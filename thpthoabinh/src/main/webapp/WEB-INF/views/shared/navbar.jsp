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
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">Giới
						Thiệu <span class="caret"></span>
				</a>
					<ul class="dropdown-menu dropdownhover-bottom" role="menu" style="">
						<li><a href="#">Giới Thiệu Chung</a></li>
						<li><a href="#">Thành Tích Nhà Trường</a></li>

					</ul></li>
				<li><a href="#">Học Tập</a></li>
				<li><a href="#">Quản Lý</a></li>

				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">Tuyển
						Sinh<span class="caret"></span>
				</a>
					<ul class="dropdown-menu dropdownhover-bottom" role="menu" style="">
						<li><a href="#">Thông Tin Từ BGD</a></li>
						<li><a href="#">Thông Tin Liên Thông ĐH, CĐ</a></li>
						<li><a href="#">Thông tin Tuyển Sinh</a></li>
						<li><a href="#">Tư Vấn Tuyển Sinh</a></li>
						<li><a href="#">Điểm Thi ĐH & CĐ</a></li>
						<li><a href="#">Dữ liệu Tuyển Sinh</a></li>
						<li><a href="#">Bản đồ TP HCM</a></li>
						<li><a href="#">Đề Thi & Tra điểm Từ Bộ</a></li>
						<li><a href="#">Điểm chuẩn các trường</a></li>
						<li><a href="#">Hướng nghiệp Việt</a></li>
						<li><a href="#">Chỉ Tiêu TS ĐH,CĐ</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">HS-SV
						HB<span class="caret"></span>
				</a>
					<ul class="dropdown-menu dropdownhover-top" role="menu"
						style="bottom: 100%; top: auto;">
						<li><a href="#">Ban liên lạc học sinh cũ</a></li>
						<li><a href="#">Học sinh đậu ĐH&CĐ các năm</a></li>
						<li><a href="#">Diễn đàn Hòa Bình</a></li>
						<li><a href="#">Đáp án & Đề các năm</a></li>
						<li><a href="#">Ứng Dụng CNTT</a></li>
						<li><a href="#">Tư Liệu ƯD CNTT</a></li>
						<li><a href="#">Cộng đồng hs-sv Hòa Bình</a></li>
					</ul></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle"
					data-toggle="dropdown" role="button" aria-expanded="false">Sổ
						Vàng<span class="caret"></span>
				</a>
					<ul class="dropdown-menu dropdownhover-top" role="menu"
						style="bottom: 100%; top: auto;">
						<li><a href="#">Học Sinh Đậu ĐH & CĐ</a></li>
						<li><a href="#">Thành Tích Của HS & GV</a></li>
					</ul></li>
				<li><a href="#">Liên Hệ</a></li>
				<security:authorize access="hasAuthority('ADMIN')">
					
					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown" role="button" aria-expanded="false">Admin<span class="caret"></span>
					</a>
						<ul class="dropdown-menu dropdownhover-top" role="menu"
							style="bottom: 100%; top: auto;">
							<li><a href="${contextRoot }/manage/post">Quản Lý Bài Đăng</a></li>
							<li><a href="${contextRoot }/manage/user">Quản Lý User</a></li>
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