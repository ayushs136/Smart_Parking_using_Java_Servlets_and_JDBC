
$('document').ready(function(){
	$.getJSON('FloorJSON',{ajax:true},function(data){
		$('#floorno').append($('<option>').text('-Select-'));	
	$.each(data,function(i,item){
		$('#floorno').append($('<option>').text(item.FLOORNAME).val(item.FLOORNO));
 	});	
 	});

	$('#floorno').change(function(){
		 
		$.getJSON('FetchFloorByIdJSON',{ajax:true, fid:$('#floorno').val()},function(data){
			
		if(data.length==0)
			{
//			 $("input[type=submit]").attr("enable", "enable");
			document.getElementById('btn').disabled=false;
			$('#fdiv').html('<b><i><font color=green>Parking is Empty...</font></i></b>');
			
			}
		else
			{
			
			console.log(data);
		 totalspace=data[0].NOOFSPACE;
		 avl_space=data[0].AVL_SPACE;
		 tv=data[0].TOTALVEHICAL;
		 console.log(avl_space);
		 
		 if(avl_space<=0){
			 $('#fdiv').html('<font color=red ><b><i>Parking is Full</i></b></font>');
//			 $("#btn").prop("disabled", true);
			 document.getElementById('btn').disabled=true;
		 }
		 else{
			 document.getElementById('btn').disabled=false; 
//			 $("#btn").prop("disabled", false);
		 $('#fdiv').html('<font color=#e74292><b><i>Total Space: '+totalspace+"<br>Available Space: "+avl_space+"<br>"+"Total Vehicle: "+tv+"</i></b></font>");
		 }
			}
	});

	});



});
