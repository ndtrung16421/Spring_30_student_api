<%@include file="/components/header.jsp"%>


<div class="container-fluid mt-6">
	<div class="row">
		<div class="row">
			<div class="col-md-6 offset-md-4 margin-table">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center mmy-3">Add student</h3>
						<form id="addstu">
							<div class="form-group">
								<label for="name">Name:</label> <input type="text"
									class="form-control" id="name" name="name"
									placeholder="Input Name here" required>
							</div>
							<div class="form-group">
								<label for="email">Email: </label> <input type="mail"
									class="form-control" id="email" name="email"
									placeholder="Input email" required>
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

							<br>

							<div class="container text-center">
								<button id="taosv" class="btn btn-outline-success">Create</button>
								<button type="reset" class="btn btn-outline-warning">Reset</button>
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
	if (!localStorage.getItem("key") || localStorage.getItem("key") == null) {
		var url = "${baseURL}/login";
		$(location).attr("href", url);
	}
</script>


<script>
	$(document).ready(function() {
		$("#taosv").click(function() {
			//----------------------------------function lấy các input name  

			var data = {};
			var formData = $('#addstu').serializeArray();

			$.each(formData, function(i, v) {
				data["" + v.name + ""] = v.value;
			});
			//----------------------------------------------------------
			/* var name = $("#name").val();
			var student_code = $("#student_code").val();
			var dob = $("#dob").val();
			
			var abcd ={"name":name, "student_code":student_code, "dob":dob  } */

			//alert( typeof abcd  );
			//let zz =JSON.stringify(data);
			//alert(JSON.stringify(data));
			if(  data.name == "" || data.email=="" ||  data.gender==""  || data.team==""   ){
				alert("khong the trong");
				return;
			}
			const reg = /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/g;
			if (reg.test(data.email) == false ){
				alert("email khong hop le");
				return;
			}
			$.ajax({
				url : 'http://localhost:8082/api/student',

				type : 'post',
				contentType : 'application/json',
				data : JSON.stringify(data),
				dataType : 'json',
				success : function(result) {
					alert("Them thanh cong!!");
				},
				error : function(jqXHR, exception) {
					alert("Them that bai!!");
				}
			});
		});
	});
</script>








<%@include file="/components/footer.jsp"%>