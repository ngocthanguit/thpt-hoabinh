<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>



<c:if test="${not empty message}">
	<div class="row">
		<div class="col-xs-12 col-md-offset-2 col-md-8">
			<div class="alert alert-info fade in">${message}</div>
		</div>
	</div>
</c:if>

<div class="row">
	<div class="col-xs-12">
		<div class="panel panel-primary manage-body">

			<div class="panel-heading">

				<h4>Chỉnh Sửa Trang</h4>

			</div>

			<div class="panel-body">
				<sf:form class="form-horizontal" id="postForm" modelAttribute="post"
					action="${contextRoot}/manage/post" method="POST"
					enctype="multipart/form-data">
					<div class="form-group">
						<label class="control-label col-md-1">Tiêu Đề</label>
						<div class="col-md-11">
							<sf:input type="text" path="title" class="form-control"
								placeholder="Nhập tiêu đề" />
							<sf:errors path="Title" cssClass="help-block" element="em" />
						</div>
					</div>


					<div class="form-group">
						<label class="control-label col-md-1">Nội Dung</label>
						<div class="col-md-11">
							<sf:textarea path="pContent" class="form-control" rows="15"
								id="editor1" placeholder="Nhập nội dung bài viết!" />
							<sf:errors path="PContent" cssClass="help-block" element="em" />
						</div>
					</div>

					


					<sf:hidden path="id" />
					<sf:hidden path="image" />
					<sf:hidden path="slug" />
					<sf:hidden path="active" />
					<sf:hidden path="authorId" />
					<sf:hidden path="dateCreated" />
					<sf:hidden path="dateModified" />
					<sf:hidden path="viewCount" />
					



					<div class="form-group">

						<div class="col-md-offset-4 col-md-4">

							<input type="submit" name="submit" value="Lưu Bài Viết"
								class="btn btn-primary" />

						</div>
					</div>

				</sf:form>

			</div>

		</div>
	</div>
</div>

