<%--
  Created by IntelliJ IDEA.
  User: Hakim
  Date: 16/10/10
  Time: 下午3:46
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    String str = request.getParameter("info") ;
    out.println("<h1>"+str+"</h1>") ;


    String content = request.getParameter("info");
    out.println("<h2>"+str+"</h2>");
%>
</body>
</html>
