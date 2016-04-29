<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="qry_forum.cfm">
	<responsibilities>
		I get the list of forums from the database
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
			<boolean name="userisERSCmember" scope="client" />
		</in>
		<out>
			<recordset name="category_threads" scope="variables" format="CFML">
				<number name="categoryid"/>
				<string name="categoryname"/>
				<number name="threadcount" />
				<number name="messagecount" />
				<string name="lastposter"/>
				<datetime name="datelastpost" />
				<boolean name="isSubscribed" />
			</recordset>
		</out>
	</io>
</fusedoc>
--->

<cfparam name="attributes.sortkey" default="Ucategoryname">
<cfparam name="attributes.sortasc" default="ASC">

<cfinvoke component="#Application.ao__AppObj_mForumFacade_Forum_Facade#"
	method="fForumsVisible"
	userid="#request.userid#"
	SiteId="#request.SiteId#"
	returnvariable="usercategories">
<cfset variables.lCategoryids=ValueList(usercategories.categoryid)>

<cfinvoke component="#Application.ao__AppObj_mForumFacade_Forum_Facade#"
	method="findForumSubscriptionsOfUser"
	userid="#request.userid#"
	returnvariable="forum_subs_summary">
<cfset variables.lForumSubscriptions=ValueList(forum_subs_summary.fs_forum_id)>

<cfset raw_category_threads=QueryNew("categoryid,categoryname,Ucategoryname,threadcount,messagecount,lastposter,datelastpost,juliandate,isSubscribed")>
<cfset variables.forumrow=0>
<cfloop query="usercategories">
	<cfset variables.forumrow=variables.forumrow+1>
	<cfset QueryAddRow(raw_category_threads)>
	<cfset QuerySetCell(raw_category_threads,"categoryid",usercategories.categoryid,variables.forumrow)>
	<cfset QuerySetCell(raw_category_threads,"categoryname",usercategories.categoryname,variables.forumrow)>
	<cfset QuerySetCell(raw_category_threads,"Ucategoryname",UCase(usercategories.categoryname),variables.forumrow)>
	<cfset variables.threadcount=0>
	<cfset variables.messagecount=0>
	<cfset variables.lastposter="">
	<cfset variables.datelastpost="">
	<cfset variables.juliandate="">
	
	<cfinvoke component="#Application.ao__AppObj_mForum_threads_Gateway#"
		method="fThreadInfo"
		categoryid="#usercategories.categoryid#"
		orderby="threads.datelastpost DESC"
		returnvariable="qThreadInfo">
	<cfif qThreadInfo.recordcount><!--- so there is at least 1 thread --->
		<cfset variables.lThreadids=ValueList(qThreadInfo.threadid)>
		<cfset variables.threadcount=qThreadInfo.recordcount>
		<cfif qThreadInfo.datelastpost NEQ ""><!--- not NULL --->
			<cfset variables.datelastpost=dateformat(qThreadInfo.datelastpost,"dd/mm/yyyy")>
			<cfset variables.juliandate=dateformat(qThreadInfo.datelastpost,"yyyy-mm-dd")>
		<cfelse>
			<cfset variables.datelastpost="">
			<cfset variables.juliandate="">
		</cfif>
		
		<cfinvoke component="#Application.ao__AppObj_mForum_threads_Gateway#"
			method="countForumMessages"
			categoryid="#usercategories.categoryid#"
			returnvariable="qMessageCount">
		<cfset variables.messagecount=qMessageCount.totalmessages>
		
		<cfinvoke component="#Application.ao__AppObj_mForumFacade_Forum_Facade#"
			method="fLastPoster"
			threadid="#qThreadInfo.threadid#"
			messagedate="#qThreadInfo.datelastpost#"
			returnvariable="qLastPoster">
		<cfif qLastPoster.recordcount>
			<cfset variables.lastposter=qLastPoster.lastposter>
		</cfif>
	</cfif>
	<cfset QuerySetCell(raw_category_threads,"threadcount",val(variables.threadcount),variables.forumrow)>
	<cfset QuerySetCell(raw_category_threads,"messagecount",val(variables.messagecount),variables.forumrow)>
	<cfset QuerySetCell(raw_category_threads,"lastposter",variables.lastposter,variables.forumrow)>
	<cfset QuerySetCell(raw_category_threads,"datelastpost",variables.datelastpost,variables.forumrow)>
	<cfset QuerySetCell(raw_category_threads,"juliandate",variables.juliandate,variables.forumrow)>
	<cfset variables.isSubscribed=ListFind(variables.lForumSubscriptions,usercategories.categoryid)>
	<cfset QuerySetCell(raw_category_threads,"isSubscribed",variables.isSubscribed,variables.forumrow)>
</cfloop>

<cfquery name="category_threads" dbtype="query">
	SELECT	categoryid,
			categoryname,
			threadcount,
			messagecount,
			lastposter,
			datelastpost,
			juliandate,
			isSubscribed
	FROM	raw_category_threads
	ORDER BY	#attributes.sortkey# #attributes.sortasc#
</cfquery>

<!--- 
$Log: qry_forum.cfm,v $
Revision 1.4  2007/06/14 16:52:21  kevin
Remove specific comments

Revision 1.3  2007/06/14 16:38:34  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:11  kevin
Initial Open Source Version

Revision 1.16  2006/08/11 12:50:07  mike
change cfc objects from Server to Application scope

Revision 1.15  2006/07/25 11:50:57  kevin
Make siteId a parameter in fForumsvisible.

Revision 1.14  2006/07/24 13:14:33  kevin
Remove unwanted SQL

Revision 1.13  2006/06/23 17:43:42  mike
new naming convention for cfc objects

Revision 1.12  2005/12/02 17:27:48  mike
DSN => ForumDSN

Revision 1.11  2005/05/23 16:43:24  mike
dd/mm/yy => dd/mm/yyyy

Revision 1.10  2005/05/21 11:39:40  mike
default sortkey to Ucategoryname

Revision 1.9  2005/05/21 10:17:52  mike
correct path for Forum_Facade.cfc

Revision 1.8  2005/05/20 12:58:55  mike
bug fix: Serendipity_Serendipty => Serendipity

Revision 1.7  2005/05/20 12:40:56  kevin
New server cfc naming convention

Revision 1.6  2005/05/20 11:35:15  mike
return isSubscribed too; delete commented-out code

Revision 1.5  2005/05/17 07:42:44  mike
return Ucategoryname too

Revision 1.4  2005/05/16 17:31:27  mike
final working version

Revision 1.3  2005/05/09 17:21:29  mike
improve the logic, by calling fForumsVisible() method

Revision 1.2  2005/05/06 14:46:04  mike
recode to call methods in Forum_Facade.cfc, etc.

Revision 1.1  2005/05/05 12:29:26  mike
Initial FB4 Version

Revision 1.6  2004/11/17 14:00:18  mike
use client.userisERSCmember

Revision 1.5  2004/11/12 09:41:26  mike
DSN => MainDSN

Revision 1.4  2004/11/07 14:31:22  mike
small edits

Revision 1.3  2004/11/04 18:49:52  mike
small edits

Revision 1.2  2004/11/02 14:09:41  mike
added fusedoc, etc.

Revision 1.1  2004/10/18 10:11:53  mike
initial version
--->
</cfsilent>
 
