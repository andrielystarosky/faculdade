import { useEffect, useState } from "react";
import { io } from "socket.io-client";
import './style.css';
import { FaTv } from 'react-icons/fa';

export default function Televisao() {
    const socket = io('http://localhost:4000');

    interface EstadoTelevisao {
        tvOn: boolean,
    }

    const [estadoTelevisao, setEstadoTelevisao] = useState<EstadoTelevisao>({
        tvOn: false
    });

    //conectar ao backend e receber o estado inicial
    useEffect(() => {
          //atualiza estado quando houver mudança
        socket.on('ligarTvSala', (novoEstado: EstadoTelevisao) => {
            setEstadoTelevisao(novoEstado);
        });

        return () => {
            socket.off('ligarTvSala');
        }
    }, []);

    //funcao para alterar o estado dos dispositivo
    const ligarTvSala = () => {
        socket.emit('ligarTvSala');
    }

    return (
        <div className='televisao'>
            <p>Televisão</p>
            {estadoTelevisao.tvOn 
            ? (<FaTv size={60} color="yellow" />) 
            : (<FaTv size={60} color="gray" />)}
            <br />
            <button onClick={ligarTvSala}>
                {estadoTelevisao.tvOn ? 'Desligar TV' : 'Ligar TV'}
            </button>
        </div>
    )
}