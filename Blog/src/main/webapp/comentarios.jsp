<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="com.avaliacoes.entidades.Post" %>
<%@ page import="com.avaliacoes.entidades.Comentario" %>
<%@ page import="com.avaliacoes.dao.DaoPost" %>
<%@ page import="com.avaliacoes.dao.DaoComentario" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="./estilos/index.css" type="text/css" />
    <script defer src="./scripts/scripts.js"></script>
</head>
<body>
    <%
        List<Post> posts;
        posts = DaoPost.buscarPosts();
        List<Comentario> comentarios;
        comentarios = DaoComentario.buscarComentarios();
    %>

    <div class="grid-container">
        <header>
            <h1>Blog</h1>
            <a href="logout.jsp">Sair</a>
        </header>
        <%
            for(Post post : posts) {
        %>
            <input class="post" type="hidden" value="<%=post.getConteudo()%>">
        <%
            }
        %>
        <%
            int i = 0;
            for(Post post : posts) {
                out.write("<article>");
            
                out.write("<h2>"+post.getTitulo()+"</h2>");
                out.write("<p class='conteudo'>"+post.getConteudo()+"</p>");
                out.write("<button id="+ i +" onclick='leiaMais(this)'>Leia mais</button>");
         %>
         <div class="comentarios">
           
            <%
                for(Comentario comentario : comentarios) {
                    if(comentario.getPostId() == post.getId()){
                        out.write("<div class='comentario-feito' >");
                        out.write("<p>"+comentario.getConteudo()+"</p>");
                        out.write("</div>"); 

                        out.write("<a href='aceitarcomentario.jsp?id="+comentario.getId()+"'>Aceitar</a>");
                    }  
                }
            
            %>
        </div>
        <%
            out.write("</article>");
            i++;
            }
        %>
            
            
        
    </div> 
</body>
</html>
