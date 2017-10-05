<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<div class="content">
	<br />
	<c:if test="${not empty message}">
		<div class="row">
			<div class="col-xs-12 col-md-offset-2 col-md-8">
				<div class="alert alert-success fade in">${message}</div>
			</div>
		</div>
	</c:if>
	<c:if test="${album.type == 'image'}">
		<h3>Tạo Album</h3>
	</c:if>
	<c:if test="${album.type == 'file'}">
		<h3>Upload Tài Liệu</h3>
	</c:if>
	
	<hr />
	<br />
	<sf:form class="form-horizontal" id="file-upload-form" modelAttribute="album"
		action="${contextRoot}/manage/save" method="POST"
		enctype="multipart/form-data">
		<div class="form-group">
			<label class="control-label col-md-3">Tên Album</label>
			<div class="col-md-8">
				<sf:input type="text" path="name" class="form-control"
					placeholder="Nhập tên album" />
				<sf:errors path="Name" cssClass="help-block" element="em" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-md-3">Mô Tả</label>
			<div class="col-md-8">
				<sf:textarea path="description" class="form-control"
					placeholder="Nhập mô tả album!" />
				<sf:errors path="Description" cssClass="help-block" element="em" />
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-3">Ảnh Đại Diện</label>
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
		<div class="form-group">

			<div class="col-md-offset-4 col-md-4">

				<input type="submit" name="submit" value="Lưu Album"
					class="btn btn-primary" />

			</div>
		</div>

	</sf:form>

</div>
