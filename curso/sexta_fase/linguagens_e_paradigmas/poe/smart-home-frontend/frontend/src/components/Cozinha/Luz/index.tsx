import { useEffect, useState } from "react";
import { io } from "socket.io-client";
import './style.css';

export default function Cozinha() {
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
        socket.on('acenderLuzCozinha', (novoEstado: EstadoLuz) => {
            setEstadoLuz(novoEstado);
        });

        return () => {
            socket.off('acenderLuzCozinha');
        }
    }, []);

    //funcao para alterar o estado dos dispositivo
    const acenderLuz = () => {
        socket.emit('acenderLuzCozinha');
    }

    return (
            <div className='luz box'>
                <button onClick={acenderLuz} hidden={estadoLuz.luzOn}>Luz</button>
                <img src='luz.png' alt="luz acesa" onClick={acenderLuz} className={`status ${estadoLuz.luzOn ? 'on' : 'off'}`} />
            </div>
    )
}