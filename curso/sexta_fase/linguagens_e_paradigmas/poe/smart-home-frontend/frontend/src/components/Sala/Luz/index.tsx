import { useEffect, useState } from "react";
import { io } from "socket.io-client";
import './style.css';
import { FaLightbulb, FaRegLightbulb } from 'react-icons/fa';

export default function Luz() {
    const socket = io('http://localhost:4000');

    interface EstadoLuz {
        luzOn: boolean,
    }

    const [estadoLuz, setEstadoLuz] = useState<EstadoLuz>({
        luzOn: false
    });

    //conectar ao backend e receber o estado inicial
    useEffect(() => {
        //atualiza estado quando houver mudança
        socket.on('acenderLuzSala', (novoEstado: EstadoLuz) => {
            setEstadoLuz(novoEstado);
        });

        return () => {
            socket.off('acenderLuzSala');
        }
    }, []);

    //funcao para alterar o estado dos dispositivo
    const acenderLuz = () => {
        socket.emit('acenderLuzSala');
    }

    return (
        <div className='luz'>
            <p>Luz</p>
            {estadoLuz.luzOn ? (
                <FaLightbulb size={60} color="yellow" />
            ) : (
                <FaRegLightbulb size={60} color="gray" />
            )}<br />
            <button onClick={acenderLuz}>
                {estadoLuz.luzOn ? 'Desligar Luz' : 'Ligar Luz'}
            </button>
        </div>
    )
}