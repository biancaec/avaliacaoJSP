<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="com.avaliacoes.utils.Login" %>
<%@ page import="com.avaliacoes.entidades.Usuario" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    
</head>
<body>
    <%
        Usuario user = Login.getUser();
        out.write(user.getNome());
    %>

    <h1>Validou</h1>
    <input id="nome" type="hidden" value="<%=user.getNome()%>">
    <input id="perfil" type="hidden" value="<%=user.getPerfilId()%>">
    <p>Texto</p>
    
    <script>
        let nome = document.getElementById("nome").value
        let perfil = document.getElementById("perfil").value
        sessionStorage.setItem("nome", nome)
        sessionStorage.setItem("perfil", perfil)
    </script>
</body>
</html>