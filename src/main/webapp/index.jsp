<%@page import="com.entity.User"%>
<%@page import="com.entity.BookDtls"%>
<%@page import="java.util.List"%>
<%@page import="com.DAO.BookDAOImpl"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.DB.DBConnect"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>EBOOK: INDEX</title>
<%@include file="all_component/allCss.jsp"%>
<style type="text/css">
.back-img1 {
	background: url("img/book-bg6.jpg");
	height: 40vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.back-img {
	background: url("img/book-pn.jpg");
	height: 13vh;
	width: 100%;
	background-repeat: no-repeat;
	background-size: cover;
}

.crd-ho:hover {
	background-color: #edd4d1;
}
</style>
</head>
<body style="background-color: #f7f7f7;">
	<%
	User u = (User) session.getAttribute("userobj");
	%>
	<%@ include file="all_component/navbar.jsp"%>
	<div class="container-fluid back-img1 ">
		<h1 class="text-center text primary text-light display-4 pt-5 "></h1>
	</div>

	<div class="container-fluid back-img ">
		<h1 class="text-center text primary text-light display-4 pt-5 "></h1>
	</div>
	<!-- start recent book -->


	<div class="container">
		<h3 class="text-center">RECENT BOOKS</h3>
		<div class="row">
			<%
			BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list2 = dao2.getRecentBook();
			for (BookDtls b : list2) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150; height: 200px" class="img-thumbnail">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<%
						if (b.getBookCategory().equals("Old")) {
						%>
						<p>
							categories:<%=b.getBookCategory()%></p>
						<div class="row ">


							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-5">view details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i
								class="fas fa-rupee-sign"></i></a>
						</div>
						<%
						} else {
						%>
						<p>
							categories:<%=b.getBookCategory()%></p>
						<div class="row ">


							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm"><i
								class="fas fa-shopping-cart"></i>add cart</a>
							<%
							} else {
							%>
							<a href="cartServlet?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm"> <i
								class="fas fa-shopping-cart"></i>add cart
							</a>
							<%
							}
							%>

							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">view details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i
								class="fas fa-rupee-sign"></i></a>
						</div>
						<%
						}
						%>


					</div>
				</div>
			</div>
			<%
			}
			%>




		</div>
		<div class="text-center text-white mt-1">
			<a href="all_recent_book.jsp" class="btn btn-danger btn-sm">View
				All</a>
		</div>
	</div>
	<!-- end recent book -->

	<hr>
	<!-- start new book -->


	<div class="container">
		<h3 class="text-center">NEW BOOKS</h3>
		<div class="row">

			<%
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list = dao.getNewBook();
			for (BookDtls b : list) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150; height: 200px" class="img-thumbnail">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							categories:<%=b.getBookCategory()%></p>
						<div class="row ">
							<%
							if (u == null) {
							%>
							<a href="login.jsp" class="btn btn-danger btn-sm"><i
								class="fas fa-shopping-cart"></i>add cart</a>
							<%
							} else {
							%>
							<a href="cartServlet?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>"
								class="btn btn-danger btn-sm"> <i
								class="fas fa-shopping-cart"></i>add cart
							</a>
							<%
							}
							%>

							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-1">view details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%><i
								class="fas fa-rupee-sign"></i></a>


						</div>
					</div>
				</div>
			</div>
			<%
			}
			%>






		</div>
		<div class="text-center text-white mt-1">
			<a href="all_new_book.jsp" class="btn btn-danger btn-sm">View All</a>
		</div>
	</div>
	<!-- end new book -->

	<hr>
	<!-- start OLD book -->
	<div class="container">
		<h3 class="text-center">OLD BOOKS</h3>
		<div class="row">



			<%
			BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
			List<BookDtls> list3 = dao3.getOldBook();
			for (BookDtls b : list3) {
			%>
			<div class="col-md-3">
				<div class="card crd-ho">
					<div class="card-body text-center">
						<img alt="" src="book/<%=b.getPhotoName()%>"
							style="width: 150; height: 200px" class="img-thumbnail">
						<p><%=b.getBookname()%></p>
						<p><%=b.getAuthor()%></p>
						<p>
							categories:<%=b.getBookCategory()%></p>

						<div class="row ">


							<a href="view_books.jsp?bid=<%=b.getBookId()%>"
								class="btn btn-success btn-sm ml-5">view details</a> <a href=""
								class="btn btn-danger btn-sm ml-1"><%=b.getPrice()%> <i
								class="fas fa-rupee-sign"></i></a>
						</div>

					</div>
				</div>
			</div>
			<%
			}
			%>






		</div>
		<div class="text-center text-white mt-1">
			<a href="all_old_book.jsp" class="btn btn-danger btn-sm">View All</a>
		</div>
	</div>
	<!-- end OLD book -->
	<%@ include file="all_component/footer.jsp"%>
</body>
</html>