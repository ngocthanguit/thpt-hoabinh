<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<security:authorize access="hasAnyAuthority('ADMIN','TEACHER')">
	<c:if test="${listThongBaoGiaoVien != null}">

		<div class="panel panel-primary">
			<div class="panel-heading heading-main">
				<h3 class="panel-title">THÔNG BÁO GIÁO VIÊN</h3>
			</div>
			<div class="panel-body">
				<ul class="side-news">
						<c:forEach items="${listThongBaoGiaoVien}" var="post">
							<fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss.SSSSSS"
								value="${post.dateCreated}" var="parsedDate" />

							<li><a href="${contextRoot}/show/post/${post.id}">${post.title}</a>
								- <fmt:formatDate value="${parsedDate}"
									pattern="dd/MM/yyyy - HH:mm" /></li>
						</c:forEach>
					</ul>
				<p class="panel-foot">
					<a href="#">Xem thêm »</a>
				</p>
			</div>
		</div>

	</c:if>
</security:authorize>


<c:if test="${listTinTuc != null}">

	<div class="panel panel-primary">
		<div class="panel-heading heading-main">
			<h3 class="panel-title">TIN TỨC</h3>
		</div>
		<div class="panel-body">
			
			<div class="row">
				<div class="col-xs-6">
					<h4>${listTinTuc[0].title}</h4>
					<a href="${contextRoot}/show/post/${listTinTuc[0].id}" class="first-post-poster-wrapper">
					<img class="first-post-poster" src="${contextRoot}/resources/images/${listTinTuc[0].image}.jpg" /></a>
					<div class="first-post-brief">${listTinTuc[0].PContent}</div>
				</div>
				<div class="col-xs-6">
					<ul class="second-posts">
						<c:set var="i" value="0" scope="page" />
						<c:forEach items="${listTinTuc}" var="post">
							<c:if test="${i > 0}">
								<fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss.SSSSSS"
									value="${post.dateCreated}" var="parsedDate" />

								<li><a href="${contextRoot}/show/post/${post.id}">${post.title}</a>
									- <fmt:formatDate value="${parsedDate}"
										pattern="dd/MM/yyyy - HH:mm" /></li>
							</c:if>
							<c:set var="i" value="${i + 1}" scope="page" />
						</c:forEach>
					</ul>
				</div>
			</div>
			<p class="panel-foot">
				<a href="#">Xem thêm »</a>
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
			<ul class="side-news">
				<c:forEach items="${listTKB}" var="post">
					<fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss.SSSSSS"
						value="${post.dateCreated}" var="parsedDate" />

					<li><a href="${contextRoot}/show/post/${post.id}">${post.title}</a>
						- <fmt:formatDate value="${parsedDate}"
							pattern="dd/MM/yyyy - HH:mm" /></li>
				</c:forEach>
			</ul>
			<p class="panel-foot">
				<a href="#">Xem thêm »</a>
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
			<ul class="side-news">
				<c:forEach items="${listThongTinHoatDong}" var="post">
					<fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss.SSSSSS"
						value="${post.dateCreated}" var="parsedDate" />

					<li><a href="${contextRoot}/show/post/${post.id}">${post.title}</a>
						- <fmt:formatDate value="${parsedDate}"
							pattern="dd/MM/yyyy - HH:mm" /></li>
				</c:forEach>
			</ul>
			<p class="panel-foot">
				<a href="#">Xem thêm »</a>
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
			<ul class="side-news">
				<c:forEach items="${listGDKH}" var="post">
					<fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss.SSSSSS"
						value="${post.dateCreated}" var="parsedDate" />

					<li><a href="${contextRoot}/show/post/${post.id}">${post.title}</a>
						- <fmt:formatDate value="${parsedDate}"
							pattern="dd/MM/yyyy - HH:mm" /></li>
				</c:forEach>
			</ul>
			<p class="panel-foot">
				<a href="#">Xem thêm »</a>
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
			<ul class="side-news">
				<c:forEach items="${listCongDoan}" var="post">
					<fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss.SSSSSS"
						value="${post.dateCreated}" var="parsedDate" />

					<li><a href="${contextRoot}/show/post/${post.id}">${post.title}</a>
						- <fmt:formatDate value="${parsedDate}"
							pattern="dd/MM/yyyy - HH:mm" /></li>
				</c:forEach>
			</ul>
			<p class="panel-foot">
				<a href="#">Xem thêm »</a>
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
			<ul class="side-news">
				<c:forEach items="${listTuyenSinh}" var="post">
					<fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss.SSSSSS"
						value="${post.dateCreated}" var="parsedDate" />

					<li><a href="${contextRoot}/show/post/${post.id}">${post.title}</a>
						- <fmt:formatDate value="${parsedDate}"
							pattern="dd/MM/yyyy - HH:mm" /></li>
				</c:forEach>
			</ul>
			<p class="panel-foot">
				<a href="#">Xem thêm »</a>
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

			<div class="row">
				<div class="col-xs-6 first-post">
					<h4>${listDoanThanhNien[9].title}</h4>
					<a href="${contextRoot}/show/post/${listDoanThanhNien[9].id}" class="first-post-poster-wrapper">
					<img class="first-post-poster" src="${contextRoot}/resources/images/${listDoanThanhNien[9].image}.jpg" /></a>
					<p class="first-post-brief">${listDoanThanhNien[9].PContent}</p>

				</div>
				<div class="col-xs-6">
					<ul class="second-posts">
						<c:set var="i" value="0" scope="page" />
						<c:forEach items="${listDoanThanhNien}" var="post">
							<c:if test="${i > 0}">
								<fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss.SSSSSS"
									value="${post.dateCreated}" var="parsedDate" />

								<li><a href="${contextRoot}/show/post/${post.id}">${post.title}</a>
									- <fmt:formatDate value="${parsedDate}"
										pattern="dd/MM/yyyy - HH:mm" /></li>
							</c:if>
							<c:set var="i" value="${i + 1}" scope="page" />
						</c:forEach>
					</ul>
				</div>
			</div>
			<p class="panel-foot">
				<a href="#">Xem thêm »</a>
			</p>
		</div>
	</div>

</c:if>


