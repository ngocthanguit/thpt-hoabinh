<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<div class="content main-page">
	<fmt:parseDate pattern="yyyy-MM-dd HH:mm:ss.SSSSSS"
		value="${album.dateCreated}" var="parsedDate" />
	<h4 class="post-title">${album.name}</h4>
	<p class="post-date">
		<fmt:formatDate value="${parsedDate}" pattern="E, dd/MM/yyyy - HH:mm" />
	</p>
	<div class="post-content">${album.description}</div>
	<br />
	<div class="row">

		<c:forEach items="${listFiles}" var="file">
			<div class="col-xs-4 col-md-2 album-image-wrapper">
				<a href="${contextRoot}/resources/upload/files/${file.name}"class=""> 
				<c:choose>
						<c:when test="${fn:contains(file.name,'.doc') || fn:contains(file.name,'.docx')}">
							<img class="album-image-main" src="${contextRoot}/resources/images/worddefault.png" />
						</c:when>
						<c:when test="${fn:contains(file.name,'.pdf')}">
							<img class="album-image-main" src="${contextRoot}/resources/images/pdfdefault.png" />
						</c:when>
						<c:when test="${fn:contains(file.name,'.xls') || fn:contains(file.name,'.xlsx') || fn:contains(file.name,'.csv')}">
							<img class="album-image-main" src="${contextRoot}/resources/images/exceldefault.png" />
						</c:when>
						<c:when test="${fn:contains(file.name,'.ppt') || fn:contains(file.name,'.pptx')}">
							<img class="album-image-main" src="${contextRoot}/resources/images/pptdefault.png" />
						</c:when>
						<c:when test="${fn:contains(file.name,'.txt')}">
							<img class="album-image-main" src="${contextRoot}/resources/images/txtdefault.jpg" />
						</c:when>
						<c:when test="${fn:contains(file.name,'.png') || fn:contains(file.name,'.jpg') || fn:contains(file.name,'.PNG') || fn:contains(file.name,'.JPG')}">
							<img class="album-image-main" src="${contextRoot}/resources/images/imagedefault.png" />
						</c:when>
						<c:otherwise>
							<img class="album-image-main" src="${contextRoot}/resources/images/filedefault.jpg" />
						</c:otherwise>
					</c:choose> 
					<span class="file-name">${file.name}</span>
				</a>
			</div>
		</c:forEach>
	</div>

</div>