<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*,javax.mail.*,javax.activation.*"%>
<%@page import="javax.mail.internet.*"%>
<%
	String email = request.getParameter("mess");
	String[] arr = email.split(",");
	out.println(email);
	email = arr[0];
	String name = arr[1];
	String contact = arr[2];
	String id = arr[3];

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "akshay");
		Statement st = conn.createStatement();

		int i = st.executeUpdate("insert into gosignup(email,fullname,no,pwdid)values('" + email + "','" + name
				+ "','" + contact + "','" + id + "')");

	} catch (Exception e) {
		System.out.print(e);
		e.printStackTrace();
	}
	response.sendRedirect("http://localhost:8080/JMASK/alerts.html");
%>

