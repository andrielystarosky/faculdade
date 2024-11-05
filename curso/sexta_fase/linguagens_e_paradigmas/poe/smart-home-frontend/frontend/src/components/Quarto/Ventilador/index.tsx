import { useEffect, useState } from "react";
import { io } from "socket.io-client";
import './style.css';

const socket = io('http://localhost:4000');
export default function Quarto() {

    interface EstadoVentilador {
        ventiladorOn: boolean,
        ventiladorVel: number
    }

    const [estadoVentilador, setEstadoVentilador] = useState<EstadoVentilador>({
        ventiladorOn: false,
        ventiladorVel: 1
    });

    //conectar ao backend e receber o estado inicial
    useEffect(() => {
        socket.on('ligarVentiladorQuarto', (novoEstado: EstadoVentilador) => {
            setEstadoVentilador(novoEstado);
        });
        socket.on('alterarVelVentilador', (novaVel: number) => {
            setEstadoVentilador((estado) => ({ ...estado, ventiladorVel: novaVel }));
        });

        return () => {
            socket.off('ligarVentiladorQuarto');
            socket.off('alterarVelVentilador');
        }
    }, []);
    
    const ligarVentilador = () => {
        socket.emit('ligarVentiladorQuarto');
    }
    const alterarVelVentilador = (event: React.ChangeEvent<HTMLInputElement>) => {
        let novaVel = parseInt(event.target.value, 10);
        novaVel < 1 && (novaVel = 1);
        novaVel > 3 && (novaVel = 3);
        socket.emit('alterarVelVentilador', novaVel);
        setEstadoVentilador((estado) => ({ ...estado, ventiladorVel: novaVel }));
    }

    return (
        <div className='ventilador box'>
            <div>
                <button onClick={ligarVentilador} hidden={estadoVentilador.ventiladorOn}>Ventilador</button>
            </div>
            <div hidden={!estadoVentilador.ventiladorOn}>
                <img src='ventilador.png' alt="ventilador" onClick={ligarVentilador} />
                <br></br>
                <label>Velocidade:</label>
                <input type="number" min={1} max={3} value={estadoVentilador.ventiladorVel} disabled={!estadoVentilador.ventiladorOn} onChange={alterarVelVentilador} />
            </div>
        </div>
    )
}