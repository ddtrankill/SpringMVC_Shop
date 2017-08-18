<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="<spring:url value="/resources/css/main.css"/>" />
<!-- jQuery -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<!-- Latest compiled and minified JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<header>
		<nav class="navbar navbar-default">
			<div class="container-fluid">
				<!-- Brand and toggle get grouped for better mobile display -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle collapsed"
						data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
						aria-expanded="false">
						<span class="sr-only">Toggle navigation</span> <span
							class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="<spring:url value="/"/>"><spring:message
							code="shop.name"></spring:message></a>
				</div>

				<!-- Collect the nav links, forms, and other content for toggling -->
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="<spring:url value="/products/all"/>">Products</a></li>
					</ul>
					<!-- Search products form -->
					<form action="<c:url value="/products/products" />" class="navbar-form navbar-left">
						<div class="form-group">
							<input type="text" name="searchCondition" class="form-control" placeholder="Search">
						</div>
						<button type="submit" class="btn btn-default">Submit</button>
					</form>
					<ul class="nav navbar-nav navbar-right">
						<c:if test="${!pageContext.request.userPrincipal.isAuthenticated()}">
								<li>
									<a href="<spring:url value="/register"/>"><spring:message
									code="shop.signup"></spring:message></a>
								</li>
								<li>
									<a href="<spring:url value="/login"/>"><spring:message
									code="shop.login"></spring:message></a>
								</li>
						</c:if>
						<c:if test="${pageContext.request.userPrincipal.isAuthenticated()}">
						<li class="dropdown">
							<a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-haspopup="true"
								aria-expanded="false"><span class="glyphicon glyphicon-th"></span>
							</a>							
							<ul class="dropdown-menu">
									<c:forEach var="item"
										items="${pageContext.request.userPrincipal.getAuthorities()}">
										<c:set var="roleAdmin" value="ROLE_ADMIN" />
										<c:set var="roleUser" value="ROLE_USER" />
										<c:if test="${item eq roleAdmin}">
										
										<!-- If user is admin -->
											<li>
												<a href="<spring:url value="/admin/productInventory"/>">
												<spring:message code="shop.product.inventory"></spring:message></a>
											</li>
											<li>
												<a href="<spring:url value="/admin/category/all"/>">
												<spring:message code="shop.category.management"></spring:message></a>
											</li>
										</c:if>
										<c:if test="${item eq roleUser}">
										
										<!-- If user is customer -->
											<li><a href="<spring:url value="/customer/cart"/>"><spring:message
													code="shop.cart"></spring:message></a></li>
										</c:if>
										<li role="separator" class="divider"></li>
										<li><a href="<c:url value="/j_spring_security_logout"/>">Logout</a></li>
									</c:forEach>
								</ul>
							</li>
						</c:if>
					</ul>
				</div>
				<!-- /.navbar-collapse -->
			</div>
			<!-- /.container-fluid -->
		</nav>
	</header>