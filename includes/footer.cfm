<hr>

  <footer>
	<div class="row">
	<div class="col-xs-12">
		<div class="wrap">
	<!---	<p>SessionID: <cfoutput>#session.ID#</cfoutput></p> 
		<p>Session Iframe: <cfoutput>#session.iframe#</cfoutput></p> 
		<p>Session pm: <cfoutput>#session.pm#</cfoutput></p> --->
    	<p>&copy; Pearl Insurance <cfoutput>#LSDateFormat(now(), 'YYYY')#</cfoutput></p>
		</div>
	</div>
	</div>
  </footer>


<script>
	var doc = document.documentElement;
	doc.setAttribute('data-useragent', navigator.userAgent);
</script>