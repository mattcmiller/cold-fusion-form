

<form name="pmgRequest03" method="post" class="form-horizontal" action="actions/request-action-03.cfm" onsubmit="javascript: return validate();">
<div class="row">
<div class="col-sm-9">
	<input type="hidden" name="todayDate" value="">
	<!--- <div class="form-group">
	    <label class="control-label col-sm-3" for="inputDetails">Total Project Details:</label>
	    <div class="col-sm-9">
	      <textarea name="jobTotalDetails" id="inputdetails" required="Yes" rows="3" placeholder="Project Details" class="form-control"></textarea>
	<span class="help-block">Please provide any overall details that may help in the production of the entire project. <strong>Reminder:</strong> Specific details for each item of the project should have been provided with the project request.</span>
	    </div>
	  </div>
	  --->
	
	<div class="form-group">
	    <label class="control-label col-sm-3" for="attachment">Attachments:</label>
	    <div class="col-sm-9">
	      <input id="attachment" type="file" name="files[]" accept="image/png image/jpg file/pdf file/doc file/docx file/xls file/xlsx" multiple placeholder="file:\\" >
			<span class="help-block">: Only png, jpg, pdf, doc, and xls files are accepted. </span>
			
	    </div>
	  </div>
	
	<div class="form-group">
	    <label class="control-label col-sm-3" for="inputDueDate">Total Project Due Date:</label>
	    <div class="col-sm-9">
	      <input type="datetime" name="jobFinalDueDate" id="datepicker" placeholder="ex: MM/DD/YYYY" required="yes" class="form-control" value="<cfoutput>#LSDateFormat(latestDueDate.dueDate, 'mm/dd/yyyy')#</cfoutput>"  onkeypress="return isNumberKey(event);">
			<span class="help-block">All projects should be initialized <strong>a minimum of two (2) weeks prior</strong> to the final due date. </span>
			<div class="alert alert-warning time-span additional-question"><p>Since you have requested a due date that is sooner than the 2 week time frame we cannot guarantee that this project will be completed in time. </p></div>
	    </div>
	  </div>
	
	<div class="form-group">
	    <label class="control-label col-sm-3" for="inputTrackingDate">Total Project Tracking Date:</label>
	    <div class="col-sm-9">
	      	<select name="inputTrackingDate" class="form-control">
				<cfoutput query="pmgYearSelect">
					<option value="#short#">#year#</option>
				</cfoutput>
			</select>
			<span class="help-block">All projects should be tracked to their year <strong>start</strong> of completed pieces. </span>

	    </div>
	  </div>

	  <div class="form-group">
		<label class="control-label col-sm-3" for="inputAgreeToTerms">Terms:</label>
	    <div class="col-sm-9">
	      <div class="checkbox">
	        <label>
	          <input type="checkbox" required="true" name="agreeToTerms" id="agreeToTerms" value="1"> I have provided all information needed for Pearl Marketing Group (PMG) to begin this project and agree to any follow-up meetings that may be necessary. I understand that my requested due date could be altered based on project priority or the volume of projects received at a time. I realize that any changes made to this request will be at the discretion of PMG.
	        </label>
	      </div>
	    </div>
	  </div>
</div>	

<div class="col-sm-3">
	<cfinclude template="marketing-aside-final.cfm">
</div>
</div>

<cfif url.pm NEQ '' OR session.pm NEQ ''>
	<div class="alert alert-info">
		<h4>Project Management</h4>
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
		    </div>
		 <div class="form-group">
			<label class="control-label col-sm-3" for="inputDueDate">PMG Members:</label>
			<div class="col-sm-9">
				<div id="output"></div>
		    </div>
		  </div>
		 <div class="form-group">
			<label class="control-label col-sm-3" for="inputDueDate">Labels:</label>
			<div class="col-sm-9">
				<div id="output2"></div>
		    </div>
		  </div>
		 <div class="form-group">
			<label class="control-label col-sm-3" for="inputDueDate">Lists:</label>
			<div class="col-sm-9">
				<div id="output3"></div>
		    </div>
		  </div>
		</div>    
	</div>
	
	</cfif>
	
	 <div class="form-group pmg-members">
	    <div class="col-sm-9 col-sm-offset-3">
      
	      <button type="submit" class="btn btn-inverse">Submit Your Request</button>
	    </div>
	  </div>
 
</form>