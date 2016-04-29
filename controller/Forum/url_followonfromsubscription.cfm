<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="url_followonfromsubscription.cfm">
	<responsibilities>
		I subscribe or unsubscribe the user to/from the threads given in the list.
	</responsibilities>
	<properties>
		<history author="Mike Oakes" email="mike@objectiveinternet.com" date="01-Nov-2004" role="Architect" type="Create" />
		<property name="copyright" value="(c)2004 Objective Internet Limited." />
		<property name="licence" value="Licensed under the Apache License, Version 2.0  See licence.txt" />
		<property name="version" value="$Revision: 1.4 $" />
		<property name="lastupdated" value="$Date: 2007/06/14 16:52:20 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<string name="XFA.ForumsMyMessages" scope="variables" />
			<string name="XFA.ForumsShowThread" scope="variables" />
			<number name="act" scope="attributes" />
			<number name="threadid" scope="attributes" />
			<boolean name="stop" scope="attributes" optional="Yes" />
		</in>
		<out>
			<string name="fuseaction" scope="formOrUrl" />
			<number name="threadid" scope="formOrUrl" />
		</out>
	</io>
</fusedoc>
--->
<cfif attributes.act is "u">
	<cfset variables.url="fuseaction=#XFA.ForumsMyMessages#">
<cfelse>
   <cfset variables.url="fuseaction=#XFA.ForumsShowThread#&threadid=#attributes.threadid#">
</cfif>
<cfif NOT isdefined("attributes.stop")>
	<cflocation url="#request.self#?#variables.url#" addtoken="no">
</cfif>

<!--- 
$Log: url_followonfromsubscription.cfm,v $
Revision 1.4  2007/06/14 16:52:20  kevin
Remove specific comments

Revision 1.3  2007/06/14 16:38:35  kevin
Copyright statement

Revision 1.2  2007/06/14 14:00:59  kevin
Initial Open Source Version

Revision 1.2  2005/05/26 12:23:25  mike
use xfa's everywhere

Revision 1.1  2005/05/26 10:50:10  mike
moved here from mForumFacade

Revision 1.2  2005/05/20 08:51:37  mike
correct fuse name

Revision 1.1  2005/05/05 12:29:28  mike
Initial FB4 Version

Revision 1.1  2004/11/09 13:33:34  kevin
Break out post new thread process into separate fuses.

Revision 1.4  2004/11/07 14:32:44  mike
small edits

Revision 1.3  2004/11/04 18:53:32  mike
small correction to fusedoc

Revision 1.2  2004/11/02 14:41:10  mike
added fusedoc, etc.
--->
</cfsilent>

