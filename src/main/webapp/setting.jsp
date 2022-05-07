<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Setting page</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
a{
text-decoration: none;
color: black;
}
a:hover{
text-decoration: none;

}
</style>
</head>
<body style="background-color: #f7f7f7;">
	<%@ include file="all_component/navbar.jsp"%>

<c:if test= "${empty userobj }">
						<c:redirect url="login.jsp"></c:redirect>
					
						</c:if >

	<div class="container">
		<h3 class="text-center">Hello, ${userobj.name }</h3>
		<div class="row p-5">
			<div class="col-md-4">
				<a href="sell_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class = "text-primary"><i class="fas fa-book-open fa-3x "></i></div>
							<h3>Sell Old Book</h3>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="old_book.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class = "text-primary"><i class="fas fa-book-open fa-3x "></i></div>
							<h3>Old Book</h3>
						</div>
					</div>
				</a>
			</div>
           <div class="col-md-4">
				<a href="edit_profile.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class = "text-primary"><i class="fas fa-address-card fa-3x"></i></div>
							<h3>Login & security(edit)</h3>
						</div>
					</div>
				</a>
			</div>
		
         
			
          <div class="col-md-6 mt-3">
				<a href="order.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class = "text-danger"><i class="fas fa-box-open fa-3x"></i></div>
							<h4>My Orders</h4>
							<p>Track Your Order</p>
						</div>
					</div>
				</a>
			</div>
			
			 <div class="col-md-6 mt-3">
				<a href="customer_care.jsp">
					<div class="card">
						<div class="card-body text-center">
							<div class = "text-primary"><i class="fas fa-info-circle fa-3x"></i></div>
							<h4>Customer Care</h4>
							<p>24x7</p>
						</div>
					</div>
				</a>
			</div>
		
		</div>
	</div>
	
	<%@ include file="all_component/footer.jsp"%>
</body>
</html>