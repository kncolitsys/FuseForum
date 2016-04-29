<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="act_forumunsubscribe.cfm">
	<responsibilities>
		I unsubscribe the user from the given forum.
	</responsibilities>
	<properties>
		<history author="Mike Oakes" email="mike@objectiveinternet.com" date="19-May-2005" role="Architect" type="Create" />
		<property name="copyright" value="(c)2004 Objective Internet Limited." />
		<property name="licence" value="Licensed under the Apache License, Version 2.0  See licence.txt" />
		<property name="version" value="$Revision: 1.3 $" />
		<property name="lastupdated" value="$Date: 2007/06/14 16:38:34 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<number name="categoryid" scope="attributes" />
		</in>
		<out>
		</out>
	</io>
</fusedoc>
--->

<cfif isDefined("attributes.categoryid") AND isNumeric(attributes.categoryid)>
	<!--- unsubscribe from this forum --->
	<cfset variables.temp=Application.ao__AppObj_mForum_forum_subscriptions_Gateway.deleteSelectedByForum(attributes.categoryid)>
</cfif>
<!--- 
$Log: act_forumunsubscribe.cfm,v $
Revision 1.3  2007/06/14 16:38:34  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:10  kevin
Initial Open Source Version

Revision 1.6  2006/08/11 12:50:07  mike
change cfc objects from Server to Application scope

Revision 1.5  2006/06/23 17:43:41  mike
new naming convention for cfc objects

Revision 1.4  2005/05/26 15:24:15  mike
improve fusedoc

Revision 1.3  2005/05/24 10:34:06  mike
complete rewrite, to unsubscribe from a SINGLE forum

Revision 1.2  2005/05/20 18:52:37  mike
ongoing edits

Revision 1.1  2005/05/20 11:36:04  mike
new file
--->
</cfsilent>

