<cfquery name="pmgRequestList" datasource="Pearl_Internal_Web">
SELECT *
FROM dbo.PMGjobRequest
WHERE ID = '#session.ID#'
</cfquery>


<cfquery name="pmgOrderList" datasource="Pearl_Internal_Web">
SELECT *
FROM dbo.PMGjobRequestMarketingPieces
WHERE jobID = '#session.ID#'
ORDER BY id ASC
</cfquery>



	<h3>Your 
		<cfoutput query="pmgRequestList">
			<cfquery name="pmgTypeList" datasource="Pearl_Internal_Web">
			SELECT *
			FROM dbo.PMGjobRequestCompanyList
			WHERE id = '#pmgRequestList.client#'
			</cfquery>

		 #pmgTypeList.title# <cfif #pmgTypeList.subtitle# NEQ ""> : #pmgTypeList.subTitle# 	</cfif>
		 Project Request
		</h3>
		
		<h5>## #pmgRequestList.jobNumber# &mdash; #pmgRequestList.jobTitle# <span class="pull-right">Final Due: <strong> #DateFormat(pmgRequestList.jobFinalDueDate, "mm/dd/yyyy")#</strong></span> </h5>

		<hr>
		<h4>Contact &amp; Information</h4>
		<dl class="dl-horizontal reciept">
			<dt>Requested by:</dt>
			<dd>#pmgRequestList.jobContact#<br> <a href="mailto:#pmgRequestList.jobContactEmail#">#pmgRequestList.jobContactEmail#</a></dd>
			<!---
			<dt>Detail:</dt>
			<dd class="capitalize">#pmgRequestList.jobTotalDetails#</dd>
			--->
			
			<dt>Target Audience:</dt>
			<dd>#pmgRequestList.targetAudience#</dd>

			<dt>Goal:</dt>
			<dd>#pmgRequestList.jobGoal#</dd>
			
			<dt>Type:</dt>
			<dd class="capitalize">#pmgRequestList.jobType#</dd>

			<dt>Approved by Manager:</dt>
			<dd>#pmgRequestList.managerApproval#</dd>

			<dt>Manager:</dt>
			<dd><a href="mailto:#pmgRequestList.managerName#">#pmgRequestList.managerName#</a></dd>
			
			<dt>Type:</dt>
			<dd class="capitalize">#pmgRequestList.jobType#</dd>
		
			<cfif pmgRequestList.jobType NEQ 'new' >
			<dt>Prior Job Number:</dt>
			<dd><cfif pmgRequestList.priorJobNumber NEQ ''>#pmgRequestList.priorJobNumber#<cfelse>None</cfif></dd>
			
		
			<dt>Prior Contact Person:</dt>
			<dd><cfif pmgRequestList.priorPMGpoint NEQ ''>#pmgRequestList.priorPMGpoint#<cfelse>None</cfif></dd>
				
			</cfif>
			
			
	
			<dt>Agreed to PMG:</dt>
			<dd><cfif pmgRequestList.agreeToTerms EQ 1>Yes, I agreed to PMG's Terms<cfelse>Nope.</cfif></dd>
		</dl>	
		
	
		</cfoutput>
		<h4>Item Details</h4>
		<div class="row">
		<cfoutput query="pmgOrderList">
			<cfquery name="pmgTypeList" datasource="Pearl_Internal_Web">
			SELECT *
			FROM dbo.PMGjobRequestProjectTypeList
			WHERE id = '#pmgOrderList.subType#'
			</cfquery>
			<div class="col-sm-6">
			<div class="well well-sm">
			<h6 class="capitalize">#pmgOrderList.Type# Job:  #pmgTypeList.subType#</h6>
			
				<ul>
				 <li>Due On: #LSDateFormat(pmgOrderList.dueDate, "mm/dd/yyyy")#</li>
				<li>Details: #pmgOrderList.details#</li>
				<li>Budget: #pmgOrderList.budget#</li>
				<li>Approvals: #pmgOrderList.approvals#</li>
				<cfif pmgOrderList.Type EQ 'web'>
					<li>URL: #pmgOrderList.url#</li>
				</cfif>
				<cfif pmgOrderList.Type EQ 'print'>
					<li class="capitalize">Printing: #pmgOrderList.printing#</li>
				</cfif>
				
				<li>SourceCode: 
					<!---<cfif pmgOrderList.sourceCheck NEQ ''>
						<cfif pmgOrderList.sourceCode NEQ ''>
							#pmgOrderList.sourceCode#
						<cfelse>
							<em>Needs to be Added</em>
						</cfif>
					<cfelse>
						Not Required
					</cfif> --->
					</li>

				<li>List: 
					<!---><cfif pmgOrderList.listCheck NEQ ''>
						<cfif pmgOrderList.listCheck EQ '1'>
							<cfif pmgOrderList.listName NEQ ''>
								#pmgOrderList.listName#
							<cfelse>
								<em>Needs to be Added</em>
							</cfif>
						<cfelse>
							<em>Needs to be Requested</em>
						</cfif>
					<cfelse>
						Not Required
					</cfif>--->
					</li>
				</ul>
			</div>
			</div>
		</cfoutput> 
		</div>
	

</div>