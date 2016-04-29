<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="qry_forumsubscribe.cfm">
	<responsibilities>
		I check whether the user is subscribed to the forum.
	</responsibilities>
	<properties>
		<history author="Mike Oakes" email="mike@objectiveinternet.com" date="19-May-2005" role="Architect" type="Create" />
		<property name="copyright" value="(c)2004 Objective Internet Limited." />
		<property name="licence" value="Licensed under the Apache License, Version 2.0  See licence.txt" />
		<property name="version" value="$Revision: 1.4 $" />
		<property name="lastupdated" value="$Date: 2007/06/14 16:52:21 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<number name="userid" scope="request" />
			<number name="categoryid" scope="attributes" />
		</in>
		<out>
			<recordset name="checkexisting" scope="variables" format="CFML">
				<number name="recordid"/>
			</recordset>
		</out>
	</io>
</fusedoc>
--->
<cfinvoke component="#Application.ao__AppObj_mForum_forum_subscriptions_Gateway#"
	method="findSelected"
	fs_name_id="#request.userid#"
	fs_forum_id="#attributes.categoryid#"
	returnvariable="checkexisting">
<!--- <cfoutput>in qry_forumsubscribe.cfm<br></cfoutput> 
<cfdump var="#attributes#">
<cfdump var="#checkexisting#">--->
<!--- <cfabort> --->

<!--- 
$Log: qry_forumsubscribe.cfm,v $
Revision 1.4  2007/06/14 16:52:21  kevin
Remove specific comments

Revision 1.3  2007/06/14 16:38:34  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:11  kevin
Initial Open Source Version

Revision 1.6  2006/08/11 12:50:07  mike
change cfc objects from Server to Application scope

Revision 1.5  2006/07/24 13:14:33  kevin
Remove unwanted SQL

Revision 1.4  2006/06/23 17:43:42  mike
new naming convention for cfc objects

Revision 1.3  2005/12/02 17:27:48  mike
DSN => ForumDSN

Revision 1.2  2005/05/20 18:52:18  mike
ongoing edits

Revision 1.1  2005/05/20 11:36:14  mike
new file

--->
</cfsilent>
