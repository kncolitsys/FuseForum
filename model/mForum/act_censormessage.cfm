<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="$RCSfile: act_censormessage.cfm,v $" language="ColdFusion 5" version="2.0">
	<responsibilities>
		I check a message to see if it contains any bad words and set the block flag to true (1) or false (0).
	</responsibilities>
	<properties>
		<history author="Kevin Roche" email="kevin@objectiveinternet.com" date="13-Oct-2004" role="Architect" type="Create" />
		<property name="copyright" value="(c)2004 Objective Internet Limited." />
		<property name="licence" value="Licensed under the Apache License, Version 2.0  See licence.txt" />
		<property name="version" value="$Revision: 1.4 $" />
		<property name="lastupdated" value="$Date: 2007/06/14 16:52:21 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<boolean name="censorship" scope="request" comments="Set to yes if censorship is required." />
			<datetime name="longtimespan" scope="request" comments="Cache time setting." />
			<string name="message" scope="attributes" comments="text of message to be checked." />
		</in>
		<out>
			<boolean name="block" scope="variables" comments="True if message conatins bad words" />
		</out>
	</io>
</fusedoc>
--->
<cfset block = 0>
<cfif request.censorship>
	
	<cfset forbiddenwords=Application.ao__AppObj_mForum_vulgarity_Gateway.findAll()>

	<cfloop query="forbiddenwords">
		<cfif findnocase(vulgarity,attributes.message)>
			<cfset attributes.message=replacenocase(attributes.message,vulgarity,"<span class='vulgarity'>#forbiddenwords.vulgarity#</span>","all")>
			<cfset block = 1>
		</cfif>
	</cfloop>
</cfif>
<!---
$Log: act_censormessage.cfm,v $
Revision 1.4  2007/06/14 16:52:21  kevin
Remove specific comments

Revision 1.3  2007/06/14 16:38:34  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:10  kevin
Initial Open Source Version

Revision 1.7  2006/08/11 12:50:07  mike
change cfc objects from Server to Application scope

Revision 1.6  2006/07/21 09:53:49  kevin
Trafalgar Conversion, Remove Old SQL.

Revision 1.5  2006/06/23 17:43:41  mike
new naming convention for cfc objects

Revision 1.4  2005/12/02 17:27:47  mike
DSN => ForumDSN

Revision 1.3  2005/05/20 12:40:56  kevin
New server cfc naming convention

Revision 1.2  2005/05/05 12:48:26  mike
recode to call methods in Forum_Facade.cfc

Revision 1.1  2005/05/05 12:29:24  mike
Initial FB4 Version

Revision 1.1  2004/11/09 13:33:34  kevin
Break out post new thread process into separate fuses.
 --->
</cfsilent>
 