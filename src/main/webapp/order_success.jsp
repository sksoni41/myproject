<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>order success</title>
<%@include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">
	<%@ include file="all_component/navbar.jsp"%>
	<c:if test="${empty userobj }">
		<c:redirect url="login.jsp"></c:redirect>

	</c:if>


<div class="container text-center mt-5">
<i class="fas fa-check-circle fa-5x text-success"></i>
<h1>Thank You</h1>
<h2>Your Order Successfully Done</h2>
<h5>will be dilivered within 5 days</h5>
<a href="index.jsp" class = "btn btn-primary mt-3">Home</a>
<a href="order.jsp" class = "btn btn-warning mt-3">View Order</a>
</div>
</body>
</html>