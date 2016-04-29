<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="act_threadunsubscribe.cfm">
	<responsibilities>
		I unsubscribe the user from the threads given in the list.
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
			<list name="unsubscribe" scope="attributes" optional="Yes" >
				<number precision="Integer" comments="Id of a subscriptions record."/>
			</list>
		</in>
		<out>
			
		</out>
	</io>
</fusedoc>
--->
<cfif isDefined("attributes.unsubscribe") AND ListLen(attributes.unsubscribe)>
	<!--- unsubscribe from these threads --->
	<cfset variables.temp=Application.ao__AppObj_mForum_subscriptions_Gateway.deleteSelectedBySubscriptions(attributes.unsubscribe)>
</cfif>
<!--- 
$Log: act_threadunsubscribe.cfm,v $
Revision 1.4  2007/06/14 16:52:21  kevin
Remove specific comments

Revision 1.3  2007/06/14 16:38:34  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:10  kevin
Initial Open Source Version

Revision 1.9  2006/08/11 12:50:07  mike
change cfc objects from Server to Application scope

Revision 1.8  2006/07/24 13:14:33  kevin
Remove unwanted SQL

Revision 1.7  2006/06/23 17:43:42  mike
new naming convention for cfc objects

Revision 1.6  2005/12/02 17:27:48  mike
DSN => ForumDSN

Revision 1.5  2005/05/20 12:40:56  kevin
New server cfc naming convention

Revision 1.4  2005/05/20 11:49:30  mike
improve fusedoc

Revision 1.3  2005/05/12 11:17:03  mike
bug fix: correct spelling error deleteSelectedBySubsciptions

Revision 1.2  2005/05/06 10:07:14  mike
recode to call methods in Forum_Facade.cfc etc.

Revision 1.1  2005/05/05 12:29:25  mike
Initial FB4 Version

Revision 1.2  2004/12/22 12:36:03  mike
bug fix: supply missing ")" character

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

