/**
 * Importação de estilos e componentes específicos da sala
 */
import './style.css';
import Luz from "./Luz";
import Ar from "./Ar";
import Televisao from "./Televisao";

/**
 * Componente Sala
 * 
 * Este componente representa o ambiente da sala, exibindo um título e agrupando
 * os controles de dispositivos específicos do ambiente, incluindo luz, televisão e ar.
 * 
 * @returns JSX.Element - Retorna a estrutura JSX da sala, com título e dispositivos.
 */
export default function Sala() {
    return (
        <div className='sala'>
            <h2>Sala</h2>
            <div className='comodo'>
                <Luz />
                <Televisao />
                <Ar />
            </div>
        </div>
    )
}