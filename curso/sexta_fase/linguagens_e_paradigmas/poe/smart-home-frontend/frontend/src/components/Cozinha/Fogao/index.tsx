import { useEffect, useState } from "react";
import { io } from "socket.io-client";
import './style.css';

const socket = io('http://localhost:4000');
export default function Cozinha() {

    interface EstadoFogao {
        fogaoOn: boolean,
        fogaoVel: number
    }

    const [estadoFogao, setEstadoFogao] = useState<EstadoFogao>({
        fogaoOn: false,
        fogaoVel: 1
    });

    //conectar ao backend e receber o estado inicial
    useEffect(() => {
        socket.on('ligarFogaoCozinha', (novoEstado: EstadoFogao) => {
            setEstadoFogao(novoEstado);
        });
        socket.on('alterarPotenciaFogao', (novaVel: number) => {
            setEstadoFogao((estado) => ({ ...estado, fogaoVel: novaVel }));
        });

        return () => {
            socket.off('ligarFogaoCozinha');
            socket.off('alterarPotenciaFogao');
        }
    }, []);
    
    const ligarFogao = () => {
        socket.emit('ligarFogaoCozinha');
    }
    const alterarPotenciaFogao = (event: React.ChangeEvent<HTMLInputElement>) => {
        let novaPot = parseInt(event.target.value, 10);
        novaPot < 1 && (novaPot = 1);
        novaPot > 5 && (novaPot = 5);
        socket.emit('alterarPotenciaFogao', novaPot);
        setEstadoFogao((estado) => ({ ...estado, fogaoVel: novaPot }));
    }

    return (
        <div className='fogao box'>
            <div>
                <button onClick={ligarFogao} hidden={estadoFogao.fogaoOn}>Fogão</button>
            </div>
            <div hidden={!estadoFogao.fogaoOn}>
                <img src='fogao.png' alt="fogao" onClick={ligarFogao} />
                <br></br>
                <label>Potência:</label>
                <input type="number" min={1} max={5} value={estadoFogao.fogaoVel} disabled={!estadoFogao.fogaoOn} onChange={alterarPotenciaFogao} />
            </div>
        </div>
    )
}