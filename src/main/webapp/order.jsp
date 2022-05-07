<%@page import="com.entity.Book_order"%>
<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookOrderImpl"%>
<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your Order</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">
	
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>

	</c:if>
	<%@ include file="all_component/navbar.jsp"%>
	<h3 class="text-center text-primary ">Your Orders</h3>
	<div class="ml-5 mr-5 p-1">
		<table class="table table-striped ">
			<thead class="bg-primary">
				<tr>
					<th scope="col">Order Id</th>
					<th scope="col">Name</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
				    <th scope="col">Price</th>
				    <th scope="col">Payment Type</th>
				    
					
				</tr>
			</thead>
			<tbody>
			<%
			User u= (User)session.getAttribute("userobj");
			BookOrderImpl dao =  new BookOrderImpl(DBConnect.getConn());
		List<Book_order>blist =	dao.getBook(u.getEmail());
		for(Book_order b: blist)
		{%>
			<tr>
					<th scope="row"><%= b.getOrderId()%></th>
					<td><%=b.getUsername()%></td>
					<td><%=b.getBook_name()%></td>
					<td><%=b.getAuthor()%></td>
					<td><%=b.getPrice()%></td>
					<td><%=b.getPaymentType() %></td>
					
				</tr>
			
			
		<%}
			
			%>
				
				
			</tbody>
		</table>
</div>
	
</body>
</html>