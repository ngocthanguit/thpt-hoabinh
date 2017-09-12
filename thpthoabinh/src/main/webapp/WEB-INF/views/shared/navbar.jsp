<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
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
					<ul class="dropdown-menu dropdownhover-bottom" role="menu" style="">
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
				<security:authorize access="hasAuthority('ADMIN')">
					<li><a href="${contextRoot }/manage">Quản Lý</a></li>
				</security:authorize>
			</ul>
			<ul class="nav navbar-nav navbar-right">
			    	<security:authorize access="isAnonymous()">
	                    <li id="signup">
	                        <a href="${contextRoot}/membership">Sign Up</a>
	                    </li>
						<li id="login">
	                        <a href="${contextRoot}/login">Login</a>
	                    </li> 			    	
			    	</security:authorize>
			    	<security:authorize access="isAuthenticated()">
						<li class="dropdown" id="userModel">
						  <a class="btn btn-default dropdown-toggle" href="javascript:void(0)" id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true" aria-expanded="true">
						    ${userModel.fullName}
						    <span class="caret"></span>
						  </a>
						  <ul class="dropdown-menu" aria-labelledby="dropdownMenu1">
		                    <security:authorize access="hasAuthority('USER')">
			                    
			                	<li role="separator" class="divider"></li>	                                   
		                    </security:authorize>
							<li id="logout">
		                        <a href="${contextRoot}/logout">Logout</a>
		                    </li>                    			    	
						  </ul>		
						</li>    			    
			    	</security:authorize>                    
			    </ul>  
			
			
			
			
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid -->
</nav>