<%--
  Created by IntelliJ IDEA.
  User: Hakim
  Date: 16/10/10
  Time: 下午5:03
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>

<html>
<head>
    <title>Title</title>
</head>
<body>
<%!
    public static final String DBDRIVER = "com.mysql.jdbc.Driver" ;
    public static final String DBURL = "jdbc:mysql://localhost:3306/mldn" ;
    public static final String DBUSER = "root" ;
    public static final String DBPASS = "123456" ;
%>
<%
    Connection conn = null ;
    PreparedStatement pstmt = null ;
    ResultSet rs = null ;
%>
<%
    try{
        Class.forName(DBDRIVER) ;
        conn = DriverManager.getConnection(DBURL,DBUSER,DBPASS) ;
        String sql = "SELECT empno,ename,job,sal,hiredate FROM emp" ;
        pstmt = conn.prepareStatement(sql) ;
        rs = pstmt.executeQuery() ;
%>
<center>
    <table border="1" width="80%">
        <tr>
            <td>雇员编号</td>
            <td>雇员姓名</td>
            <td>雇员工作</td>
            <td>雇员工资</td>
            <td>雇用日期</td>
        </tr>
        <%
            while(rs.next()){
                int empno = rs.getInt(1) ;
                String ename = rs.getString(2) ;
                String job = rs.getString(3) ;
                float sal = rs.getFloat(4) ;
                java.util.Date date = rs.getDate(5) ;
        %>
        <tr>
            <td><%=empno%></td>
            <td><%=ename%></td>
            <td><%=job%></td>
            <td><%=sal%></td>
            <td><%=date%></td>
        </tr>
        <%
            }
        %>
    </table>
</center>
<%
    }catch(Exception e)	{
        System.out.println(e) ;
    }finally{
        rs.close() ;
        pstmt.close() ;
        conn.close() ;	// Èç¹ûÖ±½Ó¹Ø±ÕÁ¬½ÓÒ²¿ÉÒÔ
    }
%>
</body>
</html>
