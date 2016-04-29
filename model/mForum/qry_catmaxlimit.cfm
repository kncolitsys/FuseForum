<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="qry_catmaxlimit.cfm">
	<responsibilities>
		I check against the message limit for this forum
	</responsibilities>
	<properties>
		<history author="Mike Oakes" email="mike@objectiveinternet.com" date="01-Nov-2004" role="Architect" type="Create" />
		<property name="copyright" value="(c)2004 Objective Internet Limited." />
		<property name="licence" value="Licensed under the Apache License, Version 2.0  See licence.txt" />
		<property name="version" value="$Revision: 1.4 $" />
		<property name="lastupdated" value="$Date: 2007/06/14 16:52:21 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<string name="XFA.Abort" scope="attributes" />
			<number name="categoryid" scope="attributes" />
		</in>
		<out>
			<string name="fuseaction" scope="formOrUrl" />
		</out>
	</io>
</fusedoc>
--->

<cfinvoke component="#Application.ao__AppObj_mForumFacade_Forum_Facade#"
	method="fCountForumMessages"
	categoryid="#attributes.categoryid#"
	returnvariable="maxlimit">
 <cfif isNumeric(maxlimit.messagelimit)
 		AND (maxlimit.messagelimit NEQ 0)
		AND (maxlimit.messagelimit LTE maxlimit.numberofmessages)>
	<cflocation url="#request.self#?fuseaction=#attributes.XFA.Abort#&categoryid=#attributes.categoryid#" addtoken="no">
</cfif>

<!--- 
$Log: qry_catmaxlimit.cfm,v $
Revision 1.4  2007/06/14 16:52:21  kevin
Remove specific comments

Revision 1.3  2007/06/14 16:38:34  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:11  kevin
Initial Open Source Version

Revision 1.9  2006/08/11 12:50:07  mike
change cfc objects from Server to Application scope

Revision 1.8  2006/07/24 13:14:33  kevin
Remove unwanted SQL

Revision 1.7  2006/06/23 17:43:42  mike
new naming convention for cfc objects

Revision 1.6  2005/12/02 17:27:48  mike
DSN => ForumDSN

Revision 1.5  2005/06/21 09:14:21  mike
pass categoryid

Revision 1.4  2005/05/21 10:17:52  mike
correct path for Forum_Facade.cfc

Revision 1.3  2005/05/20 12:40:56  kevin
New server cfc naming convention

Revision 1.2  2005/05/06 13:03:33  mike
recode to call methods in Forum_Facade.cfc, etc.

Revision 1.1  2005/05/05 12:29:26  mike
Initial FB4 Version

Revision 1.6  2004/11/22 12:15:55  mike
addtoken="no"

Revision 1.5  2004/11/07 14:32:04  mike
remove special treatment of attributes.cat

Revision 1.4  2004/11/04 18:49:28  mike
small edits

Revision 1.3  2004/11/02 15:24:13  mike
added fusedoc, etc.

Revision 1.2  2004/11/02 15:22:44  mike
added fusedoc, etc.
--->
</cfsilent>
