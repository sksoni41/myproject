<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.List"%>
<%@page import="com.entity.Cart"%>
<%@page import="com.entity.User"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.DAO.CartDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Your Cart</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">
	<%@ include file="all_component/navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>

	</c:if>


	<c:if test="${not empty failedMsg }">
	<div class="alert alert-danger text-center" role="alert">${failedMsg}</div>
		
		<c:remove var="failedMsg" scope="session" />
	</c:if>

	<c:if test="${not empty succMsg }">
		<div class="alert alert-success" role="alert">${succMsg}</div>
		
		<c:remove var="succMsg" scope="session" />
	</c:if>

	<div class="container">
		<div class="row p-2">
			<div class="col-md-6">

				<div class="card ">
					<h3 class="text-center text-success">Your Selected Item</h3>
					<div class="card-body">
						<table class="table table-striped">
							<thead>
								<tr>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>
								</tr>
							</thead>
							<tbody>
								<%
								User u = (User) session.getAttribute("userobj");

								CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
								List<Cart> cart = dao.getBookByUser(u.getId());
								Double totalPrice = 0.00;
								for (Cart c : cart) {
									totalPrice = c.getTotalPrice();
								%>

								<tr>
									<th scope="row"><%=c.getBookName()%></th>
									<td><%=c.getAuthor()%></td>
									<td><%=c.getPrice()%></td>
									<td><a href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUserid()%>&&cid=<%=c.getCid()%>"
										class="btn btn-sm btn-danger">Remove</a></td>
								</tr>

								<%
								}
								%>
								<tr>
									<td>Total Price</td>
									<td></td>
									<td></td>
									<td><%=totalPrice%></td>
								</tr>
							</tbody>
						</table>

					</div>
				</div>

			</div>
			<div class=col-md-6>
				<div class="card">
					<h3 class="text-center text-success">Your Order Details</h3>
					<div class="card-body">

						<form action="order" method="post">
						
						<input type="hidden" value="${userobj.id}" name="id">
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputEmail4">Name</label> <input type="text"
										class="form-control" id="inputEmail4" value = "${userobj.name}" name="username" required>
								</div>
								<div class="form-group col-md-6">
									<label for="inputPassword4">mobile.no</label> <input
										type="number" class="form-control" value="${userobj.phno}" required id="inputPassword4"
										placeholder="Mobile no."  name="phno">
								</div>
							</div>
							<div class="form-row">
								<div class="form-group col-md-12">
									<label for="inputEmail4">Email</label> <input type="email"
										class="form-control" id="inputEmail4" value="${userobj.email}" required name="email" placeholder="Email">
								</div>
								
							</div>
							<div class="form-group">
								<label for="inputAddress">Address</label> <input type="text"
									class="form-control" id="inputAddress" required name="address"
									placeholder="1234 Main St">
							</div>
							<div class="form-group">
								<label for="inputAddress2">Landmark</label> <input type="text"
									class="form-control" id="inputAddress2" required name="landmark"
									placeholder="Apartment, studio, or floor">
							</div>
							<div class="form-row">
								<div class="form-group col-md-6">
									<label for="inputCity">City</label> <input type="text" required name="city"
										class="form-control" id="inputCity">
								</div>
								<div class="form-group col-md-4">
									<label for="inputState">State</label> <select id="inputState" required name="state"
										class="form-control">
										<option selected>Choose...</option>
										<option>Andaman and Nicobar (UT)</option>
										<option>Andhra Pradesh</option>
										<option>Arunachal Pradesh</option>
										<option>Assam</option>
										<option>Bihar</option>
										<option>Chandigarh (UT)</option>
										<option>Chhattisgarh</option>
										<option>Dadra and Nagar Haveli (UT)</option>
										<option>Daman and Diu (UT)</option>
										<option>Delhi</option>
										<option>Goa</option>
										<option>Gujarat</option>
										<option>Haryana</option>
										<option>Himachal Pradesh</option>
										<option>Jammu and Kashmir</option>
										<option>Jharkhand</option>
                                        <option>Karnataka</option>
                                        <option>Kerala</option>
                                        <option>Lakshadweep (UT)</option>
                                        <option value="m.p">Madhya Pradesh</option>
                                        <option>Maharashtra</option>
                                        <option>Manipur</option>
                                        <option>Meghalaya</option>
                                        <option>Mizoram</option>
                                        <option>Nagaland</option>
                                        <option>Orissa</option>
                                        <option>Puducherry (UT)</option>
                                        <option>Punjab</option>
                                        <option>Rajasthan</option>
                                        <option>Sikkim</option>
                                        <option>Tamil Nadu</option>
                                        <option>Telangana</option>
                                        <option>Tripura</option>
                                        <option>Uttar Pradesh</option>
                                        <option>Uttarakhand</option>
                                        <option>West Bengal</option>
                                       
									</select>
								</div>
								<div class="form-group col-md-2">
									<label for="inputZip">Zip</label> <input type="text" required name="pincode"
										class="form-control" id="inputZip">
								</div>

							</div>
							<div class="form-group ">
								<label for="inputState">Payment Mode</label> <select
									id="inputState" class="form-control"  name="paymentType">
									<option value="noselect"selected>...Choose...</option>
									<option value="cod">CASH ON DELEVERY*</option>
									<option value="card">Credit/Debit card</option>
								</select>
							</div>
							<div class="text-center">
								<div class="form-check">

									<button type="submit" class="btn btn-primary">Order
										now</button>
									<a href="index.jsp" type="submit" class="btn btn-success">continue
										shopping</a>

								</div>
							</div>

						</form>
					</div>
				</div>

			</div>
		</div>


	</div>
</body>
</html>