<%@page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="com.avaliacoes.entidades.Comentario" %>
<%@ page import="com.avaliacoes.dao.DaoComentario" %>

<%
    String id = request.getParameter("id");
    if(DaoComentario.aceitarComentario(Integer.parseInt(id))) {
        response.sendRedirect("index.jsp");
    } else {
        out.write("Não deu certo.");
    }
%>