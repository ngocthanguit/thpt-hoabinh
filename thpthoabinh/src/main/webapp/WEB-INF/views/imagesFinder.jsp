<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:url var="css" value="/resources/css" />
<spring:url var="js" value="/resources/js" />
<spring:url var="images" value="/resources/images" />
<spring:url var="editor" value="/resources/editor" />
<link href="${css}/bootstrap.min.css" rel="stylesheet">
<!-- Custom CSS -->
<link href="${css}/mystyle.css" rel="stylesheet">
<c:set var="contextRoot" value="${pageContext.request.contextPath}" />

<div class="content main-page">
		<div class="text-center">
			<a href="${contextRoot}/manage/image/post">Upload Ảnh</a>
		</div>
	<div class="row">
		
		<c:forEach items="${listImages}" var="image">
			<div class="col-xs-3 col-md-2 album-image-wrapper">
				<a href="${contextRoot}/resources/upload/images/${image.name}.jpg" class="pop"> 
					 <img class="album-image-main"
					src="${contextRoot}/resources/upload/images/${image.name}.jpg" />
				</a>
			</div>
		</c:forEach>


	</div>
</div>
<script src="${js}/jquery.js"></script>
<script src="${js}/myapp.js"></script>