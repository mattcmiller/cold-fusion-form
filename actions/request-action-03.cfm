<cfparam name="pmg.email" default="marketing@pearlcompanies.com">
<cfparam name="url.pm" default="">
<cfparam name="url.iframe" default="">
	
	<cfif session.ID EQ ''>
		<cflocation url="index.cfm?timeout=1" addToken="no">
	</cfif>

	<cfif IsDefined("form.inputTrackingDate") AND #form.inputTrackingDate# NEQ "">
	    	<cfset yearMonth = #form.inputTrackingDate#>
		
	   <cfelse>
	      	<cfset yearMonth = #LSDateFormat(now(), 'YY')#>
	</cfif>

	<cfquery name="jobNumber" datasource="Pearl_Internal_Web">
	SELECT TOP 1 jobNumber
	FROM dbo.PMGjobRequestTrelloJobNumber20#yearMonth#
	ORDER BY jobNumber DESC
	</cfquery>

	<cfset trelloJobNumber = #jobNumber.jobNumber# + 1>

	<cfset finalNumber = '#yearMonth##trelloJobNumber#'>

	
	<cfquery datasource="Pearl_Internal_Web" name="jobNumberCheck">
		SELECT *
		FROM dbo.PMGjobRequest
		WHERE jobNumber = '#trelloJobNumber#'
	</cfquery>


<!---CHECK IF JOB NUMBER ALREADY EXISTS if so direct back to step 3 page. need to pass the values of the jobtotaldetails and jobfinalduedate back to the page so they are not lost--->
<cfif jobNumberCheck.RecordCount NEQ '0'>
	<cflocation addtoken="no" url="step-03.cfm?error=1">
<cfelse>
	<cfif NOT structKeyExists(form, "pmgRequest03")>

	 <cfquery datasource="Pearl_Internal_Web" name="emailStep" >
		UPDATE dbo.pmgJobRequest SET jobNumber = 
			<cfif IsDefined("finalNumber") AND #finalNumber# NEQ "">
			    '#finalNumber#'
			      <cfelse>
			      NULL
			</cfif>
			,jobTotalDetails =
		<cfif IsDefined("form.jobTotalDetails") AND #form.jobTotalDetails# NEQ "">
			'#ReplaceList(form.jobTotalDetails,"(,)", "[,]")#'
		      <cfelse>
		      NULL
		</cfif>
			,jobFinalDueDate =
			<cfif IsDefined("form.jobFinalDueDate") AND #form.jobFinalDueDate# NEQ "">
			    '#form.jobFinalDueDate#'
			      <cfelse>
			      NULL
			</cfif>
			,agreeToTerms = 
			<cfif IsDefined("form.agreeToTerms") AND #form.agreeToTerms# NEQ "">
			    '#form.agreeToTerms#'
			<cfelse>
			      NULL
			</cfif>	
		WHERE ID = '#session.ID#'
	</cfquery>

	<!---ASSIGN JOB NUMBER AND INSERT IN DATABASE--->
	<cfquery datasource="Pearl_Internal_Web">
	INSERT INTO dbo.PMGjobRequestTrelloJobNumber20#yearMonth# (jobNumber) VALUES (

	  <cfif IsDefined("trelloJobNumber") AND #trelloJobNumber# NEQ "">
	    '#trelloJobNumber#'

	      <cfelse>
	      NULL
	  </cfif>

	)
	</cfquery>
	
	
	<cfquery datasource="Pearl_Internal_Web" name="emailFill">
		SELECT *
		FROM dbo.PMGjobRequest
		WHERE jobNumber = '#finalNumber#'
	</cfquery>
	
	<cfquery name="pmgTypeList" datasource="Pearl_Internal_Web">
	SELECT *
	FROM dbo.PMGjobRequestCompanyList
	WHERE id = '#emailFill.client#'
	</cfquery>
	
	<cfquery name="pmgTypeListSecond" datasource="Pearl_Internal_Web">
	SELECT *
	FROM dbo.PMGjobRequestCompanyList
	WHERE id = '#emailFill.client#'
	</cfquery>
	
	<cfquery name="pmgOrderList" datasource="Pearl_Internal_Web">
	SELECT *
	FROM dbo.PMGjobRequestMarketingPieces
	WHERE jobID = '#session.ID#'
	ORDER by dueDate ASC, id DESC
	</cfquery>
	
	<cfquery name="pmgTypeListMavenLink" datasource="Pearl_Internal_Web">
	SELECT *
	FROM dbo.PMGjobRequestCompanyList
	WHERE id = '#emailFill.client#'
	</cfquery>
	

	<!--- User Email --->
	<cfmail from="#pmg.email#" to = "#emailFill.jobContactEmail# , #emailFill.managerName#" subject="Your Marketing Order: #emailFill.jobNumber# #emailFill.jobTitle#" type="html"> 

		<head>
			<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
			<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
			<title>Pearl Insurance</title>
			<style type="text/css">
				table td {
			border-collapse: collapse;
			font-family: Arial, Helvetica, sans-serif;

			}

			a, a:link, a:visited { color:##00aec5; }

			a b, a:link b, a:visited b {  color:##ffffff;}
			p { margin-bottom: 1em;}

			</style>
		</head>
		<body style="font-family: arial, helvetica, sans-serif; width:100% !important; -webkit-text-size-adjust:100%; -ms-text-size-adjust:100%; margin:0; padding:0;line-height: 13px;">
		<table style="margin: 0; padding: 0; width: 100% !important; line-height: 100% !important;" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td valign="top"> 
					<table align="center" border="0" cellpadding="0" cellspacing="0" width="550">
						<tr style="height: 75px;">
							<td style="vertical-align: middle;">
								<table style="color: ##333; border-bottom: 1px solid ##717073;">
									<tr>
										<td style="text-align: left;" width="400">
											<p><a href=""><img src="http://cf.pearlinsurance.com/DNNIncludes/images/pearl_insurance_30_blue.png" alt="Pearl Insurance" style="outline: none; text-decoration: none;" border="0"></a></p>
										</td>
										<td style="text-align: right;" width="150"></td>
									</tr>
								</table>
							</td>
						</tr>
						<tr style="background-color: ##ffffff; font-size: 15px; line-height: 22px;">
							<td>
								<br />
								<h2>Hello #emailFill.jobContact#,</h2>
								<p>Your project request has been received by Pearl Marketing Group and is under review. A member of our team will be contacting you to discuss next steps.  Below is the information you submitted:</p>
	
								<h3 style="color: ##004b8e !important;"> #emailFill.jobNumber# #emailFill.jobTitle# for #pmgTypeListSecond.title# <cfif #pmgTypeList.subtitle# NEQ "">  #pmgTypeListSecond.subTitle# </cfif>, a #emailFill.jobType# project</h3>
								
								<ul>
									<li>Requested by: #emailFill.jobContact#<br> <a href="mailto:#emailFill.jobContactEmail#">#emailFill.jobContactEmail#</a></li>
									<li>Detail: #emailFill.jobTotalDetails#</li>
									<li>Target Audience: #emailFill.targetAudience#</li>
									<li>Goal: #emailFill.jobGoal#</li>
									<li>Approval by Manager: #emailFill.managerApproval#</li>
									<li>Manager: <a href="mailto:#emailFill.managerName#">#emailFill.managerName# </a></li>
									<li>Type: #emailFill.jobType#</li>
									<cfif emailFill.jobType NEQ 'new' >
									<li>Prior Job Number: <cfif emailFill.priorJobNumber NEQ ''>#emailFill.priorJobNumber#<cfelse>None</cfif></li>
									<li>Prior Contact Person: <cfif emailFill.priorPMGpoint NEQ ''>#emailFill.priorPMGpoint#<cfelse>None</cfif></li>
									</cfif>
									<li>Agreed to PMG: <cfif emailFill.agreeToTerms EQ 1>Yes, I agreed to PMG's Terms<cfelse>Nope.</cfif></li>
								</ul>							
										
									<cfloop query="pmgOrderList">
										<cfquery name="pmgTypeListFirst" datasource="Pearl_Internal_Web">
										SELECT *
										FROM dbo.PMGjobRequestProjectTypeList
										WHERE id = '#pmgOrderList.subType#'
										</cfquery>

										<h4>#pmgTypeListFirst.subType#</h4>

											<ul>
											 <li>Due On: #LSDateFormat(pmgOrderList.dueDate, "mm/dd/yyyy")#</li>
											<li>Details: #pmgOrderList.details#</li>
											<li>Budget: #pmgOrderList.budget#</li>
											<li>Accounting Code: #pmgOrderList.accountingCode#</li>
											<li>Approvals: #pmgOrderList.approvals#</li>
											<cfif pmgOrderList.Type EQ 'web'>
												<li>URL: #pmgOrderList.url#</li>
											</cfif>
											<cfif pmgOrderList.Type EQ 'print'>
												<li class="capitalize">Printing: #pmgOrderList.printing#</li>
											</cfif>

											<li>SourceCode: 
												<cfif pmgOrderList.sourceCheck NEQ ''>
													<cfif pmgOrderList.sourceCode NEQ ''>
														#pmgOrderList.sourceCode#
													<cfelse>
														<em>Needs to be Added</em>
													</cfif>
												<cfelse>
													Not Required
												</cfif>
												</li>

											<li>List: 
												<cfif pmgOrderList.listCheck NEQ ''>
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
												</cfif>
											</ul>

									</cfloop> 
										
																	
									
									
									<p>Thank you,<br>
									Pearl Marketing Group
									</p>
							</td>
						</tr>
						<tr>
							<td style="color: ##333; border-top: 1px solid ##717073; margin-top: 1em;">
								<table>
									<tr>
										<td style="text-align: left;" width="400">
											<p style="font-size: 11px; line-height: 1.25em;"><a href="http://pearlinsurance.com" style="color: ##00aec5 !important;">pearlinsurance.com</a><br>1200 East Glen Avenue<br>Peoria Heights, IL 61616<br>800.447.4982</p>
										</td>
										<td style="text-align: right;" width="150"></td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
		</body>


		</cfmail> 


			<!--- Trello Email --->

			<cfmail from="#pmg.email#" to = "pmg.bsj7n@zapiermail.com" subject="Your Marketing Order: #emailFill.jobNumber# #emailFill.jobTitle#" cc="webpresence@pearlcompanies.com, ben.white@pearlcompanies.com" type="html"> 


				<head>
					<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
					<meta name="viewport" content="width=device-width, initial-scale=1.0"/>


				</head>
				<body style="font-family: arial, helvetica, sans-serif; width:100% !important; -webkit-text-size-adjust:100%; -ms-text-size-adjust:100%; margin:0; padding:0;line-height: 13px;">

									<h3 style="color: ##004b8e !important;">Title(## #emailFill.jobNumber# #emailFill.jobTitle#)</h3>										
									<cfif IsDefined("form.trelloList") AND #form.trelloList# NEQ "">
										<p>List(#form.trelloList#)</p>
									<cfelse>
										<p>List(55f2f1d4f4634df38fe51149)</p>
									</cfif>
									<p>Client(<cfif #pmgTypeList.subtitle# NEQ "">#pmgTypeList.subTitle# - </cfif>#pmgTypeList.title# )</p>
									<p>Contact(#emailFill.jobContact# / #emailFill.jobContactEmail#)</p>
									<p>JobType(#emailFill.jobType# ) </p>
									<p>Approval(#emailFill.managerApproval# ) </p>
									<p>Manager(#emailFill.managerName# ) </p>

									<cfif IsDefined("emailFill.priorJobNumber") AND #emailFill.priorJobNumber# NEQ "">
										<p>priorJobNumber(: #emailFill.priorJobNumber#)</p>
										<cfelse>
												<p>priorJobNumber(None)</p>
									</cfif>
									<cfif IsDefined("emailFill.priorPMGpoint") AND #emailFill.priorPMGpoint# NEQ "">
										<p>pmgPrior(#emailFill.priorPMGpoint#)</p>
											<cfelse>
										<p>pmgPrior(None)</p>
									</cfif>

									<p>jobDetails( #emailFill.jobTotalDetails# ) </p>
									<p>TargetAudience(#emailFill.targetAudience# ) </p>
									<p>jobGoal(#emailFill.jobGoal# ) </p>

									<p>dueDate(#LSDateFormat(emailFill.jobFinalDueDate, "mm/dd/yyyy")# ) </p>
									<p>rushReason(#PMGorderList.rushReason# ) </p>



									<cfif IsDefined("form.trelloLabel") AND #form.trelloLabel# NEQ "">
										<p>Label(#form.trelloLabel#)</p>
										<cfelse>
											<p>Label(yellow)</p>
									</cfif>
									<cfif IsDefined("form.trelloMember") AND #form.trelloMember# NEQ "">
										<p>Member(#form.trelloMember#)</p>
										<cfelse>
											<p>Member(53d113b979db8cd372c12631)</p>
									</cfif>

									Items(
									<cfloop query="pmgOrderList">
										<cfquery name="pmgTypeList" datasource="Pearl_Internal_Web">
										SELECT *
										FROM dbo.PMGjobRequestProjectTypeList
										WHERE id = '#pmgOrderList.subType#'
										</cfquery>
		######## #pmgOrderList.Type# Job:  #pmgTypeList.subType#

		- **Due On**: #LSDateFormat(pmgOrderList.dueDate, "mm/dd/yyyy")#
		- **Details**: #pmgOrderList.details#
		- **Was It Budgeted**: <cfif pmgOrderList.budgetCheck EQ '1'>Yes, it was budgeted<cfelse>*No, it was NOT in the budget.* </cfif>
		- **Budget**: $<cfif pmgOrderList.Type EQ 'print'>#pmgOrderList.budget#<cfelse>0</cfif>.00
		- **Accounting Code**: #pmgOrderList.accountingCode#
		- **Approvals**: #pmgOrderList.approvals#
		<cfif pmgOrderList.Type EQ 'web'>- **URL**: #pmgOrderList.url#</cfif>
		<cfif pmgOrderList.Type EQ 'print'>- **Printing**: #pmgOrderList.printing#</cfif>



		- **SourceCode**: <cfif pmgOrderList.sourceCheck NEQ ''><cfif pmgOrderList.sourceCode NEQ ''>#pmgOrderList.sourceCode#<cfelse>*Needs to be Added*</cfif><cfelse>Not Required</cfif>

		- **List**: <cfif pmgOrderList.listCheck NEQ ''><cfif pmgOrderList.listCheck EQ '1'><cfif pmgOrderList.listName NEQ ''>#pmgOrderList.listName#<cfelse>*Needs to be Added*</cfif><cfelse>*Needs to be Requested*</cfif><cfelse>Not Required</cfif>

		</cfloop>)
									<p>CheckListPMG(
										<cfloop query="pmgOrderList">
											<cfquery name="pmgTypeList" datasource="Pearl_Internal_Web">
											SELECT *
											FROM dbo.PMGjobRequestProjectTypeList
											WHERE id = '#pmgOrderList.subType#'
											</cfquery>
											#pmgTypeList.subType# - DUE #LSDateFormat(pmgOrderList.dueDate, "mm/dd/yyyy")#,
										</cfloop>
										)



										</p>

				</body>


				</cfmail>



				<!--- MavenLink --->

				<cfmail from="#pmg.email#" to = "pearlmavenlink.bsj7n@zapiermail.com" subject="Your Marketing Order (MavenLink): #emailFill.jobNumber# #emailFill.jobTitle#" cc="webpresence@pearlcompanies.com, ben.white@pearlcompanies.com" type="html"> 


					<head>
						<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
						<meta name="viewport" content="width=device-width, initial-scale=1.0"/>
					</head>
					<body style="text-align: left; font-family: arial, helvetica, sans-serif; width:100% !important; -webkit-text-size-adjust:100%; -ms-text-size-adjust:100%; margin:0; padding:0;line-height: 13px;">

						<h3 style="color: ##004b8e !important;">Title(#emailFill.jobNumber# #emailFill.jobTitle#)</h3>										
						<cfif IsDefined("form.trelloList") AND #form.trelloList# NEQ "">
							<p>List(#form.trelloList#)</p>
						<cfelse>
							<p>List(55f2f1d4f4634df38fe51149)</p>
						</cfif>
						<p>Client(<cfif #pmgTypeListMavenLink.subtitle# NEQ "">#pmgTypeListMavenLink.subTitle# - </cfif>#pmgTypeListMavenLink.title# )</p>
						<p>Contact(#emailFill.jobContact# )</p>
						<p>ContactEmail( #emailFill.jobContactEmail#)</p>
						<p>JobType(#emailFill.jobType# ) </p>
						<p>Approval(#emailFill.managerApproval# ) </p>
						<p>Manager(#emailFill.managerName# ) </p>

						<cfif IsDefined("emailFill.priorJobNumber") AND #emailFill.priorJobNumber# NEQ ""><p>priorJobNumber(: #emailFill.priorJobNumber#)</p><cfelse><p>priorJobNumber(None)</p></cfif>
						<cfif IsDefined("emailFill.priorPMGpoint") AND #emailFill.priorPMGpoint# NEQ ""><p>pmgPrior(#emailFill.priorPMGpoint#)</p><cfelse><p>pmgPrior(None)</p></cfif>
						<p>TargetAudience(#emailFill.targetAudience# ) </p>
						<br /><br />
						<p>jobDetails( #emailFill.jobTotalDetails# ) </p>
						<p>jobGoal(#emailFill.jobGoal# ) </p>
						<br /><br />
						<p>dueDate(#LSDateFormat(emailFill.jobFinalDueDate, "mm/dd/yyyy")# ) </p>
						<p>rushReason(#PMGorderList.rushReason# ) </p>
						Items(
<cfloop query="pmgOrderList">
<cfquery name="pmgTypeListMavenLink" datasource="Pearl_Internal_Web">SELECT * FROM dbo.PMGjobRequestProjectTypeList WHERE id = '#pmgOrderList.subType#'</cfquery>
#pmgTypeListMavenLink.subType#<br><br>
- Originally Due On: #LSDateFormat(pmgOrderList.dueDate, "mm/dd/yyyy")#
<br>
- Details: #pmgOrderList.details#
<br>
- Was It Budgeted: <cfif pmgOrderList.budgetCheck EQ '1'>Yes, it was budgeted<cfelse>No, it was NOT in the budget. </cfif><br>
- Budget: $<cfif pmgOrderList.Type EQ 'print'>#pmgOrderList.budget#<cfelse>0</cfif>.00
- Accounting Code: #pmgOrderList.accountingCode#
- Approvals: #pmgOrderList.approvals#
<cfif pmgOrderList.Type EQ 'web'>- URL: #pmgOrderList.url#</cfif><cfif pmgOrderList.Type EQ 'print'>-Printing: #pmgOrderList.printing#</cfif>
- SourceCode: <cfif pmgOrderList.sourceCheck NEQ ''><cfif pmgOrderList.sourceCode NEQ ''>#pmgOrderList.sourceCode#<cfelse>*Needs to be Added*</cfif><cfelse>TBD</cfif>
- List: <cfif pmgOrderList.listCheck NEQ ''><cfif pmgOrderList.listCheck EQ '1'><cfif pmgOrderList.listName NEQ ''>#pmgOrderList.listName#<cfelse>*Needs to be Added*</cfif><cfelse>*Needs to be Requested*</cfif><cfelse>TBD</cfif>
</cfloop>)


					</body>


					</cfmail>




	
	<!---RESET SESSION ID--->
	
	
	<cflocation url="../step-04.cfm" addtoken="no">
	

	</cfif>
</cfif>