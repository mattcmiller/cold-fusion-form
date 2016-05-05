<p>Please complete all fields in the form below and then click <em>Select Your Items</em> to proceed. </p>

<div class="alert alert-info">
	<p>Are you looking to just print out materials? <a href="http://home.pearlins.com/MMorder">Click here</a> to go the Marketing Ordering site.</p>
</div>

<cfif url.timeout EQ 1>
	<div class="alert alert-danger">
		<p>Your previous session has expired.</p>
	</div>
</cfif>

<form name="pmgRequest01" method="post" class="form-horizontal" action="actions/request-action-01.cfm" onsubmit="javascript: return validate();">

		<input type="hidden" name="id" value="<cfoutput>#url.recordID#</cfoutput>">
		<input type="hidden" name="pm" value="<cfoutput>#url.pm#</cfoutput>">
		<input type="hidden" name="iframe" value="<cfoutput>#url.iframe#</cfoutput>">
		<input type="hidden" name="todayDate" value="">

			<div class="form-group ">
			    <label class="control-label col-sm-3" for="inputTitle">Project Title:</label>
			    <div class="col-sm-9">
			      <input type="text" name="title" id="inputTitle" placeholder="ex: Online Pay Portal" required="yes" class="form-control">
				  <span class="help-block">Give your project a descriptive, identifiable title.</span>
			    </div>
			</div>

			<div class="form-group">
			    <label class="control-label col-sm-3" for="inputRequestedBy">Requested By:</label>
			    <div class="col-sm-9">
			      <input type="text" name="requestedBy" id="inputRequestedBy" placeholder="ex: Gary Pearl" required="yes" class="form-control">
				<span class="help-block">Include your full name, as you will be PMG's point of contact for this project.</span>
			    </div>
			</div>

			<div class="form-group">
			    <label class="control-label col-sm-3" for="inputRequestedByEmail">Contact Email:</label>
			    <div class="col-sm-9">
			      <input type="email" name="requestedByEmail" id="inputRequestedByEmail" placeholder="ex: gary.pearl@pearlcompanies.com" required="yes" class="form-control">
					<span class="help-block">Please provide us with you email address, and we will be able contact you about the project.</span>
			    </div>
			</div>

			<div class="form-group">
			    <label class="control-label col-sm-3" for="inputCompany">Company:</label>
			    <div class="col-sm-9">
					<select name="companyOptions" id="inputCompany" class="form-control"  required="yes">
						<option value="" selected="selected"  disabled>Select Below</option>	
						<cfoutput query ="pmgCompanies"><option value="#id#">#title#</option></cfoutput>
					</select>
				<div class="form-group affinity-select alert alert-info additional-question">
				    <label class="control-label col-sm-3" for="inputClient">Client:</label>
				    <div class="col-sm-9">
						<select name="clientOptions" id="inputClient" class="form-control">
							<option value="" selected="selected"  disabled>Select Below</option>	
							<cfoutput query ="pmgAffinity"><option value="#id#">#subTitle#</option></cfoutput>
						</select>
				    </div>
				</div>

				<div class="form-group business-select alert alert-info additional-question">
				    <label class="control-label col-sm-3" for="inputBusiness">Vertical:</label>
				    <div class="col-sm-9">
						<select name="businessOptions" id="inputBusiness" class="form-control">
							<option value="" selected="selected"  disabled>Select Below</option>	
							<cfoutput query ="pmgBusiness"><option value="#id#">#subTitle#</option></cfoutput>
						</select>
					</div>
				</div>

					<div class="form-group auto-select alert alert-info additional-question">
					    <label class="control-label col-sm-3" for="inputBusiness">Dealership:</label>
					    <div class="col-sm-9">
							<select name="autoOptions" id="inputAuto" class="form-control">
								<option value="" selected="selected"  disabled>Select Below</option>	
								<cfoutput query ="pmgAuto"><option value="#id#">#subTitle#</option></cfoutput>
							</select>
						</div>
					</div>

					<span class="help-block">Please complete a <strong>separate</strong> request for each company, client, or vertical.</span>
				</div>
			</div>
			
			
			<div class="form-group">
			    <label class="control-label col-sm-3" for="inputProject">Project:</label>
			    <div class="col-sm-9">
				
					<div class="radio radio-tool">
					  <label data-toggle="tooltip" data-placement="right" title="Projects that have never been done or are large, ex: a new web portal or a mailing.">
					    <input type="radio" name="optionsRadios" id="newRadio" value="new" class="trigger" data-rel="based-on-bool" required>
					   	New Project
					  </label>
					</div>
					<div class="radio radio-tool" >
					  <label data-toggle="tooltip"  data-placement="right" title="Projects that need minor updates, ex: copy changes.">
					    <input type="radio" name="optionsRadios" id="revisionRadio" value="revision" class="trigger" data-rel="job-number">
					    Project Revision
					  </label>
					</div>
					
					<div class="radio radio-tool">
					  <label data-toggle="tooltip"  data-placement="right" title="Projects that need you need the status determined by PMG.">
					    <input type="radio" name="optionsRadios" id="unknownRadio" value="unknown" class="trigger" data-rel="point-person-bool">
					    Unknown
					  </label>			
					</div>
					
					<div class="form-group based-on-bool alert alert-info additional-question subquestion">
					    <label class="control-label col-sm-7" for="inputRequestedByEmail">Based on similar or existing project?</label>
					    <div class="col-sm-5">

							<div class="row">
								<div class="col-sm-6 no-padding">
									<div class="radio">
									  <label class="radio-inline">
									    <input type="radio" name="newOptions" id="newTrue" value="yes" >
									    Yes
									  </label>
									</div>
								</div>

								<div class="col-sm-6 no-padding">
									<div class="radio">
									  <label class="radio-inline">
									    <input type="radio" name="newOptions" id="newFalse" value="no">
									   No
									  </label>
									</div>
								</div>

							</div>
						</div>
					</div>
					
					<div class="form-group job-number alert alert-info additional-question subquestion">
					    <label class="control-label col-sm-3" for="inputRequestedByEmail">Job Number:</label>
					    <div class="col-sm-9">
					      <input type="text" name="priorJobNumber" id="inputPriorJobNumber" placeholder="ex: 101010" class="form-control"  onkeypress="return isNumberKey(event)">
							<span class="help-block">Look for a six digit number at the bottom of printed materials.</span>
						</div>
					</div>
					
					<div class="form-group point-person-bool alert alert-info additional-question subquestion">
					    <label class="control-label col-sm-7" for="inputRequestedByEmail">Worked with someone on this in the past?</label>
					    <div class="col-sm-5">
							<div class="row">
								<div class="col-sm-6 no-padding">
									<div class="radio">
									  <label class="radio-inline">
									    <input type="radio" name="pmgOptions" id="pastTrue" value="t">
									    Yes
									  </label>
									</div>
								</div>
				  				<div class="col-sm-6 no-padding">
				  					<div class="radio">
					  				  <label class="radio-inline">
					  				    <input type="radio" name="pmgOptions" id="pastFalse" value="f">
					  				   No
					  				  </label>
					  				</div>
				  				</div>
							</div>
						</div>
					</div>


					<div class="form-group pmg-point alert alert-info additional-question subquestion">
					    <label class="control-label col-sm-3" for="inputRequestedByEmail">Point Person:</label>
					    <div class="col-sm-9">
					      <input type="text" name="pmgPointPerson" id="inputPMGPoint" placeholder="ex: Dave Bland"  class="form-control">
							<span class="help-block">Include the full name of your PMG Point Person.</span>
					    </div>
					</div>
					
					<span class="help-block">Hover on the radio button labels for tips. Follow-up questions <em>will</em> be asked based on your classification of the project.</span>

			    </div>
			</div>
					

			<div class="form-group">
			    <label class="control-label col-sm-3" for="inputExistingProject">Target Audience:</label>
			    <div class="col-sm-9">
			      <input type="text" name="targetAudience" id="inputExistingProject" placeholder="ex: Ages 30-50 married females without Term Life coverage" class="form-control" required="yes">
					<span class="help-block">Who is your target? Include age bands, gender, profession, and any other specifics. Your target market description should fit on one line. </span>
			    </div>
			</div>

			<div class="form-group">
			  <label class="control-label col-sm-3" for="inputExistingProject">Project Goal:</label>
			    <div class="col-sm-9">
			      <textarea name="projectGoal" id="inputExistingProject" placeholder="ex: This mailing needs to drive users to use our Online Bill Pay Module; it will drive them to the landing page and track them." class="form-control" rows="3" required="yes"></textarea>
					<span class="help-block">What is the purpose of the project? Include all calls-to-action and their purpose in your integrated marketing plan. It should be no longer than three lines.</span>
			    </div>
			</div>

			<div class="form-group">
			  <label class="control-label col-sm-3">Manager Name:</label>
			    <div class="col-sm-9">
					<select name="managerName" id="managerName" class="form-control" required="required">
					        <cfoutput query="managers"><option value="#managers.email#">#managers.fullName#</option></cfoutput>
					</select>
			    </div>
			</div>	
					
			<div class="form-group">
			  <label class="control-label col-sm-3" for="inputExistingProject">Manager Approval:</label>
			    <div class="col-sm-9">
				
			        <div class="radio">
					  <label>
					    <input type="radio" name="managerApproval" id="approved" value="Yes" required="required">
					    Yes
					  </label>
					</div>
					
					<div class="radio">
					  <label>
					    <input type="radio" name="managerApproval" id="notApproved" value="No" required="required">
					   No
					  </label>
					</div>

					<div class="row-spacer alert alert-info manager additional-question">

						<p>In order to make sure marketing resources are most effectively utilized, we are requiring that each project submission receives manager approval. <strong>If you submit this project without manager approval, a member of the marketing team will be contacting your supervisor</strong> to discuss your inquiry. We apologize for any inconvenience this may cause.</p>
					</div>
			    </div>
			</div>			

	

 <div class="form-group">
    <div class="col-sm-9 col-sm-offset-3">
      <button type="submit" class="btn btn-inverse">Select Your Items &raquo; </button>
    </div>
  </div>
 
</form>