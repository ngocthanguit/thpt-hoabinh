<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>

<security:authorize access="hasAuthority('ADMIN')">
	<c:if test="${listThongBaoGiaoVien != null}">

	<div class="panel panel-primary">
		<div class="panel-heading heading-main">
			<h3 class="panel-title">THÔNG BÁO DÀNH CHO GIÁO VIÊN</h3>
		</div>
		<div class="panel-body">
			<ul class="side-news main-list-annount">
				<c:forEach items="${listThongBaoGiaoVien}" var="post">
					<fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss.SSSSSS"
						value="${post.dateCreated}" var="parsedDate" />

					<li><a href="${contextRoot}/show/post/${post.id}">${post.title}</a>
						- <fmt:formatDate value="${parsedDate}"
							pattern="dd/MM/yyyy - HH:mm" /></li>
				</c:forEach>
			</ul>
			<p class="panel-foot">
				<a href="#">Xem thêm >></a>
			</p>
		</div>
	</div>

</c:if>
</security:authorize>


<c:if test="${listThongBaoChung != null}">

	<div class="panel panel-primary">
		<div class="panel-heading heading-main">
			<h3 class="panel-title">THÔNG BÁO CHUNG</h3>
		</div>
		<div class="panel-body">
			<ul class="side-news main-list-annount">
				<c:forEach items="${listThongBaoChung}" var="post">
					<fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss.SSSSSS"
						value="${post.dateCreated}" var="parsedDate" />

					<li><a href="${contextRoot}/show/post/${post.id}">${post.title}</a>
						- <fmt:formatDate value="${parsedDate}"
							pattern="dd/MM/yyyy - HH:mm" /></li>
				</c:forEach>
			</ul>
			<p class="panel-foot">
				<a href="#">Xem thêm >></a>
			</p>
		</div>
	</div>

</c:if>


<c:if test="${listTKB != null}">

	<div class="panel panel-primary">
		<div class="panel-heading heading-main">
			<h3 class="panel-title">THỜI KHÓA BIỂU</h3>
		</div>
		<div class="panel-body">
			<ul class="side-news main-list-annount">
				<c:forEach items="${listTKB}" var="post">
					<fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss.SSSSSS"
						value="${post.dateCreated}" var="parsedDate" />

					<li><a href="${contextRoot}/show/post/${post.id}">${post.title}</a>
						- <fmt:formatDate value="${parsedDate}"
							pattern="dd/MM/yyyy - HH:mm" /></li>
				</c:forEach>
			</ul>
			<p class="panel-foot">
				<a href="#">Xem thêm >></a>
			</p>
		</div>
	</div>

</c:if>

<c:if test="${listThongTinHoatDong != null}">

	<div class="panel panel-primary">
		<div class="panel-heading heading-main">
			<h3 class="panel-title">THÔNG TIN HOẠT ĐỘNG</h3>
		</div>
		<div class="panel-body">
			<ul class="side-news main-list-annount">
				<c:forEach items="${listThongTinHoatDong}" var="post">
					<fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss.SSSSSS"
						value="${post.dateCreated}" var="parsedDate" />

					<li><a href="${contextRoot}/show/post/${post.id}">${post.title}</a>
						- <fmt:formatDate value="${parsedDate}"
							pattern="dd/MM/yyyy - HH:mm" /></li>
				</c:forEach>
			</ul>
			<p class="panel-foot">
				<a href="#">Xem thêm >></a>
			</p>
		</div>
	</div>

</c:if>

<c:if test="${listGDKH != null}">

	<div class="panel panel-primary">
		<div class="panel-heading heading-main">
			<h3 class="panel-title">GIÁO DỤC - KHUYẾN HỌC</h3>
		</div>
		<div class="panel-body">
			<ul class="side-news main-list-annount">
				<c:forEach items="${listGDKH}" var="post">
					<fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss.SSSSSS"
						value="${post.dateCreated}" var="parsedDate" />

					<li><a href="${contextRoot}/show/post/${post.id}">${post.title}</a>
						- <fmt:formatDate value="${parsedDate}"
							pattern="dd/MM/yyyy - HH:mm" /></li>
				</c:forEach>
			</ul>
			<p class="panel-foot">
				<a href="#">Xem thêm >></a>
			</p>
		</div>
	</div>

</c:if>

<c:if test="${listCongDoan != null}">

	<div class="panel panel-primary">
		<div class="panel-heading heading-main">
			<h3 class="panel-title">CÔNG ĐOÀN</h3>
		</div>
		<div class="panel-body">
			<ul class="side-news main-list-annount">
				<c:forEach items="${listCongDoan}" var="post">
					<fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss.SSSSSS"
						value="${post.dateCreated}" var="parsedDate" />

					<li><a href="${contextRoot}/show/post/${post.id}">${post.title}</a>
						- <fmt:formatDate value="${parsedDate}"
							pattern="dd/MM/yyyy - HH:mm" /></li>
				</c:forEach>
			</ul>
			<p class="panel-foot">
				<a href="#">Xem thêm >></a>
			</p>
		</div>
	</div>

</c:if>

<c:if test="${listTuyenSinh != null}">

	<div class="panel panel-primary">
		<div class="panel-heading heading-main">
			<h3 class="panel-title">TUYỂN SINH</h3>
		</div>
		<div class="panel-body">
			<ul class="side-news main-list-annount">
				<c:forEach items="${listTuyenSinh}" var="post">
					<fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss.SSSSSS"
						value="${post.dateCreated}" var="parsedDate" />

					<li><a href="${contextRoot}/show/post/${post.id}">${post.title}</a>
						- <fmt:formatDate value="${parsedDate}"
							pattern="dd/MM/yyyy - HH:mm" /></li>
				</c:forEach>
			</ul>
			<p class="panel-foot">
				<a href="#">Xem thêm >></a>
			</p>
		</div>
	</div>

</c:if>

<c:if test="${listDoanThanhNien != null}">

	<div class="panel panel-primary">
		<div class="panel-heading heading-main">
			<h3 class="panel-title">ĐOÀN THANH NIÊN</h3>
		</div>
		<div class="panel-body">
			<ul class="side-news main-list-annount">
				<c:forEach items="${listDoanThanhNien}" var="post">
					<fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss.SSSSSS"
						value="${post.dateCreated}" var="parsedDate" />

					<li><a href="${contextRoot}/show/post/${post.id}">${post.title}</a>
						- <fmt:formatDate value="${parsedDate}"
							pattern="dd/MM/yyyy - HH:mm" /></li>
				</c:forEach>
			</ul>
			<p class="panel-foot">
				<a href="#">Xem thêm >></a>
			</p>
		</div>
	</div>

</c:if>


