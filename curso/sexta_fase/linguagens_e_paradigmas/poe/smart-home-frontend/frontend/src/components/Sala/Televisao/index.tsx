import { useEffect, useState } from "react";
import { io } from "socket.io-client";
import './style.css';

const socket = io('http://localhost:4000');
export default function Sala() {

    interface EstadoTv {
        tvOn: boolean,
        tvCanal: string,
    }

    const [estadoTv, setEstadoTv] = useState<EstadoTv>({
        tvOn: false,
        tvCanal: '1',
    });

    //conectar ao backend e receber o estado inicial
    useEffect(() => {
        socket.on('ligarTvSala', (novoEstado: EstadoTv) => {
            setEstadoTv(novoEstado);
        });
        socket.on('alterarCanalTv', (novoCanal: string) => {
            setEstadoTv((estado) => ({ ...estado, tvCanal: novoCanal }));
        });

        return () => {
            socket.off('ligarTvSala');
            socket.off('alterarCanalTv');
        }
    }, []);
    
    //funcao para alterar o estado dos dispositivo
    const ligarTv = () => {
        socket.emit('ligarTvSala');
    }
    const alterarCanalTv = (event: React.ChangeEvent<HTMLSelectElement>) => {
        const novoCanal = event.target.value;
        socket.emit('alterarCanalTv', novoCanal);
        setEstadoTv((estado) => ({ ...estado, tvCanal: novoCanal }));
    }

    return (
        <div className='tv box'>
            <div>
                <button onClick={ligarTv} hidden={estadoTv.tvOn}>TV</button>
            </div>
            <div hidden={!estadoTv.tvOn}>
                <img src='tvligada.png' alt="televisao" onClick={ligarTv} />
                <br></br>
                <label>Canais:</label>
                <select name="canalTvSala" value={estadoTv.tvCanal} disabled={!estadoTv.tvOn} onChange={alterarCanalTv}>
                    <option value="1">Canal 1</option>
                    <option value="2">Canal 2</option>
                    <option value="3">Canal 3</option>
                </select>
            </div>
            
        </div>
    )
}