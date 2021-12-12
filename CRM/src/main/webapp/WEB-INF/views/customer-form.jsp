<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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

<title>Save Customer</title>
</head>

<body>
	<div class="container">
		<h3 class="bg-info text-white">CUSTOMER RELATIONSHIP MANAGEMENT</h3>
		<hr>
		<p class="h4 mb-4">Save Customer</p>



		<form action="/CustomerRelationshipManagement/customer/save"
			method="POST">
			<!-- Add hidden form field to handle update -->
			<input type="hidden" name="id" value="${customers.id}" />
			<div class="container">
				<table class="table table-borderless">
					<tbody>
						<tr>
							<td>First Name</td>
							<td><input type="text" name="firstName"
								value="${customers.firstName}" class="form-control mb-4 col-4"
								placeholder="First Name"></td>
						</tr>
						<tr>
							<td>Last name</td>
							<td><input type="text" name="lastName"
								value="${customers.lastName}" class="form-control mb-4 col-4"
								placeholder="Last Name"></td>
						</tr>
						<tr>
							<td>Email</td>
							<td><input type="text" name="email"
								value="${customers.email}" class="form-control mb-4 col-4"
								placeholder="Email"></td>
						</tr>
						<tr>
							<td></td>
							<td><button type="submit" class="btn btn-info col-2">Save</button></td>
						</tr>
					</tbody>
				</table>
			</div>
		</form>

		<hr>
		<a href="/CustomerRelationshipManagement/customer/list">Back to
			List</a>
	</div>
</body>
</html>