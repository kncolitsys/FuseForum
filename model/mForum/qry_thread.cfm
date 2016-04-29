<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="qry_thread.cfm">
	<responsibilities>
		I get the messages for the given thread
	</responsibilities>
	<properties>
		<history author="Mike Oakes" email="mike@objectiveinternet.com" date="01-Nov-2004" role="Architect" type="Create" />
		<property name="copyright" value="(c)2004 Objective Internet Limited." />
		<property name="licence" value="Licensed under the Apache License, Version 2.0  See licence.txt" />
		<property name="version" value="$Revision: 1.5 $" />
		<property name="lastupdated" value="$Date: 2007/06/14 16:52:21 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<number name="userid" scope="request" />
			<string name="messageorder" scope="request" />
			<number name="threadid" scope="attributes" />
			<boolean name="arch" scope="attributes" optional="Yes" />
		</in>
		<out>
			<recordset name="qCategoryVisible" scope="variables" format="CFML">
				<number name="categoryid"/>
				<string name="categoryname"/>
				<string name="description" comments="Not used" />
				<boolean name="readonly" comments="Not used"/>
				<string name="visibleto" comments="Not used"/>
			</recordset>
			<recordset name="forum_subscribe_check" scope="variables" format="CFML">
				<number name="fs_id"/>
			</recordset>
			<recordset name="thread_messages" scope="variables" format="CFML">
				<number name="threadid"/>
				<string name="threadname"/>
				<boolean name="locked"/>
				<number name="messageid"/>
				<string name="message"/>
				<datetime name="messagedate" />
				<number name="userid" />
				<string name="editmessage" />
				<string name="attachment"/>
				<string name="moderatormessage"/>
				<string name="username"/>
				<string name="emailaddress"/>
				<boolean name="showemail"/>
				<boolean name="showprofile"/>
				<string name="privatemessages"/>
				<string name="signature"/>
				<number name="recordid"/>
				<string name="categoryname"/>
				<boolean name="readonly"/>
			</recordset>
		</out>
	</io>
</fusedoc>
--->

<cfparam name="attributes.threadid" default="0">
<cfparam name="attributes.arch" default="0">
<cfif request.messageorder IS "DESC">
	<cfset variables.asc="DESC">
<cfelse>
	<cfset variables.asc="ASC">
</cfif>

<cfinvoke component="#Application.ao__AppObj_mForum_threads_Gateway#"
	method="findSelected"
	threadid="#attributes.threadid#"
	returnvariable="thread_category">
<cfif thread_category.recordcount><!--- should always be true --->
	<cfset variables.categoryid=thread_category.categoryid>
<cfelse>
	<cfset variables.categoryid=0>
</cfif>

<cfinvoke component="#Application.ao__AppObj_mForum_forum_subscriptions_Gateway#"
	method="findSelected"
	fs_name_id="#request.userid#"
	fs_forum_id="#variables.categoryid#"
	returnvariable="forum_subscribe_check">

<cfinvoke component="#Application.ao__AppObj_mForumFacade_Forum_Facade#"
	method="fForumsVisible"
	userid="#request.userid#"
	SiteId="#request.SiteId#"
	categoryid="#variables.categoryid#"
	returnvariable="qCategoryVisible">

<cfif qCategoryVisible.recordcount>
	
	<cfinvoke component="#Application.ao__AppObj_mForumFacade_Forum_Facade#"
		method="fThreadMessages"
		threadid="#attributes.threadid#"
		userid="#request.userid#"
		orderby="messages.messagedate #variables.asc#"
		returnvariable="thread_messages">
<cfelse>
	<cfset thread_messages = queryNew("threadid,threadname,locked,messageid,message,messagedate,userid,editmessage,attachment,moderatormessage,username,emailaddress,showemail,showprofile,privatemessages,signature,recordid,readonly")>
</cfif>
 
<!--- 
$Log: qry_thread.cfm,v $
Revision 1.5  2007/06/14 16:52:21  kevin
Remove specific comments

Revision 1.4  2007/06/14 16:38:33  kevin
Copyright statement

Revision 1.3  2007/06/14 15:07:14  kevin
single email address

Revision 1.2  2007/06/14 14:01:12  kevin
Initial Open Source Version

Revision 1.19  2006/08/11 12:50:07  mike
change cfc objects from Server to Application scope

Revision 1.18  2006/07/27 17:05:22  mike
attributes.arch needs <cfparam>

Revision 1.17  2006/07/25 11:51:09  kevin
Make siteId a parameter in fForumsvisible.

Revision 1.16  2006/07/24 13:14:33  kevin
Remove unwanted SQL

Revision 1.15  2006/06/23 17:43:42  mike
new naming convention for cfc objects

Revision 1.14  2005/12/02 17:27:48  mike
DSN => ForumDSN

Revision 1.13  2005/05/27 12:18:52  mike
improve fusedoc

Revision 1.12  2005/05/24 10:36:00  mike
return new query forum_subscribe_check

Revision 1.11  2005/05/24 08:35:57  mike
bug fix: use request.messageorder (not threadorder)

Revision 1.10  2005/05/23 16:17:03  mike
fForumsVisible() instead of fForumVisible(), etc.

Revision 1.9  2005/05/21 10:17:53  mike
correct path for Forum_Facade.cfc

Revision 1.8  2005/05/20 16:02:11  mike
qry_friends.cfm split off

Revision 1.7  2005/05/20 12:40:56  kevin
New server cfc naming convention

Revision 1.6  2005/05/12 09:51:12  mike
no message

Revision 1.5  2005/05/12 09:50:03  mike
remove references to "attributes.arch"

Revision 1.4  2005/05/12 09:49:06  mike
remove references to "attributes.arch"

Revision 1.3  2005/05/12 09:41:58  mike
remove <cfoutput>, etc.

Revision 1.2  2005/05/09 17:58:38  mike
recode to call methods in Forum_Facade.cfc, etc.

Revision 1.1  2005/05/05 12:29:27  mike
Initial FB4 Version

Revision 1.6  2005/02/03 16:25:13  mike
include new query qCategoryVisible, so check can be made for ERSC-only forums

Revision 1.5  2004/11/07 14:31:13  mike
small edits

Revision 1.4  2004/11/03 14:37:50  mike
small edits

Revision 1.3  2004/11/02 19:05:03  mike
indent properly, etc.

Revision 1.2  2004/11/02 14:23:41  mike
added fusedoc, etc.
--->
</cfsilent>

