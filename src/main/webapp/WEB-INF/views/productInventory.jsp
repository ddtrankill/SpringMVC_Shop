<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/WEB-INF/views/template/header.jsp"%>

<div class="container">
	<h2>Product Inventory</h2>
	<table class="table">
		<thead>
			<tr>
				<th>Proto Thumb</th>
				<th>Product Name</th>
				<th>Category</th>
				<th>Condition</th>
				<th>Price</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${products}" var="product">
				<tr>
					<td><img
						src="<c:url value="/resources/images/${product.productId}.png" />"
						alt="image" class="product-image-middle"/></td>
					<td>${product.productName}</td>
					<td>${product.productCategory}</td>
					<td>${product.productCondition}</td>
					<td>${product.productPrice}USD</td>
					<td><a
						href="<spring:url value="/products/viewProduct/${product.productId}" />"><span
							class="glyphicon glyphicon-info-sign"></span></a> <a
						href="<spring:url value="/admin/product/deleteProduct/${product.productId}" />"><span
							class="glyphicon glyphicon-remove"></span></a> <a
						href="<spring:url value="/admin/product/editProduct/${product.productId}" />"><span
							class="glyphicon glyphicon-pencil"></span></a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<a href="<spring:url value="/admin/product/addProduct" />"
		class="btn btn-primary">Add Product</a>
</div>
	<%@ include file="/WEB-INF/views/template/footer.jsp"%>