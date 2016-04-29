<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="qry_today.cfm">
	<responsibilities>
		I get the user's private messages
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
			<number name="userid" scope="request" />
			<string name="sortkey" scope="attributes" optional="Yes" />
			<string name="sortasc" scope="attributes" optional="Yes" />
		</in>
		<out>
			<string name="sortkey" scope="attributes" />
			<string name="sortasc" scope="attributes" />
			<recordset name="priv_summary" scope="variables" format="CFML">
				<number name="messageid"/>
				<number name="userid"/>
				<datetime name="messagedate"/>
				<string name="username"/>
			</recordset>
			<recordset name="today" scope="variables" format="CFML">
				<number name="postid"/>
				<string name="posttitle"/>
				<string name="post"/>
				<datetime name="postdate"/>
				<datetime name="dateexpires"/>
			</recordset>
		</out>
	</io>
</fusedoc>
--->

<cfparam name="attributes.sortkey" default="messagedate">
<cfparam name="attributes.sortasc" default="DESC">

<cfif request.userid NEQ 0><!--- the user is logged in --->
	
	<cfinvoke component="#Application.ao__AppObj_mForumFacade_Forum_Facade#"
		method="findPrivateMessagesOfUser"
		userid="#request.userid#"
		orderby="#attributes.sortkey# #attributes.sortasc#"
		returnvariable="priv_summary">
	
	<!--- NOT CURRENTLY USED
	 <cfinvoke component="#Application.ao__AppObj_mForumFacade_Forum_Facade#"
		method="findFriendsOfUser"
		userid="#request.userid#"
		orderby="users.username"
		returnvariable="friends_summary">
	--->
<cfelse>
	<cfset priv_summary=QueryNew("messageid,userid,messagedate,username")>
</cfif>

<cfinvoke component="#Application.ao__AppObj_mForum_today_Gateway#"
	method="findUnexpired"
	orderby="postdate DESC"
	returnvariable="today">

<!--- 
$Log: qry_today.cfm,v $
Revision 1.4  2007/06/14 16:52:21  kevin
Remove specific comments

Revision 1.3  2007/06/14 16:38:34  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:12  kevin
Initial Open Source Version

Revision 1.11  2006/08/11 12:50:08  mike
change cfc objects from Server to Application scope

Revision 1.10  2006/07/24 13:14:33  kevin
Remove unwanted SQL

Revision 1.9  2006/06/23 17:43:42  mike
new naming convention for cfc objects

Revision 1.8  2005/12/02 17:27:48  mike
DSN => ForumDSN

Revision 1.7  2005/05/23 10:36:31  mike
improve fusedoc

Revision 1.6  2005/05/23 09:48:57  mike
handle attributes.sortkey, etc,

Revision 1.5  2005/05/21 10:17:53  mike
correct path for Forum_Facade.cfc

Revision 1.4  2005/05/20 12:40:57  kevin
New server cfc naming convention

Revision 1.3  2005/05/19 17:03:16  mike
remove the query subs_summary

Revision 1.2  2005/05/09 10:20:47  mike
recode to call methods in Forum_Facade.cfc, improve fusedoc, etc.

Revision 1.1  2005/05/05 12:29:27  mike
Initial FB4 Version

Revision 1.5  2004/11/09 10:39:22  mike
don't cache the query

Revision 1.4  2004/11/07 14:30:38  mike
small edits

Revision 1.3  2004/11/03 17:08:40  mike
improved fusedoc

Revision 1.2  2004/11/02 16:06:49  mike
added fusedoc, etc.
--->
</cfsilent>

