<cfapplication sessionmanagement="yes" setclientcookies="yes" name="pmgMarketingRequest" sessiontimeout="#CreateTimeSpan(0, 0, 60, 0)#">
	
<cfparam name="session.ID" default="">
	
<cfset pmg.email = 'marketing@pearlcompanies.com'>