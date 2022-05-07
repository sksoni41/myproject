<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit address</title>
<%@ include file="all_component/allCss.jsp"%>
</head>
<body style="background-color: #f7f7f7;">
	<%@ include file="all_component/navbar.jsp"%>

	<div class="container">
		<div class="row p-3">
		<div class="col-md-6 offset-md-3">
			<div class="card">
				<div class="card-body">
				<h3 class="text-center text-primary"> Address</h3>
				<form>
							
									<div class="form-row">
							
							<div class="form-group col-md-6">
								<label for="inputAddress">Address</label> <input type="text"
									class="form-control" id="inputAddress"
									placeholder="1234 Main St">
										</div>
										<div class="form-group col-md-6">
									<label for="inputAddress2">Landmark</label> <input type="text"
									class="form-control" id="inputAddress2"
									placeholder="Apartment, studio, or floor">
						</div>
							</div>
							
							<div class="form-row">
								<div class="form-group col-md-4">
									<label for="inputCity">City</label> <input type="text"
										class="form-control" id="inputCity">
								</div>
								<div class="form-group col-md-4">
									<label for="inputState">State</label> <select id="inputState"
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
                                        <option>Madhya Pradesh</option>
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
								<div class="form-group col-md-4">
									<label for="inputZip">Pincode</label> <input type="text"
										class="form-control" id="inputZip">
								</div>

							</div>
						
							<div class="text-center">
								

									<button type="submit" class="btn btn-primary btn-warning text-white">Add Address</button>
									

								
							</div>

						</form>
				
				
				
				</div>
			</div>
			</div>
		</div>
	</div>
</body>
</html>