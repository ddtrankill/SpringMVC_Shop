<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/WEB-INF/views/template/header.jsp"%>
<div class="container">
	<div class="page-header">
		<h2>All Products</h2>
	</div>
	<table class="table">
		<thead>
			<tr class="bg-success">
				<th>Proto Thumb</th>
				<th>Product Name</th>
				<th>Category</th>
				<th>Condition</th>
				<th>Price</th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${products}" var="product">
				<tr>
					<td><img
						src="<c:url value="/resources/images/${product.productId}.png" />"
						class="product-image-middle" alt="image" /></td>
					<td scope="row">${product.productName}</td>
					<td>${product.productCategory.getCategoryName()}</td>
					<td>${product.productCondition}</td>
					<td>${product.productPrice}USD</td>
					<td>
						<a href="<spring:url value="/products/viewProduct/${product.productId}" />">
							<span class="glyphicon glyphicon-info-sign"></span>
						</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<%@ include file="/WEB-INF/views/template/footer.jsp"%>