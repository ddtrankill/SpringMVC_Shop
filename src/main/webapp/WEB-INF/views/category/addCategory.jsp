<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="/WEB-INF/views/template/header.jsp"%>
<div class="container">
	<h2><spring:message code="shop.category.add"></spring:message></h2>

	<form:form
		action="${pageContext.request.contextPath}/admin/category/addCategory"
		method="post" commandName="category" enctype="multipart/form-data">
		<div class="form-group">
			<label for="name">Name</label>
			<form:errors path="categoryName" class="form-errors" />
			<form:input path="categoryName" class="form-control" />
		</div>

		<input type="submit" value="Add" class="btn btn-default">
		<a href="<c:url value="/admin" />"
			class="btn btn-default">Cancel</a>

	</form:form>
</div>

<%@ include file="/WEB-INF/views/template/footer.jsp"%>