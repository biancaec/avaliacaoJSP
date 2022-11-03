<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="com.avaliacoes.entidades.Usuario" %>
<%@ page import="com.avaliacoes.dao.DaoUsuario" %>
<%@ page import="com.avaliacoes.utils.Login" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./estilos/estilos.css" type="text/css" />
    <script src="./scripts/scripts.js"></script>
</head>
<body>
    <div class="grid-container">
        <form id="login" action="login.jsp" method="POST">
        <div class="login">
            <div class="input-login">
                <label for="email">E-mail:</label>
                <input id="email" type="email" name="email" required>
            </div>
            
            <div class="input-login">
                <label for="senha">Senha:</label>
                <input id="senha" type="password" name="senha" required>
            </div>
            <button>Enviar</button>
        </div>
        <div id="teste">

        </div>
        </form>
    </div>
    <%
        
            String email = request.getParameter("email");
            String senha = request.getParameter("senha");
          
            if(Login.validarLogin(email, senha)) {
                out.write("Validou email e senha");
                Usuario user = Login.getUser();
                session.setAttribute("nome",user.getNome());
                session.setAttribute("perfil",user.getPerfilId());
                
                response.sendRedirect("index.jsp");
            }
         
    %>
</body>
</html>
