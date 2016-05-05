
  <cfquery name="pmgRemovePiece" datasource="Pearl_Internal_Web">
  DELETE
  FROM dbo.PMGjobRequestMarketingPieces 
  WHERE ID = '#URL.recordID#'
  </cfquery>

<!---
	<cfif isdefined('url.iframe') AND #url.iframe# EQ "1">
		<cflocation url="../step-02.cfm?success=2&iframe=1" addtoken="no">
	<cfelseif  isdefined('url.pm') AND #url.pm EQ# "1">
		<cflocation url="../step-02.cfm?success=2&pm=1" addtoken="no">
	<cfelseif  isdefined('url.iframe') AND  isdefined('url.pm') AND #url.iframe# EQ "1" AND #url.pm# EQ "1">
			<cflocation url="../step-02.cfm?success=2&pm=1&iframe=1" addtoken="no">
	<cfelse>
  		<cflocation url="../step-02.cfm?success=2" addtoken="no">
	</cfif>
		
		--->
	
			
			<cfif  isdefined('url.iframe') AND  isdefined('url.pm')  AND 'url.iframe' NEQ '' AND 'url.pm' NEQ ''>
				<cflocation url="../step-02.cfm?success=2&pm=#url.pm#&iframe=#url.iframe#" addtoken="no">		
			<cfelseif isdefined('url.iframe')  AND 'url.iframe' NEQ ''>
				<cflocation url="../step-02.cfm?success=2&iframe=#url.iframe#" addtoken="no">
			<cfelseif  isdefined('url.pm')  AND 'url.pm' NEQ ''>
				<cflocation url="../step-02.cfm?success=2&pm=#url.pm#" addtoken="no">
			<cfelse>
		  		<cflocation url="../step-02.cfm?success=2" addtoken="no">
			</cfif>