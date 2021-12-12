<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">

<title>CUSTOMER RELATIONSHIP MANAGEMENT</title>
</head>
<body>
	<div class="container">
		<h3 class="bg-info text-white">CUSTOMER RELATIONSHIP MANAGEMENT</h3>
		<hr>

		<!-- Add a button -->
		<a href="/CustomerRelationshipManagement/customer/showFormForAdd"
			class="btn btn-primary btn-sm mb-3"> Add Customer </a>

		<table class="table table-bordered table-striped">
			<thead class="bg-info text-white">

				<tr >
					<th>First Name</th>
					<th>Last Name</th>
					<th>Email</th>
					<th>Action</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${customers}" var="tempcustomer">
					<tr>
						<td><c:out value="${tempcustomer.firstName}" /></td>
						<td><c:out value="${tempcustomer.lastName}" /></td>
						<td><c:out value="${tempcustomer.email}" /></td>
						<td>
							<!-- Add "update" button/link --> 
							<a
							href="/CustomerRelationshipManagement/customer/showFormForUpdate?customerId=${tempcustomer.id}"
							class="btn btn-link"> Update </a> 
							<!-- Add "delete" button/link -->
							<a
							href="/CustomerRelationshipManagement/customer/delete?customerId=${tempcustomer.id}"
							class="btn btn-link"
							onclick="if (!(confirm('Are you sure you want to delete this customer?'))) return false">
								Delete </a>

						</td>

					</tr>
				</c:forEach>
			</tbody>
		</table>
		</div>
</body>
</html>