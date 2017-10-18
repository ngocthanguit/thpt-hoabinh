$(function(){

//	$('#addFile')
//	.click(
//		function() {
//			var fileIndex = $('#fileTable tr').children().length - 1;
//			$('#fileTable').append('<tr><td>'
//							+ '	<input type="file" name="files['+ fileIndex +']" />'
//							+ '</td></tr>');
//	});

	$('.pop').on('click', function() {
		$('.imagepreview').attr('src', $(this).find('img').attr('src'));
		$('#imagemodal').modal('show');  
	});	
	
	$('.images-finder').on('dblclick',function(){
		//window.close();
		//alert($(this).attr('src'));
		CKEDITOR.config.baseUrl = ($(this).attr('src'));
		window.close();
	});
	
	// for adding a loader
	$(window).load(function(){
		setTimeout(function() {
			$(".se-pre-con").fadeOut("slow");
		}, 500);			
	});	
	
	// for handling CSRF token
	var token = $('meta[name="_csrf"]').attr('content');
	var header = $('meta[name="_csrf_header"]').attr('content');
	
	if((token!=undefined && header !=undefined) && (token.length > 0 && header.length > 0)) {		
		// set the token header for the ajax request
		$(document).ajaxSend(function(e, xhr, options) {			
			xhr.setRequestHeader(header,token);			
		});				
	}
	
	
	
	switch(menu){
	case "About Us":
		$('#about').addClass('active');
		break;
	case "All Posts":
		$('#listPosts').addClass('active');
		break;
	case "Contact Us":
		$('#contact').addClass('active');
		break;
	default:
		$('#listPosts').addClass('active');
		$('#a_'+menu).addClass('active');
		break;
	}
	
	function getFormattedDate(secs) {
			dateParse = new Date(secs);
		  var year = dateParse.getFullYear();

		  var month = (1 + dateParse.getMonth()).toString();
		  month = month.length > 1 ? month : '0' + month;

		  var day = dateParse.getDate().toString();
		  day = day.length > 1 ? day : '0' + day;
		  
		  var hour = dateParse.getHours().toString();
		  hour = hour.length > 1 ? hour : '0' + hour;
		  
		  var minute = dateParse.getMinutes().toString();
		  minute = minute.length > 1 ? minute : '0' + minute;
		  
		  return day + '/' + month + '/' + year + ' - ' + hour + ':' + minute;
	}
	
	
	// jQuery Validation Code

	//methods required for validation
	
	function errorPlacement(error, element) {
		// Add the 'help-block' class to the error element
		error.addClass("help-block");
		
		// add the error label after the input element
		error.insertAfter(element);
		
		
		// add the has-feedback class to the
		// parent div.validate in order to add icons to inputs
		element.parents(".validate").addClass("has-feedback");	

	}	
	
	// validating file upload form	
	$fileForm = $('#file-upload-form');
	
	if($fileForm.length) {
		
		$fileForm.validate({			
				rules: {
					name: {
						required: true,
						minlength: 3
					},
					
				},
				messages: {					
					name: {
						required: 'Vui lòng nhập tên bài đăng!',
						minlength: 'Nhập tối thiểu 3 kí tự'
					}			
				},
				errorElement : "em",
				errorPlacement : function(error, element) {
					errorPlacement(error, element);
				}				
			}
		
		);
		
	}
	
	// validating the post form element	
	$categoryForm = $('#categoryForm');
	
	if($categoryForm.length) {
		
		$categoryForm.validate({			
				rules: {
					name: {
						required: true,
						minlength: 3
					},
					description: {
						required: true,
						minlength: 3					
					}				
				},
				messages: {					
					name: {
						required: 'Please enter category title!',
						minlength: 'Please enter atleast five characters'
					},
					description: {
						required: 'Please enter category description!',
						minlength: 'Please enter atleast five characters'
					}					
				},
				errorElement : "em",
				errorPlacement : function(error, element) {
					errorPlacement(error, element);
				}				
			}
		
		);
		
	}
	
	// validating the signup form
	$categoryForm = $('#signupForm');
	
	if($categoryForm.length) {
		
		$categoryForm.validate({			
				rules: {
					username: {
						required: true,
						minlength: 3
					},
					password: {
						required: true,
						minlength: 3					
					},
					confirmPassword: {
						required: true,
						equalTo : "#password"
					},
					fullName: {
						required: true,
						minlength: 3					
					},
					email: {
						required: true,
						email: true
					},
					phone: {
						required: true,
						minlength: 10,
						number: true 				
					}
					
				},
				messages: {					
					username: {
						required: 'Vui lòng nhập tên đăng nhập!',
						minlength: 'Tên đăng nhập >= 3 kí tự'
					},
					password: {
						required: 'Vui lòng nhập mật khẩu!',
						minlength: 'Mật khẩu >= 3 kí tự'
					},
					confirmPassword: {
						required: 'Vui lòng nhập lại password!',
						equalTo : 'Không khớp với mật khẩu!'
					},
					fullName: {
						required: 'Vui lòng nhập họ tên!',
						minlength: 'Họ tên >= 3 kí tự'
					},
					email: {
						required: 'Vui lòng nhập email!',
						email: 'Vui lòng nhập email hợp lệ'
					},
					phone: {
						required: 'Vui lòng nhập số điện thoại!',
						minlength: 'Số điện thoại >= 10 số!',
						number: 'Số điện thoại phải là số!' 	
					}
				},
				errorElement : "em",
				errorPlacement : function(error, element) {
					errorPlacement(error, element);
				}				
			}
		
		);
		
	}
	
	/*validating the loginform*/
	
	$loginForm = $('#loginForm');
	
	if($loginForm.length) {
		
		$loginForm.validate({			
				rules: {
					username: {
						required: true
					},
					password: {
						required: true
					}				
				},
				messages: {					
					username: {
						required: 'Vui lòng nhập tên đăng nhập!'
					},
					password: {
						required: 'Vui lòng nhập mật khẩu!'
					}					
				},
				errorElement : "em",
				errorPlacement : function(error, element) {
					// Add the 'help-block' class to the error element
					error.addClass("help-block");
					
					// add the error label after the input element
					error.insertAfter(element);
				}				
			}
		
		);
		
	}
		
	
	// validating post form
	// fetch the form element
	$postForm = $('#postForm');
	
	if($postForm.length) {
		
		$postForm.validate({			
				rules: {
					title: {
						required: true,
						minlength: 5
					},
					pContent: {
						required: true,
						minlength: 5					
					}				
				},
				messages: {					
					title: {
						required: 'Vui lòng nhập tiêu đề bài viết!',
						minlength: 'Vui lòng nhập ít nhất 5 kí tự'
					},
					pContent: {
						required: 'Vui lòng nhập nội dung bài viết!',
						minlength: 'Vui lòng nhập ít nhất 5 kí tự'
					}					
				},
				errorElement : "em",
				errorPlacement : function(error, element) {
					errorPlacement(error, element);
				}				
			}
		
		);
		
	}
	
	
	/*------*/
	/* for fading out the alert message after 3 seconds */
	$alert = $('.alert');
	if($alert.length) {
		setTimeout(function() {
	    	$alert.fadeOut('slow');
		   }, 3000
		);		
	}
	
	
	// list of all posts for admin
	var $postsTable = $('#postsTable');
	
	
	if($postsTable.length) {
		
		var jsonUrl = window.contextRoot + '/json/data/admin/all/posts';
		console.log(jsonUrl);
		
		$postsTable.DataTable({
					lengthMenu : [ [ 10, 20, 30, -1 ], [ '10 Records', '30 Records', '50 Records', 'ALL' ] ],
					pageLength : 10,
					ajax : {
						url : jsonUrl,
						dataSrc : ''
					},
					columns : [		
					           	{data: 'id'},


					           	{data: 'image',
					           	 bSortable: false,
					           		mRender: function(data,type,row) {
					           			if(data == null || data == ""){
					           				return '<img src="' + window.contextRoot
											+ '/resources/images/default' 
											+ '.jpg" class="dataTableImg"/>';
					           			}else{
					           				return '<img src="' + window.contextRoot
											+ '/resources/images/' + data
											+ '.jpg" class="dataTableImg"/>';
					           			}
					           								           			
					           		}
					           	},
					           	{
									data : 'title'
								},
								{
									data : 'authorId'
								},
								{
									data : 'categoryId',
								},
								{
									data : 'dateCreated',
									mRender: function(data,type,row) {
					           			return getFormattedDate(data)			           			
					           		}
								},
								{
									data : 'slug',
									
								},
								{
									data : 'active',
									bSortable : false,
									mRender : function(data, type, row) {
										var str = '';
										if(data) {											
											str += '<label class="switch"> <input type="checkbox" value="'+row.id+'" checked="checked">  <div class="slider round"> </div></label>';
											
										}else {
											str += '<label class="switch"> <input type="checkbox" value="'+row.id+'">  <div class="slider round"> </div></label>';
										}
										
										return str;
									}
								},
								{
									data : 'id',
									bSortable : false,
									mRender : function(data, type, row) {

										var str = '';
										str += '<a href="'
												+ window.contextRoot
												+ '/manage/'
												+ data
												+ '/post" class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></span></a> &#160;';

										return str;
									}
								}					           	
					],
					
					
					initComplete: function () {
						var api = this.api();
						api.$('.switch input[type="checkbox"]').on('change' , function() {							
							var dText = (this.checked)? 'You want to activate the Post?': 'You want to de-activate the Post?';
							var checked = this.checked;
							var checkbox = $(this);
							debugger;
						    bootbox.confirm({
						    	size: 'medium',
						    	title: 'Post Activation/Deactivation',
						    	message: dText,
						    	callback: function (confirmed) {
							        if (confirmed) {
							            $.ajax({							            	
							            	type: 'GET',
							            	url: window.contextRoot + '/manage/post/'+checkbox.prop('value')+'/activation',
							        		timeout : 100000,
							        		success : function(data) {
							        			displaySnackbar(data);							        										        			
							        		},
							        		error : function(e) {
							        			displaySnackbar('ERROR: '+ e);
							        			//display(e);
							        		}						            	
							            });
							        }
							        else {							        	
							        	checkbox.prop('checked', !checked);
							        }
						    	}
						    });																											
						});
							
					}
				});
	}
	
	
	
	// list of all user for admin
	var $usersTable = $('#usersTable');
	
	
	if($usersTable.length) {
		
		var jsonUrl = window.contextRoot + '/json/data/admin/all/users';
		console.log(jsonUrl);
		
		$usersTable.DataTable({
					lengthMenu : [ [ 10, 20, 30, -1 ], [ '10 Records', '30 Records', '50 Records', 'ALL' ] ],
					pageLength : 10,
					ajax : {
						url : jsonUrl,
						dataSrc : ''
					},
					columns : [		
					           	{data: 'id'},


					           	{data: 'image',
					           	 bSortable: false,
					           		mRender: function(data,type,row) {
					           			if(data == null || data == ""){
					           				return '<img src="' + window.contextRoot
											+ '/resources/images/default' 
											+ '.jpg" class="dataTableImg"/>';
					           			}else{
					           				return '<img src="' + window.contextRoot
											+ '/resources/images/' + data
											+ '.jpg" class="dataTableImg"/>';
					           			}
					           								           			
					           		}
					           	},
					           	{
									data : 'username'
								},
								{
									data : 'fullName'
								},
								{
									data : 'email',
								},
								{
									data : 'phone',
								},
								{
									data : 'profile',
									
								},
								{
									data : 'role',
									
								},
								{
									data : 'active',
									bSortable : false,
									mRender : function(data, type, row) {
										var str = '';
										if(data) {											
											str += '<label class="switch"> <input type="checkbox" value="'+row.id+'" checked="checked">  <div class="slider round"> </div></label>';
											
										}else {
											str += '<label class="switch"> <input type="checkbox" value="'+row.id+'">  <div class="slider round"> </div></label>';
										}
										
										return str;
									}
								},
								{
									data : 'id',
									bSortable : false,
									mRender : function(data, type, row) {

										var str = '';
										str += '<a href="'
												+ window.contextRoot
												+ '/manage/'
												+ data
												+ '/user" class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></span></a> &#160;';

										return str;
									}
								}					           	
					],
					
					
					initComplete: function () {
						var api = this.api();
						api.$('.switch input[type="checkbox"]').on('change' , function() {							
							var dText = (this.checked)? 'You want to activate the User?': 'You want to de-activate the User?';
							var checked = this.checked;
							var checkbox = $(this);
							debugger;
						    bootbox.confirm({
						    	size: 'medium',
						    	title: 'User Activation/Deactivation',
						    	message: dText,
						    	callback: function (confirmed) {
							        if (confirmed) {
							            $.ajax({							            	
							            	type: 'GET',
							            	url: window.contextRoot + '/manage/user/'+checkbox.prop('value')+'/activation',
							        		timeout : 100000,
							        		success : function(data) {
							        			displaySnackbar(data);							        										        			
							        		},
							        		error : function(e) {
							        			displaySnackbar('ERROR: '+ e);
							        			//display(e);
							        		}						            	
							            });
							        }
							        else {							        	
							        	checkbox.prop('checked', !checked);
							        }
						    	}
						    });																											
						});
							
					}
				});
	}
	
	
	// list of all album for admin
	var $filesTable = $('#filesTable');
	
	
	if($filesTable.length) {
		
		var jsonUrl = window.contextRoot + '/json/data/admin/all/file/albums';
		console.log(jsonUrl);
		
		$filesTable.DataTable({
					lengthMenu : [ [ 10, 20, 30, -1 ], [ '10 Records', '30 Records', '50 Records', 'ALL' ] ],
					pageLength : 10,
					ajax : {
						url : jsonUrl,
						dataSrc : ''
					},
					columns : [		
					           	{data: 'id'},
					           	{
									data : 'name'
								},
								{
									data : 'authorId',
								},
								{
									data : 'description'
								},
								{
									data : 'dateCreated',
									mRender: function(data,type,row) {
					           			return getFormattedDate(data)			           			
					           		}
								},
								{
									data : 'subjectId',
									
								},
								{
									data : 'grade',
									
								},
								{
									data : 'active',
									bSortable : false,
									mRender : function(data, type, row) {
										var str = '';
										if(data) {											
											str += '<label class="switch"> <input type="checkbox" value="'+row.id+'" checked="checked">  <div class="slider round"> </div></label>';
											
										}else {
											str += '<label class="switch"> <input type="checkbox" value="'+row.id+'">  <div class="slider round"> </div></label>';
										}
										
										return str;
									}
								},
								{
									data : 'id',
									bSortable : false,
									mRender : function(data, type, row) {

										var str = '';
										str += '<a href="'
												+ window.contextRoot
												+ '/manage/'
												+ data
												+ '/album" class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></span></a> &#160;';

										return str;
									}
								}						           	
					],
					
					
					initComplete: function () {
						var api = this.api();
						api.$('.switch input[type="checkbox"]').on('change' , function() {							
							var dText = (this.checked)? 'You want to activate the User?': 'You want to de-activate the User?';
							var checked = this.checked;
							var checkbox = $(this);
							debugger;
						    bootbox.confirm({
						    	size: 'medium',
						    	title: 'User Activation/Deactivation',
						    	message: dText,
						    	callback: function (confirmed) {
							        if (confirmed) {
							            $.ajax({							            	
							            	type: 'GET',
							            	url: window.contextRoot + '/manage/album/'+checkbox.prop('value')+'/activation',
							        		timeout : 100000,
							        		success : function(data) {
							        			displaySnackbar(data);							        										        			
							        		},
							        		error : function(e) {
							        			displaySnackbar('ERROR: '+ e);
							        			//display(e);
							        		}						            	
							            });
							        }
							        else {							        	
							        	checkbox.prop('checked', !checked);
							        }
						    	}
						    });																											
						});
							
					}
				});
	}
	
	
	// list of all album for admin
	var $imagesTable = $('#imagesTable');
	
	
	if($imagesTable.length) {
		
		var jsonUrl = window.contextRoot + '/json/data/admin/all/image/albums';
		console.log(jsonUrl);
		
		$imagesTable.DataTable({
					lengthMenu : [ [ 10, 20, 30, -1 ], [ '10 Records', '30 Records', '50 Records', 'ALL' ] ],
					pageLength : 10,
					ajax : {
						url : jsonUrl,
						dataSrc : ''
					},
					columns : [		
					           	{data: 'id'},
					           	{
									data : 'name'
								},
								{
									data : 'authorId',
								},
								{
									data : 'description'
								},
								{
									data : 'dateCreated',
									mRender: function(data,type,row) {
					           			return getFormattedDate(data)			           			
					           		}
								},
								
								{
									data : 'active',
									bSortable : false,
									mRender : function(data, type, row) {
										var str = '';
										if(data) {											
											str += '<label class="switch"> <input type="checkbox" value="'+row.id+'" checked="checked">  <div class="slider round"> </div></label>';
											
										}else {
											str += '<label class="switch"> <input type="checkbox" value="'+row.id+'">  <div class="slider round"> </div></label>';
										}
										
										return str;
									}
								},
								{
									data : 'id',
									bSortable : false,
									mRender : function(data, type, row) {

										var str = '';
										str += '<a href="'
												+ window.contextRoot
												+ '/manage/'
												+ data
												+ '/album" class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></span></a> &#160;';

										return str;
									}
								}						           	
					],
					
					
					initComplete: function () {
						var api = this.api();
						api.$('.switch input[type="checkbox"]').on('change' , function() {							
							var dText = (this.checked)? 'You want to activate the User?': 'You want to de-activate the User?';
							var checked = this.checked;
							var checkbox = $(this);
							debugger;
						    bootbox.confirm({
						    	size: 'medium',
						    	title: 'User Activation/Deactivation',
						    	message: dText,
						    	callback: function (confirmed) {
							        if (confirmed) {
							            $.ajax({							            	
							            	type: 'GET',
							            	url: window.contextRoot + '/manage/album/'+checkbox.prop('value')+'/activation',
							        		timeout : 100000,
							        		success : function(data) {
							        			displaySnackbar(data);							        										        			
							        		},
							        		error : function(e) {
							        			displaySnackbar('ERROR: '+ e);
							        			//display(e);
							        		}						            	
							            });
							        }
							        else {							        	
							        	checkbox.prop('checked', !checked);
							        }
						    	}
						    });																											
						});
							
					}
				});
	}
	
	// display snack bar
	function displaySnackbar(result){
	    // Get the snackbar DIV
	    var x = document.getElementById("snackbar");
	    x.innerHTML = result
	    // Add the "show" class to DIV
	    x.className = "show";
	    // After 3 seconds, remove the show class from DIV
	    setTimeout(function(){ x.className = x.className.replace("show", ""); }, 3000);
	}
	
	CKEDITOR.replace( 'editor1',{
		filebrowserBrowseUrl: window.contextRoot + '/show/imagesfinder',
		filebrowserUploadUrl: window.contextRoot + '/manage/file/upload',
		filebrowserWindowWidth: '1000',
		filebrowserWindowHeight: '700',
		width: 885,
		height: 400
	} );
	

		
	
})

