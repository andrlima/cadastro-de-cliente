<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html lang = "pt-br">
    <head>
        
        <meta charset = "UTF-8">
        <meta name = "viewport" content = "width=device-width initial-scale = 1.0">
        <meta http-equiv = "X-UA-Compatible" content = "ie = edge" /> 

        <title> Cadastro Cliente </title>

        <link rel = "stylesheet" href = "./css/estilo.css" />
        <link rel = "stylesheet" href = "./css/estilo-lista-cliente.css"/>
        <link rel = "stylesheet" href = "./css/animacao-form.css" />
        <link rel = "stylesheet" href = "./css/animacao-lista.css" />

    </head>

    <body>

        <div class="texto-main">

            <h1> Lista de clientes </h1>

        </div>

        <div class = "div-tabela">

            <div class = "div-tabela-cliente">

                <table class = "tabela-cliente">

                    <tr>
                        <th> ID </th>
                        <th> Nome </th>
                        <th> Cpf </th>
                        <th> Data de nascimento </th>
                        <th> Telefone </th>
                        <th> E-mail </th>
                        <th> Nome do pai </th>
                        <th> Nome da mãe </th>
                        <th colspan = "2" class = "btn-th"> <a href ="index.html" class = "btn-links"> Cadastrar cliente </a></th>
                    </tr>
					
					<c:forEach items="${cliente}" var="cliente">
					
	                    <tr>
	                    	<td> ${cliente.id} </td>
							<td> ${cliente.nome} </td>
							<td> ${cliente.cpf} </td>
							
							<td>
								<fmt:formatDate value = "${cliente.dataNascimento.time}" pattern = "dd/MM/yyyy"/>
							</td>
							
							<td> ${cliente.telefone} </td>
							<td> ${cliente.email} </td>
							<td> ${cliente.nomePai} </td>
							<td> ${cliente.nomeMae} </td>
	                   
	                        <td class = "btn-th"> <a href="editarCliente?id=${cliente.id}" class = "btn-links btn-links-2"> Editar </a> </td>
	                        <td class = "btn-th"> <a href="excluirCliente?id=${cliente.id}" class = "btn-links btn-links-2"> Excluir </a> </td>
	                        
	                    </tr>
                    
                	</c:forEach>

                </table>

            </div>

        </div>

    </body>

</html>
