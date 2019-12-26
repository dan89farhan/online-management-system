<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"></jsp:include>
<%
String uid=(String)session.getAttribute("userid");
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/"+"dms","root","Noname@786");
Statement st=con.createStatement();

try{
st.executeUpdate("insert into AddressBook values('"+uid+"','"+request.getParameter("contactname") +"','"+request.getParameter("contactid")+"')");
%>

<jsp:forward page="AddressBook.jsp"></jsp:forward>
<%}
catch(Exception e){
%>
<h3 align="center"> contact id  already added or id not exist <%= e %>></h3>
<%
}
%>

</body>
</html>