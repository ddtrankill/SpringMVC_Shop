<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ include file="/WEB-INF/views/template/header.jsp" %>
    <div class="container">
        <div class="page-header">
            <h2>Edit Category</h2>
        </div>

        <form:form action="${pageContext.request.contextPath}/admin/category/edit"
                   method="post" commandName="category" enctype="multipart/form-data">

         <form:hidden path="categoryId" value="${category.categoryId}" />

            <div class="form-group">
                <label for="name">Name</label>
                <form:errors path="categoryName" class="form-errors" />
                <form:input path="categoryName" id="name" class="form-control" value="${category.categoryName}"/>
            </div>

            <input type="submit" value="Submit" class="btn btn-default">
            <a href="<c:url value="/category/all" />" class="btn btn-default">Cancel</a>

        </form:form>
</div>
<%@ include file="/WEB-INF/views/template/footer.jsp" %>