<cfsilent>
<!--- -->
<fusedoc fuse="$RCSfile: lay_XHTMLHeader.cfm,v $" language="ColdFusion 6.1" version="2.0">
	<responsibilities>
		I display the XHTML Header for the page.
	</responsibilities>
	<properties>
		<history author="Kevin Roche" email="kevin@objectiveinternet.com" date="10-May-2005" role="Architect" type="Create" />
		<property name="copyright" value="(c)2004 Objective Internet Limited." />
		<property name="licence" value="Licensed under the Apache License, Version 2.0  See licence.txt" />
		<property name="version" value="$Revision: 1.4 $" />
		<property name="lastupdated" value="$Date: 2007/06/14 16:52:20 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<string name="page.title" scope="request" optional="Yes"/>
			<string name="page.subtitle" scope="request" optional="Yes"/>
			<string name="page.stylesheet" scope="request" optional="Yes"/>
			<string name="page.javascript" scope="request" optional="Yes"/>
			<string name="siteKeywords" scope="request"/>
			<string name="baseHREF" scope="request"/>
			<string name="ColdFusion.ProductName" scope="server"/>
			<string name="ColdFusion.ProductVersion" scope="server"/>
		</in>
		<out>
			
		</out>
	</io>
</fusedoc>
--->
</cfsilent>
<cfset ExpiryDate = CreateDate(year(now()),  month(now()),  day(now()))>
<cfset ExpiryTime = CreateTime(hour(now()),  minute(now()),  second(now()))>

<cfset ExpiryTimeString = dateFormat(ExpiryDate,"ddd") & ", " & dateFormat(ExpiryDate,"dd mmm yyyy") & " " & timeFormat(ExpiryTime,"HH:mm:ss") & " GMT">
<cfoutput>
<cfcontent reset="yes"><!--- <?xml version="1.0" encoding="utf-8"?> --->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<!--- <!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"> --->
<head>
	
	<base href="#request.baseHREF#" /> 
	<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
	<meta name="Description" content="FuseForum." />
	<meta name="keywords" content="#request.siteKeywords#" />
	<meta name="author" content="Objective Internet Limited, Basingstoke, United Kingdom. 01256 338 490" />
	<meta name="generator" content="Adobe #server.ColdFusion.ProductName# #server.ColdFusion.ProductVersion#" />
	<meta name="copyright" content="&copy; 2005 Objective Internet" />
	<meta content="text/html; charset=utf-8" http-equiv="Content-Type" />
	<meta http-equiv="Express" content="-1" />
	<!--- <meta http-equiv="Expires" content="#ExpiryTimeString#" /> --->
	<link rel="SHORTCUT ICON" href="" />
	<link rel="ICON" href="" type="image/x-icon">
	
	<!-- CSS -->
	<cfif NOT isdefined("url.nocss")>
		
		<link href="css/base.css" rel="stylesheet" type="text/css" media="screen" />
		<link href="css/menu.css" rel="stylesheet" type="text/css" media="screen" />
		<link href="css/vertical.css" rel="stylesheet" type="text/css" media="screen" >
		<link href="css/fonts.css" rel="stylesheet" type="text/css" media="screen" />
		<link href="css/base_print.css" rel="stylesheet" type="text/css" media="print" />
		<link href="css/fonts_print.css" rel="stylesheet" type="text/css" media="print" />
		<link href="css/cms.css" rel="stylesheet" type="text/css" />
		<link href="css/footer_menu.css" rel="stylesheet" type="text/css" />
		<!-- JAVASCRIPT -->
		<script src="javascript/base.js" type="text/javascript"></script>
		<script src="javascript/utility.js" type="text/javascript"></script>
		<script src="javascript/cssmenus.js" type="text/javascript"></script>
		<script src="javascript/findmea.js" type="text/javascript"></script>
		<script src="javascript/footer_menu.js" type="text/javascript"></script>
	</cfif>
	<title>
	<cfif isDefined("request.page.title") AND trim(request.page.title IS NOT "")>#request.page.title# - </cfif>
	<cfif isDefined("request.page.subtitle") AND trim(request.page.subtitle IS NOT "")>#request.page.subtitle#</cfif>
	</title>
	<cfif isDefined("request.page.stylesheet") AND len(request.page.stylesheet NEQ 0)>#request.page.stylesheet#<cfelse>
		
	</cfif>
	<cfif isDefined("request.page.javascript") AND len(request.page.javascript NEQ 0)>#request.page.javascript#</cfif>
</head>
<body>
</cfoutput>
<cfsilent>
<!--- 
$Log: lay_XHTMLHeader.cfm,v $
Revision 1.4  2007/06/14 16:52:20  kevin
Remove specific comments

Revision 1.3  2007/06/14 16:38:35  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:47  kevin
Initial Open Source Version

Revision 1.6  2005/10/06 16:32:49  bob
Add link rel="ICON"

Revision 1.5  2005/08/10 14:28:24  bob
CR2.1 - Include footer_menu.css and footer_menu.js

Revision 1.4  2005/06/30 15:51:34  kevin
Add Stylesheet for new serendipity.

Revision 1.3  2005/06/06 13:32:17  kevin
Separate out Interakt files

Revision 1.2  2005/05/12 16:37:25  kevin
Stylesheet cahnges for print support

Revision 1.1  2005/05/10 12:30:30  kevin
Initial File

 --->
</cfsilent>
