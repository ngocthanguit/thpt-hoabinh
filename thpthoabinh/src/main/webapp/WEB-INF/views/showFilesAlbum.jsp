<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="content">

	<div class="panel panel-primary">
		<div class="panel-heading heading-main">
			<c:if test="${type == 'file'}">
				<h3 class="panel-title">Tài Liệu Học Tập</h3>
			</c:if>
			<c:if test="${type == 'exam'}">
				<h3 class="panel-title">Đề Thi</h3>
			</c:if>
		</div>
		<div class="panel-body">
			<ul class="side-news main-list-annount">
				<c:if test="${listAlbums == null}">
					Chưa có tài liệu.
				</c:if>
				<c:forEach items="${listAlbums}" var="album">
					<fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss.SSSSSS"
						value="${album.dateCreated}" var="parsedDate" />

					<li><a href="${contextRoot}/show/album/${album.id}">${album.name}</a>
						- <fmt:formatDate value="${parsedDate}"
							pattern="dd/MM/yyyy - HH:mm" />
						<p>${album.description}</p></li>
				</c:forEach>
			</ul>
			<p class="panel-foot">
			<div class="text-left">
				<c:if test="${offset > 0}">
					<a
						href="${contextRoot}/show/file/albums?offset=${offset - 10}">« Trang
						trước</a>
				</c:if>
			</div>

			<div class="text-right">
				<c:if test="${offset + 10 < max}">
					<a
						href="${contextRoot}/show/file/albums?offset=${offset + 10}">Trang
						sau »</a>
				</c:if>
			</div>
			</p>
		</div>
	</div>

</div>