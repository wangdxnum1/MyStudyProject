<%--
  Created by IntelliJ IDEA.
  User: Hakim
  Date: 16/10/10
  Time: 下午4:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="application/msword;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
    <table border="1">
        <%
            response.setHeader("Content-Disposition","attachment;filename=aaa.doc");
        %>
        <tr><td>嘻嘻嘻</td></tr>
        <tr><td>家具</td></tr>
        <tr><td>呵呵</td></tr>
    </table>
</body>
</html>
