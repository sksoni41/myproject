<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>book details</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">
	<%@ include file="all_component/navbar.jsp"%>

<%
	User u = (User) session.getAttribute("userobj");
	%>
	<%
	int id = Integer.parseInt(request.getParameter("bid"));
	BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
	BookDtls b = dao.getBookById(id);
	%>




	<div class="container p-3">
		<div class="row ">
			<div class="col-md-6 p-5 text-center border bg-white">

				<img alt="" src="book/<%=b.getPhotoName()%>"
					style="height: 200px; width: 150px"><br>
				<h4 class=mt-3>
					Book Name : <span class=text-success><%=b.getBookname()%></span>
				</h4>
				<h4>
					Author Name : <span class=text-success><%=b.getAuthor()%></span>
				</h4>
				<h4>
					Category : <span class=text-success><%=b.getBookCategory()%></span>
				</h4>
			</div>
			<div class="col-md-6 p-5 text-center border bg-white">
				<h2><%=b.getBookname()%></h2>
				<%
				if("Old".equals(b.getBookCategory()))
				{%>
				<h5 class = "text-primary">Contact to Seller</h5>
					<h5  class = "text-primary"> <i class="fas fa-envelope"></i> Email: <%=b.getEmail()%></h5>
				
				<%}%>
				
				
				
				
				<div class="row">
					<div class="col-md-4 text-danger p-2">
						<i class="fab fa-amazon-pay fa-3x"></i>
						<p>Cash On Delivery</p>
					</div>
					<div class="col-md-4 text-danger p-2">
						<i class="fas fa-undo fa-3x"></i>
						<p>Easy Return</p>
					</div>
					<div class="col-md-4 text-danger p-2">
						<i class="fas fa-shuttle-van fa-3x"></i>
						<p>Free Delivery*</p>
					</div>
				</div>
				
				
				<%
				if("Old".equals(b.getBookCategory()))
				{%>
					<div class=" text-center p-3">
					<a href="index.jsp" class="btn btn-success"> <i
						class="fas fa-shopping-cart"></i>Continue Shopping
					</a> <a href="" class="btn btn-danger"> <i
						class="fas fa-rupee-sign"></i>200
					</a>
				</div>
				<%}else {%>
					<div class=" text-center p-3">
					
					
					
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger"><i
								class="fas fa-shopping-cart"></i>add cart</a>
							<%
							} else {
							%>
							<a href="cartServlet?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-primary"> <i
						class="fas fa-shopping-cart"></i>Add Cart
					</a>
							<%
							}
							%>
					  <a href="" class="btn btn-danger"> <i
						class="fas fa-rupee-sign"></i>200
					</a>
				</div>
				<%}
				%>
				
			</div>
		</div>

	</div>
</body>
</html>