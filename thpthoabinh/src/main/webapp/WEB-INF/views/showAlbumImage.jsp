<%@page contentType="text/html" pageEncoding="UTF-8"%>

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

		<c:forEach items="${listImages}" var="image">
			<div class="col-xs-6 col-md-3 album-image-wrapper">
				<a href="#" class="pop"> 
					 <img class="album-image-main"
					src="${contextRoot}/resources/upload/images/${image.name}.jpg" />
				</a>
			</div>
		</c:forEach>
	</div>
	<div class="modal fade" id="imagemodal" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="close" data-dismiss="modal">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<img src="" class="imagepreview" style="width: 100%;">
				</div>
			</div>
		</div>
	</div>

</div>