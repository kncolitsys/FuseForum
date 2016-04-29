<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="qry_threadsincategory.cfm">
	<responsibilities>
		I get all the threads in this forum
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
			<string name="threadorder" scope="request" />
			<number name="categoryid" scope="attributes" />
			<boolean name="userisERSCmember" scope="client" />
			<string name="sortkey" scope="attributes" optional="Yes" />
			<string name="sortasc" scope="attributes" optional="Yes" />
		</in>
		<out>
			<recordset name="qCategoryVisible" scope="variables" format="CFML">
				<number name="categoryid"/>
				<string name="categoryname"/>
				<string name="description"/>
				<boolean name="readonly"/>
				<string name="visibleto"/>
			</recordset>
			<recordset name="threadsincat" scope="variables" format="CFML">
				<string name="categoryname"/>
				<string name="description"/>
				<boolean name="readonly"/>
				<number name="threadid"/>
				<string name="threadname" />
				<datetime name="datecreated" />
				<datetime name="datelastpost" />
				<string name="juliandate" />
				<number name="messagecount" />
				<string name="username" />
				<string name="last_poster" />
			</recordset>
		</out>
	</io>
</fusedoc>
--->

<cfparam name="attributes.sortkey" default="juliandate">
<cfif isDefined("request.threadorder")><!--- should always be true --->
	<cfparam name="attributes.sortasc" default="#request.threadorder#">
<cfelse>
	<cfparam name="attributes.sortasc" default="DESC">
</cfif>

<!--- the following added 16Jun04 to prevent a CF dump if undefined or empty or rubbish --->
<cfparam name="attributes.categoryid" default="0">
<cfif NOT isNumeric(attributes.categoryid)>
	<cfset attributes.categoryid=0>
</cfif>

<cfinvoke component="#Application.ao__AppObj_mForumFacade_Forum_Facade#"
	method="fForumsVisible"
	userid="#request.userid#"
	SiteId="#request.SiteId#"
	categoryid="#attributes.categoryid#"
	returnvariable="qCategoryVisible">

<cfif qCategoryVisible.recordcount>
	
	<cfinvoke component="#Application.ao__AppObj_mForumFacade_Forum_Facade#"
		method="fForumThreads"
		categoryid="#attributes.categoryid#"
		returnvariable="qThreads">
	<cfset variables.lThreadids=ValueList(qThreads.threadid)>

	<cfif ListLen(variables.lThreadids) NEQ 0>
		<!--- NB the following can take a VERY LONG time --->
		<cfinvoke component="#Application.ao__AppObj_mForumFacade_Forum_Facade#"
			method="fLastPosters"
			lThreadids="#variables.lThreadids#"
			returnvariable="qLastPosters">
		<cfquery name="threadsincat" dbtype="query">
			SELECT 	qThreads.categoryname,
					qThreads.description,
					qThreads.readonly,
					qThreads.threadid,
					qThreads.threadname,
					qThreads.Uthreadname,
					qThreads.datecreated,
					qThreads.datelastpost,
					qThreads.juliandate,
					qThreads.messagecount,
					qThreads.username,
					qThreads.Uusername,
					qLastPosters.last_poster
			FROM	qThreads, qLastPosters
			WHERE	qThreads.threadid = qLastPosters.threadid 
			ORDER BY	#attributes.sortkey# #attributes.sortasc#
		</cfquery>
	<cfelse>
		<cfset threadsincat=QueryNew("categoryname,description,readonly,threadid,threadname,Uthreadname,datecreated,datelastpost,juliandate,username,Uusername,messagecount,last_poster")>
	</cfif>
<cfelse>
	<cfset threadsincat=QueryNew("categoryname,description,readonly,threadid,threadname,Uthreadname,datecreated,datelastpost,juliandate,username,Uusername,messagecount,last_poster")>
</cfif>

<!--- 
$Log: qry_threadsincategory.cfm,v $
Revision 1.4  2007/06/14 16:52:21  kevin
Remove specific comments

Revision 1.3  2007/06/14 16:38:33  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:12  kevin
Initial Open Source Version

Revision 1.13  2006/08/11 12:50:07  mike
change cfc objects from Server to Application scope

Revision 1.12  2006/07/25 11:51:25  kevin
Make siteId a parameter in fForumsvisible.

Revision 1.11  2006/07/24 13:14:33  kevin
Remove unwanted SQL

Revision 1.10  2006/06/23 17:43:42  mike
new naming convention for cfc objects

Revision 1.9  2005/12/02 17:27:48  mike
DSN => ForumDSN

Revision 1.8  2005/06/03 11:35:29  mike
default the thread order to date DESC

Revision 1.7  2005/05/27 12:18:52  mike
improve fusedoc

Revision 1.6  2005/05/21 10:17:53  mike
correct path for Forum_Facade.cfc

Revision 1.5  2005/05/20 12:40:57  kevin
New server cfc naming convention

Revision 1.4  2005/05/17 07:55:58  mike
set Uthreadname and Uusername too

Revision 1.3  2005/05/16 18:28:04  mike
handle sortkey and sortasc properly, use juliandate, etc.

Revision 1.2  2005/05/09 17:19:32  mike
recode to call methods in Forum_Facade.cfc, etc.

Revision 1.1  2005/05/05 12:29:27  mike
Initial FB4 Version

Revision 1.7  2004/11/17 13:59:35  mike
for ERSC forums, tell user must join ERSC

Revision 1.6  2004/11/12 09:41:50  mike
DSN => MainDSN

Revision 1.5  2004/11/10 11:28:19  mike
added OR (Cat.VisibleTo = 'ER')

Revision 1.4  2004/11/07 14:31:03  mike
small edits

Revision 1.3  2004/11/03 14:38:51  mike
completely re-cast, in order top be able to return last_poster, etc.

Revision 1.2  2004/11/02 13:55:56  mike
added fusedoc, etc.

Revision 1.1  2004/10/18 10:11:53  mike
initial version
--->
</cfsilent>
