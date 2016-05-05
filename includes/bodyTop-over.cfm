<body class="form<cfoutput><cfif url.pm NEQ '' OR session.pm NEQ ''> pmg</cfif></cfoutput>">
	
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
		 <h5 class="navbar-text navbar-left">PMG <cfif url.pm EQ "" or url.pm EQ "0"  > Member<cfelse> Project Manager</cfif> Form</h5>
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
			<h1>Marketing Project Overview</h1>
			</div>
	
	</div>
</div>

