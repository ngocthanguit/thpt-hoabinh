<%@page contentType="text/html" pageEncoding="UTF-8"%>



<c:if test="${not empty message}">
	<div class="row">
		<div class="col-xs-12 col-md-offset-2 col-md-8">
			<div class="alert alert-info fade in">${message}</div>
		</div>
	</div>
</c:if>

<h1>Danh Sách User</h1>

<hr />
<br />
<div class="row">


	<div class='col-xs-12'>
		<form class="form-horizontal" id="adminUpdateUserForm"
			action="${contextRoot}/manage/updateuser" method="POST">

			<div class="form-group">
				<label class="control-label col-md-3">Họ và Tên</label>
				<div class="col-md-8 disabled">
					<input type="text" name="fullName" class="form-control"
						value="${fullName}" />
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-md-3">Email</label>
				<div class="col-md-8 disabled">
					<input type="text" name="email" class="form-control"
						value="${email}" />
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-md-3">Số Điện Thoại</label>
				<div class="col-md-8 disabled">
					<input type="text" name="phone" class="form-control"
						value="${phone}" />
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-md-3">Thông tin khác</label>
				<div class="col-md-8 disabled">
					<textarea name="profile" class="form-control">${profile}</textarea>
				</div>
			</div>

			<div class="form-group">
				<label class="control-label col-md-3">Chức Vụ</label>
				<div class="col-md-8 disabled">
					<select name="role" class="form-control">
						<c:if test="${role == 'USER'}">
							<option value="USER" selected>USER</option>
						</c:if>
						<c:if test="${role != 'USER'}">
							<option value="USER">USER</option>
						</c:if>
						<c:if test="${role == 'TEACHER'}">
							<option value="TEACHER" selected>TEACHER</option>
						</c:if>
						<c:if test="${role != 'TEACHER'}">
							<option value="TEACHER">TEACHER</option>
						</c:if>
						<c:if test="${role == 'ADMIN'}">
							<option value="ADMIN" selected>ADMIN</option>
						</c:if>
						<c:if test="${role != 'ADMIN'}">
							<option value="ADMIN">ADMIN</option>
						</c:if>
					</select>
				</div>
			</div>
			<input type="hidden" id= "csrf-token" th:name="${_csrf.parameterName}" th:value="${_csrf.token}"/>

			<div class="form-group">

				<div class="col-md-offset-4 col-md-4">

					<input type="submit" name="submit" value="Cập Nhật"
						class="btn btn-primary" />

				</div>
			</div>

		</form>

		<table id="usersTable" class="table table-condensed table-bordered">

			<thead>
				<tr>
					<th>Id</th>
					<th>&#160;</th>
					<th>Username</th>
					<th>Họ Tên</th>
					<th>Email</th>
					<th>Phone</th>
					<th>Thông Tin</th>
					<th>Activate</th>
					<th>Edit</th>
				</tr>
			</thead>

			<tfoot>
				<tr>
					<th>Id</th>
					<th>&#160;</th>
					<th>Username</th>
					<th>Họ Tên</th>
					<th>Email</th>
					<th>Phone</th>
					<th>Thông Tin</th>
					<th>Activate</th>
					<th>Edit</th>
				</tr>
			</tfoot>


		</table>


	</div>


</div>

