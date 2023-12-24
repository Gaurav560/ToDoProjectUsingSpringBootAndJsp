<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="ab" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ToDo Item List</title>

   <link rel="stylesheet"
        	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
        <script
        	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script
        	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
        <script
            src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>


<style>
a.btn-like {
	color: white;
	text-decoration: none;
}

a.btn-like:hover {
	text-decoration: none;
}
</style>
</head>
<body>

	<div class="container">
		<h1 class="p-3">ToDo Item List</h1>

		<form:form>
			<table class="table table-bordered">
				<tr>
					<th>Id</th>
					<th>Title</th>
					<th>Date</th>
					<th>Status</th>
					<th>Mark Completed</th>
					<th>Edit</th>
					<th>Delete</th>
				</tr>

				<ab:forEach var="todo" items="${list}">
					<tr>
						<td>${todo.id}</td>
						<td>${todo.title}</td>
						<td>${todo.date}</td>
						<td>${todo.status}</td>
						<td><a href="/updateToDoStatus/${todo.id}"
							class="btn btn-success btn-like">Mark Complete</a></td>
						<td><a href="/editToDoItem/${todo.id}"
							class="btn btn-primary btn-like">Edit</a></td>
						<td><a href="/deleteToDoItem/${todo.id}"
							class="btn btn-danger btn-like">Delete</a></td>
					</tr>
				</ab:forEach>
			</table>
		</form:form>

		<a href="/addToDoItem" class="btn btn-primary btn-block btn-like">Add
			New ToDo Item</a></div>
	
	<script th:inline="javascript">
		window.onload = function() {
			var msg = "${message}";

			if (msg === "Save Success") {
				toastr["success"]("Item added successfully!!");
			} else if (msg === "Delete Success") {
				toastr["success"]("Item deleted successfully!!");
			} else if (msg === "Delete Failure") {
				toastr["error"]("Some error occurred, couldn't delete item");
			} else if (msg === "Edit Success") {
				toastr["success"]("Item updated successfully!!");
			}

			toastr.options = {
				"closeButton" : true,
				"debug" : false,
				"newestOnTop" : false,
				"progressBar" : true,
				"positionClass" : "toast-top-right",
				"preventDuplicates" : false,
				"showDuration" : "300",
				"hideDuration" : "1000",
				"timeOut" : "5000",
				"extendedTimeOut" : "1000",
				"showEasing" : "swing",
				"hideEasing" : "linear",
				"showMethod" : "fadeIn",
				"hideMethod" : "fadeOut"
			};
		}
	</script>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL"
		crossorigin="anonymous"></script>
</body>
</html>
