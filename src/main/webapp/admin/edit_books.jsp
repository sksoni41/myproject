<%@page import="com.entity.BookDtls"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
		  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Admin: Add Books</title>
<%@ include file="allCss.jsp"%>
</head>
<body style = "background-color:#f0f2f2">
	<%@ include file="navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-4 offset-md-4">

				<div class="card">
					<div class="card-body">
					<h4 class =  text-center>EDIT BOOKS</h4>
					
						
						
						<%
						int id=Integer.parseInt(request.getParameter("id"));
						BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
						BookDtls b=dao.getBookById(id);
						%>
						<form action="../editbooks" method="post">
						
						<div class="form-group">
								<label for="exampleInputEmail1">Book Id</label>
								 <input
									name="id" type="text" class="form-control"
									id="exampleInputEmail1" value = "<%=b.getBookId()%>" aria-describedby="emailHelp" >
									

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Book Name</label>
								 <input
									name="bname" type="text" class="form-control"
									id="exampleInputEmail1" value = "<%=b.getBookname()%>" aria-describedby="emailHelp" >
									

							</div>

							<div class="form-group">
								<label for="exampleInputEmail1">Author Name</label> <input
									name="author" type="text" class="form-control"
									id="exampleInputEmail1" aria-describedby="emailHelp"
									placeholder="" value = "<%=b.getAuthor()%>">

							</div>
							<div class="form-group">
								<label for="exampleInputEmail1">Price</label> <input
									name="price" type="number" class="form-control"
									id="exampleInputEmail1" id="exampleInputPassword1"
									placeholder="" value = "<%=b.getPrice()%>">

							</div>
							
							
							<div class="form-group">
								<label for="exampleFormControlSelect1">Book Status</label> <select
									name="status" class="form-control" id="inputState">
									<%if("Active".equals(b.getStatus()))
									{%>
									<option value="Active">Active</option>
										<option value="Inactive">Inactive</option>
									<%}else
									{%>
									<option value="Inactive">Inactive</option>
									<option value="Active">Active</option>
									<% }	%>
									
									
									

								</select>
							</div>
							

							
							<button type="submit" class="btn btn-primary">Update</button>
							
							
						</form>

					</div>

				</div>



			</div>


		</div>
	</div>
	<div style="margin-top:5px;"><%@ include file="footer.jsp" %></div>
</body>
</html>