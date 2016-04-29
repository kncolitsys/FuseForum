<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="act_subscriptions.cfm">
	<responsibilities>
		I unsubscribe the user from the forums and/or threads given in the lists.
	</responsibilities>
	<properties>
		<history author="Mike Oakes" email="mike@objectiveinternet.com" date="20-May-2005" role="Architect" type="Create" />
		<property name="copyright" value="(c)2004 Objective Internet Limited." />
		<property name="licence" value="Licensed under the Apache License, Version 2.0  See licence.txt" />
		<property name="version" value="$Revision: 1.4 $" />
		<property name="lastupdated" value="$Date: 2007/06/14 16:52:21 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<list name="ForumUnsubscribe" scope="attributes" optional="Yes" >
				<number precision="Integer" comments="Id of a forum_subscriptions record."/>
			</list>
			<list name="ThreadUnsubscribe" scope="attributes" optional="Yes" >
				<number precision="Integer" comments="Id of a subscriptions record."/>
			</list>
		</in>
		<out>
		</out>
	</io>
</fusedoc>
--->
<cfif isDefined("attributes.ForumUnsubscribe") AND ListLen(attributes.ForumUnsubscribe)>
	<!--- unsubscribe from these forums --->
	<cfset variables.temp=Application.ao__AppObj_forum_subscriptions_Gateway.deleteSelectedBySubscriptions(attributes.ForumUnsubscribe)>
</cfif>

<cfif isDefined("attributes.ThreadUnsubscribe") AND ListLen(attributes.ThreadUnsubscribe)>
	<!--- unsubscribe from these threads --->
	<cfset variables.temp=Application.ao__AppObj_subscriptions_Gateway.deleteSelectedBySubscriptions(attributes.ThreadUnsubscribe)>
</cfif>
<!--- 
$Log: act_subscriptions.cfm,v $
Revision 1.4  2007/06/14 16:52:21  kevin
Remove specific comments

Revision 1.3  2007/06/14 16:38:34  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:10  kevin
Initial Open Source Version

Revision 1.7  2006/08/11 12:50:07  mike
change cfc objects from Server to Application scope

Revision 1.6  2006/07/24 13:14:33  kevin
Remove unwanted SQL

Revision 1.5  2006/06/23 17:43:42  mike
new naming convention for cfc objects

Revision 1.4  2005/12/02 17:27:48  mike
DSN => ForumDSN

Revision 1.3  2005/05/26 15:24:47  mike
improve fusedoc

Revision 1.2  2005/05/21 10:44:26  mike
final working version

Revision 1.1  2005/05/20 18:30:00  mike
new file
--->
</cfsilent>

