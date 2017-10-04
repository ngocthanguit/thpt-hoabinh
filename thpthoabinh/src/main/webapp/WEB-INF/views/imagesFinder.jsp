<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />
<spring:url var="editor" value="/resources/editor" />
<link href="${css}/bootstrap.min.css" rel="stylesheet">
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<div class="content main-page">
	<div class="row">

		<c:forEach items="${listImages}" var="image">
			<div class="col-xs-4 col-md-3 album-image-wrapper">
				
					<img style="max-width: 100%; max-height: 100%; margin: 10px;" class="images-finder"
						src="${contextRoot}/resources/upload/images/${image.name}.jpg" />
				
			</div>
		</c:forEach>


	</div>
</div>
<script src="${js}/jquery.js"></script>
<script src="${js}/myapp.js"></script>