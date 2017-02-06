<%--
  Created by IntelliJ IDEA.
  User: Hakim
  Date: 16/10/11
  Time: 下午2:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*"%>
<html>
<head>
    <title>Title</title>
</head>
<body>
<center>
    <h1>µÇÂ½²Ù×÷</h1>
    <hr>
    <%!	// ¶¨ÒåÈô¸É¸öÊý¾Ý¿âµÄÁ¬½Ó³£Á¿
        public static final String DBDRIVER = "org.gjt.mm.mysql.Driver" ;
        public static final String DBURL = "jdbc:mysql://localhost:3306/mldn" ;
        public static final String DBUSER = "root" ;
        public static final String DBPASS = "123456" ;
    %>
    <%
        Connection conn = null ;		// Êý¾Ý¿âÁ¬½Ó
        PreparedStatement pstmt = null ;	// Êý¾Ý¿âÔ¤´¦Àí²Ù×÷
        ResultSet rs = null ;		// ²éÑ¯Òª´¦Àí½á¹û¼¯
        boolean flag = false ;	// ±£´æ±ê¼Ç
        String name = null ;	// ±£´æÕæÊµÐÕÃû
    %>
    <%
        try{
    %>
    <%
        Class.forName(DBDRIVER) ;
        conn = DriverManager.getConnection(DBURL,DBUSER,DBPASS) ;
        String sql = "SELECT name FROM user WHERE userid=? AND password=?" ;
        pstmt = conn.prepareStatement(sql) ;
        pstmt.setString(1,request.getParameter("id")) ;
        pstmt.setString(2,request.getParameter("password")) ;
        rs = pstmt.executeQuery() ;	// ²éÑ¯
        if(rs.next()){	// Èç¹ûÓÐÊý¾Ý£¬Ôò¿ÉÒÔÖ´ÐÐ
            flag = true ;	//  ±íÊ¾µÇÂ½³É¹¦
            name = rs.getString(1) ;
        }
    %>
    <%
        }catch(Exception e)	{
            e.printStackTrace() ;
        }
        finally{
            try{
                rs.close() ;
                pstmt.close() ;
                conn.close() ;
            } catch(Exception e){}
        }
    %>
    <%
        if(flag){	// µÇÂ½³É¹¦
    %>
    <jsp:forward page="login_success.jsp">
        <jsp:param name="uname" value="<%=name%>"/>
    </jsp:forward>
    <%
    } else {		// µÇÂ½Ê§°Ü
    %>
    <jsp:forward page="login_failure.html"/>
    <%
        }
    %>
</center>
</body>
</html>
