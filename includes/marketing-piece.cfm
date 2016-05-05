


<div class="piece <cfif pmgOrderList.RecordCount NEQ '0'>hidden</cfif>" >
<form name="pmgRequest02" method="post" class="form-horizontal" action="actions/request-action-02.cfm" onsubmit="javascript: return validate();">
		<input type="hidden" name="id" value="<cfoutput>#url.recordID#</cfoutput>">
		<input type="hidden" name="pm" value="<cfoutput>#url.pm#</cfoutput>">
		<input type="hidden" name="iframe" value="<cfoutput>#url.iframe#</cfoutput>">
		<input type="hidden" name="todayDate" value="">
		<div class="form-group">
		    <label class="control-label col-sm-3" for="inputProjectType">Project Type:</label>
		    <div class="col-sm-9">
				<div class="row">
				<div class="col-sm-6 no-padding">
				<div class="radio radio-tool">
				  <label data-toggle="tooltip" data-placement="right" title="Projects that are to be finilized in hard copy, ex: forms and applications.">
				    <input type="radio" name="detailsRadios" id="print" value="print" class="trigger" data-rel="print-choices" required>
				   	Print
				  </label>
				</div>
				</div>
				<div class="col-sm-6 no-padding">	
				<div class="radio radio-tool" >
				  <label data-toggle="tooltip"  data-placement="right" title="Projects exist digitally only, ex: landing pages.">
				    <input type="radio" name="detailsRadios" id="web" value="web" class="trigger" data-rel="web-choices">
				    Digital / Web
				  </label>
				</div>

				</div></div>
					<div class="form-group  alert alert-info print-choices additional-question print">
					    <label class="control-label col-sm-4" for="inputType">Print Project:</label>
					    <div class="col-sm-8">
					      <select name="typePrint" id="inputPrintType" class="form-control">
									<option value="" selected="selected">Select Below</option>	
								<cfoutput query ="pmgPrintItems"><option value="#id#">#subType#</option></cfoutput>
								
					      </select>
					
							
					    </div>
					
					  </div>
							<div class="alert alert-warning is-mailing additional-question"><p>Project completion may vary based on the complexity of your request and available resources.</p>
								</div>


					<div class="form-group  alert alert-info web-choices web additional-question">
					    <label class="control-label col-sm-4" for="inputType">Digital Project:</label>
					    <div class="col-sm-8">
					      <select name="typeWeb" id="inputWebType" class="form-control">
								<option value="" selected="selected">Select Below</option>	
								<cfoutput query ="pmgWebItems"><option value="#id#">#subType#</option></cfoutput>
								
					      </select>
					    </div>
					  </div>
					
					
					<span class="help-block">Hover over the button labels for additional details. Follow-up questions will be asked based on your selection.</span>			
					
					
				</div>
				

		    </div>
	
	<div class="print">
	
	

	
		<div class="form-group">
		    <label class="control-label col-sm-3" for="inputURL">Printing:</label>
		    <div class="col-sm-9">
		     		<div class="row">
			
					<div class="col-sm-6 no-padding">
					<div class="radio ">
					  <label data-toggle="tooltip" data-placement="right" title="Printed here at Pearl's PMG Printer.">
					    <input type="radio" name="printingOption" id="printRadios1" value="inhouse" class="trigger" data-rel="based-on-bool">
					   	In-House
					  </label>
					</div>
					</div>
					
					<div class="col-sm-6 no-padding">	
					<div class="radio radio-tool" >
					  <label data-toggle="tooltip"  data-placement="right" title="Pieces sent to a third party printer.">
					    <input type="radio" name="printingOption" id="printRadios2" value="vendor" class="trigger" data-rel="job-number">
					    Vendor
					  </label>
					</div>
					</div>
					</div>

		    </div>
		  </div>
	
	</div>
	
	<div class="web additional-question">
		<div class="form-group web-address ">
		    <label class="control-label col-sm-3" for="inputURL">Web Address:</label>
		    <div class="col-sm-9">
		      <input type="text" name="URL" id="inputURL" placeholder="http://..." class="form-control">
			<span class="help-block">For an existing project, please provide the url so we know what page needs updated. For redirects or new pages, please provide the url that you would like us to use (i.e.: pearlinsurance.com/auto).</span>
		    </div>
		  </div>
	</div>

	<div class="form-group">
	    <label class="control-label col-sm-3" for="inputProjectDetails">Additional Details:</label>
  <div class="col-sm-9">
			      <textarea name="projectDetails" id="inputProjectDetails" placeholder="ex: This mailing needs to be on letter paper, four color with 500 prints or this needs to be a email with a large call to action for our convention." class="form-control" rows="3"></textarea>
					<span class="help-block">Give us the size, color, and quantity for the item. If you have a design style in mind, please provide art direction.</span>

	    </div>
	  </div>
	
		<div class="form-group hidden">
		    <label class="control-label col-sm-3" for="inputSourceCheck">Source Code:</label>
	  <div class="col-sm-9">
		<div class="checkbox">
	        <label>
	          <input type="checkbox" id="inputSourceCheck" name="sourceCheck" value="1"> Yes, this will require a source Code. 
	        </label>
		  </div>
		
		
			<div class="form-group source-bool alert alert-info additional-question">
			    <label class="control-label col-sm-7" for="inputSourceCodeRequest">Has the Source Code Been Requested?</label>
			    <div class="col-sm-5">
					<div class="row">
						<div class="col-sm-6 no-padding">
							<div class="radio">
							  <label class="radio-inline">
							    <input type="radio" name="sourceRequest" id="sourceTrue" value="1">
							    Yes
							  </label>
							</div>
						</div>
		  				<div class="col-sm-6 no-padding">
		  					<div class="radio">
			  				  <label class="radio-inline">
			  				    <input type="radio" name="sourceRequest" id="sourceFalse" value="0">
			  				   No
			  				  </label>
			  				</div>
		  				</div>
					</div>
				</div>
			</div>
			

			<cfif url.pm NEQ '' OR session.pm NEQ ''>
				<div class="form-group sourceCode-input alert alert-info additional-question">
				    <label class="control-label col-sm-4" for="inputSourceCode">Source Code:</label>
				    <div class="col-sm-8">
				    	<div class="input-group">
							<span class="input-group-addon">141XXX-<cfoutput query="pmgRequestList"><cfquery name="pmgTypeList" datasource="Pearl_Internal_Web"> SELECT * FROM dbo.PMGjobRequestCompanyList WHERE id = '#pmgRequestList.client#'</cfquery><cfif #pmgTypeList.acronym# NEQ "">#pmgTypeList.subTitle#</cfif></cfoutput>-</span>
							<input type="text" name="sourceCode" id="inputSourceCode" placeholder="ex: FolUpEmail"  class="form-control">
							
						
						</div>
						
						
						<span class="help-block">Include the source code if you have it.</span>
				    </div>
				</div>
			<cfelse>
			<span class="help-block">This is not setting up a source code! This is letting us know that there is a source code required for this particular task.</span>
			</cfif>
		</div>
		</div>
	
	
		<div class="form-group hidden">
		    <label class="control-label col-sm-3" for="inputListCheck">List Request:</label>
	  <div class="col-sm-9">
		<div class="checkbox">
		        <label>
		          <input type="checkbox" id="inputListCheck" name="listCheck" value="1"> Yes, this requires a list request. 
		        </label>
		      </div>
		
		<span class="help-block">This is not requesting a list! This is letting us know that there is a list required for this particular task.</span>
		
			<div class="form-group list-bool alert alert-info additional-question">
			    <label class="control-label col-sm-7" for="inputListRequest">Has the List Been Requested?</label>
			    <div class="col-sm-5">
					<div class="row">
						<div class="col-sm-6 no-padding">
							<div class="radio">
							  <label class="radio-inline">
							    <input type="radio" name="listRequest" id="listTrue" value="1">
							    Yes
							  </label>
							</div>
						</div>
		  				<div class="col-sm-6 no-padding">
		  					<div class="radio">
			  				  <label class="radio-inline">
			  				    <input type="radio" name="listRequest" id="listFalse" value="0">
			  				   No
			  				  </label>
			  				</div>
		  				</div>
					</div>
				</div>
			</div>
			
			<div class="form-group list-input alert alert-info additional-question">
			    <label class="control-label col-sm-4" for="inputListName">List Name:</label>
			    <div class="col-sm-8">
			      <input type="text" name="listName" id="inputListName" placeholder="ex: 101010-FolUpEmail-List"  class="form-control">
					<span class="help-block">Include the list name if you have it.</span>
			    </div>
			</div>
			

		    </div>
		  </div>
		<div class="form-group">
		    <label class="control-label col-sm-3" for="inputProjectType">Budgeted:</label>
		    <div class="col-sm-9">
				<div class="row">
					<div class="col-sm-6 no-padding">
						<div class="radio ">
						  <label>
						    <input type="radio" name="budgetedRadios" id="yesBudget" value="1">
						   		Yes, it's in the budget
						  </label>
						</div>
					</div>
					<div class="col-sm-6 no-padding">	
						<div class="radio" >
						  <label >
						    <input type="radio" name="budgetedRadios" id="noBudget" value="0">
						    	No, it's not
						  </label>
						</div>
					</div>
					<span class="help-block">Please let us know if this project was budgeted for the current fiscal year.</span>
				</div>
			</div>
		</div>

	<div class="form-group budget">
	    <label class="control-label col-sm-3" for="inputBudget">Budget Amount:</label>
	    <div class="col-sm-9">
			<div class="input-group">
				<span class="input-group-addon">$</span>
	      		<input type="text" name="budget" id="inputBudget" placeholder="ex: 5000" class="form-control" onkeypress="return isNumberKey(event)">
				<span class="input-group-addon">.00</span>
			</div>
	
		<span class="help-block">Provide the budget for this project in a dollar amount.</span>
	    </div>
	  </div>
	
	<div class="form-group">
	    <label class="control-label col-sm-3" for="inputAccounting">Accounting Code:</label>
	    <div class="col-sm-9 ">
			<div class="row ">
				<div class="col-xs-6 no-padding">
				<label>Revenue</label>
				
				<select name="accountingRevenue" id="accountingRevenue" class="form-control">
						
						<cfoutput query ="pmgAccountingCode">
							<option value="#code#"<cfif code EQ "915"> selected="selected"</cfif>>#code# #company#</option>
						</cfoutput>
			      </select>
				</div>
				<div class="col-xs-6 no-padding">
				<label>Product Line</label>
				<select name="accountingProduct" id="accountingProduct" class="form-control">
						<option value="" selected="selected">Select Below</option>	
						<cfoutput query ="pmgAccountingCodeProductLine"><option value="#code#">#code# #productLine#</option></cfoutput>
			      </select>
				</div>
			</div>
			
		<span class="help-block">Provide the department's accounting code for billing costs of the project.</span>
	    </div>
	  </div>
	
	<div class="form-group">
	    <label class="control-label col-sm-3" for="inputURL">Approvals:</label>
	    <div class="col-sm-9">
	      <input type="text" name="approval" id="inputApproval" placeholder="ex: Jane Doe, Joe Smith, etc." class="form-control" required="true">
		<span class="help-block">Who needs to approve this project? Please provide the <strong>full name</strong> of each person who needs to approve this item. Consider <strong>all</strong> steps of approval and separate names by commas.</span>
	    </div>
	  </div>
	
	
	
	<div class="form-group">
	    <label class="control-label col-sm-3" for="inputDueDate">Piece Due Date:</label>
	    <div class="col-sm-9">
	      <input type="datetime" name="dueDatePiece" id="datepicker-piece" maxlength="12" placeholder="ex: MM/DD/YYYY" required="yes" class="form-control" onkeypress="return isNumberKey(event);">
			<span class="help-block">Please select your required due date for this project understanding that we appreciate as much lead time as possible due to current workload. All projects should be initialized <strong>a minimum of two (2) weeks prior</strong> to the final due date. Project completion may vary based on the complexity of your request and available resources.<strong>Only put dates in this field! Notes should be in the Additional Details field.</strong></span>
			<div class="alert alert-warning">
				<p>If this is a RUSH project, please complete this form as fully as possible, then call us to discuss how we can expedite your requested deliverable.</p>
			</div>
			<div class="alert alert-danger time-span additional-question">
				<p>For this rush request please contact Ben White at ext. <strong>1531</strong> or <strong><a href="mailto:ben.white@pearlcompanies.com">ben.white@pearlcompanies.com</a></strong> to discuss project needs and deadlines.</p>
				
				
				<div class="form-group">
				    <label class="control-label col-sm-3" for="RushReason">Reason:</label>
				    <div class="col-sm-9">
				      <textarea name="rushReason" id="RushReason" class="form-control" required="true">
					</textarea>
					<span class="help-block">Please provide your reason for this rush request.</span>
					
				    </div>
				  </div>
				  
				  
				</div>
	    </div>
	  </div>

	 <div class="form-group">
	    <div class="col-sm-9 col-sm-offset-3">
			<button type="submit" class="btn btn-primary">Add Item &raquo; </button>
		</div>
	  </div>


			</form>
</div>