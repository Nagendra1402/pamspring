function deleteRow(r)
{
var i = r.parentNode.parentNode.rowIndex;
document.getElementById("projectable").deleteRow(i);
};

function Save(){
    var par = $(this).parent().parent(); //tr
    var tdProjectName = par.children("td:nth-child(1)");
    var tdDesc = par.children("td:nth-child(2)");
    var tdStartDate = par.children("td:nth-child(3)");
    var tdEndDate = par.children("td:nth-child(4)");
    var tdStatus = par.children("td:nth-child(5)");
	var tdEdit = par.children("td:nth-child(6)");
	
    var status= tdStatus.children("input[type=text]");

    tdProjectName.html(tdProjectName.children("input[type=text]").val());
    tdDesc.html(tdDesc.children("input[type=text]").val());
    tdStartDate.html(tdStartDate.children("input[type=text]").val());
    tdEndDate.html(tdEndDate.children("input[type=text]").val());
	tdStatus.html("<div class=progress id=progress><div class=bar role=progressbar aria-valuenow=60 aria-valuemin=0 aria-valuemax=100 style=width:"+ status.val() +"%;><div>"+ status.val()+"%</div></div><div>");
	tdEdit.html("<a href='#' onclick='EditRow(this)'><i class='icon-edit'></i>Edit</a><a href='#' onclick='deleteRow(this)' id='btnDelete'><i class='icon-trash'></i>Delete</a>");
    
};


function EditRow(t){
    var par = $(t).parent().parent(); //tr
    var tdProjectName = par.children("td:nth-child(1)");
    var tdDesc = par.children("td:nth-child(2)");
    var tdStartDate = par.children("td:nth-child(3)");
    var tdEndDate = par.children("td:nth-child(4)");
    var tdStatus = par.children("td:nth-child(5)");
	var tdEdit = par.children("td:nth-child(6)");
	
    tdProjectName.html("<input type='text' id='txtName' style=width:40% value='"+tdProjectName.html()+"'/>");
    tdDesc.html("<input type='text' id='txtDesc' value='"+tdDesc.html()+"'/>");
    tdStartDate.html("<input type='text' id='txtStartDate' style=width:40%  value='"+tdStartDate.html()+"'/>");
    tdEndDate.html("<input type='text' id='txtEndDate' style=width:40%  value='"+tdEndDate.html()+"'/>");
	tdStatus.html("<input type='text' id='txtStatus' style=width:10%  value=''/>");
	tdEdit.html("<a href='#' id='btnSave'><i class='icon-save'></i>save</a>");

	 $( "#txtStartDate" ).datepicker({
	    showButtonPanel: true,
        changeMonth: true,
        numberOfMonths: 1,
        onClose: function( selectedDate ) {
        $( "#txtEndDate" ).datepicker( "option", "minDate", selectedDate );
        }
       }).datepicker("setDate",new Date());
     $( "#txtEndDate" ).datepicker({
       defaultDate: "+1w",
       changeMonth: true,
       numberOfMonths: 1,
       onClose: function( selectedDate ) {
       $( "#txtStartDate" ).datepicker( "option", "maxDate", selectedDate );
      }
	  
   });
   
    $("#btnSave").bind("click", Save);
   };	


	$(function(){
	//Dialog Box
	 $("#newproject").dialog({ autoOpen: false,
	  position: "center",
	  title: 'Create New Project',
     height: 485,
	 width: 410,
	 
	 });

	 //Cancel Dialog box
   $("#cancel").click(function(){
    $('#newproject').dialog("close");
   });
   
     $("#ecancel").click(function(){
    $('#editproject').dialog("close");
   });

   //Open the Dialog box
$('#create').click(function() {
    $('#newproject').dialog('open');
	});

	//For Drop down list
	$('.selectpicker').selectpicker();
	
	//From and to date picker
	  $( "#startdate" ).datepicker({
	    showButtonPanel: true,
        defaultDate: "+1w",
        changeMonth: true,
        numberOfMonths: 1,
        onClose: function( selectedDate ) {
        $( "#enddate" ).datepicker( "option", "minDate", selectedDate );
        }
       }).datepicker("setDate",new Date());
     $( "#enddate" ).datepicker({
       defaultDate: "+1w",
       changeMonth: true,
       numberOfMonths: 1,
       onClose: function( selectedDate ) {
       $( "#startdate" ).datepicker( "option", "maxDate", selectedDate );
      }
	  
   });
   
   $(".ui-datepicker-current ui-state-default ui-priority-secondary ui-corner-all").click(function() {
   $(this).datepicker("hide"); 
   
   });
   //Appending the project details
   $("#projectbutton").click(function(){
    var status = $("#status");
   	$( "#projectable tbody" ).append( "<tr>" +
							"<td>" + $('#pname').val() + "</td>" +
							"<td>" + $('#pdesc').val() + "</td>" +
							"<td>" + $('#startdate').val() + "</td>" +
							"<td>" + $('#enddate').val() + "</td>" +
							"<td><div class=progress><div class=bar role=progressbar aria-valuenow=60 aria-valuemin=0 aria-valuemax=100 style=width:"+ status.val() +"%;><div>"+ status.val()+"%</div></div><div></td>" +
							"<td id=edit1><a href='#' onclick='EditRow(this)'><i class='icon-edit'></i>Edit</a><a href='#' onclick='deleteRow(this)' id='btnDelete'><i class='icon-trash'></i>Delete</a></td>"+
						"</tr>" );
						$('#newproject').dialog( "close" );
						document.getElementById('pname').value = '';
						document.getElementById('pdesc').value = '';
						document.getElementById('startdate').value = '';
						document.getElementById('enddate').value = '';
						document.getElementById('status').value = '';
			
			
   });

   $('#edit').click(function() {
    $('.editable').attr("contenteditable", "true");
});

	 $("#editproject").dialog({ autoOpen: false,
	  position: "center",
	  title: 'Edit Project',
     height: 250,
	 width: 360,
	 
	 });
	 $('#edit').click(function() {
    $('#editproject').dialog('open');
	});
	
	  /*  $("#projectable tr").click(function() {
        //change the background color to red before removing
        $(this).css("background-color","#FF3700");
         
        $(this).fadeOut(400, function(){
            $(this).remove();
        });
    });*/
$('#platforms').click(function(){
$("#menu").toggle();
});

});
