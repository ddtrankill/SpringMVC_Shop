<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/WEB-INF/views/template/header.jsp"%>
<div class="container">
	<h2>Cart</h2>
	<section class="container">
		<div>
			<table class="table table-hover">
				<tr>
					<th>Product</th>
					<th>Unit Price</th>
					<th>Quantity</th>
					<th>Price</th>
					<th>Action</th>
				</tr>
				<c:forEach var="item" items="${cart.getCartItems()}">
					<tr>
						<td>${item.getProduct().getProductName()}</td>
						<td>${item.getProduct().getProductPrice()}</td>
						<td>${item.getQuantity()}</td>
						<td>${item.getTotalPrice()}</td>
						<td>
							<a href="/rest/cart/remove/${item.getCartItemId()}" class="label label-danger remove-item">
								<span class="glyphicon glyphicon-remove"></span>remove
							</a>
						</td>
					</tr>
				</c:forEach>
				<tr>
					<th></th>
					<th></th>
					<th>Total price: ${cart.getGrandTotal()}</th>
					<th></th>
					<th></th>
				</tr>
			</table>
			<div class="pull-right">
				<a href="<spring:url value="/products/all" />" class="btn btn-default">
					Continue Shopping
				</a>
				<a class="btn btn-danger delete-cart"  href="${pageContext.request.contextPath}/rest/cart/${cart.getCartId()}">
					<span class="glyphicon glyphicon-remove-sign"></span> Clear Cart
				</a>
				<a href="<spring:url value="/order/${cartId}" />" class="btn btn-success">
					<span class="glyphicon glyphicon-shopping-cart"></span> Check out
				</a>
			</div>
		</div>
	</section>
</div>
<script>
	$('.remove-item').on('click', function(e) {
		var url = $(this).attr("href");
		e.preventDefault();
		$.ajax({
			type : "PUT",
			url : "${pageContext.request.contextPath}" + url,
			success : function(msg) {
				alert("Deleted");
				location.reload();
			}
		});
	});

	$('.delete-cart').on('click', function(e) {
		var url = $(this).attr("href");
		e.preventDefault();
		$.ajax({
			type : "DELETE",
			url : url,
			success : function(msg) {
				alert("Deleted");
				location.reload();
			}
		});
	});
</script>
<%@ include file="/WEB-INF/views/template/footer.jsp"%>