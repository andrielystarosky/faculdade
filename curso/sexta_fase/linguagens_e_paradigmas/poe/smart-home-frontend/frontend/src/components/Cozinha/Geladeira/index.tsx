import { useEffect, useState } from "react";
import { io } from "socket.io-client";
import './style.css';

const socket = io('http://localhost:4000');
export default function Cozinha() {

    interface EstadoGeladeira {
        geladeiraTemp: number
    }

    const [estadoGeladeira, setEstadoGeladeira] = useState<EstadoGeladeira>({
        geladeiraTemp: 1
    });

    //conectar ao backend e receber o estado inicial
    useEffect(() => {
        socket.on('alterarTemperaturaGeladeira', (novaVel: number) => {
            setEstadoGeladeira((estado) => ({ ...estado, geladeiraTemp: novaVel }));
            novaVel >= 5 && alert('Temperatura alta!');
        });

        return () => {
            socket.off('alterarTemperaturaGeladeira');
        }
    }, []);
    const alterarTemperaturaGeladeira = (event: React.ChangeEvent<HTMLInputElement>) => {
        let novaPot = parseInt(event.target.value, 10);
        novaPot < -25 && (novaPot = -25);
        novaPot > 25 && (novaPot = 25);
        socket.emit('alterarTemperaturaGeladeira', novaPot);
        setEstadoGeladeira((estado) => ({ ...estado, geladeiraTemp: novaPot }));
    }

    return (
        <div className='geladeira box'>
            <div>
                <img src='geladeira.png' alt="geladeira" />
                <br></br>
                <label>Potência:</label>
                <input type="number" min={-25} max={25} value={estadoGeladeira.geladeiraTemp} onChange={alterarTemperaturaGeladeira} />
            </div>
        </div>
    )
}