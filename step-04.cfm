
<cfinclude template="includes/header.cfm">
	
<cfset session.progress = "100">		
	
 <!---INCLUDE BODY TOP HTML--->
<cfinclude template="includes/bodyTop.cfm">
	<div class="row">
	<div class="col-sm-9 col-xs-12">    

		
			<h2>Great Success!</h2>
			<p class="lead">Your project request has been successfully submitted to Pearl Marketing Group for review. You will be receiving an email confirming your submission. Your project will be assigned and a member of our team will be contacting you. </p>
			<p><A HREF="javascript:window.print()" class="btn-default btn">Click to Print This Page</A></p>
			
	</div>	
	<div class="col-sm-3 col-xs-12">
		<h4>Ready to fill out another?</h4>
			<p><a href="http://test.pearlinsurance.com/web-project-request/index.cfm?pm=<cfoutput>#session.pm#</cfoutput>" class="btn btn-primary">Click Here to Start Again</a></p>
		</div>
		</div>	
		
		<div class="row">
		<div class="col-sm-12 col-xs-12">
			<cfinclude template="includes/marketing-summary.cfm">
	

    </div><!--/span-->


</div><!--/row-->



	
	<!---INCLUDE FOOTER INCLUDE--->
	<cfinclude template="includes/footer.cfm">

  </body>
</html>

<cfset session.pm = ''>
	<cfset session.ID = ''>
<!---reset number at 1st of year




YYNNNN  year two digits and then increment job number up to four digits--->

<script src="../bootstrap3/js/bootstrap.min.js"></script>



