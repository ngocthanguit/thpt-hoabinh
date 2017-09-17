<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>



	<c:if test="${not empty message}">	
		<div class="row">			
			<div class="col-xs-12 col-md-offset-2 col-md-8">			
				<div class="alert alert-info fade in">${message}</div>				
			</div>
		</div>
	</c:if>

	<div class="row">
		<div class="col-xs-offset-2 col-xs-8">
			<div class="panel panel-primary">

				<div class="panel-heading">

					<h4>Quản Lý Bài Đăng</h4>

				</div>

				<div class="panel-body">
					<sf:form class="form-horizontal" modelAttribute="post" action="${contextRoot}/manage/post" method="POST" enctype="multipart/form-data">
						<div class="form-group">
							<label class="control-label col-md-4">Tiêu Đề</label>
							<div class="col-md-8">
								<sf:input type="text" path="title" class="form-control"
									placeholder="Nhập tiêu đề" />
								<sf:errors path="Title" cssClass="help-block" element="em"/> 
							</div>
						</div>
						

						<div class="form-group">
							<label class="control-label col-md-4">Nội Dung</label>
							<div class="col-md-8">
								<sf:textarea path="pContent" class="form-control"
									placeholder="Nhập nội dung bài viết!" /> 
								<sf:errors path="PContent" cssClass="help-block" element="em"/>
							</div>
						</div>


						<div class="form-group">
							<label class="control-label col-md-4">Ảnh Bài Viết</label>
							<div class="col-md-8">
								<sf:input type="file" path="file" class="form-control"/>
								<sf:errors path="file" cssClass="help-block" element="em"/> 
							</div>
						</div>


						<div class="form-group">
							<label class="control-label col-md-4">Loại Bài Viết</label>
							<div class="col-md-8">
								<sf:select path="categoryId" items="${categories}" itemLabel="name" itemValue="id" class="form-control"/>
							
								<div class="text-right">
									<br/>			
									<sf:hidden path="id"/>
									<sf:hidden path="image"/>
									<sf:hidden path="slug"/>
									<sf:hidden path="active"/>	
									<sf:hidden path="authorId"/>
									<sf:hidden path="dateCreated"/>		
									<sf:hidden path="dateModified"/>	
									<sf:hidden path="viewCount"/>														
									<button type="button" class="btn btn-warning btn-xs" data-toggle="modal" data-target="#myCategoryModal">Add New Category</button>
								</div>							
							</div>
							
						</div>


					
						<div class="form-group">
							
							<div class="col-md-offset-4 col-md-4">
							
								<input type="submit" name="submit" value="Save" class="btn btn-primary"/>
								
							</div>
						</div>						
										
					</sf:form>

				</div>

			</div>
		</div>
	</div>

	<!-- Modal -->
	<div class="modal fade" id="myCategoryModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title" id="myModalLabel">New Category</h4>
	      </div>
	      <div class="modal-body">
	        
	        <sf:form id="categoryForm" class="form-horizontal" modelAttribute="category" action="${contextRoot}/manage/category" method="POST">
	        	
       			<div class="form-group">
					<label class="control-label col-md-4">Name</label>
					<div class="col-md-8 validate">
						<sf:input type="text" path="name" class="form-control"
							placeholder="Category Name" /> 
					</div>
				</div>
       			
       			<div class="form-group">				
					<label class="control-label col-md-4">Description</label>
					<div class="col-md-8 validate">
						<sf:textarea path="description" class="form-control"
							placeholder="Enter category description here!" /> 
					</div>
				</div>	        	        
	        
	        
				<div class="form-group">				
					<div class="col-md-offset-4 col-md-4">					
						<input type="submit" name="submit" value="Save" class="btn btn-primary"/>						
					</div>
				</div>	        
	        </sf:form>
	      </div>
	    </div>
	  </div>
	</div>
	
	<hr/>	
	<h1>Danh Sách Bài Đăng</h1>
	
	<hr/>
	<br/>
	<div class="row">
				
		
		<div class='col-xs-12'>
		
		
			<table id="postsTable" class="table table-condensed table-bordered">
							
				<thead>					
					<tr>					
						<th>Id</th>
						<th>&#160;</th>
						<th>Title</th>
						<th>Author</th>
						<th>Category</th>
						<th>Date</th>
						<th>Slug</th>
						<th>Activate</th>				
						<th>Edit</th>
					</tr>					
				</thead>
				
				<tfoot>
					<tr>					
						<th>Id</th>
						<th>&#160;</th>
						<th>Title</th>
						<th>Author</th>
						<th>Category</th>
						<th>Date</th>
						<th>Slug</th>
						<th>Activate</th>				
						<th>Edit</th>
					</tr>									
				</tfoot>
				
							
			</table>
		
		
		</div>
	
	
	</div>

