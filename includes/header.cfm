<cfparam name="url.success" default="">
<cfparam name="url.timeout" default="">
<cfparam name="url.pm" default="">	
<cfparam name="url.iframe" default="">
<cfparam name="session.pm" default="">	
<cfparam name="session.iframe" default="">	
<cfparam name="url.recordID" default="">	
<cfparam name="pageName" default=#listlast(cgi.script_name,"/")#>
	
<cfset session.progress = '0'>
	
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Marketing Web Project Request</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Le styles -->
    <link href="../bootstrap3/css/bootstrap.min.css" rel="stylesheet">
	<link href="../bootstrap3/css/bootstrap-datetimepicker.min.css" rel="stylesheet">
	<link href="../bootstrap3/css/bootstrap-emtype.css" rel="stylesheet">
	<link href="../bootstrap3/css/icon-styles.css" rel="stylesheet">
	<link href="../bootstrap3/css/jquery.fileupload.css" rel="stylesheet">
	<link href="css/styles.css" rel="stylesheet">
	
	

	
	
    <!-- HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

	<!--[if IE 7]>
	<link href="../bootstrap3/css/ie7.css" rel="stylesheet">
	<![endif]-->
	
	<!--[if IE 8]>
	<link href="../bootstrap3/css/ie8.css" rel="stylesheet">
	<![endif]-->

	<cfif url.pm EQ '1'>
    <!-- Fav and touch icons -->
    <link rel="apple-touch-icon-precomposed" sizes="144x144" href="ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="ico/apple-touch-icon-114-precomposed.png">
      <link rel="apple-touch-icon-precomposed" sizes="72x72" href="ico/apple-touch-icon-72-precomposed.png">
                    <link rel="apple-touch-icon-precomposed" href="ico/apple-touch-icon-57-precomposed.png">
                                   <link rel="shortcut icon" href="ico/favicon.png">

	<cfelse>
	<link rel="apple-touch-icon-precomposed" sizes="144x144" href="ico/apple-touch-icon-144-precomposed.png">
    <link rel="apple-touch-icon-precomposed" sizes="114x114" href="ico/apple-touch-icon-114-precomposed.png">
      <link rel="apple-touch-icon-precomposed" sizes="72x72" href="ico/apple-touch-icon-72-precomposed.png">
                    <link rel="apple-touch-icon-precomposed" href="ico/apple-touch-icon-57-precomposed.png">
                                   <link rel="shortcut icon" href="ico/favicon.png">
	</cfif>
	
	
	<script src="//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
	<script type="text/javascript">

	function getParameterByName(name)
	{
	  name = name.replace(/[\[]/, "\\\[").replace(/[\]]/, "\\\]");
	  var regexS = "[\\?&]" + name + "=([^&#]*)";
	  var regex = new RegExp(regexS);
	  var results = regex.exec(window.location.search);
	  if(results == null)
	    return "";
	  else
	    return decodeURIComponent(results[1].replace(/\+/g, " "));
	}
	
	function validate() {
		var e = document.webRequest.elements, m = ''; 
		
		function isEmail(email) { 
		    return /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/i.test(email);
		}
		
		
	//	if(!e['policyNumber'].value) {m += '~ Policy Number is required.\n';} 
	//	if(!e['pearlID'].value) {m += '~ Pearl ID is required.\n';} 
		if(!e['title'].value) {m += '~ Forgot a project title\n';} 
		if(!e['requestedBy'].value) {m += '~ Forgot your name\n';} 
		if(!e['requestedByEmail'].value) {m += '~ Forgot your email\n';} 
		if(!/.+@[^.]+(\.[^.]+)+/.test(e['requestedByEmail'].value)) {m += '~ This is not an email\n';} 
	//		if (isEmail(e['requestedByEmail'].value) == false){m += '~ This is not an email\n'; alert("no");} else { alert('This is email is valid');}
		if(!e['dueDate'].value) {m += '~ Forgot a due date\n';} 
		if(!e['details'].value) {m += '~ Forgot project details\n';} 
		if (!e['detailsRadios'].value) {m += '~ Forgot project type\n';} 
		if (!e['optionsRadios'].value) {m += '~ Forgot project type\n';} 
		
		if (!e['managerApproval'].value) {m += '~ Forgot to get Manager Approval\n';} 
		if (!e['managerName'].value) {m += '~ Forgot Manager Name\n';}
				
		if(m) {alert('The following error(s) occurred:\n\n' + m); return false;}return true;}
		
		
		function isNumberKey(evt)
		  {
		     var charCode = (evt.which) ? evt.which : event.keyCode
		     if (charCode > 31 && (charCode < 48 || charCode > 57) || charCode==46 )
		        return false;

		     return true;
		  }
		
	

	</script>
	
	<script>
	  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
	  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
	  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
	  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

	  ga('create', 'UA-58314908-1', 'auto');
	  ga('send', 'pageview');

	</script>


	</head>