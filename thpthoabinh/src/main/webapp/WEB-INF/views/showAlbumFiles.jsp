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
	
		<c:set var="count" value="0" scope="page" />
		<c:forEach items="${listFiles}" var="file">
			
			
				<div class="col-xs-4 col-md-2 album-image-wrapper">
					<a href="${contextRoot}/resources/upload/files/${file.name}"class=""> 
					<c:choose>
							<c:when test="${fn:contains(file.displayName,'.doc') || fn:contains(file.displayName,'.docx')}">
								<img class="album-image-main" src="${contextRoot}/resources/images/worddefault.png" />
							</c:when>
							<c:when test="${fn:contains(file.displayName,'.pdf')}">
								<img class="album-image-main" src="${contextRoot}/resources/images/pdfdefault.png" />
							</c:when>
							<c:when test="${fn:contains(file.displayName,'.xls') || fn:contains(file.displayName,'.xlsx') || fn:contains(file.displayName,'.csv')}">
								<img class="album-image-main" src="${contextRoot}/resources/images/exceldefault.png" />
							</c:when>
							<c:when test="${fn:contains(file.displayName,'.ppt') || fn:contains(file.displayName,'.pptx')}">
								<img class="album-image-main" src="${contextRoot}/resources/images/pptdefault.png" />
							</c:when>
							<c:when test="${fn:contains(file.displayName,'.txt')}">
								<img class="album-image-main" src="${contextRoot}/resources/images/txtdefault.jpg" />
							</c:when>
							<c:when test="${fn:contains(file.displayName,'.png') || fn:contains(file.displayName,'.jpg') || fn:contains(file.displayName,'.PNG') || fn:contains(file.displayName,'.JPG')}">
								<img class="album-image-main" src="${contextRoot}/resources/images/imagedefault.png" />
							</c:when>
							<c:otherwise>
								<img class="album-image-main" src="${contextRoot}/resources/images/filedefault.jpg" />
							</c:otherwise>
						</c:choose> 
						<span class="file-name">${file.displayName}</span>
					</a>
				</div>
				
		<c:set var="count" value="${count + 1}" scope="page" />
		</c:forEach>
	

</div>