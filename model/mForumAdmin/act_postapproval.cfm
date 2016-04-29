<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="act_postapproval.cfm">
	<responsibilities>
		I approve or reject(delete) a message or all messages in a thread
	</responsibilities>
	<properties>
		<history author="Mike Oakes" email="mike@objectiveinternet.com" date="04-Feb-2005" role="Architect" type="Create" />
		<property name="copyright" value="(c)2005 Objective Internet Limited." />
		<property name="licence" value="See licence.txt" />
		<property name="version" value="$Revision: 1.1 $" />
		<property name="lastupdated" value="$Date: 2007/06/15 13:59:05 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<string name="forumDSN" scope="request" />
			<string name="followon" scope="attributes" />
			<number name="messageid" scope="attributes" />
			<string name="accept" scope="attributes" optional="Yes" />
			<string name="reject" scope="attributes" optional="Yes" />
			<number name="threadid" scope="attributes" optional="Yes" />
			<string name="threadname" scope="attributes" optional="Yes" />
			<string name="message" scope="attributes" optional="Yes" />
			<string name="moderatormessage" scope="attributes" optional="Yes" />
		</in>
		<out>
			<string name="fuseaction" scope="formOrUrl" />
		</out>
	</io>
</fusedoc>
--->

<cfif isDefined("attributes.accept")>
	<cfif isDefined("attributes.threadid")>
		
		<cfset oThreads=createObject("component","FuseForum.model.mForum.threads").init()>
		<cfset temp=Application.ao__AppObj_mForum_threads_DAO.read(oThreads,attributes.threadid)>
		<cfset temp=oThreads.setApproved(1)>
		<cfset temp=oThreads.setThreadname(attributes.threadname)>
		<cfset temp=Application.ao__AppObj_mForum_threads_DAO.update(oThreads)>
	<cfelse>
		
		<cfset msgthread=Application.ao__AppObj_mForum_messages_Gateway.findSelected(attributes.messageid)>
		
		<cfset oThreads=createObject("component","FuseForum.model.mForum.threads").init()>
		<cfset temp=Application.ao__AppObj_mForum_threads_DAO.read(oThreads,msgthread.threadid)>
		<cfset variables.count=oThreads.getMessagecount()>
		<cfset variables.count=variables.count+1>
		<cfset temp=oThreads.setMessagecount(variables.count)>
		<cfset temp=oThreads.setDatelastpost(msgthread.messagedate)>
		<cfset temp=Application.ao__AppObj_mForum_threads_DAO.update(oThreads)>
	</cfif>
	
	<cfset oMessages=createObject("component","FuseForum.model.mForum.messages").init()>
	<cfset temp=Application.ao__AppObj_mForum_messages_DAO.read(oMessages,attributes.messageid)>
	<cfset temp=oMessages.setApproved(1)>
	<cfset temp=oMessages.setMessage(attributes.message)>
	<cfset temp=oMessages.setModeratormessage(attributes.moderatormessage)>
	<cfset temp=Application.ao__AppObj_mForum_messages_DAO.update(oMessages)>
	
	<cfset getnewmessage=Application.ao__AppObj_mForum_messages_Gateway.findSelected(attributes.messageid)>
	
	<cfinclude template="act_emailsubs.cfm">
	
<cfelseif isDefined("attributes.reject")>
	<!--- The code to decrement threadcount was added 2Dec05 --->
	<cftransaction>
		<cfquery name="msgthread" datasource="#request.ForumDSN#">
			SELECT 	threadID
			FROM 	messages
			WHERE	messageid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#attributes.messageid#">
		</cfquery>
		<cfquery name="updatethreadcount" datasource="#request.ForumDSN#">
			UPDATE 	threads
			SET 	messagecount = [threads].[messagecount]-1
			WHERE	threadid = #msgthread.threadid#
		</cfquery>
	
		<cfquery name="rejectmessage" datasource="#request.ForumDSN#">
			DELETE
			FROM 	messages
			WHERE	messageid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#attributes.messageid#">
		</cfquery>
	</cftransaction>

	<cfif isdefined("attributes.threadid")>
		<cfset stThreads=structNew()>
		<cfset stThreads.threadid=attributes.threadid>
		<cfset oThreads=createObject("component","FuseForum.model.mForum.threads").init()>
		<cfset temp=oThreads.setInstanceMemento(stThreads)>
		<cfset temp=Application.ao__AppObj_mForum_threads_DAO.delete(oThreads)>
	</cfif>
</cfif>

<cflocation url="#request.baseHREF##request.self#?fuseaction=#attributes.followon#" addtoken="No">

<!--- 
$Log: act_postapproval.cfm,v $
Revision 1.1  2007/06/15 13:59:05  kevin
Add Admin Modules

Revision 1.9  2006/08/11 12:52:26  mike
change cfc objects from Server to Application scope

Revision 1.8  2006/07/31 15:43:24  kevin
Remove old SQL

Revision 1.7  2006/06/23 17:19:55  mike
new naming convention for cfc objects

Revision 1.6  2005/12/02 17:53:35  mike
bug fix: must decrement messagecount

Revision 1.5  2005/09/05 15:47:31  kevin
Change DSN for forums.

Revision 1.4  2005/05/20 12:33:38  kevin
New server cfc naming convention

Revision 1.3  2005/05/11 10:41:17  kevin
Rename from MVC conversion

Revision 1.2  2005/04/11 15:25:41  mike
changed to call Facade/Gateway/DAO cfc's

Revision 1.1  2005/03/29 13:28:26  mike
files moved from mForum

Revision 1.1  2005/03/09 13:49:08  mike
Moved to create MVC version

Revision 1.5  2005/02/24 13:57:24  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.4  2005/02/23 17:14:39  mike
small edits to layout

Revision 1.3  2005/02/09 12:23:35  mike
add addtoken="No", improve fusedoc, etc.

Revision 1.2  2005/02/08 17:09:04  mike
improved fusedoc etc.

Revision 1.1  2005/02/04 19:56:48  mike
FB3 version made from wireframe with fusebuilder, with contents pasted from FB2 version, fbx_switch fully commented, and XFA usage improved throughout
--->
</cfsilent>
