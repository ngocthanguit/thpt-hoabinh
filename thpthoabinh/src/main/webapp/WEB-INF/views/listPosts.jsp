<%@page contentType="text/html" pageEncoding="UTF-8"%>


<div class="list-post">
	<ul class="side-news list-post">
		<c:forEach items="${listPosts}" var="post">
			<fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss.SSSSSS"
				value="${post.dateCreated}" var="parsedDate" />

			<li><a class="post-item" href="${contextRoot}/show/post/${post.id}">${post.title}</a>
				- <fmt:formatDate value="${parsedDate}" pattern="dd/MM/yyyy - HH:mm" />
			
			</li>
		</c:forEach>
	</ul>
</div>
<div class="text-left">
	<c:if test="${offset > 0}">
		<a
			href="${contextRoot}/show/category/${categoryId}/posts?offset=${offset - 10}">Trang
			trước</a>
	</c:if>
</div>

<div class="text-right">
	<c:if test="${offset + 10 < max}">
		<a
			href="${contextRoot}/show/category/${categoryId}/posts?offset=${offset + 10}">Trang
			sau</a>
	</c:if>
</div>
