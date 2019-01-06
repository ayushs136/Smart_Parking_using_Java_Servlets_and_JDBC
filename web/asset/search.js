$('document').ready(function () {
    $('#btn').click(function () {

        $('#rfiddiv').empty();
        $.getJSON('VehicalByEmployeeJSON', {
            ajax: true,
            eid: $('#eid').val(),
            d1: $('#d1').val(),
            d2: $('#d2').val()
        }, function (data) {
            console.log(data);
            $.each(data, function (i) {

                $('#rfiddiv').append("<br><br><table align='center' border=true>" +
                    " <tr><th>Status</th>" +
                    "	<th>Vehical Id</th>" +
                    "	<th>Registration No</th>" +
                    "	<th>RFID</th>" +
                    "	<th>Date Entered</th>" +
                    "	<th>Time Entered</th>" +
                    "	<th>Floor</th>" +
                    "	<th>Amount</th>" +
                    "	<th>Mobile No.</th>" +
                    "	</tr><tr><td>" + data[i].STATUS + "</td>" +
                    "		<td>" + data[i].VEHICALID + "</td>" +
                    "		<td>" + data[i].REGISTRATION + "</td>" +
                    "		<td>" + data[i].RFID + "</td>" +
                    "		<td>" + data[i].CURRENTDATE + "</td>" +
                    "		<td>" + data[i].CURRENTTIME + "</td>" +
                    "		<td>" + data[i].FLOORNAME + "</td>" +
                    "		<td>" + data[i].AMOUNT + "</td>" +
                    "		<td>" + data[i].MOBILENO + "</td>" +
                    "	</tr>" +
                    "</table>");

            });
        });
    });
});