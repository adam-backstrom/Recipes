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
		
			<div class="col-12 text-center">
				<h2 style="margin-top: 20px;">The Recipe Bank</h2>
				
				<security:authorize access="hasAnyRole('MANAGER', 'ADMIN')">
					<input type="button"
						   value="Create Recipe"
						   onclick="window.location.href='showFormForAdd'; return false;"
						   class="add-button" />
				</security:authorize>
				
				<br>
				<br>
				<br>
				
				<form:form action="search" method="GET">
 					Search recipe: <input type="text" name="theSearchName" />
 					<input type="submit" value="Search" class="add-button">
 				</form:form>
			</div>
		</div>
		
		<div id="container">
			<div id="content">
 				
				<c:forEach var="tempRecipe" items="${recipes}">
					
					<c:url var="updateLink" value="/recipe/showFormForUpdate">
						<c:param name="recipeId" value="${tempRecipe.id}" />
					</c:url>					

					<c:url var="deleteLink" value="/recipe/delete">
						<c:param name="recipeId" value="${tempRecipe.id}" />
					</c:url>
					
					<c:url var="showcaseLink" value="/recipe/showcase">
						<c:param name="recipeId" value="${tempRecipe.id}" />
					</c:url>

			  		<div class="container py-5">
			  		
				    	<div class="card">
				      		<div class="row">
				      		
				        		<div class="col-4">
			            			<img class="w-100" src="${tempRecipe.imgurl}">
		 						</div>
		 						
				          		<div class="col-8" style="margin-top: 20px;">
				              		<h4 class="card-title">${tempRecipe.title}</h4>
				              		
				              		<div style="position: absolute; top: 5px; right: 30px;">
					              		<security:authorize access="hasAnyRole('MANAGER', 'ADMIN')">
											<security:authorize access="hasAnyRole('MANAGER', 'ADMIN')">
												<a href="${updateLink}">Update</a>
											</security:authorize>
											/
											<security:authorize access="hasAnyRole('ADMIN')">
												<a href="${deleteLink}" onclick="if (!(confirm('Are you sure you want to delete this recipe?'))) return false">Delete</a>
											</security:authorize>
										</security:authorize>
									</div>
									
									<div style="margin-right: 150px;">
										${tempRecipe.description}
									</div>
									
									<br>
									
									<div style="position: absolute; bottom: 10px;">
									
										<b>Number of ingredients: </b>
										
										<c:set var="ingredientParts" value="${fn:split(tempRecipe.ingredients, ',')}" />
										
										${fn:length(ingredientParts)}
				
									</div>
									
									<a href="${showcaseLink}" class="btn btn-primary" style="position: absolute; bottom: 15px; right: 30px;">View</a>
									
					          	</div>
							</div>
						</div>
			    	</div>
				</c:forEach>
			</div>
		</div>
	</body>
</html>









