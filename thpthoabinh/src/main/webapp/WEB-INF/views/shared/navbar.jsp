<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<nav class="navbar navbar-inverse" role="navigation">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-animations">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="${contextRoot}">Trang Chủ</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-animations" data-hover="dropdown"
			data-animations="fadeInDown fadeInRight fadeInUp fadeInLeft">
			<ul class="nav navbar-nav">
				<li><a href="#">Giới Thiệu</a></li>
				<li><a href="${contextRoot}/show/category/4/posts">TKB</a></li>
				<li><a href="${contextRoot}/show/category/5/posts">Hoạt Động</a></li>

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">Tham Khảo<span class="caret"></span>
				</a>
					<ul class="dropdown-menu dropdownhover-bottom" role="menu" style="">
						<li><a href="#">Đề Kiểm Tra</a></li>
						<li><a href="#">Tài Liệu Học Tập</a></li>
					</ul></li>
				<li><a href="${contextRoot}/show/category/6/posts">Giáo Dục</a></li>
				<li><a href="${contextRoot}/show/category/8/posts">Tuyển Sinh</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">Lưu Trữ<span class="caret"></span>
				</a>
					<ul class="dropdown-menu dropdownhover-top" role="menu"
						style="bottom: 100%; top: auto;">
						<li><a href="${contextRoot }/show/albums">Hình Ảnh</a></li>
						<li><a href="#">Video</a></li>
					</ul></li>
				<security:authorize access="hasAuthority('ADMIN')">
					
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">Admin<span class="caret"></span>
					</a>
						<ul class="dropdown-menu dropdownhover-top" role="menu"
							style="bottom: 100%; top: auto;">
							<li><a href="${contextRoot }/manage/post">Quản Lý Bài Đăng</a></li>
							<li><a href="${contextRoot }/manage/user">Quản Lý User</a></li>
							<li><a href="${contextRoot }/manage/show">Upload Images</a></li>
						</ul></li>
				</security:authorize>
			</ul>
			<ul class="nav navbar-nav navbar-right">
				<security:authorize access="isAnonymous()">
					<li id="signup"><a href="${contextRoot}/signup">Đăng Ký</a></li>
					<li id="login"><a href="${contextRoot}/login">Đăng Nhập</a></li>
				</security:authorize>
				<security:authorize access="isAuthenticated()">
					<li class="dropdown" id="userModel"><a
						class="btn btn-default dropdown-toggle" href="javascript:void(0)"
						id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="true"> ${userModel.fullName} <span
							class="caret"></span>
					</a>
						<ul class="dropdown-menu logout-drop"
							aria-labelledby="dropdownMenu1">
							<li><a href="${contextRoot}/editaccount">Chỉnh Sửa Thông Tin</a></li>
							<li id="logout"><a href="${contextRoot}/logout">Đăng Xuất</a></li>
						</ul></li>
				</security:authorize>
			</ul>

		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>