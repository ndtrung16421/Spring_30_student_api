<%@include file="/components/common_css_js.jsp"%>


	<div class="container-fluid mt-6">
		<div class="row">
            <div class="row">
                <div class="col-md-6 offset-md-4 margin-table">
                    <div class="card">
                        <div class="card-body">
                            <h3 class="text-center mmy-3">Register</h3>
                            <form id="addstu">
                                <div class="form-group">
                                    <label for="name">User name:</label>
                                    <input type="text" class="form-control" id="name" name="username" placeholder="Input Name here" required>
                                </div>
                                <div class="form-group">
                                    <label for="email">Password: </label>
                                    <input type="password"  class="form-control" id="email" name="password"  placeholder="Input pass" required>
                                </div>
                                <div class="form-group">
                                    <label for="gender">First name: </label>
                                    <input type="text"  class="form-control" id="firstname" name="firstname"  placeholder="Input " required>
                                </div>
                                <div class="form-group">
                                    <label for="teams">Last name: </label>
                                    <input type="text"  class="form-control" id="lastname" name="lastname" placeholder="Input " required>
                                </div>
                                <div class="container text-center">
                                    <p  id="taosv" class="btn btn-outline-success" style= "margin-top: 16px;">Create</p><br>
                                    <button type="reset" class="btn btn-outline-warning">Reset</button>
                                    <a href="${baseURL}/login" class="btn btn-outline-info">Login</a>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
	</div>
	
	

	
	
	<script>
		$(document).ready(function() {
			$("#taosv").click(function() {
				//----------------------------------function lấy các input name  
				
				var data = {};
				var formData = $('#addstu').serializeArray();
				
				  $.each(formData, function (i, v) {
			            data[""+v.name+""] = v.value;
			        });
				
					//alert( JSON.stringify(data)  );
					if(  data.username == "" || data.password=="" ||  data.firstname==""  || data.lastname==""   ){
						alert("khong the trong");
						return;
					}
						
					
					$.ajax({ 
				        url: 'http://localhost:8082/api/addUser',
				 
				        type: 'post',
				        contentType: 'application/json',
			            data: JSON.stringify(data)  ,
			            dataType: 'json',
				        success: function(data)
				        {
				        	alert( "Them thanh cong!!" );
							var	url = "${baseURL}/login";
						    $(location).attr("href", url); 
				        },
				        error: function (jqXHR, exception) {
				        	alert( "Them that bai!! tai khoan da ton tai " );
			            }
				    });	    
			});
		});
	</script>
	
	
	
	
	
<%@include file="/components/footer.jsp"%>