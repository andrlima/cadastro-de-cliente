<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="cadastro" %>

<!DOCTYPE html>
<html lang = "pt-br">
    <head>
        
        <meta charset = "UTF-8">
        <meta name = "viewport" content = "width=device-width initial-scale = 1.0">
        <meta http-equiv = "X-UA-Compatible" content = "ie = edge" /> 

        <title> Cadastro Cliente </title>
		
		<link rel = "stylesheet" href = "./css/estilo.css" />
        <link rel = "stylesheet" href = "./css/animacao-form.css" />
        <link rel = "stylesheet" href = "./css/jquery.css" />

    </head>

    <body>

        <div class="texto-main">

            <h1> Cadastro de cliente </h1>

        </div>

        <section class = "form-section">

            <div class = "div-formulario" id = "div-form">

                <form action = "adicionarCliente" id = "form-cadastro" methodo = "post">

                    <div class = "input-block">

                        <label for = "nome"> Nome </label>
                        <input type = "text" id = "nome" required />

                    </div>

                    <div class = "input-block">

                        <label for = "cpf"> Cpf </label>
                        <input type = "text" id = "cpf" required />

                    </div>

                    <div class = "input-block">

                        <label for = "dataNascimento"> Data de Nascimento </label>
                        <input type = "text" id = "dataNascimento" required/>
          				<!-- <cadastro:campoData id="dataNascimento"/> -->

                    </div>

                    <div class = "input-block">

                        <label for = "telefone"> Telefone</label>
                        <input type = "text" id = "telefone" required /> 

                    </div>
                    
                    <div class = "input-block">

                        <label for = "email"> Email </label>
                        <input type = "email" id = "email" required/> 

                    </div>
                    
                    <div class = "input-block">

                        <label for = "nomepai"> Nome do Pai</label>
                        <input type = "text" id = "nomePai" required/> 

                    </div>

                    <div class = "input-block">

                        <label for = "nomeMae"> Nome da Mãe </label>
                        <input type = "text" id = "nomeMae" required/> 

                    </div>

                    <div class = "input-block">

                        <button type = "submit" class = "btn-cadastrar" id = "btnCadastrar"> Cadastrar </button>

                    </div>

                </form>

                <div class = "div-links">
                    <a href = "listaDeCliente" class = "links"> Lista de clientes </a>
                </div>
                
            </div>
            
        </section>
        
        <script src="./js/jquery.js"></script>
        <script src="./js/jquery-ui.js"></script>

    </body>

</html>
