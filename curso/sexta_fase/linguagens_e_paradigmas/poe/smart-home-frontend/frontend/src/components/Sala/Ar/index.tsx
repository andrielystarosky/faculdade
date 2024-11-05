import { useEffect, useState } from "react";
import { io } from "socket.io-client";
import './style.css';

const socket = io('http://localhost:4000');
export default function Sala() {

    interface EstadoAr {
        arOn: boolean,
        arTemp: number
    }

    const [estadoAr, setEstadoAr] = useState<EstadoAr>({
        arOn: false,
        arTemp: 20
    });

    //conectar ao backend e receber o estado inicial
    useEffect(() => {
        socket.on('ligarArSala', (novoEstado: EstadoAr) => {
            setEstadoAr(novoEstado);
        });
        socket.on('alterarTempAr', (novaTemp: number) => {
            setEstadoAr((estado) => ({ ...estado, arTemp: novaTemp }));
        });

        return () => {
            socket.off('ligarArSala');
            socket.off('alterarTempAr');
        }
    }, []);
    
    const ligarAr = () => {
        socket.emit('ligarArSala');
    }
    const alterarTempAr = (event: React.ChangeEvent<HTMLInputElement>) => {
        let novaTemp = parseInt(event.target.value, 10);
        novaTemp < 18 && (novaTemp = 18);
        novaTemp > 30 && (novaTemp = 30);
        socket.emit('alterarTempAr', novaTemp);
        setEstadoAr((estado) => ({ ...estado, arTemp: novaTemp }));
    }

    return (
        <div className='ar box'>
            <div>
                <button onClick={ligarAr} hidden={estadoAr.arOn}>Ar-Condicionado</button>
            </div>
            <div hidden={!estadoAr.arOn}>
                <img src='ar.png' alt="ar condicionado" onClick={ligarAr} />
                <br></br>
                <label>Temperatura:</label>
                <input type="number" min={18} max={30} value={estadoAr.arTemp} disabled={!estadoAr.arOn} onChange={alterarTempAr} />
            </div>
        </div>
    )
}