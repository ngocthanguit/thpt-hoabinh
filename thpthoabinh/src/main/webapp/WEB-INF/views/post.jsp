<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<div class="post-content">

	<fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss.SSSSSS"
		value="${post.dateCreated}" var="parsedDate" />
	<h4 class="post-title">${post.title}</h4>
	<p class="post-date">
		<fmt:formatDate value="${parsedDate}" pattern="E, dd/MM/yyyy - HH:mm" />
	</p>
	<div class="post-content">${post.PContent}</div>

</div>




