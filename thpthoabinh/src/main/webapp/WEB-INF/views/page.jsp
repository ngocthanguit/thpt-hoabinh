<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />
<spring:url var="editor" value="/resources/editor" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">

<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">
<meta name="_csrf" content="${_csrf.token}">
<meta name="_csrf_header" content="${_csrf.headerName}">

<title>THPT HÒA BÌNH - ${title}</title>
<script>
	window.menu = '${title}';
	window.contextRoot = '${contextRoot}'
</script>
<!-- Bootstrap Core CSS -->
<link href="${css}/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap Dropdown Hover CSS -->
<link href="${css}/animate.min.css" rel="stylesheet">
<link href="${css}/bootstrap-dropdownhover.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="${css}/mystyle.css" rel="stylesheet">

<script src="${editor}/ckeditor.js"></script>



<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>
	<!-- The actual snackbar -->
	<div id="snackbar"></div>
	<div class="wrapper">

		<div class="container">
			<div class="row">
				<div class="header-section span12">
					<div id="logo" class="site-logo">
						<a href="${contextRoot}/" title="Trang chủ" rel="home"> <img
							src="${images}/HB_Banner.png" alt="" role="presentation"
							style="width: 100%; height: 100%;" />
						</a>
						<hr>
					</div>
					<!-- /#logo -->
					<div id="site" class="hide">
						<div id="name">
							<a href="/">Cổng thông tin đào tạo</a>
						</div>
					</div>
					<!-- /#name-and-slogan -->
					<!-- /#header-content -->
				</div>
				<!-- /#site-login -->
			</div>
		</div>

		<div class="container text-center main-content">
			<div class="row">
				<!-- Navigation -->
				<%@include file="./shared/navbar.jsp"%>
			</div>
			<div class="row">
				<!-- Page Content -->
				<div class="content">


					<div class="container text-center">
						<div class="row">
							<c:if test="${manage != true}">
								<div class="col-sm-3">

									<%@include file="./shared/sidebar.jsp"%>

								</div>
								<div class="col-sm-9 content-view ">

									<c:if test="${userClickHome == true}">
										<%@include file="home.jsp"%>
									</c:if>
									<c:if test="${userClickPost == true}">
										<%@include file="post.jsp"%>
									</c:if>
									<c:if test="${userClickSignup == true}">
										<%@include file="signup.jsp"%>
									</c:if>
									<c:if test="${userClickImageAlbums == true}">
										<%@include file="showImageAlbum.jsp"%>
									</c:if>
									<c:if test="${userClickFileAlbums == true}">
										<%@include file="showFilesAlbum.jsp"%>
									</c:if>
									<c:if test="${userClickAlbumImages == true}">
										<%@include file="showAlbumImage.jsp"%>
									</c:if>
									<c:if test="${userClickAlbumFiles == true}">
										<%@include file="showAlbumFiles.jsp"%>
									</c:if>
									<c:if test="${userClickCategoryPosts == true}">
										<%@include file="listPosts.jsp"%>
									</c:if>
									
								</div>
							</c:if>
							
							<c:if test="${manage == true}">
								<div class="col-sm-12 content-view ">
									<c:if test="${userClickManagePost == true}">
										<%@include file="managePost.jsp"%>
									</c:if>
									<c:if test="${userClickManageUser == true}">
										<%@include file="manageUser.jsp"%>
									</c:if>
									<c:if test="${userClickManageAlbum == true}">
										<%@include file="file_upload_form.jsp"%>
									</c:if>

								</div>
							</c:if>
						</div>
					</div>
				</div>
			</div>
			<div class="row">
				<!-- Footer -->
				<%@include file="./shared/footer.jsp"%>
			</div>
		</div>



		<!-- jQuery -->
		<script src="${js}/jquery.js"></script>

		<script src="${js}/jquery.validate.js"></script>

		<!-- Bootstrap Core JavaScript -->
		<script src="${js}/bootstrap.min.js"></script>

		<!-- DataTable Plugin -->
		<script src="${js}/jquery.dataTables.js"></script>

		<!-- DataTable Bootstrap Script -->
		<script src="${js}/dataTables.bootstrap.js"></script>

		<!-- DataTable Bootstrap Script -->
		<script src="${js}/bootbox.min.js"></script>

		

		<!-- Bootstrap Dropdown Hover JS -->
		<script src="${js}/bootstrap-dropdownhover.js"></script>
		<!-- my script -->
		<script src="${js}/myapp.js"></script>
	</div>
</body>

</html>
