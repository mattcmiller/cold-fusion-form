	<cfif NOT structKeyExists(form, "pmgRequest01")>

  		<cfquery datasource="Pearl_Internal_Web">
		  INSERT INTO dbo.pmgJobRequest (jobTitle, jobContact, jobContactEmail,  client, targetAudience, jobGoal, priorJobNumber, priorPMGpoint, jobTotalDetails, jobFinalDueDate, jobType, managerName, managerApproval ) VALUES (
 

			  <cfif IsDefined("FORM.title") AND #FORM.title# NEQ "">
				'#ReplaceList(FORM.title,"(,)", "[,]")#'	
			      <cfelse>
			      NULL
			  </cfif>
				,

			  <cfif IsDefined("FORM.requestedBy")  AND #FORM.requestedBy# NEQ "">
				'#ReplaceList(FORM.requestedBy,"(,)", "[,]")#'	
				<cfelse>
			      NULL
			  </cfif>
			  ,    

			  <cfif IsDefined("FORM.requestedByEmail") AND #FORM.requestedByEmail# NEQ "">
				'#ReplaceList(FORM.requestedByEmail,"(,)", "[,]")#'	
				<cfelse>
			      NULL
			  </cfif>
			  ,
			<cfif IsDefined("FORM.companyOptions") AND #FORM.companyOptions# NEQ "" AND #FORM.companyOptions# EQ "7">
				'#Form.clientOptions#'
			<cfelseif IsDefined("FORM.companyOptions") AND #FORM.companyOptions# NEQ "" AND #FORM.companyOptions# EQ "5">
				'#FORM.businessOptions#'
			<cfelseif IsDefined("FORM.companyOptions") AND #FORM.companyOptions# NEQ "" AND #FORM.companyOptions# EQ "2">
				'#FORM.autoOptions#'
			<cfelseif IsDefined("FORM.companyOptions") AND #FORM.companyOptions# NEQ "">		
			  '#FORM.companyOptions#'	
			<cfelse>
			    NULL
			</cfif>
			,
			
			<cfif IsDefined("FORM.targetAudience") AND #FORM.targetAudience# NEQ "">
			' #ReplaceList(FORM.targetAudience,"(,)", "[,]")#'	
			<cfelse>
			   NULL
			</cfif>
			,
			
			<cfif IsDefined("FORM.projectGoal") AND #FORM.projectGoal# NEQ "">
				'#ReplaceList(FORM.projectGoal,"(,)", "[,]")#'
			<cfelse>
			   NULL
			</cfif>
			,
			
			<cfif IsDefined("FORM.priorJobNumber") AND #FORM.priorJobNumber# NEQ "">
				'#ReplaceList(FORM.priorJobNumber,"(,)", "[,]")#'	
			<cfelse>
			   NULL
			</cfif>
			,
			
			<cfif IsDefined("FORM.pmgPointPerson") AND #FORM.pmgPointPerson# NEQ "">
				'#ReplaceList(FORM.pmgPointPerson,"(,)", "[,]")#'
			<cfelse>
			  NULL
			</cfif>
			,
			
			<cfif IsDefined("FORM.jobTotalDetails") AND #FORM.jobTotalDetails# NEQ "">
				'#ReplaceList(FORM.jobTotalDetails,"(,)", "[,]")#'	
			<cfelse>
			  NULL
			</cfif>
			,
			
			<cfif IsDefined("FORM.jobFinalDueDate") AND #FORM.jobFinalDueDate# NEQ "">
			'#FORM.jobFinalDueDate#'	
			<cfelse>
			  NULL
			</cfif>,
			
			<cfif IsDefined("FORM.optionsRadios") AND #FORM.optionsRadios# NEQ "">
		    '#FORM.optionsRadios#'	
			<cfelse>
		      NULL
		  </cfif> ,
		
		<cfif IsDefined("FORM.managerName") AND #FORM.managerName# NEQ "">
			'#ReplaceList(FORM.managerName,"(,)", "[,]")#'	
		<cfelse>
		  NULL
		</cfif>
		,
		  
		<cfif IsDefined("FORM.managerApproval") AND #FORM.managerApproval# NEQ "">
	    '#FORM.managerApproval#'	
		<cfelse>
	      NULL
	  	</cfif> 
	
			
		

		  )
		  </cfquery>

<cfquery name="getID" datasource="Pearl_Internal_Web">
SELECT TOP 1 ID
FROM dbo.pmgJobRequest
ORDER by ID DESC
</cfquery>

<cfset session.ID = '#getID.ID#'>

  		<cflocation url="../step-02.cfm" addtoken="no">


</cfif>
