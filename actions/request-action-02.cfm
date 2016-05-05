<cfparam name="url.pm" default="">
<cfparam name="url.iframe" default="">
	
	<cfif session.ID EQ ''>
		<cflocation url="index.cfm?timeout=1" addToken="no">
	</cfif>
	
<!---  <cfif form.ID NEQ '' >
	
	<cfquery datasource="Pearl_Internal_Web">
	UPDATE dbo.PMGjobRequestMarketingPieces
	SET
	type = '#form.detailsRadios#',
	details = '#form.details#',
	budget = '#form.budget#',
	dealership = '#form.dueDate#'
	WHERE ID = '#form.id#'
	</cfquery>
	
<cflocation url="../tech-form.cfm?success=3" addtoken="no"> 

<cfelse> --->


<!--- Delete Above Once All Hooked Together --->
	
	<cfif NOT structKeyExists(form, "pmgRequest02")>
	
	  	<cfquery datasource="Pearl_Internal_Web">
		  INSERT INTO dbo.PMGjobRequestMarketingPieces (jobID, type, subType, details, printing, sourceCheck, sourceRequest, sourceCode, listCheck, listRequest, listName, url, budgetCheck, budget, accountingCode, approvals, dueDate, rushReason ) VALUES (
		
		  <cfif IsDefined("session.ID") AND #session.ID# NEQ "">
		    '#session.ID#'
		      <cfelse>
		      NULL
		  </cfif>
			,	
 
		  <cfif IsDefined("FORM.detailsRadios") AND #FORM.detailsRadios# NEQ "">
		    '#FORM.detailsRadios#'
		      <cfelse>
		      NULL
		  </cfif>
			,

		  <cfif IsDefined("FORM.typePrint")  AND #FORM.typePrint# NEQ "" AND #FORM.detailsRadios# EQ "print">
		    '#FORM.typePrint#'
			<cfelseif IsDefined("FORM.typeWeb")  AND #FORM.typeWeb# NEQ "" AND #FORM.detailsRadios# EQ "web">
			 '#FORM.typeWeb#'
			<cfelse>
		      NULL
		  </cfif>
		  ,    

		  <cfif IsDefined("FORM.projectDetails") AND #FORM.projectDetails# NEQ "">
			'#ReplaceList(FORM.projectDetails,"(,)", "[,]")#'	
			<cfelse>
		      NULL
		  </cfif>
		  ,
			<cfif IsDefined("FORM.printingOption") AND #FORM.detailsRadios# EQ "print" AND #FORM.printingOption# NEQ "">
			  '#FORM.printingOption#'	
				<cfelse>
			    NULL
			</cfif>
			,
			
			<cfif IsDefined("FORM.sourceCheck") AND #FORM.sourceCheck# NEQ "">
				'#ReplaceList(FORM.sourceCheck,"(,)", "[,]")#'		
			<cfelse>
			   NULL
			</cfif>
			,
			
		<cfif IsDefined("FORM.sourceRequest") AND #FORM.sourceRequest# NEQ "">
			'#ReplaceList(FORM.sourceRequest,"(,)", "[,]")#'	
		<cfelse>
		   NULL
		</cfif>
		,

		<cfif IsDefined("FORM.sourceCode") AND #FORM.sourceCode# NEQ "">
			'#ReplaceList(FORM.sourceCode,"(,)", "[,]")#'	
		<cfelse>
		   NULL
		</cfif>
		,
		<cfif IsDefined("FORM.listCheck") AND #FORM.listCheck# NEQ "">
			'#ReplaceList(FORM.listCheck,"(,)", "[,]")#'	
		<cfelse>
		   NULL
		</cfif>
		,
		<cfif IsDefined("FORM.listRequest") AND #FORM.listRequest# NEQ "">
			'#ReplaceList(FORM.listRequest,"(,)", "[,]")#'	
		<cfelse>
		   NULL
		</cfif>
		,
		<cfif IsDefined("FORM.listName") AND #FORM.listName# NEQ "">
		 '#FORM.listName#'	
		<cfelse>
		   NULL
		</cfif>
		,
		<cfif IsDefined("FORM.URL") AND #FORM.URL# NEQ "" AND #FORM.detailsRadios# EQ "web">
			'#ReplaceList(FORM.URL,"(,)", "[,]")#'		
		<cfelse>
		   NULL
		</cfif>
		,
			
			<cfif IsDefined("FORM.budgetedRadios") AND #FORM.budgetedRadios# NEQ "">
			 '#FORM.budgetedRadios#'	
			<cfelse>
			   NULL
			</cfif>
			,
			
			
			<cfif IsDefined("FORM.budget") AND #FORM.budget# NEQ "">
				'#ReplaceList(FORM.budget,"(,)", "[,]")#'		
			<cfelse>
			   NULL
			</cfif>
			,
			<cfif IsDefined("FORM.accountingRevenue") AND #FORM.accountingRevenue# NEQ "" AND IsDefined("FORM.accountingProduct") AND #FORM.accountingProduct# NEQ "">
			 '#FORM.accountingRevenue#-#FORM.accountingProduct#'	
			<cfelse>
			   NULL
			</cfif>
			,
			
			<cfif IsDefined("FORM.approval") AND #FORM.approval# NEQ "">
				'#ReplaceList(FORM.approval,"(,)", "[,]")#'	
			<cfelse>
			   NULL
			</cfif>
			,
			<cfif IsDefined("FORM.dueDatePiece") AND #FORM.dueDatePiece# NEQ "">
			 '#FORM.dueDatePiece#'	
			<cfelse>
			   NULL
			</cfif>
			,
			<cfif IsDefined("FORM.rushReason") AND #FORM.rushReason# NEQ "">
			 '#FORM.rushReason#'	
			<cfelse>
			   NULL
			</cfif>
	

		  )
		  </cfquery>
		

		  		<cflocation url="../step-02.cfm?success=3" addtoken="no">
		
	</cfif>

