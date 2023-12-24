<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@taglib prefix="ab" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page isELIgnored="false"%>

<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add ToDo Item</title>


<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
	crossorigin="anonymous">
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script>
        src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
	
</head>
<body>

	<div class="container">

		<h1 class="p-3">Add a ToDo Item</h1>

		<form:form action="/saveToDoItem" method="post" modelAttribute="toDo">

			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3" for="title">Title</label>
					<div class="col-md-6">
						<form:input type="text" path="title" id="title"
							class="form-control input-sm" required="required" />
					</div>
				</div>
			</div>

			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3" for="date">Date</label>
					<div class="col-md-6">
						<form:input type="date" path="date" id="date"
							class="form-control input-sm" required="required" />
					</div>
				</div>
			</div>

			<div class="row">
				<div class="form-group col-md-12">
					<label class="col-md-3" for="status">Status</label>
					<div class="col-md-6">
						<form:input type="text" path="status" id="status"
							class="form-control input-sm" value="Incomplete" />
					</div>
				</div>
			</div>

			<div class="row p-2">
				<div class="col-md-2">
					<button type="submit" value="Register" class="btn btn-success">Save</button>
				</div>
			</div>

		</form:form>

	</div>

	<script th:inline="javascript">
            window.onload = function() {

                var msg = "${message}";
                console.log(msg);
                if (msg == "Save Failure") {
    				Command: toastr["error"]("Something went wrong with the save.")
    			}

    			toastr.options = {
                      "closeButton": true,
                      "debug": false,
                      "newestOnTop": false,
                      "progressBar": true,
                      "positionClass": "toast-top-right",
                      "preventDuplicates": false,
                      "showDuration": "300",
                      "hideDuration": "1000",
                      "timeOut": "5000",
                      "extendedTimeOut": "1000",
                      "showEasing": "swing",
                      "hideEasing": "linear",
                      "showMethod": "fadeIn",
                      "hideMethod": "fadeOut"
                    }
    	    }
        </script>
	

</body>

</html>
