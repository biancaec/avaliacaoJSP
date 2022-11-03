<%
    session.removeAttribute("nome");
    session.removeAttribute("perfil");
    response.sendRedirect("index.jsp");
%>