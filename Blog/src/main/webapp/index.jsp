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
                    if(comentario.getPostId() == post.getId() && comentario.isAutorizado()){
                        out.write("<div class='comentario-feito' >");
                        out.write("<p>"+comentario.getConteudo()+"</p>");
                        out.write("</div>"); 
                    }  
                }
            %>
            <%
                if(session.getAttribute("nome") != null) {

            %>
            <form id="comentario-form" action="index.jsp" method="POST">
                <input id="post-id" name="post-id" type="hidden" value="<%=post.getId()%>">
                <label for="comentario">Comentário:</label>
                <textarea id="comentario-input" name="comentario" rows="4" cols="40" maxlength="160" placeholder="Seu comentário."></textarea>
                <button>Enviar</button>
            </form>
            <%
                    Integer perfil = (Integer)session.getAttribute("perfil");
                    if(perfil == 1) {
                        out.write("<a href='comentarios.jsp'>Gerenciar comentários</a>");
                    }
                } else {
            %>
                <div id="cadastro-login">
                    <p>Deseja comentar?</p>
                    <a href="login.jsp">Entre</a>
                    <p>ou</p>
                    <button>Cadastre-se</button>
                </div>
            <%
                
            }
            %>
           
        <%    
                out.write("</article>");
                i++;
            }       
        %> 
            
        
    </div>
    <%
        if(request.getMethod() == "POST") {
            String conteudo = request.getParameter("comentario");
            int postId = Integer.parseInt(request.getParameter("post-id"));
            boolean autorizado = false;

            if(conteudo != null) {
                Comentario comentario = new Comentario();
                comentario.setConteudo(conteudo);
                comentario.setPostId(postId);
                comentario.setAutorizado(autorizado);

                boolean retorno = DaoComentario.salvar(comentario);
                if (retorno) {
                    out.write("Comentario salvo");
                    response.sendRedirect("index.jsp");
                }
            }
        }
    %>
   
</body>
</html>
