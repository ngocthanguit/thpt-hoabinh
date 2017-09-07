<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />

<c:set var="contextRoot" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>THPT HÒA BÌNH - ${title}</title>

<!-- Bootstrap Core CSS -->
<link href="${css}/bootstrap.min.css" rel="stylesheet">




<!-- Bootstrap Dropdown Hover CSS -->
<link href="${css}/animate.min.css" rel="stylesheet">
<link href="${css}/bootstrap-dropdownhover.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="${css}/mystyle.css" rel="stylesheet">
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
    <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
<![endif]-->


</head>
<body>
<div class="p-t-h-b">
	<div class="container">
		<div class="row">
			<div class="header-section span12">
				<div id="logo" class="site-logo">
					<a href="/" title="Trang chủ" rel="home"> <img
						src="${images}/truong.jpg" alt="" role="presentation"
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

	<!-- /#header -->

	<div class="container text-center">
		<div class="row">


			<!-- Start navbar -->

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
						<a class="navbar-brand" href="#">Trang Chủ</a>
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
								<ul class="dropdown-menu dropdownhover-bottom" role="menu"
									style="">
									<li><a href="#">Action</a></li>
									<li><a href="#">Another action</a></li>
									<li><a href="#">Another action</a></li>
									<li><a href="#">Something else here</a></li>
									<li class="divider"></li>
									<li><a href="#">Separated link</a></li>
									<li class="divider"></li>
									<li><a href="#">One more separated link</a></li>
								</ul></li>
							<li><a href="#">TKB</a></li>
							<li><a href="#">Thông Tin Hoạt Động</a></li>
							<li><a href="#">Tham Khảo</a></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-expanded="false">Tài
									Nguyên<span class="caret"></span>
							</a>
								<ul class="dropdown-menu dropdownhover-bottom" role="menu"
									style="">
									<li><a href="#">Hình ảnh hoạt động</a></li>
									<li><a href="#">Video giảng dạy</a></li>
									<li class="dropdown"><a href="#">Another dropdown <span
											class="caret"></span></a>
										<ul class="dropdown-menu dropdownhover-right">
											<li><a href="#">Action</a></li>
											<li><a href="#">Another action</a></li>
											<li><a href="#">Something else here</a></li>
											<li class="divider"></li>
											<li><a href="#">Separated link</a></li>
											<li class="divider"></li>
											<li><a href="#">One more separated link</a></li>
										</ul></li>
									<li class="dropdown"><a href="#">Another dropdown 2 <span
											class="caret"></span></a>
										<ul class="dropdown-menu dropdownhover-right" style="">
											<li><a href="#">Action</a></li>
											<li><a href="#">Another action</a></li>
											<li><a href="#">Another action</a></li>
											<li class="dropdown"><a href="#">Another dropdown <span
													class="caret"></span></a>
												<ul class="dropdown-menu dropdownhover-right"
													style="bottom: auto; top: -32px;">
													<li><a href="#">Action</a></li>
													<li><a href="#">Another action</a></li>
													<li><a href="#">Something else here</a></li>
													<li class="divider"></li>
													<li><a href="#">Separated link</a></li>
													<li class="divider"></li>
													<li><a href="#">One more separated link</a></li>
												</ul></li>
											<li><a href="#">Something else here</a></li>
											<li class="divider"></li>
											<li><a href="#">Separated link</a></li>
											<li class="divider"></li>
											<li><a href="#">One more separated link</a></li>
										</ul></li>
									<li><a href="#">Something else here</a></li>
									<li class="divider"></li>
									<li><a href="#">Separated link</a></li>
									<li class="divider"></li>
									<li><a href="#">One more separated link</a></li>
								</ul></li>
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-expanded="false">Giáo
									Dục <span class="caret"></span>
							</a>
								<ul class="dropdown-menu dropdownhover-top" role="menu"
									style="bottom: 100%; top: auto;">
									<li><a href="#">Action</a></li>
									<li><a href="#">Another action</a></li>
									<li><a href="#">Something else here</a></li>
									<li class="divider"></li>
									<li><a href="#">Separated link</a></li>
									<li class="divider"></li>
									<li><a href="#">One more separated link</a></li>
								</ul></li>
							<li><a href="#">Tuyển Sinh</a></li>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li class="dropdown"><a href="#" class="dropdown-toggle"
								data-toggle="dropdown" role="button" aria-expanded="false">Dropdown
									<span class="caret"></span>
							</a>
								<ul class="dropdown-menu dropdownhover-bottom" role="menu">
									<li><a href="#">Action</a></li>
									<li><a href="#">Another action</a></li>
									<li class="dropdown"><a href="#">Another dropdown <span
											class="caret"></span></a>
										<ul class="dropdown-menu dropdownhover-left">
											<li><a href="#">Action</a></li>
											<li><a href="#">Another action</a></li>
											<li><a href="#">Something else here</a></li>
											<li class="divider"></li>
											<li><a href="#">Separated link</a></li>
											<li class="divider"></li>
											<li><a href="#">One more separated link</a></li>
										</ul></li>
									<li class="dropdown"><a href="#">Another dropdown 2 <span
											class="caret"></span></a>
										<ul class="dropdown-menu dropdownhover-left">
											<li><a href="#">Action</a></li>
											<li><a href="#">Another action</a></li>
											<li><a href="#">Another action</a></li>
											<li class="dropdown"><a href="#">Another dropdown <span
													class="caret"></span></a>
												<ul class="dropdown-menu dropdownhover-left">
													<li><a href="#">Action</a></li>
													<li><a href="#">Another action</a></li>
													<li><a href="#">Something else here</a></li>
													<li class="divider"></li>
													<li><a href="#">Separated link</a></li>
													<li class="divider"></li>
													<li><a href="#">One more separated link</a></li>
												</ul></li>
											<li><a href="#">Something else here</a></li>
											<li class="divider"></li>
											<li><a href="#">Separated link</a></li>
											<li class="divider"></li>
											<li><a href="#">One more separated link</a></li>
										</ul></li>
									<li><a href="#">Something else here</a></li>
									<li class="divider"></li>
									<li><a href="#">Separated link</a></li>
									<li class="divider"></li>
									<li><a href="#">One more separated link</a></li>
								</ul></li>
						</ul>
					</div>
					<!-- /.navbar-collapse -->
				</div>
				<!-- /.container-fluid -->
			</nav>



			<!-- End navbar -->


		</div>
	</div>



	<div class="container text-center">
		<div class="row">
			<div class="col-sm-4">

				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">Tìm Kiếm</h3>
					</div>
					<div class="panel-body search-panel">
						<form role="search">
							<div class="form-group input-group">
								<input type="text" class="form-control" placeholder="Search..">
								<span class="input-group-btn">
									<button class="btn btn-default" type="button">
										<span class="glyphicon glyphicon-search"></span>
									</button>
								</span>
							</div>
						</form>

					</div>
				</div>

				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">Tin Tức Nổi Bật</h3>
					</div>
					<div class="panel-body side-panel">

						<ul class="side-news">
							<li><a href="">Lễ Khai giảng năm học mới 2010 - 2011</a></li>
							<li><a href="">Hình ảnh lễ khai giảng năm học mới 2010 -
									2011 (tiếp)</a></li>
							<li><a href="">Chùm ảnh ngày lễ tốt nghiệp khối 12 khóa
									2007 2010</a></li>
							<li><a href="">Chùm ảnh ngày bế giảng năm học 2009 -
									2010</a></li>
							<li><a href="">Hoạt động chào mừng ngày nhà giáo VN năm
									học 2008-2009</a></li>
						</ul>

					</div>
				</div>

				<div class="panel panel-primary">
					<div class="panel-heading">
						<h3 class="panel-title">Danh Mục</h3>
					</div>
					<div class="panel-body side-panel">
						<ul class="side-news">
							<li><a href="">NỘI QUY DIỄN ĐÀN</a></li>
							<li><a href="">Hoạt động nhà trường</a></li>
							<li><a href="">Giới thiệu chung</a></li>
							<li><a href="">Thành tích nhà trường</a></li>
							<li><a href="">Công Đoàn</a></li>
							<li><a href="">Đoàn TNCS Hồ Chí Minh</a></li>
						</ul>
					</div>
				</div>

			</div>

			<div class="col-sm-8 content-view ">
				<div class="well main-content">THIS IS CONTENT Lorem ipsum dolor sit amet,
					consectetur adipisicing elit. Pariatur praesentium sed ipsum error
					quibusdam voluptatibus aspernatur voluptas nostrum libero, optio
					sunt similique obcaecati enim eius tempore accusantium! Labore
					magni assumenda sequi, doloribus iusto, fugit nulla, qui maxime cum
					voluptate aliquid ut enim a quibusdam corporis fugiat molestias.
					Maxime dignissimos facere, voluptas ducimus sit saepe eveniet,
					fugiat minus distinctio ut provident, esse nemo obcaecati rem
					voluptate tempore. Quasi nostrum provident sed illo amet at ipsam
					exercitationem facilis minus, laudantium natus dolor, in saepe
					nobis ratione itaque temporibus hic, recusandae veniam assumenda
					eius. Laboriosam sunt illo nesciunt quaerat vitae voluptatibus
					impedit exercitationem dolorum fuga a aliquid, ut recusandae,
					magnam pariatur. Soluta quae recusandae temporibus consequuntur
					fugit minus quisquam, nobis voluptatibus repellendus architecto!
					Blanditiis veniam ab quae maiores accusamus perferendis omnis
					dolorem quas quaerat ipsum esse quis aspernatur quibusdam ducimus,
					dolor voluptatum porro aliquid tempora cupiditate optio eius.
					Suscipit sed reprehenderit laboriosam veritatis sunt voluptatem
					maiores aliquam dolor vitae tempore. Nisi consequuntur voluptate
					error, deleniti laudantium. Iste inventore labore ducimus id,
					laborum esse, tempora itaque accusantium, dolores atque voluptatum
					facilis odit vel rem qui? Facere et, nisi inventore ullam sint
					commodi expedita quos quaerat, dolor dolores facilis architecto
					eligendi quis aliquid qui hic quidem! Voluptatem doloribus
					laudantium ipsa minus quod numquam dolores delectus ea asperiores
					magnam. Eligendi natus, ex voluptatibus impedit, assumenda quod,
					exercitationem, harum id suscipit expedita ratione. Molestias
					voluptas commodi, quasi voluptatem expedita aspernatur totam hic,
					quod id exercitationem sequi cumque officia iusto ad dolore modi
					excepturi ratione dolores optio iste laborum. Repellat ex officia,
					est ipsa hic architecto natus qui perspiciatis soluta veniam
					numquam, iusto cupiditate assumenda eaque commodi! Ipsa enim
					doloremque nemo ducimus ullam libero possimus dolor odit. Delectus
					incidunt eveniet, iste ipsa temporibus vel omnis possimus quae
					inventore nesciunt quia est at expedita repudiandae debitis
					accusantium, odit dolores aut dolore provident ducimus placeat.
					Vel, reiciendis incidunt soluta officia libero rem earum tempora.
					Sint dolor voluptas harum vero, perspiciatis, beatae pariatur
					labore aspernatur nulla exercitationem aperiam ad atque illum
					laudantium, dolorem laboriosam dignissimos officiis qui eos velit
					aliquam, explicabo iure! Maxime deserunt placeat ratione, alias
					vitae autem. Autem molestiae nisi distinctio, consectetur,
					doloremque fugit debitis totam ducimus. Sint optio consectetur
					impedit distinctio, magni molestias praesentium iusto reprehenderit
					odit pariatur, perspiciatis rem. Molestias consequuntur fugiat,
					possimus fuga? Iure, facere nostrum? Cupiditate perferendis
					doloribus unde aliquam molestias incidunt quo esse. Ipsum cum,
					totam laboriosam hic quo a doloribus, qui dolore ad quam temporibus
					ea! Itaque, quo distinctio ratione eius molestias porro minima
					architecto laboriosam harum non sed nam doloribus ipsam a
					blanditiis atque repellendus, nesciunt unde id! Soluta voluptas,
					fugit. Fugiat aliquid dolore, ad facere aliquam sapiente nihil
					consequuntur, saepe, quidem distinctio delectus facilis. Illum odit
					praesentium, et quasi cum, excepturi? Culpa itaque amet assumenda
					minus quos perferendis doloremque, eos ad, ducimus recusandae
					voluptate vero, suscipit libero optio repellat quidem quisquam
					architecto, temporibus eligendi! Nihil in maxime aliquid labore,
					molestiae qui veritatis. Rerum doloribus quo, ab, maiores delectus
					provident, laudantium ratione voluptates repellendus consectetur
					voluptas animi minus saepe error dolorum magni?</div>

			</div>
		</div>
	</div>

	<footer id="footer" class="container text-center">
		<h5>
			<b>Trường THPT Hòa Bình</b>
		</h5>
		<p>Địa chỉ: Thị Xã An Nhơn - Tỉnh Bình Định</p>
	</footer>


	<!-- jQuery -->
	<script src="${js}/jquery.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="${js}/bootstrap.min.js"></script>
	
	<!-- Bootstrap Dropdown Hover JS -->
	<script src="${js}/bootstrap-dropdownhover.js"></script>
	</div>
</body>
</html>