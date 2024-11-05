/**
 * Importação de estilos e componentes específicos da cozinha
 */
import './style.css';
import Luz from "./Luz";
import Geladeira from "./Geladeira";
import Fogao from "./Fogao";

/**
 * Componente Cozinha
 * 
 * Este componente representa o ambiente da cozinha, exibindo um título e agrupando
 * os controles de dispositivos específicos do ambiente, incluindo luz, geladeira e fogão.
 * 
 * @returns JSX.Element - Retorna a estrutura JSX da cozinha, com título e dispositivos.
 */
export default function Cozinha() {
    return (
        <div className='cozinha'>
            <h2>Cozinha</h2>
            <div className='comodo'>
                <Luz/>
                <Geladeira/>
                <Fogao/>
            </div>
        </div>
    )
}