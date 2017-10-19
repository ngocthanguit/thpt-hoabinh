<%@page contentType="text/html" pageEncoding="UTF-8"%>

<div class="content">

	<div class="panel panel-primary">
		<div class="panel-heading heading-main">
			<h3 class="panel-title">Hình Ảnh</h3>
		</div>
		<div class="panel-body">
			<ul class="side-news main-list-annount">
				<c:if test="${listAlbums == null}">
					Chưa có dữ liệu hình ảnh.
				</c:if>
				<c:forEach items="${listAlbums}" var="album">
					<fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss.SSSSSS"
						value="${album.dateCreated}" var="parsedDate" />

					<div class="row">
						<li>
							<div class="col-xs-2">
								<a href="${contextRoot}/show/album/${album.id}">
								<img class="post-poster"
									src="${contextRoot}/resources/upload/images/${album.image}.jpg/" /></a>
							</div>
							<div class="col-xs-10">
								<div class="post-detail">
									<ul class="list-post-detail">
										<li><a href="${contextRoot}/show/album/${album.id}"><span
												class="post-item">${album.name}</span></a></li>
										<li><span> Ngày đăng: <fmt:formatDate
													value="${parsedDate}" pattern="dd/MM/yyyy - HH:mm" /></span></li>
										<li><span>${album.description}</span></li>
									</ul>
								</div>
							</div>
						</li>
					</div>
				</c:forEach>
			</ul>
			<p class="panel-foot">
				<a href="#">Xem thêm »</a>
			</p>
		</div>
	</div>

</div>