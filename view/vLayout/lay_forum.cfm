<cfsetting enablecfoutputonly="Yes">
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="lay_forum.cfm">
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
		<property name="version" value="$Revision: 1.3 $" />
		<property name="lastupdated" value="$Date: 2007/06/14 16:38:35 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<string name="page.LHColumn" scope="request"/>
			<string name="page.breadcrumb" scope="request"/>
			<string name="page.pageContent" scope="request"/>
		</in>
		<out>
		</out>
	</io>
</fusedoc>
--->
<div id="col2">
	<div class="v_spacer"><!--- comment to make spacer work ---></div>
	<cfif isDefined("request.page.Content") AND len(request.page.Content) NEQ 0><cfoutput>#request.page.Content#</cfoutput></cfif>
</div>
<!--- 
$Log: lay_forum.cfm,v $
Revision 1.3  2007/06/14 16:38:35  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:47  kevin
Initial Open Source Version

Revision 1.4  2005/05/25 16:18:26  kevin
Fix spacing in breadcrumb

Revision 1.3  2005/05/21 11:29:43  kevin
Move various elements to separate fuses

Revision 1.2  2005/05/17 17:12:24  mike
correct fuse name

Revision 1.1  2005/05/10 12:30:30  kevin
Initial File

--->
<cfsetting enablecfoutputonly="No">
