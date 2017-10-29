<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />
<spring:url var="editor" value="/resources/editor" />
<link href="${css}/bootstrap.min.css" rel="stylesheet">
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<div class="content main-page">
	<div class="row">
		<div class="col-xs-offset-2 col-xs-8">
			<sf:form class="form-horizontal" modelAttribute="album"
		action="${contextRoot}/manage/files/save" method="POST"
		enctype="multipart/form-data">

		<div class="form-group">
			<label class="control-label col-md-3">Chọn Ảnh</label>
			<div class="col-md-8">
				<input name="files" type="file" class="form-control" multiple />
				<sf:errors path="files" cssClass="help-block" element="em" />
			</div>
		</div>


		<sf:hidden path="id" />
		<sf:hidden path="active" />
		<sf:hidden path="authorId" />
		<sf:hidden path="type" />
		<sf:hidden path="dateCreated" />
		<sf:hidden path="dateModified" />
		<sf:hidden path="image" />
		<sf:hidden path="Description" />
		<sf:hidden path="Name" />
		<div class="form-group">

			<div class="col-md-offset-4 col-md-4">

				<input type="submit" name="submit" value="Lưu Album"
					class="btn btn-primary" />

			</div>
		</div>

	</sf:form>
		</div>

	</div>
</div>
<script src="${js}/jquery.js"></script>
<script src="${js}/myapp.js"></script>