import { useEffect, useState } from "react";
import { io } from "socket.io-client";
import './style.css';

const socket = io('http://localhost:4000');
export default function Quarto() {

    interface EstadoLuz {
        luzOn: boolean,
    }

    const [estadoLuz, setEstadoLuz] = useState<EstadoLuz>({
        luzOn: false
    });

    //conectar ao backend e receber o estado inicial
    useEffect(() => {
        //atualiza estado quando houver mudança
        socket.on('acenderLuzQuarto', (novoEstado: EstadoLuz) => {
            setEstadoLuz(novoEstado);
        });

        return () => {
            socket.off('acenderLuzQuarto');
        }
    }, []);

    //funcao para alterar o estado dos dispositivo
    const acenderLuz = () => {
        socket.emit('acenderLuzQuarto');
    }

    return (
        <div className='luz box'>
            <button onClick={acenderLuz} hidden={estadoLuz.luzOn}>Luz</button>
            <img src='luz.png' alt="luz acesa" onClick={acenderLuz} className={`status ${estadoLuz.luzOn ? 'on' : 'off'}`} />
        </div>
    )
}