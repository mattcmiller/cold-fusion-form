
<h4>Your Cart<cfif pmgOrderList.RecordCount NEQ '0'><span class="badge pull-right"><cfoutput>#pmgOrderList.RecordCount#</cfoutput></span></cfif></h4> 

<cfif pmgOrderList.RecordCount EQ '0'>
	<div class="alert alert-warning"><p>No Items Added.</p></div>
<cfelse>

<div class="alert alert-info">
	
<ol class="aside-list">

<cfif url.success EQ 2><div class="alert alert-warning"><p>Piece has been deleted!</p></div></cfif>	
	
<cfoutput query="pmgOrderList">
	<cfquery name="pmgTypeList" datasource="Pearl_Internal_Web">
	SELECT *
	FROM dbo.PMGjobRequestProjectTypeList
	WHERE id = '#pmgOrderList.subType#'
	</cfquery>
	 	
	<li>
		#pmgTypeList.subType#
		<input  type="hidden" name="recordID#ID#" value="#ID#">	
		<!---	<a class="btn btn-warning btn-sm" href="step-02.cfm?recordID=#ID#&pm=#url.pm#&iframe=#url.iframe#" onclick="javascript: return confirm('Are you sure you want to edit this request?');">Edit</a> --->
				<a class="btn btn-danger btn-sm pull-right" href="actions/request-removal-02.cfm?recordID=#ID#" onclick="javascript: return confirm('Are you sure you want to delete this request?');">Delete</a>
	</li>
	
</cfoutput> 
</ol>
<hr>

<p>You have <strong><cfoutput>#pmgOrderList.RecordCount#</cfoutput></strong> <cfif pmgOrderList.RecordCount EQ 1>item<cfelse>items</cfif>!</p>
<cfif pmgOrderList.RecordCount NEQ '0'>
	<a href="step-03.cfm" class="btn btn-success">Check Out &raquo; </a>
</cfif>

</div>
</cfif>


<h4>Project Summary</h4>

<div class="well ">
	<dl class="aside-dl">
	<cfoutput query="pmgRequestList">
	<cfquery name="pmgTypeList" datasource="Pearl_Internal_Web">
	SELECT *
	FROM dbo.PMGjobRequestCompanyList
	WHERE id = '#pmgRequestList.client#'
	</cfquery>
	
	<dt>Company:</dt>
	<dd>#pmgTypeList.title#</dd>
		
	<cfif #pmgTypeList.subtitle# NEQ "">
		<dt>Client:</dt>
		<dd>#pmgTypeList.subTitle#</dd>
		
	</cfif>
	
	<dt>Project Name:</dt>
	<dd>#pmgRequestList.jobTitle#</dd>

	<dt>Requested By:</dt>
	<dd>#pmgRequestList.jobContact#</dd>

	<dt>Contact Email:</dt>
	<dd ><a href="mailto:#pmgRequestList.jobContactEmail#" class="ellipsis" data-toggle="tooltip" data-placement="bottom" title="#pmgRequestList.jobContactEmail#">#pmgRequestList.jobContactEmail#</a></dd>

	</dl>
</cfoutput>	
</div>