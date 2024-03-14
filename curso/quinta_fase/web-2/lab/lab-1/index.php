<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="style.css" />
    <title>Exercício</title>
</head>
<body>
    <form action="">
        <label>Nome</label><br>
        <input type="text" name="nome"><br><br>
        <label>Telefone</label><br>
        <input type="tel" name="telefone"><br><br>
        <label>E-mail</label><br>
        <input type="email" name="email"><br><br>
        <label>Deixe uma mensagem</label><br>
        <textarea name="mensagem" cols="30" rows="10"></textarea><br>
        <button type="submit">Enviar</button>
    </form><br><br><br>
    
    <?php
        //print_r($_GET);
        echo '<hr>';
        echo '<h1 class="Titulo">Dados:</h1>';
        echo 'Nome:' . $_GET["nome"] . '<br>';   
        echo 'Telefone:' . $_GET["telefone"] . '<br>';
        echo 'E-mail:' . $_GET["email"] . '<br>';
        echo 'Mensagem:' . $_GET["mensagem"] . '<br>';


        
    ?>
    
</body>
</html>