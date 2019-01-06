$('document').ready(function () {
        $.getJSON("EmployeeIdJSON", {ajax:true}, function (data) {
        $.each(data, function(i, item){
                $('#eid').append($('<option>').text(item.EMPLOYEEID).val(item.EMPLOYEEID));
            });
        });
});