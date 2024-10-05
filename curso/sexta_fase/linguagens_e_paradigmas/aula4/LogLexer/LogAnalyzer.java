import org.antlr.v4.runtime.CharStreams;
import org.antlr.v4.runtime.CommonTokenStream;
import org.antlr.v4.runtime.Token;

import java.util.List;

public class LogAnalyzer {
    public static void main(String[] args) {
        String logData = "[2024-08-10 14:22:30] ERROR User 1234 failed to authenticate";

        RegraLog lexer = new RegraLog(CharStreams.fromString(logData));
        CommonTokenStream tokens = new CommonTokenStream(lexer);
        tokens.fill();

        List<Token> allTokens = tokens.getTokens();
        for (Token token : allTokens) {
            System.out.println("Token: " + token.getText() + " | Tipo: " + RegraLog.VOCABULARY.getSymbolicName(token.getType()));
        }
    }
}


