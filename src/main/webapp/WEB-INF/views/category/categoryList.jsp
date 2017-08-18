<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ include file="/WEB-INF/views/template/header.jsp"%>
<div class="container">
	<h2>All categories</h2>
	<div class="pull-right">	
		<a href="<spring:url value="/admin/category/addCategory" />"
			class="btn btn-primary"><spring:message code="shop.category.add"/></a>
	</div>
	<table class="table">
		<thead>
			<tr class="bg-success">
				<th>Category</th>
				<th>Action</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${categories}" var="category">
				<tr>
					<td>${category.getCategoryName()}</td>
					<td>
						<a href="<spring:url value="/admin/category/delete/${category.categoryId}" />" class="category-delete">
							<span class="glyphicon glyphicon-remove"></span>
						</a>
						<a href="<spring:url value="/admin/category/edit/${category.categoryId}" />">
							<span class="glyphicon glyphicon-pencil"></span>
						</a>
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>
<script>
$(".category-delete").on("click", function(e){
	var url = $(this).attr("href");
	console.log(url);
	e.preventDefault();
	$.ajax({
		type: "DELETE",
		url: url,
		success: function(msg) {
			alert("Category deleted");

		}
	});
});
</script>
<%@ include file="/WEB-INF/views/template/footer.jsp"%>