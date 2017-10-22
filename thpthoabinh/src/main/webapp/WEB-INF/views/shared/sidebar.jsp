<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="panel panel-primary">
	<div class="panel-heading heading-side">
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
	<div class="panel-heading heading-side">
		<h3 class="panel-title">Thông Báo Chung</h3>
	</div>
	<div class="panel-body side-panel">

		<ul class="side-news">
			<c:forEach items="${listThongBaoChung}" var="post">
				<fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss.SSSSSS"
					value="${post.dateCreated}" var="parsedDate" />

				<li><a href="${contextRoot}/show/post/${post.id}">${post.title}</a>
					- <fmt:formatDate value="${parsedDate}"
						pattern="dd/MM/yyyy - HH:mm" /></li>
			</c:forEach>

		</ul>

	</div>
</div>

<div class="panel panel-primary">
	<div class="panel-heading heading-side">
		<h3 class="panel-title">Danh Mục</h3>
	</div>
	<!-- 
	<div class="panel-body side-panel">
		<ul class="side-news">
			<li><a href="">NỘI QUY DIỄN ĐÀN</a></li>
			<li><a href="">Hoạt động nhà trường</a></li>
			<li><a href="">Giới thiệu chung</a></li>
			<li><a href="">Thành tích nhà trường</a></li>
			<li><a href="">Công Đoàn</a></li>
			<li><a href="">Đoàn TNCS Hồ Chí Minh</a></li>
		</ul>
	</div> -->
	<div class="list-group">


		<c:forEach items="${categories}" var="category">
			<c:choose>
				<c:when test="${category.id == 3}">
					<security:authorize access="hasAnyAuthority('ADMIN','TEACHER')">
	           			<a href="${contextRoot}/show/category/${category.id}/posts"
							class="list-group-item" id="a_${category.name}">${category.name}</a>
					</security:authorize>
         		</c:when>
				<c:otherwise>
					<a href="${contextRoot}/show/category/${category.id}/posts"
					class="list-group-item" id="a_${category.name}">${category.name}</a>
         		</c:otherwise>
			</c:choose>
			
		</c:forEach>


	</div>
</div>

<div class="panel panel-primary">
	<div class="panel-heading heading-side">
		<h3 class="panel-title">Trường Học Kết Nối</h3>
	</div>
	<div class="panel-body">
		<form role="search">

			<select class="form-control">
				<option>Website bộ giáo dục</option>
				<option>Giáo viên bộ môn</option>
				<option>Diễn Đàn THPT Hòa Bình</option>
				<option>Website tuyển sinh</option>
			</select>

		</form>
	</div>
</div>