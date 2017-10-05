<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="content">
	<div class="panel panel-primary">
		<div class="panel-heading heading-main">
			<h3 class="panel-title">Tài Liệu Học Tập</h3>
		</div>
		<div class="panel-body">
			<ul class="side-news main-list-annount">
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
				<a href="#">Xem thêm »</a>
			</p>
		</div>
	</div>

</div>