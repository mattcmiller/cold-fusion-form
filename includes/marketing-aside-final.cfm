
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

<h4>Pieces Ordered</h4>

<div class="alert alert-info">
	
	<ol class="aside-list">
		<cfoutput query="pmgOrderList">
			<cfquery name="pmgTypeList" datasource="Pearl_Internal_Web">
			SELECT *
			FROM dbo.PMGjobRequestProjectTypeList
			WHERE id = '#pmgOrderList.subType#'
			</cfquery>
	 	
			<li>#pmgTypeList.subType#</li>
	
		</cfoutput> 
	</ol>
</div>


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
