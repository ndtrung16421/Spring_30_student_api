<%@include file="/components/header.jsp"%>
	<div class="container-fluid mt-6">
		<div class="row">
            <div class="row">
                <div class="col-md-6 offset-md-4 margin-table">
                    <div class="card">
                        <div class="card-body">
                            <h2 class="text-center mmy-3">Update Student</h2>
                            <form >
                            
                            	<div class="form-group">
                                    <label for="id">ID: </label>
                                    <input type="text" class="form-control" id="id" name="id" readonly required >
                                </div><br>
                            
                                <div class="form-group">
                                    <label for="name">Name:</label>
                                    <input type="text" class="form-control" id="name" name="name" placeholder="Input Name here" 
                                     required  >
                                </div>
                                <div class="form-group">
                                    <label for="email">Email: </label>
                                    <input type="text"  class="form-control" id="email" name="emaie" placeholder="Input email here"
                                      required >
                                </div>
                                
                                
<br>
							<div class="form-group">
								<label for="gender">Gender: </label> <select id="gender"
									name="gender">
									<option value="M">M</option>
									<option value="F">F</option>
								</select>
							</div>
							<br>
							<div class="form-group round">
								<label for="teams">Team: </label> <select id="teams"
									name="teams">
									<option value="Team 1">Team 1</option>
									<option value="Team 2">Team 2</option>
									<option value="Team 3">Team 3</option>
									<option value="Team 4">Team 4</option>
									<option value="Team 5">Team 5</option>
								</select>
								<!-- <input type="text"  class="form-control" id="teams" name="teams" placeholder="Input team" required> -->
							</div>
                                
                                
                                
                                
                                <div class="container text-center"  ><br>
                                    <p    id="upsv"  class="btn btn-outline-success" style= "margin-top: 16px;">Update</p>
                                    
                                    <a href="${baseURL}/student" class="btn btn-outline-info">Back</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</div>
	
	
		<script>
		
		if( !localStorage.getItem("key") || localStorage.getItem("key")==null ){
			var	url = "${baseURL}/login";
		    $(location).attr("href", url);  
		}
		
		</script>
	
	
	<script>
		$(document).ready(function() {
			var pa = (window.location.pathname) ;
			var pa2 = pa.split('/');
			var pa3 = (pa2[  pa2.length -1  ]);
				//alert("connect") ;
				$.ajax({  
		            url: "http://localhost:8082/api/student/"+pa3+"  ",  
		            
		            type: 'GET',  
		             
		            dataType: 'json',  
		            
		            success: function(data) {  

						$('#id').val(data.id);
						$('#name').val(data.name);
						$('#email').val(data.email);
						$('#gender').val(data.gender);
						$('#teams').val(data.teams);
						
		                	                  
		            },  
		            error: function(xhr, textStatus, errorThrown) {  
		                alert('Error in Database 2');  
		                
		                
		            }  
		        });  
				
			
		});
	</script>
	<script>
		$(document).ready(function() {
			$("#upsv").click(function() {
				//----------------------------------function lấy các input name  
				
				/* var data = {};
				var formData = $('#upsv1').serializeArray();
				
				  $.each(formData, function (i, v) {
			            data[""+v.name+""] = v.value;
			        }); */
				//--/* /* --------------------------------------------------------
					var id = $("#id").val();
					var name = $("#name").val();
					var email = $("#email").val();
					var gender = $("#gender").val();
					var teams = $("#teams").val();
					
					var abcd ={"id":id,"name":name, "email":email, "gender":gender,"teams":teams  }  
					
					//alert( JSON.stringify(abcd)  );
					





					

					$.ajax({ 
				        url: 'http://localhost:8082/api/student',
				 
				        type: 'post',
				        contentType: 'application/json',
			            data: JSON.stringify(abcd)  ,
			            dataType: 'json',
				        success: function(result)
				        {	
				        	
				        	alert( "Cap nhat thanh cong!!!");
				        	var	url = "${baseURL}/student";
				            $(location).attr("href", url);  
				        	
				        },
				        error: function (jqXHR, exception) {
				        	alert( "Cap nhat that bai!!" );
			            }
				    });	    
			});
		});
	</script>
	
	
	
	
	
<%@include file="/components/footer.jsp"%>