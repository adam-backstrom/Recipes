<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!DOCTYPE html>

<html>
	<head>
		<title>Receptbanken</title>
			  
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
				<br>
				
				<form:form action="${pageContext.request.contextPath}/logout" method="POST">
					<input type="submit" value="Logout" class="add-button" />
				</form:form>
			</div>
		</div>
	
		<a href="${pageContext.request.contextPath}/recipe/list">Back to List</a>

  		<div class="container col-4">
	    	<div class="card text-center">
	      		<div class="row">
	        		<div class="col-12 mx-auto">
            			<img class="w-100" src="https://www.recept.com/public/uploads/headrecipes/343fcefeeeb7c9bdcaf5fbc2a5e9c552.jpg">
						</div>
					</div>
					
					<div class="row text-center">
						<div class="col-10 mx-auto" style="margin-top: 20px; margin-bottom: 20px;">
							<h4 class="card-title">${recipe.title}</h4>
					
						${recipe.description}
					
						<br><br>
					
						<b>Ingredients:</b>
					
						<br>
						
						<c:set var="ingredientParts" value="${fn:split(recipe.ingredients, ',')}" />
						
						<c:forEach var="tempIngredient" items="${ingredientParts}">
							${tempIngredient}
							<br>
						</c:forEach>
						
						<br>
						
						<b>Directions:</b>
						
						<br>
						
						${recipe.directions}
						
					</div>
				</div>
			</div>
    	</div>

	</body>
</html>









