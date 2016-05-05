<cfquery name="pmgRequestList" datasource="Pearl_Internal_Web">
SELECT *
FROM dbo.PMGjobRequest
WHERE jobNumber IS NOT NULL
</cfquery>


<cfquery name="pmgOrderList" datasource="Pearl_Internal_Web">
SELECT *
FROM dbo.PMGjobRequestMarketingPieces
ORDER BY id ASC
</cfquery>


<div class="row">
	<div class="col-sm-offset-4 col-sm-4">
		<div id="loggedout">
    		<a id="connectLink" href="#" class="btn btn-success btn-block">Connect To Trello</a>
		</div>
	</div>
</div>

<div id="loggedin">		
    <div id="header-trello">
		<p>Logged in to as <strong><span id="fullName"></span> </strong></p>
		<a id="disconnect" href="#" class="btn btn-default">Log Out</a>
		
		<div id="outputCards" class="btn-group" role="group" aria-label="navigation"></div> 
		
		<table class="table table-condensed table-hover marketing-overview">
			<tr>
				<td></td>
				<th>Labels</th>
				<th>Job Number</th>
				<th>Job Title</th>
				<th>Status</th>
				<th>Final Due Date</th>
				<th>Actions</th>
			</tr>

			<cfoutput query="pmgRequestList">
				<cfquery name="pmgTypeList" datasource="Pearl_Internal_Web">
				SELECT *
				FROM dbo.PMGjobRequestCompanyList
				WHERE id = '#pmgRequestList.client#'
				</cfquery>
	
			<tr id="row-#pmgRequestList.jobNumber#">
				<td class="expand-#pmgRequestList.jobNumber#" ><a href="##row-#pmgRequestList.jobNumber#" class="btn btn-info btn-sm" data-toggle="collapse" data-target="##demo-#pmgRequestList.jobNumber#">+</a>
					</td>
				<td>	<span class="cardLabel-#pmgRequestList.jobNumber#"></span></td>
				<td>#pmgRequestList.jobNumber#</td>		
				<td><span class="trello-#pmgRequestList.jobNumber#">#pmgRequestList.jobTitle#</span></td>
				<td><span class="trelloList-#pmgRequestList.jobNumber# list-name">Open</span></td>	
				<td>#DateFormat(pmgRequestList.jobFinalDueDate, "mm/dd/yyyy")#</td>
				<td> <button class="btn btn-danger btn-sm">Close</button></td>
	
			</tr>
			<tr id="demo-#pmgRequestList.jobNumber#" class="collapse">	
				<td colspan="7" class="active">
					<div class="row">
							<div class="col-sm-12"><h6>#pmgTypeList.title#<cfif #pmgTypeList.subtitle# NEQ "">: #pmgTypeList.subTitle#</cfif></h6></div>
							<div class="col-sm-3">
						
								<ul>
									<li>Current % Complete</li>
									<li><strong>Current Deadline</strong>: <span class="cardLabel2"></span></li>
								</ul>
							</div>
					
						<div class="col-sm-9">
							<p><strong>Goal</strong>: #pmgRequestList.jobGoal#</p>
								<p><strong>Details</strong>: #pmgRequestList.jobTotalDetails# </p>
							<p><strong>Next Step</strong></p>
							<p><strong>Notes</strong>: <span class="notes-#pmgRequestList.jobNumber#"></span></p>
						</div>
			
					</div>
				</td>
			</tr>
			</cfoutput>
		</table>
    </div>
</div>
