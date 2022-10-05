<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="req" value="${pageContext.request}" />
<c:set var="baseURL" value="${req.contextPath}" />
<%@include file="/components/common_css_js.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body  >	


		<script>
		
		if( !localStorage.getItem("key") || localStorage.getItem("key")==null ){
			var	url = "${baseURL}/login";
		    $(location).attr("href", url);  
		}
		
		</script>



	<script >
	
	
		$(document).ready(function() {
			
			

				var pa = (window.location.pathname) ;
				var pa2 = pa.split('/');
				var pa3 = (pa2[  pa2.length -1  ]);
				$.confirm({
				    title: 'Canh bao!',
				    content: 'Ban co chac chan xoa khong!',
				    buttons: {
				        dongy: function () {


							$.ajax({ 
							        url: "http://localhost:8082/api/student/ "+pa3+"    ",							 
							        type: 'delete',
							        success: function()
							        {	
							        	
							        	//alert( "Xoa thanh cong!!!");
							      		var	url = "${baseURL}/student";
							            $(location).attr("href", url);  
							        	
							        },
							        error: function (jqXHR, exception) {
							        	alert( "Xoa that bai!!" );
						            }
							    });	   
					       
				        },
				        khong: function () {
				            var	url = "${baseURL}/student";
				            $(location).attr("href", url); 
				        }
				    }
				});






 
			
		});
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>