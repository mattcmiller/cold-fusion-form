
<cfinclude template="includes/header.cfm">
	
<cfif url.pm NEQ ''>
	<cfset session.pm = 1>
</cfif>

<cfif url.iframe NEQ ''>
	<cfset session.ifram = 1>
</cfif>
	

<cfquery name="pmgCompanies" datasource="Pearl_Internal_Web">
SELECT *
FROM dbo.PMGjobRequestCompanyList
WHERE subTitle IS NULL
ORDER BY title ASC
</cfquery>

<cfquery name="pmgAffinity" datasource="Pearl_Internal_Web">
SELECT *
FROM dbo.PMGjobRequestCompanyList
WHERE title = 'Pearl Affinity' AND subTitle IS NOT NULL 
ORDER BY subTitle ASC
</cfquery>

<cfquery name="pmgBusiness" datasource="Pearl_Internal_Web">
SELECT *
FROM dbo.PMGjobRequestCompanyList
WHERE title = 'Pearl Business Insurance' AND subTitle IS NOT NULL 
ORDER BY subTitle ASC
</cfquery>

<cfquery name="pmgAuto" datasource="Pearl_Internal_Web">
SELECT *
FROM dbo.PMGjobRequestCompanyList
WHERE title = 'Pearl Automotive' AND subTitle IS NOT NULL 
ORDER BY subTitle ASC
</cfquery>

<cfquery name="status" datasource="Pearl_Internal_Web">
SELECT *
FROM dbo.PMGjobRequest
</cfquery>

<cfset session.progress = "25">	
	
 <!---INCLUDE BODY TOP HTML--->
<cfinclude template="includes/bodyTop.cfm">
	
	<div class="row">
	<div class="col-sm-12 col-xs-12">    
		
		<cfdump var="#status#">

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

<script type="text/javascript">


	$( document ).ready(function() {
				
	$(function () {
		$('input[type="datetime"]').datetimepicker({
			pickTime: false,
			daysOfWeekDisabled: [0,6],
			useStrict: true
		});

	});
	$("[required]" ).parent().parent().find(".control-label").append("<i class='icon-asterisk'>*</i> ");
	
	$('select[name="companyOptions"]').change(function(){
		var str = "";
		    $( "select[name='companyOptions'] option:selected" ).each(function() {
		    str = $(this).val();

			if ( str == "7") {
				$('.affinity-select').show();
				$('#inputClient').prop('required',true);
			}
			else {
				$('.affinity-select').hide();
				$('#inputClient').prop('required',false);
			}
			
			if ( str == "5") {
				$('.business-select').show();
				$('#inputBusiness').prop('required',true);
			}
			else {
				$('.business-select').hide();
				$('#inputBusiness').prop('required',false);
			}
			
			
			if ( str == "2") {
				$('.auto-select').show();
				$('#inputAuto').prop('required',true);
			}
			else {
				$('.auto-select').hide();
				$('#inputAuto').prop('required',false);
			}
		    });
		
		
	});
	
	/*
	$('.trigger').click(function() {
      $('.additional-question').hide();
      $('.' + $(this).data('rel')).show();
  	});*/




	$('input[name=newOptions]').click(function () {
	    if (this.id == "newTrue") {
	        $(".job-number").show();
			$(".point-person-bool").show();
	    }
	
	    if (this.id == "newFalse") {
	        $(".job-number").hide();
			$(".point-person-bool").hide();
	    }

	});
	
	
	
	$('input[name=pmgOptions]').click(function () {
	    if (this.id == "pastTrue") {
			$(".pmg-point").show();
	    }
		if (this.id == "pastFalse") {
			$(".pmg-point").hide();
	    }
	});
	
	
	$('.trigger').click(function () {
		$('.subquestion').hide();
		
	   	if (this.id == "newRadio") {
			$(".based-on-bool").show();
	    }
		else {
			$(".based-on-bool").hide();
		}
		
		if (this.id == "revisionRadio") {
			$(".job-number").show();
	    }
		else {
			$(".job-number").hide();
		}
		
		if (this.id == "unknownRadio") {
			$(".point-person-bool").show();
	    }
		else {
			$(".point-person-bool").hide();
		}

	});
	

	

	$('[data-toggle="tooltip"]').tooltip();
	$('[data-toggle="popover"]').popover();
	
	});

	
</script>