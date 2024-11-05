/**
 * Importação de estilos e componentes específicos do quarto
 */
import './style.css';
import Luz from "./Luz";
import Ventilador from "./Ventilador";
import Cortina from "./Cortina";

/**
 * Componente Quarto
 * 
 * Este componente representa o ambiente do quarto, exibindo um título e agrupando
 * os controles de dispositivos específicos do ambiente, incluindo luz, ventilador e cortina.
 * 
 * @returns JSX.Element - Retorna a estrutura JSX do quarto, com título e dispositivos.
 */
export default function Quarto() {
    return (
        <div className='quarto'>
            <h2>Quarto</h2>
            <div className='comodo'>
                <Luz/>
                <Ventilador/>
                <Cortina/>
            </div>
        </div>
    )
}