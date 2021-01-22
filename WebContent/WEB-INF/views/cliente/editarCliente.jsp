<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib tagdir="/WEB-INF/tags" prefix="cadastro" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html lang = "pt-br">
    <head>
        
        <meta charset = "UTF-8">
        <meta name = "viewport" content = "width=device-width initial-scale = 1.0">
        <meta http-equiv = "X-UA-Compatible" content = "ie = edge" /> 

        <title> Editar Cliente </title>
		
		<link rel = "stylesheet" href = "./css/estilo.css" />
   
        <link rel = "stylesheet" href = "./css/animacao-form-editar.css" />
        <link rel = "stylesheet" href = "./css/jquery.css" />

    </head>

    <body>

        <div class="texto-main">

            <h1> Editando Cliente - ${cliente.id} </h1>

        </div>

        <section class = "form-section">
	
            <div class = "div-formulario" id = "div-form">

                <form action = "atualizarCliente" id = "form-cadastro" methodo = "post">
                
               		<input type="hidden" name="id" value="${cliente.id}"/>

                    <div class = "input-block">

                        <label for = "nome"> Nome </label>
                        <input type = "text" name="nome" value = "${cliente.nome}" />

                    </div>

                    <div class = "input-block">

                        <label for = "cpf"> Cpf </label>
                        <input type = "text" name = "cpf" value = "${cliente.cpf}" />

                    </div>

                    <div class = "input-block">

                        <label for = "dataNascimento"> Data de Nascimento </label>              
						<input type = "text" name = "dataNascimento" value = "<fmt:formatDate value="${cliente.dataNascimento.time}" pattern="dd/MM/yyyy" />"/>
						
                    </div>

                    <div class = "input-block">

                        <label for = "telefone"> Telefone</label>
                        <input type = "text" name = "telefone" value = "${cliente.telefone}" /> 

                    </div>
                    
                    <div class = "input-block">

                        <label for = "email"> Email </label>
                        <input type = "email" id = "email" required/> 

                    </div>
                    
                    <div class = "input-block">

                        <label for = "nomepai"> Nome do Pai</label>
                        <input type="text" name="nomePai" value="${cliente.nomePai}" />

                    </div>

                    <div class = "input-block">

                        <label for = "nomeMae"> Nome da Mãe </label>
                        <input type="text" name="nomeMae" value="${cliente.nomeMae}" /> 

                    </div>

                    <div class = "input-block">

                        <button type = "submit" class = "btn-cadastrar" id = "btnCadastrar"> Editar </button>

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
