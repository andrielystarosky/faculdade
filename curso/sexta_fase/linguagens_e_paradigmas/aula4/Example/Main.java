import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.Token;

public class Main {
    public static void main(String[] args) throws Exception {
        //Exemplo de entrada de dados
        String input = "x + 3 - y";

        //Inicializa o lexer
        ExampleLexer lexer = new ExampleLexer(CharStreams.fromString(input));

        //Iterado sobre os tokens
        for(Token token : lexer.getAllTokens()) {
            System.out.println("Token: " + token.getText() + " | Tipo: " + lexer.getVocabulary().getSymbolicName(token.getType()));
        }
    }
}