<body class="form<cfoutput><cfif url.pm NEQ '' OR session.pm NEQ ''> pmg</cfif></cfoutput>">

	<!--[if lt IE 9]>
	    <div><p class="chromeframe text-center">You are using an <strong>outdated</strong> browser. Please <a href="http://browsehappy.com/">upgrade your browser</a> or <a href="http://www.google.com/chromeframe/?redirect=true">activate Google Chrome Frame</a> to improve your experience.</p></div>
	<![endif]-->

	
<cfif url.iframe EQ "" OR session.iframe EQ "">	
	<header id="branding" role="banner" class="navbar">
	<div class="row">
	<nav role="navigation">
	  <div class="wrap">
	    <!-- Brand and toggle get grouped for better mobile display -->
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#menu">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="index.cfm"><img src="img/logo.png"></a>
		 <h5 class="navbar-text navbar-left">PMG <cfif url.pm EQ "" or url.pm EQ "0"  > Marketing<cfelse> Project Manager</cfif> Form</h5>
	    </div>
		

	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="collapse navbar-collapse pull-right" id="menu">
	      <ul class="nav navbar-nav">
	      
	      
	      <ul class="nav navbar-nav navbar-right">
	        <li><a href="http://home.pearlinsurance.com/">Pearl IntraNet</a></li>
	      </ul>
		
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav>
	</div>
	</header>
</cfif>	


<div class="wrap">
<br>
<div class="row">
	<div class="col-xs-12">
	
			<div class="jumbotron">
			<h1>Marketing Project Request</h1>
			</div>
	
	</div>
</div>

<div class="row">
	<div class="col-xs-12">
		<h3><small>
		<cfif pageName EQ 'index.cfm'>Step 01
		<cfelseif pageName EQ 'step-02.cfm'>Step 02
		<cfelseif pageName EQ 'step-03.cfm'>Step 03
		<cfelseif pageName EQ 'step-04.cfm'>Step 04
		<cfelseif pageName EQ 'step-05.cfm'>Step 05
		<cfelse>Start Here</cfif>
		:</small> 
			<cfif pageName EQ 'index.cfm'>Contact &amp; Information
			<cfelseif pageName EQ 'step-02.cfm'>Add Marketing Items
			<cfelseif pageName EQ 'step-03.cfm'>Additional Information &amp; Terms Of Use
			<cfelseif pageName EQ 'step-04.cfm'>Summary Page &amp; Success!
			<cfelseif pageName EQ 'step-05.cfm'>Submission &amp; Success!
			
			<cfelse></cfif>
		</h3>
	
	
<div class="progress progress-striped active">
  <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="<cfoutput>#session.progress#</cfoutput>" aria-valuemin="0" aria-valuemax="100" style="width: <cfoutput>#session.progress#</cfoutput>%">
    <span class="sr-only"><cfoutput>#session.progress#</cfoutput> %</span>
  </div>
</div>
	</div>
</div>