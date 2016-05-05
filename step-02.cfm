<cfinclude template="includes/header.cfm">	
	<cfif session.ID EQ ''>
		<cflocation url="index.cfm" addToken="no">
	</cfif>
	
	<cfquery name="pmgOrderList" datasource="Pearl_Internal_Web">
	SELECT *
	FROM dbo.PMGjobRequestMarketingPieces
	WHERE jobID = '#session.ID#'
	ORDER BY id ASC
	</cfquery>


	<cfquery name="pmgRequestList" datasource="Pearl_Internal_Web">
	SELECT *
	FROM dbo.PMGjobRequest
	WHERE ID = '#session.ID#'
	</cfquery>
	
	<cfquery name="pmgAccountingCode" datasource="Pearl_Internal_Web">
	SELECT *
	FROM dbo.PMGjobRequestAccountingCode
	ORDER by id ASC
	</cfquery>
	
	<cfquery name="pmgAccountingCodeProductLine" datasource="Pearl_Internal_Web">
	SELECT *
	FROM dbo.PMGjobRequestAccountingProductLine
	ORDER by id ASC
	</cfquery>
	

<!---
<cfquery name="pmgOrderList" datasource="Pearl_Internal_Web">
SELECT *
FROM dbo.pmgOrders
WHERE jobNumber = recordID
ORDER BY ID DESC 
</cfquery> --->


<cfquery name="pmgOrderListItem" datasource="Pearl_Internal_Web">
SELECT *
FROM dbo.PMGjobRequestMarketingPieces 
WHERE id = '#url.recordID#' 
</cfquery>

<cfquery name="pmgPrintItems" datasource="Pearl_Internal_Web">
SELECT *
FROM dbo.PMGjobRequestProjectTypeList
WHERE type = 'print' AND active = '1' 
</cfquery>


<cfquery name="pmgWebItems" datasource="Pearl_Internal_Web">
SELECT *
FROM dbo.PMGjobRequestProjectTypeList
WHERE type = 'web' AND active = '1' 
</cfquery>



<cfset session.progress = "50">	

	
 <!---INCLUDE BODY TOP HTML--->
<cfinclude template="includes/bodyTop.cfm">
	<div class="row">
	<div class="col-sm-12 col-xs-12">    
		
			<div class="row">
				<div class="col-sm-9">	
<cfif pmgOrderList.RecordCount EQ '0'>
	<p>You may request multiple items (i.e. landing page, email, presentation, etc.) for your project. After inserting your first item's details and selecting the <em>Add Item</em> button, you will be prompted to add another item or continue to the next step. The form below will need to be completed for each separate item. </p>

		<p>You may delete a request after adding an item to your order by using the sidebar to the right, labeled <em>Items Ordered</em>.</p>
	</cfif>
	<cfif url.success EQ 3>
		<div class="alert alert-success">
			<h2>Check Out Now or Add Another Item Below</h2>
			<p><strong>Your marketing item has been added to your cart!</strong></p> 
			
		
			
			<cfoutput query="pmgRequestList">
			<cfquery name="pmgTypeList" datasource="Pearl_Internal_Web">
			SELECT *
			FROM dbo.PMGjobRequestCompanyList
			WHERE id = '#pmgRequestList.client#'
			</cfquery>
			
			<p>You may add another item for the <strong>#pmgRequestList.jobTitle#</strong> project below.
			</cfoutput>
			
			<p><a href="#" class="btn btn-warning">Add Another Item &#x25BC;</a></p>
			
			<p>If not you can finalize this project by clicking <em>Check Out</em>. </p>
			<cfif pmgOrderList.RecordCount NEQ '0'>
				<p><a href="step-03.cfm" class="btn btn-success">Check Out With Your <cfoutput>#pmgOrderList.RecordCount#</cfoutput> <cfif pmgOrderList.RecordCount EQ 1>Item<cfelse>Items</cfif> &raquo; </a></p>
		
			</cfif>
			
		
		</div>
	<div class="alert alert-danger">
		<p>If you need to enter another separate project you may do so after completing this project on the next step.</p>
	</div>
	</cfif>	
				
			<cfinclude template="includes/marketing-piece.cfm">
				

    </div><!--/span-->

	<div class="col-sm-3">
		<aside>
			<cfinclude template="includes/marketing-aside.cfm">
  		</aside>
</div><!--/row-->

</div></div>

	
	<!---INCLUDE FOOTER INCLUDE--->
	<cfinclude template="includes/footer.cfm">

  </body>
</html>


<!---reset number at 1st of year

YYNNNN  year two digits and then increment job number up to four digits--->

<script src="../bootstrap3/js/bootstrap.min.js"></script>
<script src="../bootstrap3/js/moment.js"></script>
<script src="../bootstrap3/js/bootstrap-datetimepicker.min.js"></script>

<script type="text/javascript">
var dateby = 28; 
var dateLimit = moment().format('l');
var startDate = moment().add('days', dateby).format('l');

$(function () {
	$('input[type="datetime"]').datetimepicker({
		pickTime: false,
		daysOfWeekDisabled: [0,6],
		useStrict: true,
		showToday: true,
		minDate: dateLimit,
		format: 'MM/DD/YYYY',
		defaultDate: startDate
	});

});

function isNumberKey(evt)
  {
     var charCode = (evt.which) ? evt.which : event.keyCode
     if (charCode > 31 && (charCode < 47 || charCode > 57) ){
			return false;
		}
		
     return true;
  }



$( document ).ready(function() {
	
	$('.btn-warning').click(function(){
		$('.piece').toggleClass('hidden');
	});
			
	var date2 = moment().format('L');
	var date3 = moment().add('days', 14).calendar();

	/*
	for(var i = 0; i < 15; i++) {
		var date5 = moment().add('days', i).format('D');


		$('.day').filter(function() {
		   return $(this).text() == date5;
		}).addClass('alert-warning');
	$('.day').addClass('alert-warning');
	}*/
	
	
	
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
	
	
	$('input[name=sourceCheck]').click(function() {
			if ($('#inputSourceCheck').is(':checked')) {
				$('.source-bool').show();
			}
			else {
				$('.source-bool').hide();
			}
	});
	
	$('input[name=sourceRequest]').click(function() {
	    if (this.id == "sourceTrue") {
			$(".sourceCode-input").show();
		}
		else {
			$(".sourceCode-input").hide();
		}
	});
	
	
	
	$('input[name=listCheck]').click(function() {
			if ($('#inputListCheck').is(':checked')) {
				$('.list-bool').show();
			}
			else {
				$('.list-bool').hide();
			}
	});
	
	$('input[name=listRequest]').click(function() {
	    if (this.id == "listTrue") {
			$(".list-input").show();
		}
		else {
			$(".list-input").hide();
		}
	});
	
	$("[required]").parent().parent().find(".control-label").append("<i class='icon-asterisk'>*</i> ");
	$("[required]").parent().parent().find(".control-label").addClass("required");
	
	$("#inputBudget[required]" ).parent().parent().parent().find(".control-label").append("<i class='icon-asterisk'>*</i> ");
	$("#inputBudget[required]" ).parent().parent().parent().find(".control-label").addClass("required");
	
	$('input[name=detailsRadios]').parent().parent().parent().parent().parent().parent().find(".control-label").append("<i class='icon-asterisk'>*</i> ");
	$('input[name=detailsRadios]').parent().parent().parent().parent().parent().parent().find(".control-label").addClass("required");
	
	
	$('input[name=detailsRadios]').click(function() {
	    if (this.id == "print") {
			$(".print").show();
			$("#inputPrintType").prop('required',true);
			$(".print-choices label").append("<i class='icon-asterisk'>*</i> ");
			$(".print-choices label").addClass("required");
			
			$(".web").hide();
			$("#inputWebType").prop('required',false);
			$(".web-choices label .icon-asterisk").remove();	
			$(".web-choices label").removeClass("required");
			
			$('.budget').show();
				$('.is-mailing').hide();
	    }
		if (this.id == "web") {
			$('.web').show();
			$("#inputWebType").prop('required',true);
			$(".web-choices label").append("<i class='icon-asterisk'>*</i> ");
			$(".web-choices label").addClass("required");
			
			$(".print").hide();
			$("#inputPrintType").prop('required',false);
			$(".print-choices label .icon-asterisk").remove();
			$(".print-choices label").removeClass("required");			
		
			$('.budget').hide();
				$('.is-mailing').hide();
	    }
		
		
	});
	
	
	$('select[name="typePrint"]').change(function(){
		var pmgCheck = $('select[name="typePrint"] option:selected').val();
		$('.is-mailing').hide();

		if ( pmgCheck == "1") {
			$('.is-mailing').show();
			var startDate = moment().add('days', 164).format('l');
			$('input[type="datetime"]').datetimepicker({
				defaultDate: startDate
			});
		}

		
	
	});
	
	
	$('input[name=printingOption]').click(function() {
		$(".print").show();
		$('.print-choices').show;
	});
	
	$('input[name=printingOption]').click(function() {
		$(".print").show();
		$('.print-choices').show;
	});
	


	$('[data-toggle="tooltip"]').tooltip();
	$('[data-toggle="popover"]').popover();
	
	
	
	});

	
</script>