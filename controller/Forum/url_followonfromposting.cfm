<cfsetting enablecfoutputonly="Yes">
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="$RCSfile: url_followonfromposting.cfm,v $" language="ColdFusion 5" version="2.0">
	<responsibilities>
		I redirect after posting the message to the given thread
	</responsibilities>
	<properties>
		<history author="Kevin Roche" email="kevin@objectiveinternet.com" date="13-Oct-2004" role="Architect" type="Create" />
		<property name="copyright" value="(c)2004 Objective Internet Limited." />
		<property name="licence" value="Licensed under the Apache License, Version 2.0  See licence.txt" />
		<property name="version" value="$Revision: 1.4 $" />
		<property name="lastupdated" value="$Date: 2007/06/14 16:52:20 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<string name="XFA.ForumsShowThread" scope="variables" />
			<string name="XFA.ForumsThreads" scope="variables" />
			<string name="XFA.ForumsHome" scope="variables" />
			<number name="categoryid" scope="attributes" />
			<number name="threadid" scope="attributes" />
		</in>
		<out>
			<string name="fuseaction" scope="formOrUrl" />
		</out>
	</io>
</fusedoc>
--->

<cfif isDefined("attributes.threadid")>
	<cfset variables.url="fuseaction=#XFA.Show_Thread#&threadid=#attributes.threadid#">
<cfelseif isDefined("attributes.categoryid")>
	<cfset variables.url="fuseaction=#XFA.Threads#&categoryid=#attributes.categoryid#">
<cfelse>
	<cfset variables.url="fuseaction=#XFA.Forum_Home#">
</cfif>

<cflocation url="#request.self#?#variables.url#" addtoken="no">

<!---
$Log: url_followonfromposting.cfm,v $
Revision 1.4  2007/06/14 16:52:20  kevin
Remove specific comments

Revision 1.3  2007/06/14 16:38:35  kevin
Copyright statement

Revision 1.2  2007/06/14 14:00:59  kevin
Initial Open Source Version

Revision 1.4  2005/05/27 15:37:07  mike
bug fix: missing "&"

Revision 1.3  2005/05/26 12:23:25  mike
use xfa's everywhere

Revision 1.2  2005/05/24 13:28:16  mike
simplify the coding and fusedoc

Revision 1.1  2005/05/05 12:26:11  mike
Initial FB4 Version

Revision 1.1  2004/11/09 13:36:45  kevin
Break out post new thread process into separate fuses.
 --->
<cfsetting enablecfoutputonly="No"> 
 