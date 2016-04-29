<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="act_postnewthread.cfm">
	<responsibilities>
		If this is a new thread I create the thread in the database.
		I save the message to the database and link it to the thread.
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
			<number name="categoryid" scope="attributes" />
			<number name="threadid" scope="attributes" />
			<string name="message" scope="attributes" />
			<string name="threadname" scope="attributes" />
			<number name="userid" scope="request" />
			<recordset name="needapproval" scope="variables" format="CFML">
				<boolean name="approval" comments="True if the message requires approval"/>
			</recordset>
			<string name="attachment" scope="attributes" />
			<string name="toolarge" scope="variables" optional="Yes" />
		</in>
		<out>
		</out>
	</io>
</fusedoc>
--->

<cfif needapproval.approval>
	<cfset variables.approval="true">
	<cfset variables.approved=0>
<cfelse>
	<cfset variables.approval="false">
	<cfset variables.approved=1>
</cfif>
<cfset variables.timenow=now()>

<cfif isDefined("attributes.categoryid")>
	
	<cfinvoke component="#Application.ao__AppObj_mForumFacade_Forum_Facade#"
		method="fCreateThread"
		threadname="#attributes.threadname#"
		userid="#request.userid#"
		categoryid="#attributes.categoryid#"
		approved="#variables.approved#"
		datecreated="#variables.timenow#"
		datelastpost="#variables.timenow#"
		returnvariable="attributes.threadid">

<cfelseif NOT needapproval.approval>
	
	<cfinvoke component="#Application.ao__AppObj_mForum_threads_Gateway#"
		method="updateMessageCount"
		threadid="#attributes.threadid#"
		datelastpost="#variables.timenow#"
		returnvariable="variables.temp">
</cfif>

<!--- NB the following added 9Nov05 --->
<!--- Check that message doesn't have any VERY long substrings (which can corrupt page layouts) --->
<cfmodule template="../../tags/splitmessage/splitmessage.cfm"
	message="#attributes.message#"
	maxwordlen="80"
	r_output="attributes.message">


<cfif isDefined("attributes.attachment") AND len(attributes.attachment) AND NOT isDefined("variables.toolarge")>
	<cfset variables.attachment=attributes.attachment>
<cfelse>
	<cfset variables.attachment="">
</cfif>
<cfinvoke component="#Application.ao__AppObj_mForumFacade_Forum_Facade#"
	method="fCreateMessage"
	message="#attributes.message#"
	threadid="#attributes.threadid#"
	userid="#request.userid#"
	approved="#variables.approved#"
	messagedate="#variables.timenow#"
	attachment="#variables.attachment#"
	returnvariable="attributes.messageid">

<!---
$Log: act_postnewthread.cfm,v $
Revision 1.4  2007/06/14 16:52:21  kevin
Remove specific comments

Revision 1.3  2007/06/14 16:38:34  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:10  kevin
Initial Open Source Version

Revision 1.11  2006/08/11 12:50:07  mike
change cfc objects from Server to Application scope

Revision 1.10  2006/07/24 13:14:33  kevin
Remove unwanted SQL

Revision 1.9  2006/06/23 17:43:42  mike
new naming convention for cfc objects

Revision 1.8  2005/12/06 11:44:11  mike
DON'T call formatinput custom tag

Revision 1.7  2005/12/02 17:27:47  mike
DSN => ForumDSN

Revision 1.6  2005/11/09 18:06:09  mike
call formatinput and splitmessage custom tags

Revision 1.5  2005/05/21 10:17:52  mike
correct path for Forum_Facade.cfc

Revision 1.4  2005/05/20 12:40:56  kevin
New server cfc naming convention

Revision 1.3  2005/05/16 14:09:15  mike
pass variables.timenow explicitly, to ensure threads and messages records synchronised

Revision 1.2  2005/05/05 13:01:44  mike
recode to call methods in Forum_Facade.cfc etc.; improve fusedoc

Revision 1.1  2005/05/05 12:29:25  mike
Initial FB4 Version

Revision 1.8  2004/11/09 13:33:34  kevin
Break out post new thread process into separate fuses.

Revision 1.7  2004/11/07 14:33:16  mike
small edits

Revision 1.6  2004/11/05 15:30:30  mike
call by <cfmodule> not cf_formatinput

Revision 1.5  2004/11/05 13:53:00  mike
removed dsp_vulgarity.cfm etc.

Revision 1.4  2004/11/03 18:18:12  mike
added check of Len(variables.emailto) to stop errors, etc.

Revision 1.3  2004/11/02 15:06:39  mike
added fusedoc, etc.

Revision 1.2  2004/10/27 13:26:33  mike
FB4

Revision 1.1  2004/10/18 10:11:53  mike
initial version
 --->
</cfsilent>
