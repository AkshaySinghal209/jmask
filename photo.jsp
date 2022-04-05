<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*,java.util.*,javax.mail.*,javax.activation.*,javax.servlet.http.Part,javax.servlet.http.HttpServletResponse,javax.servlet.http.HttpServletRequest"%>
<%@page import="javax.mail.internet.*"%>
<%@page import="javax.servlet.ServletException,javax.servlet.annotation.MultipartConfig,javax.servlet.annotation.WebServlet,javax.servlet.http.HttpServlet" %>
<%@page import="java.io.File,java.io.IOException,java.io.PrintWriter" %>
<%@page import="java.sql.Connection,java.sql.DriverManager,java.sql.PreparedStatement" %>


<%
	Part part = request.getPart("file");//
	String fileName = extractFileName(part);//file name
	
	
	String applicationPath = getServletContext().getRealPath("");
    String uploadPath = applicationPath + File.separator + UPLOAD_DIR;
    System.out.println("applicationPath:" + applicationPath);
    File fileUploadDirectory = new File(uploadPath);
    if (!fileUploadDirectory.exists()) {
        fileUploadDirectory.mkdirs();
    }
    String savePath = uploadPath + File.separator + fileName;
    System.out.println("savePath: " + savePath);
    String sRootPath = new File(savePath).getAbsolutePath();
    System.out.println("sRootPath: " + sRootPath);
    part.write(savePath + File.separator);
    File fileSaveDir1 = new File(savePath);
    /*if you may have more than one files with same name then you can calculate some random characters
     and append that characters in fileName so that it will  make your each image name identical.*/
    dbFileName = UPLOAD_DIR + File.separator + fileName;
    part.write(savePath + File.separator);

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/mysql", "root", "akshay");
		
		Statement st = conn.createStatement();

		int i = st.executeUpdate("insert into DISPIC(photo)values('" + photo + "')");
		response.sendRedirect("http://localhost:8080/JMASK/alerts.html");
	} catch (Exception e) {
		System.out.print(e);
		e.printStackTrace();
	}
%>
<%
String extractFilename(Part part) {
    final String partHeader = part.getHeader("content-disposition");
    for (String content : part.getHeader("content-disposition").split(";")) {
        if (content.trim().startsWith("filename")) {
            return content.substring((content.indexOf('=') + 1).trim().replace("\"", ""));
        }
    }
    return null;   
}
 %>