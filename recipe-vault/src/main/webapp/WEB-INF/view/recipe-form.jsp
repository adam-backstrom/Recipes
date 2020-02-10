<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>

<html>
	<head>
		<title>Save/Update Recipe</title>
			  
	    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
		<link rel="stylesheet" href="//maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
		<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
		<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
		
	</head>

	<body>
		<div class="container">
			<div class="text-center" style="position: absolute; display: inline-block; right: 30px;">
				Logged in as: <security:authentication property="principal.username" />
			
				<br>
				
				<form:form action="${pageContext.request.contextPath}/logout" method="POST">
					<input type="submit" value="Logout" class="add-button" />
				</form:form>
				
			</div>
			
			<a href="${pageContext.request.contextPath}/recipe/list" style="left: 0; position: absolute; ">Back to List</a>
			
			<div class="text-center" style="display:inline-block">
				<form:form action="saveRecipe" modelAttribute="recipe" method="POST">
					<!-- need to associate this data with customer id -->
					<form:hidden path="id" />
	
					<table style="display: inline-block; position: absolute;">
						<tr>
							<td></td>
							<td><h2 style="margin-top: 20px;">Save/Update Recipe</h2></td>
						</tr>
						<tr>
							<td><label>Title: </label></td>
							<td><form:textarea rows="2" cols="50" path="title" /></td>
						</tr>
						
						<tr>
							<td><label>Description: </label></td>
							<td><form:textarea rows="5" cols="50" path="description" /></td>
						</tr>
						
						<tr>
							<td><label>Ingredients: </label></td>
							<td><form:textarea rows="5" cols="50" path="ingredients" /></td>
						</tr>
						
						<tr>
							<td><label>Directions: </label></td>
							<td><form:textarea rows="5" cols="50" path="directions" /></td>
						</tr>
						
						<tr>
							<td><label>Image URL: </label></td>
							<td><form:textarea rows="5" cols="50" path="imgurl" /></td>
						</tr>

						<tr>
							<td></td>
							<td colspan="3"><input type="submit" value="Save/Update" class="save" /></td>
						</tr>
					</table>
					
					<div style="position: absolute; margin-left: 500px; margin-top: 70px;">
					
						<form:form action="saveRecipe" modelAttribute="recipe" method="POST">
							<!-- need to associate this data with customer id -->
							<form:hidden path="id" />
						</form:form>	
					</div>
				</form:form>
			</div>
		</div>
	</body>
</html>










