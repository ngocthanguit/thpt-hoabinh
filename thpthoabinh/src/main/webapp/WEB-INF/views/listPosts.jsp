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

					<li>
						<a class="post-item" href="${contextRoot}/show/post/${post.id}">
						<img class="post-poster" src="${contextRoot}/resources/images/${post.image}.jpg/"/>
						${post.title}</a> - <fmt:formatDate value="${parsedDate}" pattern="dd/MM/yyyy - HH:mm" /></li>
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

