<%@include file="/components/header.jsp"%>

<div class="container">


	<!-- <button id="logout" class="btn btn-danger">Logout</button> -->


	<div class="card sm-8" style="border: none;">
		<h2 class="text-center">Student List</h2>

		<div class="container mb-3 btn-add">
			<%-- <a href="${baseURL }/add" class="btn btn-outline-success">Add
				Student</a> <a href="http://localhost:8082/api/student/pdfview"
				class="btn btn-outline-info">Export to PDF</a> --%>
		</div>



		<div class="card-body">
			<div class="row">
				<div class="col-sm-4">
					<p>
						<label for="name" class="form-label">Search by Name</label><br>
						<input type="text" id="find_student" class="form-control">

					</p>
				</div>

				<div class="col-sm-4">
					<p>
						<label for="email" class="form-label">Search by Email</label><br>
						<input type="text" id="find_email" class="form-control">
					</p>
				</div>



				<div class="col-sm-3 form-check" id='checkbox'>
					<label>Gender</label><br> <input type="radio" id="male"
						name="gender" value="M" class="form-check-input"> <label
						for="male" class="form-check-label">Male</label><br> <input
						type="radio" id="female" name="gender" value="F"
						class="form-check-input"> <label for="female"
						class="form-check-label">Female</label><br> <input
						type="radio" id="all" name="gender" value=""
						class="form-check-input"> <label for="all">All</label> <br>
				</div>


				<div class="col-sm-4">
					<div class="form-group round">
						<label for="teams">Team: </label> <select id="teams" name="teams">
							<option class="pick_team" value="">All</option>
							<option class="pick_team" value="Team 1">Team 1</option>
							<option class="pick_team" value="Team 2">Team 2</option>
							<option class="pick_team" value="Team 3">Team 3</option>
							<option class="pick_team" value="Team 4">Team 4</option>
							<option class="pick_team" value="Team 5">Team 5</option>
						</select>
						<!-- <input type="text"  class="form-control" id="teams" name="teams" placeholder="Input team" required> -->
					</div>

				</div>

			</div>
		</div>





		<table class="table table-shover text-center sm-12" border="1"
			style="border: none;">
			<thead>
				<tr>
					<th scope="col">ID</th>
					<th scope="col">Name</th>
					<th scope="col">Email</th>
					<th scope="col">Gender</th>
					<th scope="col">Teams</th>
					<th scope="col">Action</th>
				</tr>
			</thead>
			<tbody id="tbo">
				<%-- <c:forEach items="${student}" var="student" varStatus="status">
						<tr>
							<td>SV-${student.id}</td>
							<td>${student.name}</td>
							<td>${student.age}</td>
							<td>${student.address}</td>
							<td>
								<div>
									<a href= "${baseURL}/update/${student.id }" class="btn btn-outline-info btn-action">Update</a>
									<a href="${baseURL}/delete/${student.id }" onclick="return confirm('Ban muon xoa khong?'); "  class="btn btn-outline-danger btn-action">Delete</a>
								</div>
							</td>
						</tr>
					</c:forEach> --%>
			</tbody>
		</table>
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
 
            // Returning Input Radio defaultChecked Property
                document.getElementById(
                  "all").defaultChecked;
       
});
    </script>
<script>
	$(document).ready(function() {
		$("#logout").click(function() {

			//alert( "logggg"  );
			localStorage.removeItem("key");
			//localStorage.clear();
			var url = "${baseURL}/login";
			$(location).attr("href", url);

		});
	});
</script>

<script>
	$(document).on('click', '.close', function() {
		//alert("aaaaaa");

		$("#MyForm").hide();
		// $("#list_task").hide();
		//
	})
</script>
<script>
	$(document)
			.ready(
					function() {
						$("#checkbox input:radio")
								.click(
										function() {
											//alert("asdasda");
											var find_stu = "";
											find_stu = $('#find_student').val();
											var find_team = $('#teams').val();
											
											var find_gender = $('input[name="gender"]:checked').val();

											//alert(find_gender);
											
											if(  !find_gender   ){
												find_gender= "";
											}

											
											var find_email = $('#find_email')
													.val();

											/* if (find_stu == "") {
												find_stu = "-999";
											} */
											//alert(find_stu) ;
											var student ={"name":find_stu, "email":find_email, "gender":find_gender, "teams":find_team };
											//alert(JSON.stringify(student));
											$.ajax({
												url : 'http://localhost:8082/api/student-find-student',

												type : 'post',
												contentType : 'application/json',
												data : JSON.stringify(student),
												dataType : 'json',
												success : function(data) {

													//alert(JSON.stringify(data));
													//alert("Them thanh cong!!");

													$("#tbo").empty();

													for (var i = 0; i < Object
															.keys(data).length; i++) {

														var txt1 = "<tr> <td> "
																+ data[i].id
																+ " </td> <td> "
																+ data[i].name
																+ " </td> <td> "
																+ data[i].email
																+ "   </td> <td>"
																+ data[i].gender
																+ "   </td> <td>"
																+ data[i].teams
																+ "   </td> "

																+ "	<td>  "
																+ "		<div>  "
																+ "			<a href=' ${baseURL}/update/"+ data[i].id +"  '  "
      	+"			class='btn btn-outline-info btn-action'> Update</a>  "

																+ "			<a href= ' ${baseURL}/delete/"+ data[i].id +"  '   "
      	+"			class= 'btn btn-outline-danger btn-action'     >"
																+ "		  "
																+ "			Delete </a>   "
																+ "		</div>  "
																+ "	</td>    "

																+ "</tr>  ";

														$("tbody")
																.append(
																		txt1);
													}




													
												},
												error : function(jqXHR, exception) {
													alert("Them that bai!!");
												}
											});

										});
					});
</script>

<script>
	$(document)
			.ready(
					function() {
						$("#teams")
								.change(
										function() {
											//alert("asdasda");
											var find_stu = "";
											find_stu = $('#find_student').val();
											var find_team = $('#teams').val();
											
											var find_gender = $('input[name="gender"]:checked').val();

											//alert(find_gender);
											
											if(  !find_gender   ){
												find_gender= "";
											}

											
											var find_email = $('#find_email')
													.val();

											/* if (find_stu == "") {
												find_stu = "-999";
											} */
											//alert(find_stu) ;
											var student ={"name":find_stu, "email":find_email, "gender":find_gender, "teams":find_team };
											//alert(JSON.stringify(student));
											$.ajax({
												url : 'http://localhost:8082/api/student-find-student',

												type : 'post',
												contentType : 'application/json',
												data : JSON.stringify(student),
												dataType : 'json',
												success : function(data) {

													//alert(JSON.stringify(data));
													//alert("Them thanh cong!!");

													$("#tbo").empty();

													for (var i = 0; i < Object
															.keys(data).length; i++) {

														var txt1 = "<tr> <td> "
																+ data[i].id
																+ " </td> <td> "
																+ data[i].name
																+ " </td> <td> "
																+ data[i].email
																+ "   </td> <td>"
																+ data[i].gender
																+ "   </td> <td>"
																+ data[i].teams
																+ "   </td> "

																+ "	<td>  "
																+ "		<div>  "
																+ "			<a href=' ${baseURL}/update/"+ data[i].id +"  '  "
      	+"			class='btn btn-outline-info btn-action'> Update</a>  "

																+ "			<a href= ' ${baseURL}/delete/"+ data[i].id +"  '   "
      	+"			class= 'btn btn-outline-danger btn-action'     >"
																+ "		  "
																+ "			Delete </a>   "
																+ "		</div>  "
																+ "	</td>    "

																+ "</tr>  ";

														$("tbody")
																.append(
																		txt1);
													}




													
												},
												error : function(jqXHR, exception) {
													alert("Them that bai!!");
												}
											});

										});
					});
</script>



<script>
	$(document)
			.ready(
					function() {

						//alert("connect") ;
						$
								.ajax({
									url : 'http://localhost:8082/api/student',

									type : 'GET',

									dataType : 'json',

									success : function(data) {
										//alert(data.id);
										//alert(Object.keys( data ).length);
										//alert(   data.length  );
										//alert(data.student_code);

										for (var i = 0; i < Object.keys(data).length; i++) {

											var txt1 = "<tr> <td> "
													+ data[i].id
													+ " </td> <td> "
													+ data[i].name
													+ " </td> <td> "
													+ data[i].email
													+ "   </td> <td>"
													+ data[i].gender
													+ "   </td> <td>"
													+ data[i].teams
													+ "   </td> "

													+ "	<td>  "
													+ "		<div>  "
													+ "			<a href=' ${baseURL}/update/"+ data[i].id +"  '  "
 	 		                	+"			class='btn btn-outline-info btn-action'> Update</a>  "

													+ "			<a href= ' ${baseURL}/delete/"+ data[i].id +"  '   "
 	 		                	+"			class= 'btn btn-outline-danger btn-action'     >"
													+ "		  "
													+ "			Delete </a>   "
													+ "		</div>  "
													+ "	</td>    "

													+ "</tr>  ";

											$("tbody").append(txt1);
										}
									},
									error : function(xhr, textStatus,
											errorThrown) {
										alert('Error in Database 2');

									}
								});

					});
</script>



<script>
	$(document)
			.ready(
					function() {
						$('#find_student')
								.keyup(
										function() {
											//alert("asdasda");
											var find_stu = "";
											find_stu = $('#find_student').val();
											var find_team = $('#teams').val();
											
											var find_gender = $('input[name="gender"]:checked').val();

											//alert(find_gender);
											
											if(  !find_gender   ){
												find_gender= "";
											}

											
											var find_email = $('#find_email')
													.val();

											/* if (find_stu == "") {
												find_stu = "-999";
											} */
											//alert(find_stu) ;
											var student ={"name":find_stu, "email":find_email, "gender":find_gender, "teams":find_team };
											//alert(JSON.stringify(student));
											$.ajax({
												url : 'http://localhost:8082/api/student-find-student',

												type : 'post',
												contentType : 'application/json',
												data : JSON.stringify(student),
												dataType : 'json',
												success : function(data) {

													//alert(JSON.stringify(data));
													//alert("Them thanh cong!!");

													$("#tbo").empty();

													for (var i = 0; i < Object
															.keys(data).length; i++) {

														var txt1 = "<tr> <td> "
																+ data[i].id
																+ " </td> <td> "
																+ data[i].name
																+ " </td> <td> "
																+ data[i].email
																+ "   </td> <td>"
																+ data[i].gender
																+ "   </td> <td>"
																+ data[i].teams
																+ "   </td> "

																+ "	<td>  "
																+ "		<div>  "
																+ "			<a href=' ${baseURL}/update/"+ data[i].id +"  '  "
      	+"			class='btn btn-outline-info btn-action'> Update</a>  "

																+ "			<a href= ' ${baseURL}/delete/"+ data[i].id +"  '   "
      	+"			class= 'btn btn-outline-danger btn-action'     >"
																+ "		  "
																+ "			Delete </a>   "
																+ "		</div>  "
																+ "	</td>    "

																+ "</tr>  ";

														$("tbody")
																.append(
																		txt1);
													}




													
												},
												error : function(jqXHR, exception) {
													alert("Them that bai!!");
												}
											});

										});
					});
</script>


<script>
	$(document)
			.ready(
					function() {
						$('#find_email')
								.keyup(
										function() {
											//alert("asdasda");
											var find_stu = "";
											find_stu = $('#find_student').val();
											var find_team = $('#teams').val();
											
											var find_gender = $('input[name="gender"]:checked').val();

											//alert(find_gender);
											
											if(  !find_gender   ){
												find_gender= "";
											}

											
											var find_email = $('#find_email')
													.val();

											/* if (find_stu == "") {
												find_stu = "-999";
											} */
											//alert(find_stu) ;
											var student ={"name":find_stu, "email":find_email, "gender":find_gender, "teams":find_team };
											//alert(JSON.stringify(student));
											$.ajax({
												url : 'http://localhost:8082/api/student-find-student',

												type : 'post',
												contentType : 'application/json',
												data : JSON.stringify(student),
												dataType : 'json',
												success : function(data) {

													//alert(JSON.stringify(data));
													//alert("Them thanh cong!!");

													$("#tbo").empty();

													for (var i = 0; i < Object
															.keys(data).length; i++) {

														var txt1 = "<tr> <td> "
																+ data[i].id
																+ " </td> <td> "
																+ data[i].name
																+ " </td> <td> "
																+ data[i].email
																+ "   </td> <td>"
																+ data[i].gender
																+ "   </td> <td>"
																+ data[i].teams
																+ "   </td> "

																+ "	<td>  "
																+ "		<div>  "
																+ "			<a href=' ${baseURL}/update/"+ data[i].id +"  '  "
      	+"			class='btn btn-outline-info btn-action'> Update</a>  "

																+ "			<a href= ' ${baseURL}/delete/"+ data[i].id +"  '   "
      	+"			class= 'btn btn-outline-danger btn-action'     >"
																+ "		  "
																+ "			Delete </a>   "
																+ "		</div>  "
																+ "	</td>    "

																+ "</tr>  ";

														$("tbody")
																.append(
																		txt1);
													}




													
												},
												error : function(jqXHR, exception) {
													alert("Them that bai!!");
												}
											});

										});
					});
</script>






<%@include file="/components/footer.jsp"%>