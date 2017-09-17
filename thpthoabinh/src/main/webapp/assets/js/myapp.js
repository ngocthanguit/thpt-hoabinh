$(function(){
	
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
	case "All Products":
		$('#listProducts').addClass('active');
		break;
	case "Contact Us":
		$('#contact').addClass('active');
		break;
	default:
		$('#listProducts').addClass('active');
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
	
	var toTimeString = function(secs) {
		day = new Date(secs);
//		return day.getDate() + '/' + (day.getMonth() + 1) + '/' + day.getFullYear();
	};
/*validating the loginform*/
	
	// validating the product form element	
	// fetch the form element
	$loginForm = $('#loginForm');
	
	if($loginForm.length) {
		
		$loginForm.validate({			
				rules: {
					username: {
						required: true,
						email: true
						
					},
					password: {
						required: true
					}				
				},
				messages: {					
					username: {
						required: 'Please enter your email!',
						email: 'Please enter a valid email address!'
					},
					password: {
						required: 'Please enter your password!'
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
		
	
	
	/*------*/
	/* for fading out the alert message after 3 seconds */
	$alert = $('.alert');
	if($alert.length) {
		setTimeout(function() {
	    	$alert.fadeOut('slow');
		   }, 3000
		);		
	}
	
	
	// list of all products for admin
	var $productsTable = $('#postsTable');
	
	
	if($productsTable.length) {
		
		var jsonUrl = window.contextRoot + '/json/data/admin/all/posts';
		console.log(jsonUrl);
		
		$productsTable.DataTable({
					lengthMenu : [ [ 10, 30, 50, -1 ], [ '10 Records', '30 Records', '50 Records', 'ALL' ] ],
					pageLength : 30,
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
												+ '/product" class="btn btn-primary"><span class="glyphicon glyphicon-pencil"></span></a> &#160;';

										return str;
									}
								}					           	
					],
					
					
					initComplete: function () {
						var api = this.api();
						api.$('.switch input[type="checkbox"]').on('change' , function() {							
							var dText = (this.checked)? 'You want to activate the Product?': 'You want to de-activate the Product?';
							var checked = this.checked;
							var checkbox = $(this);
							debugger;
						    bootbox.confirm({
						    	size: 'medium',
						    	title: 'Product Activation/Deactivation',
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
	
	CKEDITOR.replace( 'editor1' );
	// This is for pasting content to post content
//	$(document).ready(function(){
//        //put yer code in here
//
//        ['paste'].forEach(function(event) {
//            document.addEventListener(event, function(e) {
//                e.preventDefault();
//                var pastedText = undefined;
//
//                if (window.clipboardData && window.clipboardData.getData) { // IE
//
//                    pastedText = window.clipboardData.getData('Text');
//
//                } else if (e.clipboardData && e.clipboardData.getData) {
//
//                    pastedText = e.clipboardData.getData('text/html');
//
//                }
//
//                $("#post-content").html(pastedText);
//
//            });
//        });
//
//    });
	
	
	
	
})

