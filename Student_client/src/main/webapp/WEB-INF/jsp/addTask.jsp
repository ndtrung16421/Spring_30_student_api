<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="/components/header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<script>
	if (!localStorage.getItem("key") || localStorage.getItem("key") == null) {
		var url = "${baseURL}/login";
		$(location).attr("href", url);
	}
</script>


	<div class="container-fluid mt-6">
		<div class="row">
			<div class="row">
				<div class="col-md-6 offset-md-4 margin-table">
					<div class="card">
						<div class="card-body">
							<h3 class="text-center mmy-3">New task</h3>
							<form id="addstu">
								<div class="form-group">

									<input type="text" class="form-control" id="newtask"
										name="newtask" placeholder="NewTask" required>
										<br>
										<label>Start</label>
										<input type="date" class="form-control" id="dateStart"
										name="newtask" placeholder="NewTask" required>
										<input type="time" class="form-control" id="timeStart"
										name="timeStart"  required>
										
										<br>
										<label>End</label>
										<input type="date" class="form-control" id="dateEnd"
										name="newtask" placeholder="NewTask" required>
										<input type="time" class="form-control" id="timeEnd"
										name="timeStart"  required>
										
										<br>
										<label>Color</label>
										<input type="color" class="form-control" id="choose_color"
										name="choose_color" value="#49dab6" required>
								</div>
								<div class="container text-center">
									<br>
									

								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	
	<button  id="addtask2" class="btn btn-info">Add Task</button>
	<button  id="clear_task_all" class="btn btn-danger pull-right">Clear all</button>							
			
										
	<!-- <table class="table table-shover text-center sm-12" border="1"
		style="border: none;">
		<thead>
			<tr>
				<th scope="col">Name Task</th>
				<th scope="col">Date start</th>
				<th scope="col">Date End</th>
			</tr>
		</thead>
		
		<tbody >
			<tr>
				<td>1</td>
				<td>Task 1</td>
			</tr>
			<tr>
				<td>2</td>
				<td>Task 2</td>
			</tr>


		</tbody>
	</table> -->
<div class="events-today my-3 px-3">
                               
                            </div> 
	
	
	
	
<script>
	$(document).ready(function() {
		//
		$("#addtask2").click(function() {
			var text_task = $("#newtask").val() ;
			var dateStart = $("#dateStart").val() ;
			var timeStart = $("#timeStart").val() ;
			
			var dateEnd = $("#dateEnd").val() ;
			var timeEnd = $("#timeEnd").val() ;
			
			var ch_color = $("#choose_color").val() ;
			
			if( text_task =="" || dateStart =="" || dateEnd=="" || ch_color=="" || timeStart=="" || timeEnd==""){
				alert( "Khong the trong" );
				return;
			} 
/* 			for( let i =0 ; i<10 ; i++){
				if(  ! localStorage.getItem("addTask" +i)   ){
					localStorage.setItem("addTask"+i , [a,b,c] );
					break;
				}
			} */
            let events = localStorage.getItem('events');
            let obj = [];
            if (events) {
                obj = JSON.parse(events);
            }
           
            
                let id =1;
                if (obj.length > 0) {
                    id = Math.max.apply('', obj.map(function (entry) { return parseFloat(entry.id); })) + 1;
                }
                else {
                    id = 1;
                }
                obj.push({
                    'id' : id,
                    'eventText': text_task,
                    'dateStart': dateStart,
                    'timeStart': timeStart,
                    'dateEnd': dateEnd,
                    'timeEnd': timeEnd,
                    'color': ch_color,
                    'done': false
                    
                });           
                localStorage.setItem('events', JSON.stringify(obj));
/*                 $('#eventTxt').val('');
                $('.toast-body').html('Your event have been added');
                $('.toast').toast('show');
                showEvent(eventDate); */
            

			alert("Them thanh cong");
			location.reload();
			//alert("aa");
		});
	});
</script>



<script>
	$(document).ready(function() {
		//alert("aa");
		$("#clear_task_all").click(function() {
			localStorage.removeItem("events");
			alert("Da xoa tat ca task");
			location.reload();
		});
	});
</script>



<script type="text/javascript">

function showEvent(){
	 let storedEvents = JSON.parse(localStorage.getItem('events'));
	   
	    for(let i=0; i< storedEvents.length ; i++){
	    	console.log( storedEvents[i].id );
	    }
	    
	    if (storedEvents == null){
	        $('.events-today').html('<h5 class="text-center">No events found</h5 class="text-center">');               
	    }else{
	        let eventsToday = storedEvents;
	        
	        let eventsList = Object.keys(eventsToday).map(k => eventsToday[k]);
	        //alert(   eventsToday[0].id) ;
	        
	        if(eventsList.length>0){
	            let eventsLi ='';
	            eventsList.forEach(event =>  $('.events-today').html(eventsLi +=`
	            <div style="background-color: `+ event.color +` ;" class="alert alert-danger alert-dismissible fade show"  role="alert">
	            `+ event.eventText +` : &emsp;   `+ event.dateStart +` `+ event.timeStart +` &emsp;  to  &emsp;  `+ event.dateEnd +` `+ event.timeEnd +`
	            <button type="button" class="close remove-event btn btn-danger" data-event-id=" `+ event.id +`" data-dismiss="alert" aria-label="Close">
	              <span aria-hidden="true">&times;</span>
	            </button>
	          </div>`));
	        }else{
	            $('.events-today').html('<h5 class="text-center">No events found</h5 class="text-center">');
	        }               
	    }
}



$(document).ready(function() {
	
	showEvent();
//alert("aabb");
   

});
</script>

<script>
	$(document).ready(function() {
		//alert("aa");
		$(".remove-event").click(function() {
			let id = $(this).data('event-id');
			//alert(id);
			let storedEvents = JSON.parse(localStorage.getItem('events'));
            if(storedEvents != null){
                storedEvents = storedEvents.filter( ev => ev.id != id ); 
                localStorage.setItem('events', JSON.stringify(storedEvents));
/*                 $('.toast-body').html('Your event have been removed');
                $('.toast').toast('show'); */
            }
			alert("xoa thanh cong");
			location.reload();
			//showEvent();
		});
	});
</script>
	
	
	
	
	

</body>
</html>