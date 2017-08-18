<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ include file="/WEB-INF/views/template/header.jsp"%>
<div class="container">
	<h2><spring:message code="shop.product.add"/></h2>

	<form:form
		action="${pageContext.request.contextPath}/admin/product/addProduct"
		method="post" commandName="product" enctype="multipart/form-data">
		<div class="form-group">
			<label for="name">Name</label>
			<form:errors path="productName" class="form-errors" />
			<form:input path="productName" class="form-control" />
		</div>

		<div class="form-group">
			<label for="category">Category</label>
			<form:select path="productCategory.categoryId" class="form-control">
				<c:forEach items="${categories}" var="category">
					<form:option value="${category.getCategoryId()}">${category.getCategoryName()}</form:option>
				</c:forEach>
			</form:select>
		</div>

		<div class="form-group">
			<label for="description">Description</label>
			<form:textarea path="productDescription" id="description"
				class="form-control" />
		</div>

		<div class="form-group">
			<label for="price">Price</label>
			<form:errors path="productPrice" cssStyle="color:#ff0000;" />
			<form:input path="productPrice" id="price" class="form-control" />
		</div>

		<div class="form-group">
			<label for="condition">Condition</label> <label
				class="checkbox-inline"><form:radiobutton
					path="productCondition" id="condition" value="new" />New</label> <label
				class="checkbox-inline"><form:radiobutton
					path="productCondition" id="condition" value="used" />Used</label>
		</div>

		<div class="form-group">
			<label for="status">Status</label> <label class="checkbox-inline"><form:radiobutton
					path="productStatus" id="status" value="active" />Active</label> <label
				class="checkbox-inline"><form:radiobutton
					path="productStatus" id="status" value="inactive" />Inactive</label>
		</div>

		<div class="form-group">
			<label for="unitInStock">Unit In Stock</label>
			<form:errors path="unitInStock" cssStyle="color:#ff0000;" />
			<form:input path="unitInStock" id="unitInStock" class="form-control" />
		</div>

		<div class="form-group">
			<label for="manufacturer">Manufacturer</label>
			<form:input path="productManufacturer" id="manufacturer"
				class="form-control" />
		</div>

		<div class="form-group">
			<label class="control-label" for="productImage">Upload
				Picture</label>
			<form:input id="productImage" path="productImage" type="file"
				class="form:input-large" />
		</div>
		<input type="submit" value="Add" class="btn btn-default">
		<a href="<c:url value="/admin/productInventory" />"
			class="btn btn-default">Cancel</a>

	</form:form>
</div>

<%@ include file="/WEB-INF/views/template/footer.jsp"%>