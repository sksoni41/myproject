<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Old Book</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">
	<%@ include file="all_component/navbar.jsp"%>
		<c:if test="${not empty failedMsg }">
	<div class="alert alert-danger text-center" role="alert">${failedMsg}</div>
		
		<c:remove var="failedMsg" scope="session" />
	</c:if>

	<c:if test="${not empty succMsg }">
		<div class="alert alert-success text-center" role="alert">${succMsg}</div>
		
		<c:remove var="succMsg" scope="session" />
	</c:if>
	
	<div class="ml-5 mr-5 pt-5">
	<table class="table table-striped ">
		<thead class="bg-primary text-white">
			<tr>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">price</th>
				<th scope="col">Category</th>
				<th scope="col">Action</th>
			</tr>
		</thead>
		<tbody>
		
		
		<%
		User u=(User)session.getAttribute("userobj");
		String email = u.getEmail();
			BookDAOImpl dao= new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list= dao.getBookByOld(email, "Old");
			for(BookDtls b : list){%>
				<tr>
				<td><%=b.getBookname()%></td>
				<td><%=b.getAuthor()%></td>
				<td><%=b.getPrice()%></td>
				<td><%=b.getBookCategory()%></td>	
				<td><a href = "delete_old_book?em=<%=email%>&&id=<%=b.getBookId()%>" class = "btn btn-sm btn-danger">Delete</a></td>
			</tr>
			<% }
			
			
			%>
			
			
			
			
		</tbody>
	</table>
</div>
</body>
</html>