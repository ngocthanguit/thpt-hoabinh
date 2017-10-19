<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div class="list-post">
	<div class="panel panel-primary">
		<div class="panel-heading heading-main">
			<h3 class="panel-title">${title}</h3>
		</div>
		<div class="panel-body">
			<ul class="side-news list-post">
				<c:forEach items="${listPosts}" var="post">
					<fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss.SSSSSS"
						value="${post.dateCreated}" var="parsedDate" />
					<div class="row">
						<li>
							<div class="col-xs-2">
								<a class="post-item" href="${contextRoot}/show/post/${post.id}">
								<img class="post-poster" src="${contextRoot}/resources/images/${post.image}.jpg/"/></a>
							</div>
							<div class="col-xs-10">
								<div class="post-detail">
									<ul class="list-post-detail">
										<li><a href="${contextRoot}/show/post/${post.id}"><span
												class="post-item">${post.title}</span></a></li>
										<li><span> Ngày đăng: <fmt:formatDate value="${parsedDate}" pattern="dd/MM/yyyy - HH:mm" /></span></li>
										<li><span>${album.description}</span></li>
									</ul>
								</div>
							</div>
						</li>
					</div>
				</c:forEach>
				<c:if test="${listPosts == null || listPosts.size() <= 0}">
					Không có bài viết.
				</c:if>
			</ul>
			<p class="panel-foot">
			<div class="text-left">
				<c:if test="${offset > 0}">
					<a
						href="${contextRoot}/show/category/${categoryId}/posts?offset=${offset - 10}">« Trang
						trước</a>
				</c:if>
			</div>

			<div class="text-right">
				<c:if test="${offset + 10 < max}">
					<a
						href="${contextRoot}/show/category/${categoryId}/posts?offset=${offset + 10}">Trang
						sau »</a>
				</c:if>
			</div>
			</p>

		</div>
	</div>

</div>

