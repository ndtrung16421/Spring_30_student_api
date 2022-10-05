<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="/components/header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style type="text/css">

/* scroll-bar */
/* width */
::-webkit-scrollbar {
  width: 5px;
}

/* Track */
::-webkit-scrollbar-track {
  box-shadow: inset 0 0 5px white; 
  border-radius: 4px;
}
 
/* Handle */
::-webkit-scrollbar-thumb {
  background:  #FF7F50; 
  border-radius: 10px;
}


*, *::after, *::before {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
	height:auto;
}

html {
height:auto;
	font-size: 16px;
}

body {
height:auto;
	color: #222;
	font-family: 'Poppins', sans-serif;
}

.container {

height:auto;
	height: auto;
	display: flex;
	justify-content: center;
	align-items: center;
	background-image: linear-gradient(120deg, #e0c3fc 0%, #8ec5fc 100%);
	
	overflow: hidden;
}

.calendar {

height:auto;
	width: 766px;
	background-color: #fff;
	padding: 2rem;
	border-radius: 4px;
}

.calendar h1 {
	text-transform: uppercase;
	margin-bottom: 2rem;
	text-align: center;
}

.info {

	display: flex;
	justify-content: space-between;
	margin-bottom: 1rem;
}

.info p {
	font-size: 1.5rem;
	font-weight: 600;
}

.date {
	border: 1px solid #ccc;
	display: flex;
	flex-wrap: wrap;
}

.day, .day-name {
	width: 100px;
	height: 100px;
	border: 1px solid #ccc;
	font-size: 1.5rem;
	text-align: center;
	line-height: 80px;
	
}

/* .btn {
	display: inline-block;
	padding: 1rem;
	font-size: 1.0rem;
	border: none;
	outline: none;
	cursor: pointer;
	border-radius: 4px;
	transition: all 0.5s ease-in;
}
 */
/* .btn {
	background-size: 200% auto;
	color: #fff;
	box-shadow: 0 0 20px #eee;
} */

.btn:hover {
	background-position: right center;
	color: #fff;
	text-decoration: none;
}

.btn-next {
	margin-left: 1rem;
	 background-image: linear-gradient(to right,  #7386D5 0%,  #7386D5 51%,  #7386D5 100%); 
}

.btn-prev {
	margin-right: 1rem;
	 background-image: linear-gradient(to right, #7386D5 0%,  #7386D5 51%,  #7386D5 100%); 
}

.today {
	margin-right: 1rem;
	 background-image: linear-gradient(to right, #7386D5 0%,  #7386D5 51%,  #7386D5 100%);
	  position: relatived   ;
  	
  	right: 50%;
  	top: 20%;
}

.day.active {
	background-color: #7386D5;
	/* background-image: linear-gradient(to right, #aa076b 0%, #61045f 51%, #aa076b 100%); */
	color: #fff;
	    
}
.day {
	 height: 100px;
	
	      overflow-y: auto;
}



.day.active1 {
	background-color: deeppink;
	/* background-image: linear-gradient(to right, #aa076b 0%, #61045f 51%, #aa076b 100%); */
	color: black;
	 font-weight: bold;
}
p{
    font-size: 5px;
 	margin-top: -20px;
    padding: 1px;
	
}

.number_d{
    font-size: 1rem;
   color: black;
    padding: 1px;

}

#MyForm{
	display: none;
    width: 300px;
    
    border: 1px solid #ccc;
    padding: 14px;
    background: #ececec;
    position: fixed;
  	
  	right: 50%;
  	top: 20%;
}
#list_task{
	display: none;
    width: 300px;
    
    border: 1px solid #ccc;
    padding: 14px;
    background: #ececec;
    position: fixed;
  	
  	right: 10%;
  	top: 20%;
}


</style>
</head>
<body>


<script>
	if (!localStorage.getItem("key") || localStorage.getItem("key") == null) {
		var url = "${baseURL}/login";
		$(location).attr("href", url);
	}
</script>

	<div class="container">
		<button class="btn btn-prev">
			<span><i class="fa fa-chevron-left" aria-hidden="true"><</i></span>
		</button>
		<div class="calendar">
			
			
			<div class="btn-edit" style="margin-bottom: 10px;">
		
  	 
  				<p class="today btn btn-info btn-sm" style="margin:auto;font-size:1rem;margin-top: 10px;"> TODAY</p>
			</div> 
			
			<div class="info">
				<p class="month">September</p>
				<p class="year">2022222</p>
			</div>
			<div class="date">
				<div class="day-name">Su</div>
				<div class="day-name">Mo</div>
				<div class="day-name">Tu</div>
				<div class="day-name">We</div>
				<div class="day-name">Th</div>
				<div class="day-name">Fr</div>
				<div class="day-name">Sa</div>
			</div>
			<div class="date date-container">
				<div class="day"></div>
				<div class="day"></div>
				<div class="day">
				<p>1</p>
				</div>
				<div class="day">2</div>
				<div class="day">3</div>
				<div class="day">4</div>
				<div class="day">5</div>
				<div class="day">6</div>
				<div class="day">7</div>
				<div class="day">8</div>
				<div class="day">9</div>
				<div class="day">10</div>
				<div class="day">11</div>
				<div class="day">12</div>
				<div class="day">13</div>
				<div class="day">14</div>
				<div class="day">15</div>
				<div class="day">16</div>
				<div class="day">17</div>
				<div class="day">18</div>
				<div class="day">19</div>
				<div class="day">20</div>
				<div class="day">21</div>
				<div class="day">22</div>
				<div class="day">23</div>
				<div class="day">24</div>
				<div class="day">25</div>
				<div class="day">26</div>
				<div class="day">27</div>
				<div class="day">28</div>
				<div class="day">29</div>
				<div class="day">30</div>
				<div class="day">31</div>
			</div>
		</div>
		<button class="btn btn-next">
			<span><i class="fa fa-chevron-right" aria-hidden="true">></i></span>
		</button>
	</div>
	
	
	
<form id="MyForm" action="" method="post">
  	<div class="form-group">
		
		<input type="hidden" class="form-control" id="task_id"
		name="newtask" placeholder="NewTask" required>
		
		<label> Task</label>
		<input type="text" class="form-control" id="newtask"
		name="newtask" placeholder="NewTask" required>
				
		<label> Start</label>						
		<input type="date" class="form-control" id="dateStart"
		name="newtask" placeholder="NewTask" required>
		<input type="time" class="form-control" id="timeStart"
		name="timeStart"  required>
										
									
		<label> End</label>						
		<input type="date" class="form-control" id="dateEnd"
		name="newtask" placeholder="NewTask" required>
		<input type="time" class="form-control" id="timeEnd"
		name="timeStart"  required>
										
										
		<label>Color</label>
		<input type="color" class="form-control" id="choose_color"
		name="choose_color"  required   style="height: 40px;">
		</div>
		
<!--   	<p style="height:20%;" class="edit btn btn-success btn-sm">Edit</p>
  	<p class="close btn btn-info btn-sm"> Close</p> -->
<div class="btn-edit" style="
    margin-bottom: 10px;
	">
		
  	<p class="edit btn btn-success btn-sm" style="margin:auto;font-size: 0.8rem;margin-top: 10px;">Edit</p>
  	<p class="close btn btn-info btn-sm" style="margin:auto;font-size: 0.8rem;margin-top: 10px;"> Close</p>
	</div>
</form>

<div id="list_task">

</div>

	<script type="text/javascript">
		let monthEle = document.querySelector('.month');
		let yearEle = document.querySelector('.year');
		let btnNext = document.querySelector('.btn-next');
		let btnPrev = document.querySelector('.btn-prev');
		let dateEle = document.querySelector('.date-container');
		const date = new Date();
		let currentMonth = date.getMonth();
		let currentYear = date.getFullYear();
		function displayInfo() {
			// Hiển thị tên tháng
			let currentMonthName = new Date(currentYear, currentMonth)
					.toLocaleString('en-us', {
						month : 'long'
					});

			monthEle.innerHTML = currentMonthName;
			yearEle.innerHTML = currentYear;
			renderDate();
		}
		
		function getDaysInMonth() {
		    return new Date(currentYear, currentMonth + 1, 0).getDate();
		}

		// Lấy ngày bắt đầu của tháng
		function getStartDayInMonth() {
		    return new Date(currentYear, currentMonth, 1).getDay();
		}

		// Active current day
		var task_date = []   ;
		function activeCurrentDay(day) {
			
			 ;
			var check = false;
			for( let i =0 ; i<10 ; i++){
				//console.log(i) ;
				if ( localStorage.getItem('addTask'+i) ){

					console.log(i);
					console.log( storedEvents[i].dateStart );
					
					let day1 = new Date( storedEvents[i].dateStart ).toDateString();
					console.log(   day1  );

				    let day2 = new Date(currentYear, currentMonth, day).toDateString();
				    console.log(   day2  );

				    console.log(    day1 == day2  );
				    

				    if( day1 == day2   ){
				    	task_date[i] = storedEvents[i].eventText ;
						check = true ;
						}
				    
				    
				}
			}


			return check == true ? 'active' : '';
			
		}

		function abcdef( day  ) {
			
			var re ="" ;
			let storedEvents = JSON.parse(localStorage.getItem('events'));
			if (storedEvents != null){
				
			
				var check = false;
				var kk ;
				for( let i =0 ; i< storedEvents.length; i++){
					//console.log(i) ;
					
	
						console.log(i);
						console.log( storedEvents[i].dateStart );
						
						let day1 = new Date( storedEvents[i].dateStart ).toDateString();
						console.log(   day1  );
	
					    let day2 = new Date(currentYear, currentMonth, day).toDateString();
					    console.log(   day2  );
	
					    console.log(    day1 == day2  );
					    
					    let eventsLi ='';
					    if( day1 == day2   ){
					    	task_date[i] = storedEvents[i].eventText ;
							check = true ;
							var kk =storedEvents[i].eventText ;
							re += "<p data-event-id="+storedEvents[i].id+" class='event-edit' style='background-color:  "+storedEvents[i].color+"  ;color:blue;font-size:15px;'> "+kk+"  </p> "; 
							
							}
					    
					    
					
				}
			}
			console.log(re);
			//return check == true ? kk : '';
			return re ;
			
		}

		
		// Hiển thị ngày trong tháng lên trên giao diện
		function renderDate() {
		    let daysInMonth = getDaysInMonth();
		    let startDay = getStartDayInMonth();

		    dateEle.innerHTML = '';

		    for (let i = 0; i < startDay; i++) {
		        dateEle.innerHTML += `
		            <div class="day"></div>
		        `;
		    }
		    
		    for (let i = 0; i < daysInMonth; i++) {
		    	let day1 = new Date().toDateString();
			    let day2 = new Date(currentYear, currentMonth, i+1).toDateString();
			    if(day1==day2)
			    	 dateEle.innerHTML += '<div class="day active1">  <div >  '+(i + 1)+' </div>     '+ abcdef( i+1  )+'   </div>';
			    else{
		        	dateEle.innerHTML += '<div class="day"> '+(i + 1)+''+ abcdef( i+1  )+' </div>';
		        	
		        	
		        	
			    }
		        	
		        	
		        	
		    }
		    
		}
		btnNext.addEventListener('click', function () {
		    if (currentMonth == 11) {
		        currentMonth = 0;
		        currentYear++;
		    } else {
		        currentMonth++;
		    }
		    displayInfo();
		});

		// Xử lý khi ấn vào nút previous month
		btnPrev.addEventListener('click', function () {
		    if (currentMonth == 0) {
		        currentMonth = 11;
		        currentYear--;
		    } else {
		        currentMonth--;
		    }
		    displayInfo();
		});
		window.onload = displayInfo;
		
	</script>
	
	
	
<script>
$(document).on('click', '.event-edit', function(){
    //alert("aaaaaa");
    let id = $(this).data('event-id');
   // alert(id);
    let storedEvents = JSON.parse(localStorage.getItem('events'));
    if(storedEvents != null){
        storedEvents = storedEvents.filter( ev => ev.id == id ); 
        
        $("#task_id").val( id )  ;
       $("#newtask").val( storedEvents[0].eventText )  ;
		 $("#dateStart").val( storedEvents[0].dateStart ) ;
		$("#timeStart").val(    storedEvents[0].timeStart    )   ;
		
		$("#dateEnd").val( storedEvents[0].dateEnd ) ;
		$("#timeEnd").val( storedEvents[0].timeEnd  ) ;
		
		$("#choose_color").val( storedEvents[0].color) ;
		
		//--------------------------------------------------------
		
		
       
                         
        	/* let storedEvents3 = JSON.parse(localStorage.getItem('events'));
        	//alert(  storedEvents[0].dateStart );
            let eventsToday = storedEvents3.filter(eventsToday => eventsToday.dateStart === storedEvents[0].dateStart);
            let eventsList = Object.keys(eventsToday).map(k => eventsToday[k]);
            if(eventsList.length>0){
                let eventsLi ='';
                eventsList.forEach(event =>  $('#list_task').html(eventsLi +=`
    	            <div class="alert alert-danger alert-dismissible fade show" role="alert">
    	            `+ event.eventText +`
    	            <button type="button" class="close remove-event btn btn-danger" data-event-id=" `+ event.id +`" data-dismiss="alert" aria-label="Close">
    	              <span aria-hidden="true">&times;</span>
    	            </button>
    	          </div>`));
            }else{
                $('#list_task').html('<h5 class="text-center">No events found</h5 class="text-center">');
            }      */          
        
		
		
		
		
		
        //alert( storedEvents[0].eventText+" "+ storedEvents[0].timeStart);
    }
    
    $("#MyForm").toggle();
    //$("#list_task").toggle();
    //
})

 $(document).on('click', '.close', function(){
    //alert("aaaaaa");
    
    
    $("#MyForm").hide()   ;
   // $("#list_task").hide();
    //
})
 $(document).on('click', '.today', function(){
	 location.reload();
})


 $(document).on('click', '.edit', function(){
	 
	 var id9 = $("#task_id").val() ;
	// alert(id9) ;
	 let storedEvents = JSON.parse(localStorage.getItem('events'));
		if (storedEvents != null){
			
		
			 for(let i=0; i<storedEvents.length ; i++ ){
				 if( storedEvents[i].id == id9  ){
					 
					 storedEvents[i].eventText = $("#newtask").val() ;
					 storedEvents[i].dateStart = $("#dateStart").val() ;
					 storedEvents[i].timeStart = $("#timeStart").val() ;
					 
					 storedEvents[i].dateEnd = $("#dateEnd").val() ;
					 storedEvents[i].timeEnd = $("#timeEnd").val() ;
					 
					 storedEvents[i].color = $("#choose_color").val() ;
					 storedEvents[i].done = false ;
					 
				 }
			 }
			 localStorage.setItem('events', JSON.stringify(storedEvents));
		
				//alert("Them thanh cong");
				location.reload();
		}
     

    //$("#MyForm").hide()   ;
    //
})
</script>


</body>
</html>