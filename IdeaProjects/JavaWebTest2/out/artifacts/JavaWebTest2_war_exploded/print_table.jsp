<%--
  Created by IntelliJ IDEA.
  User: Hakim
  Date: 16/10/10
  Time: 下午4:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<%
    int rows = 0 ;
    int cols = 0 ;
    try{
        rows = Integer.parseInt(request.getParameter("row")) ;
        cols = Integer.parseInt(request.getParameter("col")) ;
    }catch(Exception e){}
%>
<table border="1" width="100%">
    <%
        for (int x=0;x<rows;x++){
    %>
    <tr>
        <%
            for(int y=0;y<cols;y++){
        %>
        <td bgcolor="#00CC33"><%=x*y%></td>
        <%
            }
        %>
    </tr>
    <%
        }
    %>
</table>
</body>
</html>
