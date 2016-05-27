<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">
<%
String useremail = request.getParameter("Email");
//System.out.println(useremail+"  Wel");
if(session.getAttribute(useremail)==null){
//user did not login
response.sendRedirect("signin.jsp");
}
%>
  <head>
    <title>userHome</title>

  
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css">
    <link href="http://getbootstrap.com/examples/jumbotron-narrow/jumbotron-narrow.css" rel="stylesheet">
    <link href="../static/css/signup.css" rel="stylesheet">
    <script src="../static/js/jquery-1.11.2.js"></script>
    <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.templates/beta1/jquery.tmpl.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

 <style>
	.btn-file {
    position: relative;
    overflow: hidden;
}
.btn-file input[type=file] {
    position: absolute;
    top: 0;
    right: 0;
    min-width: 100%;
    min-height: 100%;
    font-size: 100px;
    text-align: right;
    filter: alpha(opacity=0);
    opacity: 0;
    outline: none;
    background: white;
    cursor: inherit;
    display: block;
}
    </style>
	<script src="../static/js/jquery.ui.widget.js"></script>
	
	<script type="text/javascript" src="../static/js/jquery.fileupload.js"></script>
	<script type="text/javascript" src="../static/js/jquery.fileupload-process.js"></script>
	<script type="text/javascript" src="../static/js/jquery.fileupload-ui.js"></script>
	
	    
        <script>
		$(function(){
			    $('#fileupload').fileupload({
        			url: 'upload',
        			dataType: 'json',
        			add: function (e, data) {
        				data.submit();
        			},
			        success:function(response,status) {
					console.log(response.filename);
					var filePath = 'static/Uploads/' + response.filename;
					$('#imgUpload').attr('src',filePath);
					$('#filePath').val(filePath);
			        	console.log('success');
			        },
			        error:function(error){
			        	console.log(error);
			        }
    			});
		})
	</script>
 <script>
	$(function(){
		
		GetWishes(1);
		$('#btnUpdate').click(function(){
			$.ajax({
			url : '/updateWish',
			data : {title:$('#editTitle').val(),description:$('#editDescription').val(),id:localStorage.getItem('editId'),filePath:$('#imgUpload').attr('src'),isPrivate:$('#chkPrivate').is(':checked')?1:0,isDone:$('#chkDone').is(':checked')?1:0},
			type : 'POST',
			success: function(res){
				

			$('#editModal').modal('hide');
							    
				GetWishes(1);
				
				

				
			},
			error: function(error){
				console.log(error);
			}
		});
		});

		$('document').on('click','.navigation li a',function(){
			console.log('me in');
		});
	});

	function GetWishes(_page){
		
		var _offset = (_page - 1) * 2;
		$.ajax({
			url : '/getWish',
			type : 'POST',
			data : {offset:_offset},
			success: function(res){
				


				
				var itemsPerPage = 2;
				
				var wishObj = JSON.parse(res);
				
				$('#ulist').empty();
				$('#listTemplate').tmpl(wishObj[0]).appendTo('#ulist');

				var total = wishObj[1]['total'];
				var pageCount = total/itemsPerPage;
				var pageRem = total%itemsPerPage;
				if(pageRem !=0 ){
					pageCount = Math.floor(pageCount)+1;
				}
			

				$('.pagination').empty();

 				var pageStart = $('#hdnStart').val();
				var pageEnd = $('#hdnEnd').val();

				
				

				if(pageStart>5){
					var aPrev = $('<a/>').attr({'href':'#'},{'aria-label':'Previous'})
				.append($('<span/>').attr('aria-hidden','true').html('&laquo;'));

				$(aPrev).click(function(){
					$('#hdnStart').val(Number(pageStart) - 5);
					$('#hdnEnd').val(Number(pageStart) - 5 + 4);
					GetWishes(Number(pageStart) - 5);
				});

				var prevLink = $('<li/>').append(aPrev);
				$('.pagination').append(prevLink);
				}
				
				
				
				for(var i=Number(pageStart);i<=Number(pageEnd);i++){
					
					if (i > pageCount){
						break;
					}

					
					var aPage = $('<a/>').attr('href','#').text(i);
					
					$(aPage).click(function(i){
						return function(){
							GetWishes(i);
						}
					}(i));
					var page = $('<li/>').append(aPage);

					if((_page)==i){
						$(page).attr('class','active');
					}
					
					$('.pagination').append(page);
					
					
				}
				if ((Number(pageStart) + 5) <= pageCount){
					var nextLink = $('<li/>').append($('<a/>').attr({'href':'#'},{'aria-label':'Next'})
					.append($('<span/>').attr('aria-hidden','true').html('&raquo;').click(function(){
							$('#hdnStart').val(Number(pageStart) + 5);
							$('#hdnEnd').val(Number(pageStart) + 5 + 4);
							GetWishes(Number(pageStart) + 5);
						
					})));
					$('.pagination').append(nextLink);
				}
				
				
				
				

				
			},
			error: function(error){
				console.log(error);
			}
		});
	}

	function ConfirmDelete(elem){
		localStorage.setItem('deleteId',$(elem).attr('data-id'));
		$('#deleteModal').modal();
	}

	function Delete(){
		$.ajax({
			url : '/deleteWish',
			data : {id:localStorage.getItem('deleteId')},
			type : 'POST',
			success: function(res){
				var result = JSON.parse(res);
				if(result.status == 'OK'){
					$('#deleteModal').modal('hide');
					GetWishes();
				}
				else{
					alert(result.status);	
				}
			},
			error: function(error){
				console.log(error);
			}
		});
	}

	function Edit(elm){
		localStorage.setItem('editId',$(elm).attr('data-id'));
		$.ajax({
			url : '/getWishById',
			data : {id:$(elm).attr('data-id')},
			type : 'POST',
			success: function(res){
				
				var data = JSON.parse(res);
				console.log(data);
				$('#editTitle').val(data[0]['Title']);
				$('#editDescription').val(data[0]['Description']);
				$('#imgUpload').attr('src',data[0]['FilePath']);
				if(data[0]['Private']=="1"){
					$('#chkPrivate').attr('checked','checked');
				}
				if(data[0]['Done']=="1"){
					$('#chkDone').attr('checked','checked');
				}
				$('#editModal').modal();
				
				

				
			},
			error: function(error){
				console.log(error);
			}
		});
	}
    </script>
    
   <style>
        .trash { color:rgb(209, 91, 71); }




        .panel-body .checkbox { display:inline-block;margin:0px; }


        .list-group { margin-bottom:0px; }
    </style>
   
  </head>

  <body>

    <div class="container-fluid">
      <div class="header">
        <nav>
          <ul class="nav nav-pills pull-right">
              <li role="presentation"><a style="color:#A52A2A" target="_blank" href="https://shibboleth.stevens.edu/idp/Authn/UserPassword">MyStevens</a></li>
              <li role="presentation"><a href="/MyWeb/dashboard.jsp">Dashboard</a></li>
             <li role="presentation" class="active"><a href="/userHome">Home</a></li>
	    <li role="presentation"><a href="/MyWeb/addWish.jsp">Add Post</a></li>
            <li role="presentation" ><a href="/MyWeb/index.jsp">Logout</a></li>
          </ul>
        </nav>
        <h3 class="text-muted">Stevens Duck Life</h3>
      </div>

     
        <script id="listTemplate" type="text/x-jQuery-tmpl">
       <li class="list-group-item">
                            <div class="checkbox">
                                <label>
                                    ${Title}
                                </label>
                            </div>
                            <div class="pull-right action-buttons">
                                <a data-id=${Id} onclick="Edit(this)" ><span class="glyphicon glyphicon-pencil"></span></a>
                               <a data-id=${Id} onclick="ConfirmDelete(this)" ><span class="glyphicon glyphicon-trash"></span></a>
                            </div>
                        </li>
    </script>
     
    
	
	<div class="well" style="background-image:url(/MyWeb/static/Uploads/Stevens.jpg)">
    <div class="row">
        <div class="col-md-12">
            
                <div class="panel-body">

                    <ul id="ulist" class="list-group">
                        
 
                        
                    </ul>
		    <nav>
  <ul class="pagination">
    
  </ul>
</nav>
                </div>
                
            </div>
        </div>
    </div>
 <footer class="footer">
        <p>&copy; Yaoshuai 2016</p>
      </footer>
</div>
    <form action=Housing.jsp method=post>  
    <!-- transfer email address to StevensHousing page -->
    <input type=hidden id="hidden 1" name=email value="<%=request.getParameter("Email") %>">
    <!-- jump into StevensHousing page -->
    <input type=submit value=StevensHousing>
    </form>

<div class="modal fade" id="editModal" tabindex="-1" role="dialog" aria-labelledby="editModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal"><span aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
        <h4 class="modal-title" id="editModalLabel">Update Wish</h4>
      </div>
      <div class="modal-body">
        <form role="form">
          <div class="form-group">
            <label for="recipient-name" class="control-label">Title:</label>
            <input type="text" class="form-control" id="editTitle">
          </div>
          <div class="form-group">
            <label for="message-text" class="control-label">Description:</label>
            <textarea class="form-control" id="editDescription"></textarea>
          </div>
          <div class="form-group">
  <label for="txtPost">Photos</label>
            </div>
                     
<div class="input-group">
    <div>
                <span class="input-group-btn">
                    <span class="btn btn-primary btn-file">
                        Browse&hellip; <input type="file" id="fileupload" name="file" multiple>
                    </span>
                </span>
		<div class="pull-right">
                <img  id="imgUpload" style="width: 140px; height: 140px;" class="img-thumbnail"><input type="hidden" name="filePath" id="filePath">
		</div>
            </div>
  
</div>

<div class="form-group">
<label>Mark this as private and not visible to others.</label><br/>
<input id="chkPrivate" name="private" type="checkbox"> Mark as Private <span class="glyphicon glyphicon-lock" aria-hidden="true"></span>
</div>
<div>
<div class="form-group">
<label>Have you already accomplished this?</label><br/>
<input id="chkDone" name="done" type="checkbox"> Mark as Done <span class="glyphicon glyphicon-ok" aria-hidden="true"></span>
</div>
    <div>
    
    <div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button id="btnUpdate" type="button" class="btn btn-primary">Update</button>
      </div>
    </div>
  </div>
</div>





<div class="modal fade" id="deleteModal" tabindex="-1" role="dialog" aria-labelledby="deleteModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header" style="text-align:center;">
        <h4 class="modal-title" style="color:red;" id="deleteModalLabel">You are going to Delete this forever !!</h4>
      </div>
     
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">Cancel</button>
        <button type="button" class="btn btn-primary" onclick="Delete()">Delete</button>
      </div>
    </div>
  </div>
</div>
 <div>    
<input type="hidden" id="hdnStart" value="1" />
<input type="hidden" id="hdnEnd" value="5"/>
      

     
</div>


  </body>
</html>

