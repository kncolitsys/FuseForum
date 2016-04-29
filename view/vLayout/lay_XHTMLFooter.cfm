<cfsetting enablecfoutputonly="Yes">
<!--- -->
<fusedoc fuse="$RCSfile: lay_XHTMLFooter.cfm,v $" language="ColdFusion 5.0" version="2.0">
	<responsibilities>
		I display the XHTML Footer for the page.
	</responsibilities>
	<properties>
		<history author="Kevin Roche" email="kevin@objectiveinternet.com" date="29-Oct-2004" role="Architect" type="Create" />
		<property name="copyright" value="(c)2004 Objective Internet Limited." />
		<property name="licence" value="Licensed under the Apache License, Version 2.0  See licence.txt" />
		<property name="version" value="$Revision: 1.4 $" />
		<property name="lastupdated" value="$Date: 2007/06/14 16:52:20 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
		</in>
		<out>
		</out>
	</io>
</fusedoc>
--->
<cfoutput>
<!--- <cfdump var="#cgi#"> --->
<cfif cgi.HTTP_USER_AGENT CONTAINS "W3C_Validator" OR HTTP_USER_AGENT CONTAINS "Bobby">
	<cfsetting showdebugoutput="No">
<cfelseif ListFind("127.0.0.1",cgi.REMOTE_HOST)>
	<cfset variables.url="http://127.0.0.1"><!--- To make the external validator work you will have to set the remote domain or IP address for the server --->
	<cfset variables.url=variables.url & cgi.path_info>
	<cfif Len(cgi.query_string)>
		<cfset variables.url=variables.url & "?" & cgi.query_string>
	</cfif>
	<br /><br />
	<a href="http://bobby.watchfire.com/bobby/bobbyServlet?URL=#URLEncodedFormat(variables.url)#&gl=wcag1-aaa&test=" target="_blank">Bobby Validation</a><br />
	<a href="http://validator.w3.org/check?uri=#URLEncodedFormat(variables.url)#" target="_blank">XHTML Validation</a>
</cfif>
</body>
</html>
</cfoutput>
<!---
$Log: lay_XHTMLFooter.cfm,v $
Revision 1.4  2007/06/14 16:52:20  kevin
Remove specific comments

Revision 1.3  2007/06/14 16:38:35  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:47  kevin
Initial Open Source Version

Revision 1.2  2005/05/13 16:58:02  kevin
Add debug code

Revision 1.1  2005/05/10 12:30:30  kevin
Initial File

 --->
<cfsetting enablecfoutputonly="No">