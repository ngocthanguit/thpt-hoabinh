<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<div class="content">
	<br/>
	   	<c:if test="${not empty message}">
		<div class="row">
			<div class="col-xs-12 col-md-offset-2 col-md-8">
				<div class="alert alert-danger fade in">${message}</div>
			</div>
		</div>
	</c:if>
	<sf:form class="form-horizontal" id="signupForm" modelAttribute="user"
		action="${contextRoot}/signup" method="POST"
		enctype="multipart/form-data">
		<div class="form-group">
			<label class="control-label col-md-3">Tên Đăng Nhập</label>
			<div class="col-md-8">
				<sf:input type="text" path="username" class="form-control"
					placeholder="Nhập tên đăng nhập" />
				<sf:errors path="Username" cssClass="help-block" element="em" />
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-3">Mật Khẩu</label>
			<div class="col-md-8">
				<sf:password path="password" class="form-control"
					placeholder="Nhập password" />
				<sf:errors path="Password" cssClass="help-block" element="em" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-md-3">Nhập lại mật khẩu</label>
			<div class="col-md-8">
				<sf:password path="confirmPassword" class="form-control"
					placeholder="Nhập lại password" />
				<sf:errors path="confirmPassword" cssClass="help-block" element="em" />
			</div>
		</div>
		<div class="form-group">
			<label class="control-label col-md-3">Họ và Tên</label>
			<div class="col-md-8">
				<sf:input type="text" path="fullName" class="form-control"
					placeholder="Nhập tên đăng nhập" />
				<sf:errors path="FullName" cssClass="help-block" element="em" />
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-3">Email</label>
			<div class="col-md-8">
				<sf:input type="text" path="email" class="form-control"
					placeholder="Nhập email" />
				<sf:errors path="Email" cssClass="help-block" element="em" />
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-3">Số Điện Thoại</label>
			<div class="col-md-8">
				<sf:input type="text" path="phone" class="form-control"
					placeholder="Nhập số điện thoại" />
				<sf:errors path="Phone" cssClass="help-block" element="em" />
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-3">Thông tin khác</label>
			<div class="col-md-8">
				<sf:textarea path="profile" class="form-control"
					placeholder="Nhập thông tin khác!" />
				<sf:errors path="Profile" cssClass="help-block" element="em" />
			</div>
		</div>

		<div class="form-group">
			<label class="control-label col-md-3">Ảnh Đại Diện</label>
			<div class="col-md-8">
				<sf:input type="file" path="file" class="form-control" />
				<sf:errors path="file" cssClass="help-block" element="em" />
			</div>
		</div>


		<sf:hidden path="id" />
		<sf:hidden path="image" />
		<sf:hidden path="role" />
		<sf:hidden path="active" />
		<div class="form-group">

			<div class="col-md-offset-4 col-md-4">

				<input type="submit" name="submit" value="Signup"
					class="btn btn-primary" />

			</div>
		</div>

	</sf:form>

</div>