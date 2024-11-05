import { useEffect, useState } from "react";
import { io } from "socket.io-client";
import './style.css';

const socket = io('http://localhost:4000');
export default function Quarto() {

    interface EstadoCortina {
        cortinaOn: boolean,
    }

    const [estadoCortina, setEstadoCortina] = useState<EstadoCortina>({
        cortinaOn: false
    });

    //conectar ao backend e receber o estado inicial
    useEffect(() => {
        //atualiza estado quando houver mudança
        socket.on('abrirCortinaQuarto', (novoEstado: EstadoCortina) => {
            setEstadoCortina(novoEstado);
        });

        return () => {
            socket.off('abrirCortinaQuarto');
        }
    }, []);

    //funcao para alterar o estado dos dispositivo
    const abrirCortina = () => {
        socket.emit('abrirCortinaQuarto');
    }

    return (
        <div className='cortina box'>
            <button onClick={abrirCortina} hidden={estadoCortina.cortinaOn}>Cortina</button>
            <img src='cortina-aberta.png' onClick={abrirCortina} alt="cortina acesa" className={`status ${estadoCortina.cortinaOn ? 'on' : 'off'}`} />
        </div>
    )
}