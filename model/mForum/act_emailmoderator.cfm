<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="$RCSfile: act_emailmoderator.cfm,v $" language="ColdFusion 5" version="2.0">
	<responsibilities>
		I post the message to the given thread
	</responsibilities>
	<properties>
		<history author="Kevin Roche" email="kevin@objectiveinternet.com" date="13-Oct-2004" role="Architect" type="Create" />
		<property name="copyright" value="(c)2004 Objective Internet Limited." />
		<property name="licence" value="Licensed under the Apache License, Version 2.0  See licence.txt" />
		<property name="version" value="$Revision: 1.5 $" />
		<property name="lastupdated" value="$Date: 2007/06/14 16:52:21 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<string name="adminEmail" scope="request" />
			<recordset name="getapproved"
					   scope="variables" 
					   format="CFML" 
					   optional="Yes"
					   comments="Email address of the forum admininistrators. Only present when message needs approval">
				<string name="emailaddress"/>
			</recordset>
		</in>
		<out>
			<string name="fuseaction" scope="formOrUrl" />
		</out>
	</io>
</fusedoc>
--->
<cfif getapproved.recordcount GT 0>
	<cfset emailto = "">
	<cfloop query="getapproved">
		<!--- send the email to the moderator's preferred address --->
		<cfset variables.emailto = ListAppend(variables.emailto,getapproved.emailaddress)>
	</cfloop>
<cfelse>
	<cfset variables.emailto = request.adminEmail>
</cfif>
<cfif Len(variables.emailto)><!--- check added 3Nov04 --->
	
	<cfmail from="#request.adminEmail#"
			to="#variables.emailto#"
			subject="New message approval required">

	A new message has been posted in one of your moderation forums.
	Please proceed to the moderation area to approve or reject this message
	before it appears on the forum.

	</cfmail>
	
</cfif>
<!---
$Log: act_emailmoderator.cfm,v $
Revision 1.5  2007/06/14 16:52:21  kevin
Remove specific comments

Revision 1.4  2007/06/14 16:38:33  kevin
Copyright statement

Revision 1.3  2007/06/14 15:07:14  kevin
single email address

Revision 1.2  2007/06/14 14:01:10  kevin
Initial Open Source Version

Revision 1.2  2005/05/05 12:47:57  mike
improve fusedoc

Revision 1.1  2005/05/05 12:29:24  mike
Initial FB4 Version

Revision 1.1  2004/11/09 13:33:34  kevin
Break out post new thread process into separate fuses.
 --->
</cfsilent>
