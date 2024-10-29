import { useEffect, useState } from "react";
import { io } from "socket.io-client";
import './style.css';
import { FaWind } from 'react-icons/fa';

export default function ArCondicionado() {
    const socket = io('http://localhost:4000');

    interface EstadoArCondicionado {
        arOn: boolean,
    }

    const [estadoArCondicionado, setEstadoArCondicionado] = useState<EstadoArCondicionado>({
        arOn: false
    });

    //conectar ao backend e receber o estado inicial
    useEffect(() => {
        //atualiza estado quando houver mudança
        socket.on('estadoArCondicionadoSala', (novoEstado: EstadoArCondicionado) => {
            setEstadoArCondicionado(novoEstado);
        });

        return () => {
            socket.off('estadoArCondicionadoSala');
        }
    }, []);

    //funcao para alterar o estado dos dispositivo
    const estadoArCondicionadoSala = () => {
        socket.emit('estadoArCondicionadoSala');
    }

    return (
        <div className='ArCondicionado'>
            <p>Ar Condicionado</p>
            {estadoArCondicionado.arOn 
            ? (<FaWind size={60} color="lightblue" />) 
            : (<FaWind size={60} color="gray" />)}<br />
            <button onClick={estadoArCondicionadoSala}>
                {estadoArCondicionado.arOn ? 'Desligar' : 'Ligar'}
            </button>
        </div>
    )
}