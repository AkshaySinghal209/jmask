<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
	String email = request.getParameter("email");
	String pword = request.getParameter("pwd");
	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "muskan11");
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery(
				"SELECT * from SIGNUP where '" + email + "' in (EMAIL) and '" + pword + "' in (PWD) ");
		ResultSetMetaData rsmd = rs.getMetaData();
		int columnsNumber = rsmd.getColumnCount();
		int c = 0;
		while (rs.next()) {
			for (int i = 1; i <= columnsNumber; i++) {
				if (i > 1)
					c = c + 1;
			}
		}
		int i = c;

		if (i > 0) {
			response.sendRedirect("http://localhost:8090/WEBSITE/alertls.html");
		} else {
			response.sendRedirect("http://localhost:8090/WEBSITE/alertln.html");
		}
	} catch (Exception e) {
		System.out.print(e);
		e.printStackTrace();
	}
%>