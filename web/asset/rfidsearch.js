$('document').ready(function(){

		$('#btn').click(function(){
			$.getJSON('FetchVehicalByRFID', {ajax:true, rfid:$("#rfid").val()}, function(data){
				console.log(data);
				if(data.length==0){
					$('#rfiddiv').html('<b><i><font color=red>Vehicale Not Found</font></i></b>');
					
				}else{
				today = new Date();
				cd = today.getFullYear()+"/"+(today.getMonth()+1)+"/"+today.getDate();
				ct = today.getHours()+":"+today.getMinutes()+":"+today.getSeconds();
				$('#rfiddiv').html("<font face='impact' ><h3>Employee: "+data[0].EMPLOYEEID+"</h3></font>" +
						"<br><hr><table align='center' border=true> "+
"	<tr><th>Status</th>"+
//"	<th>Vehical Id</th>"+
"	<th>Registration No</th>"+
"	<th>RFID</th>"+
"	<th>Date Entered</th>"+
"	<th>Time Entered</th>"+
"	<th>Floor</th>"+
"	<th>Amount</th>"+
"	<th>Mobile No.</th>"+
"	</tr>"+
"	<tr><td>"+data[0].STATUS+"</td>"+
//"		<td>"+data[0].VEHICALID+"</td>"+
"		<td>"+data[0].REGISTRATION+"</td>"+
"		<td>"+data[0].RFID+"</td>"+
"		<td>"+data[0].CURRENTDATE+"</td>"+
"		<td>"+data[0].CURRENTTIME+"</td>"+
"		<td>"+data[0].FLOORNAME+"</td>"+
"		<td>"+data[0].AMOUNT+"</td>"+
"		<td>"+data[0].MOBILENO+"</td>"+
"	</tr>"+
"</table> <form action='ExitVehicalServlet'><input type='hidden' value='"+data[0].VEHICALID+"' name='vid'>" +
		"<table width=80%><tr><td><b><i>Exit Date: </b></i></td><td><input type=text name='exitdate' value='"+cd+"' readonly></td><td><b><i>Exit time: </td><td><input type=text name=exittime value='"+ct+"' readonly></td></tr></table>" +
		"<input type='submit' value='Confirm Exit'></form>");
				}
			});
	});
	
});