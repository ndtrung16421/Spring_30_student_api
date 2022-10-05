<%@include file="/components/common_css_js.jsp"%>

<script>
	if (localStorage.getItem("key") && localStorage.getItem("key") != null) {
		var url = "${baseURL}/student";
		$(location).attr("href", url);
	}
</script>

<div class="container-fluid mt-6">
	<div class="row">
		<div class="row">
			<div class="col-md-6 offset-md-4 margin-table">
				<div class="card">
					<div class="card-body">
						<h2>Login</h2>
						<form id="addstu">
							<div class="form-group">
								<label for="name">User name:</label> <input type="text"
									class="form-control" id="username" name="username"
									placeholder="Input Name here" required>
							</div>
							<div class="form-group">
								<label for="email">Password: </label> <input type="password"
									class="form-control" id="password" name="password"
									placeholder="Input pass" required>
							</div>

							<div class="container text-center">
								<div>
									<p id="btn_login" class="btn btn-outline-success" style="    margin-top: 16px;">login</p>
									<button type="reset" class="btn btn-outline-warning">Reset</button>
									<a href="${baseURL}/Register" class="btn btn-outline-info">Register</a>
								</div>

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
		$("#btn_login").click(function() {
			//----------------------------------function lấy các input name  
			//alert( "aaa"  );
			/* 	var data = {};
				var formData = $('#addstu').serializeArray();
				
				  $.each(formData, function (i, v) {
			            data[""+v.name+""] = v.value;
			        }); */
			//----------------------------------------------------------
			var username = $("#username").val();
			// alert( username  );
			var password = $("#password").val();
			// alert( password  );

			var abcd = {
				"username" : username,
				"password" : password
			};

			//alert( JSON.stringify( abcd )  );

			$.ajax({
				url : 'http://localhost:8082/api/login',

				type : 'post',
				contentType : 'application/json',
				data : JSON.stringify(abcd),
				dataType : 'json',
				success : function(data) {

					//alert( localStorage.getItem("key") );
					//alert( data.key );

					if (data.key != null) {
						localStorage.setItem('key', data.key);
						var url = "${baseURL}/student";
						$(location).attr("href", url);
					} else {
						alert("sai tai khoan hoac mat khau!!");
					}

				},
				error : function(jqXHR, exception) {
					alert("that bai!!");
				}
			});
		});
	});
</script>







<%@include file="/components/footer.jsp"%>