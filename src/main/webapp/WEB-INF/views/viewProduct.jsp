<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/WEB-INF/views/template/header.jsp"%>
<div class="container">
	<div class="page-header">
		<h2>Product Detail</h2>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<img
					src="<c:url value="/resources/images/${product.productId}.png" />"
					alt="image" style="width: 100%" />
			</div>
			<div class="col-md-5">
				<h3>${product.productName}</h3>
				<p>${product.productDescription}</p>
				<p>
					<strong>Manufacturer</strong>: ${product.productManufacturer}
				</p>
				<p>
					<strong>Category</strong>: ${product.productCategory}
				</p>
				<p>
					<strong>Condition</strong>: ${product.productCondition}
				</p>
				<p>${product.productPrice}USD</p>

				<br />

				<c:set var="role" scope="page" value="${param.role}" />
				<c:set var="url" scope="page" value="/products/all" />
				<c:if test="${role='admin'}">
					<c:set var="url" scope="page" value="/admin/productInventory" />
				</c:if>

				<p>
					<a href="<c:url value = "${url}" />" class="btn btn-default">Back</a>
					<a href="" class="btn btn-warning btn-large" id="add-to-cart">
						<span class="glyphicon glyphicon-shopping-cart"></span>Add to cart
					</a>
					<a href="<spring:url value="/customer/cart" />" class="btn btn-default">
						<span class="glyphicon glyphicon-hand-right"></span> View Cart
					</a>
				</p>

			</div>
		</div>
	</div>
</div>
<script>
$('#add-to-cart').on('click', function(e){
	e.preventDefault();
	$.ajax({
		type: "PUT",
		url: "${pageContext.request.contextPath}/rest/cart/add/${product.productId}",
		success: function(msg){
			alert("Added");
		}
	});
});
</script>
<%@ include file="/WEB-INF/views/template/footer.jsp"%>
