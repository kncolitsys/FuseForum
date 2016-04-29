<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="qry_subscriptions.cfm">
	<responsibilities>
		I get the user's subscriptions to forums and threads
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
		</in>
		<out>
			<recordset name="forum_subs_summary" scope="variables" format="CFML">
				<number name="fs_id"/>
				<number name="fs_forum_id"/>
				<string name="categoryname"/>
			</recordset>
			<recordset name="subs_summary" scope="variables" format="CFML">
				<number name="threadid"/>
				<number name="recordid"/>
				<string name="categoryname"/>
				<string name="threadname"/>
				<datetime name="datelastpost"/>
				<number name="messagecount"/>
			</recordset>
		</out>
	</io>
</fusedoc>
--->

<cfparam name="attributes.sortkey" default="categoryname">
<cfparam name="attributes.forumsortasc" default="ASC">
<cfparam name="attributes.threadsortasc" default="ASC">

<cfif request.userid NEQ 0><!--- the user is logged in, so get their subscriptions --->
	
	<cfinvoke component="#Application.ao__AppObj_mForumFacade_Forum_Facade#"
		method="findForumSubscriptionsOfUser"
		userid="#request.userid#"
		orderby="categories.categoryname #attributes.forumsortasc#"
		returnvariable="forum_subs_summary">

	<cfinvoke component="#Application.ao__AppObj_mForumFacade_Forum_Facade#"
		method="findSubscriptionsOfUser"
		userid="#request.userid#"
		orderby="#attributes.sortkey# #attributes.threadsortasc#"
		returnvariable="subs_summary">
</cfif>

<!--- 
$Log: qry_subscriptions.cfm,v $
Revision 1.4  2007/06/14 16:52:21  kevin
Remove specific comments

Revision 1.3  2007/06/14 16:38:33  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:12  kevin
Initial Open Source Version

Revision 1.8  2006/08/11 12:50:07  mike
change cfc objects from Server to Application scope

Revision 1.7  2006/07/24 13:14:33  kevin
Remove unwanted SQL

Revision 1.6  2006/06/23 17:43:42  mike
new naming convention for cfc objects

Revision 1.5  2005/12/02 17:27:48  mike
DSN => ForumDSN

Revision 1.4  2005/05/21 11:39:15  mike
sort-by-column behaviour now ok

Revision 1.3  2005/05/21 10:17:53  mike
correct path for Forum_Facade.cfc

Revision 1.2  2005/05/20 18:52:37  mike
ongoing edits

Revision 1.1  2005/05/20 11:36:54  mike
new file

--->
</cfsilent>

