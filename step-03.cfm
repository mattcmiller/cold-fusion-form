
<cfquery name="latestDueDate" datasource="Pearl_Internal_Web">
SELECT TOP 1 dueDate
FROM dbo.PMGjobRequestMarketingPieces
WHERE jobID = '#session.ID#'
ORDER by dueDate DESC
</cfquery>

<cfquery name="pmgYearSelect" datasource="Pearl_Internal_Web">
SELECT *
FROM dbo.PMGjobRequestYearSelect
WHERE active = '1'
ORDER BY ID ASC
</cfquery>


<cfset dateLimit = #LSDateFormat(latestDueDate.dueDate, 'mm/dd/yyyy')#>

<cfinclude template="includes/header.cfm">
	<cfif session.ID EQ ''>
		<cflocation url="index.cfm" addToken="no">
	</cfif>
<cfset session.progress = "75">		
	
 <!---INCLUDE BODY TOP HTML--->
<cfinclude template="includes/bodyTop.cfm">
	<div class="row">
	<div class="col-sm-12 col-xs-12">    
			
			
			
		<cfinclude template="includes/marketing-finalForm.cfm">
			
			
	
    </div><!--/span-->


</div><!--/row-->



	
	<!---INCLUDE FOOTER INCLUDE--->
	<cfinclude template="includes/footer.cfm">

  </body>
</html>


<!---reset number at 1st of year

YYNNNN  year two digits and then increment job number up to four digits--->

<script src="../bootstrap3/js/bootstrap.min.js"></script>
<script src="../bootstrap3/js/moment.js"></script>
<script src="../bootstrap3/js/bootstrap-datetimepicker.min.js"></script>


<!-- The jQuery UI widget factory, can be omitted if jQuery UI is already included -->
<script src="../bootstrap3/js/vendor/jquery.ui.widget.js"></script>
<!-- The Load Image plugin is included for the preview images and image resizing functionality -->
<script src="http://blueimp.github.io/JavaScript-Load-Image/js/load-image.min.js"></script>
<!-- The Canvas to Blob plugin is included for image resizing functionality -->
<script src="http://blueimp.github.io/JavaScript-Canvas-to-Blob/js/canvas-to-blob.min.js"></script>
<!-- The Iframe Transport is required for browsers without support for XHR file uploads -->
<script src="../bootstrap3/js/jquery.iframe-transport.js"></script>
<!-- The basic File Upload plugin -->
<script src="../bootstrap3/js/jquery.fileupload.js"></script>
<!-- The File Upload processing plugin -->
<script src="../bootstrap3/js/jquery.fileupload-process.js"></script>
<!-- The File Upload image preview & resize plugin -->
<script src="../bootstrap3/js/jquery.fileupload-image.js"></script>
<!-- The File Upload validation plugin -->
<script src="../bootstrap3/js/jquery.fileupload-validate.js"></script>

<script src="https://api.trello.com/1/client.js?key=b8648e40362f05ff091b5fd8bd35066f"></script>

<script type="text/javascript">

function isNumberKey(evt)
  {
     var charCode = (evt.which) ? evt.which : event.keyCode
     if (charCode > 31 && (charCode < 47 || charCode > 57) ){
			return false;
		}
		
     return true;
  }


/*  TO OLD PMG BOARD * 515718d88e744441310017c2*  */

$("[required]" ).parent().parent().find(".control-label").append("<i class='icon-asterisk'>*</i> ");
$("[required]").parent().parent().find(".control-label").addClass("required");

$("#agreeToTerms[required]" ).parent().parent().parent().parent().find(".control-label").append("<i class='icon-asterisk'>*</i> ");
$("#agreeToTerms[required]" ).parent().parent().parent().parent().find(".control-label").addClass("required");

var onAuthorize = function() {
    updateLoggedIn();
    $("#output").empty();
	var token = Trello.token();
    
    Trello.members.get("me", function(member){
        $("#fullName").text(member.fullName);
    
        var $boards = $("<div class='row'>").text("Loading Members...").appendTo("#output");	
    	var $boards2 = $("#output2");
  		var $boards3 = $("#output3");

		    // Output checkboxes of all PMG Staff Members
		    Trello.get("boards/54946b573211f2755865a768/members", function(x) {
		       $boards.empty();
		       $.each(x, function(ix, y) {
					var pmgCheck = $("<label>").addClass("checkbox-inline").text(y.fullName);
					var pmgCheckbox = $("<input type='checkbox' name='trelloMember'>").val(y.id);
					$(pmgCheck).prepend(pmgCheckbox);
					var pmgCheckContainer = $("<div>").addClass("checkbox trello-members").append(pmgCheck);
					pmgCheck = $("<div>").addClass("col-sm-4 col-xs-6").append(pmgCheckContainer);
					$(pmgCheck).appendTo($boards); 
					});
		
        		});


			 /* Output checkboxes of all PMG Colored Labels	*/
			    Trello.get("boards/54946b573211f2755865a768/labelNames", function(x) {
			       $boards2.empty();
			       $.each(x, function(ix, y) {
						var pmgCheck =  $("<label>").addClass("text").addClass("checkbox-inline").text(y);
						var pmgCheckbox = $("<input type='radio' name='trelloLabel'>").val(ix);
						$(pmgCheck).prepend(pmgCheckbox);
						var pmgCheckContainer = $("<div>").addClass("radio trello-labels");
						$(pmgCheckContainer).append(pmgCheck);
						pmgCheck = $("<div>").addClass("col-sm-4 col-xs-6 labels " + ix);
						$(pmgCheck).append(pmgCheckContainer);
						$(pmgCheck).appendTo($boards2); 

					});

	        	});
	

	
		/* 	Output checkboxes of all PMG Labels 
			    Trello.get("boards/54946b573211f2755865a768/labels", function(x) {
			       $boards2.empty();
			       $.each(x, function(ix, y) {
						var pmgCheck =  $("<label>").addClass("text").addClass("checkbox-inline").text(y.name);
						var pmgCheckbox = $("<input type='checkbox' name='trelloLabel'>").val(ix);
						
						$(pmgCheck).prepend(pmgCheckbox);
						
						var pmgCheckContainer = $("<div>").addClass("checkbox trello-labels").append(pmgCheck);
						pmgCheck = $("<div>").addClass("col-sm-4 col-xs-6 labels " + y.color).append(pmgCheckContainer);
						
						$(pmgCheck).appendTo($boards2); 

					});

		    	});

	*/

			    //  Output checkboxes of all PMG Lists
			    Trello.get("boards/54946b573211f2755865a768/lists", function(x) {
			       $boards3.empty();
			       $.each(x, function(ix, y) {
						var pmgCheck = $("<label>").addClass("radio-inline").text(y.name);
						var pmgCheckbox = $("<input type='radio' name='trelloList'>").val(y.id);
						$(pmgCheck).prepend(pmgCheckbox);
						var pmgCheckContainer = $("<div>").addClass("checkbox trello-lists").append(pmgCheck);
						pmgCheck = $("<div>").addClass("col-xs-6").append(pmgCheckContainer);
						$(pmgCheck).appendTo($boards3); 

						});

	        		});

    });

};

var updateLoggedIn = function() {
    var isLoggedIn = Trello.authorized();
    $("#loggedout").toggle(!isLoggedIn);
    $("#loggedin").toggle(isLoggedIn);        
};
    
var logout = function() {
    Trello.deauthorize();
    updateLoggedIn();
};
                          
Trello.authorize({
	name: "PMG Marketing Form",
    interactive:false,
	scope: { write: true, read: true, account: true },
    success: onAuthorize
});

$("#connectLink")
.click(function(){
    Trello.authorize({
		name: "PMG Marketing Form",
		scope: { write: true, read: true, account: true },
        type: "popup",
        success: onAuthorize
    })
});
    
$("#disconnect").click(logout);

$(function () {
	$('input[type="datetime"]').datetimepicker({
		pickTime: false,
		daysOfWeekDisabled: [0,6],
		useStrict: true,
		minDate: '<cfoutput>#dateLimit#</cfoutput>'
		
	});

});

	$( document ).ready(function() {
			
	var date2 = moment().format('L');
	var date3 = moment().add('days', 14).calendar();

	
	$('input[type="datetime"]').change(function(){
		var pmgCheck = $(this).val();
		if ( pmgCheck < date3) {
			$('.time-span').show();
		}
		else if ( pmgCheck == date2 ) {
			$('.time-span').show();
		}
		else {
			$('.time-span').hide();
		}
	});

	$('[data-toggle="tooltip"]').tooltip();
	$('[data-toggle="popover"]').popover();
	
	});

	
</script>