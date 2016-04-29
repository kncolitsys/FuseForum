<cfsetting enablecfoutputonly="Yes">
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="lay_empty.cfm">
	<responsibilities>
		I create an empty page layout.
	</responsibilities>

	<properties>
		<history author="Kevin Roche"
				 email="kevin@objectiveinternet.com"
				 date="10-May-2005"
				 role="Architect"
				 type="Create" />
		<property name="copyright" value="(c)2005 Objective Internet Limited." />
		<property name="licence" value="Licensed under the Apache License, Version 2.0  See licence.txt" />
		<property name="version" value="$Revision: 1.4 $" />
		<property name="lastupdated" value="$Date: 2007/06/15 14:00:08 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<string name="page.pageContent" scope="request"/>
		</in>
		<out>
		</out>
	</io>
</fusedoc>
--->
<cfif isDefined("request.page.content") AND len(request.page.content NEQ 0)><cfoutput>#request.page.content#</cfoutput></cfif>
<!--- 
$Log: lay_empty.cfm,v $
Revision 1.4  2007/06/15 14:00:08  kevin
Add Admin Modules

Revision 1.3  2007/06/14 16:38:35  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:47  kevin
Initial Open Source Version

Revision 1.1  2005/05/10 12:30:30  kevin
Initial File

--->
<cfsetting enablecfoutputonly="No">
