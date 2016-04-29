<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="act_deletecategory.cfm">
	<responsibilities>
		I archive or delete a forum and its threads and messages
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
			<string name="deleteaction" scope="attributes" />
			<number name="categoryid" scope="attributes" />
			<number name="newcategory" scope="attributes" optional="Yes" />
		</in>
		<out>
		</out>
	</io>
</fusedoc>
--->

<cfif attributes.deleteaction IS "archive">
	
	<cfinvoke component="#Application.ao__AppObj_mForum_threads_Gateway#"
		method="findSelected"
		categoryid="#attributes.categoryid#"
		returnvariable="getthreadsincat">
	
	<cfoutput query="getthreadsincat">
		
		<cfset variables.newthreadid=Application.ao__AppObj_mForumAdmin_ForumAdmin_Facade.fArchiveThread(getthreadsincat.threadid)>
		
		<cfinvoke component="#Application.ao__AppObj_mForum_messages_Gateway#"
			method="findSelected"
			threadid="#getthreadsincat.threadid#"
			returnvariable="getmessagesinthread">
		<cfloop query="getmessagesinthread">
			
			<cfset temp=Application.ao__AppObj_mForumAdmin_ForumAdmin_Facade.fArchiveMessage(getmessagesinthread.messageid,variables.newthreadid)>
			
			<cfset stMessages=structNew()>
			<cfset stMessages.messageid=getmessagesinthread.messageid>
			<cfset oMessages=createObject("component","FuseForum.model.mForum.messages").init()>
			<cfset temp=oMessages.setInstanceMemento(stMessages)>
			<cfset temp=Application.ao__AppObj_mForum_messages_DAO.delete(oMessages)>
		</cfloop>
	
		<cfset stThreads=structNew()>
		<cfset stThreads.threadid=getthreadsincat.threadid>
		<cfset oThreads=createObject("component","FuseForum.model.mForum.threads").init()>
		<cfset temp=oThreads.setInstanceMemento(stThreads)>
		<cfset temp=Application.ao__AppObj_mForum_threads_DAO.delete(oThreads)>
		<cfset variables.temp=Application.ao__AppObj_mForum_subscriptions_Gateway.deleteSelected(getthreadsincat.threadid)>
	</cfoutput>

<cfelseif attributes.deleteaction IS "delete">
	<cfinvoke component="#Application.ao__AppObj_mForum_threads_Gateway#"
		method="findSelected"
		categoryid="#attributes.categoryid#"
		returnvariable="threadincat">
	
	<cfoutput query="threadincat">
		<cfset variables.temp=Application.ao__AppObj_mForum_messages_Gateway.deleteSelected(threadincat.threadid)>
		<cfset variables.temp=Application.ao__AppObj_mForum_subscriptions_Gateway.deleteSelected(threadincat.threadid)>
	</cfoutput>
	
	<cfset variables.temp=Application.ao__AppObj_mForum_threads_Gateway.deleteSelected(attributes.categoryid)>

<cfelseif attributes.deleteaction IS "move"><!--- not currently allowed --->
	<cfset variables.temp=Application.ao__AppObj_mForum_threads_Gateway.updateSelected(attributes.categoryid,attributes.newcategory)>
</cfif>

<cfset variables.temp=Application.ao__AppObj_mForum_categories_mod_Gateway.deleteSelected(attributes.categoryid)>

<cfset variables.temp=Application.ao__AppObj_mForum_categories_per_Gateway.deleteSelected(attributes.categoryid)>

<cfset stCategories=structNew()>
<cfset stCategories.categoryid=attributes.categoryid>
<cfset oCategories=createObject("component","FuseForum.model.mForum.categories").init()>
<cfset temp=oCategories.setInstanceMemento(stCategories)>
<cfset temp=Application.ao__AppObj_mForum_categories_DAO.delete(oCategories)>

<!--- 
$Log: act_deletecategory.cfm,v $
Revision 1.1  2007/06/15 13:59:05  kevin
Add Admin Modules

Revision 1.10  2006/08/11 12:52:26  mike
change cfc objects from Server to Application scope

Revision 1.9  2006/08/01 10:56:50  mike
correct the naming convention for the ForumAdmin_Facade.cfc object

Revision 1.8  2006/07/31 15:43:24  kevin
Remove old SQL

Revision 1.7  2006/06/23 17:19:55  mike
new naming convention for cfc objects

Revision 1.6  2005/09/05 15:47:31  kevin
Change DSN for forums.

Revision 1.5  2005/05/21 15:26:34  mike
correct path for ForumAdmin_Facade

Revision 1.4  2005/05/20 12:33:38  kevin
New server cfc naming convention

Revision 1.3  2005/05/11 10:41:17  kevin
Rename from MVC conversion

Revision 1.2  2005/04/11 16:35:05  mike
changed to call Facade/Gateway/DAO cfc's

Revision 1.1  2005/03/29 13:28:25  mike
files moved from mForum

Revision 1.1  2005/03/09 13:49:08  mike
Moved to create MVC version

Revision 1.7  2005/02/24 13:57:21  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.6  2005/02/23 17:14:26  mike
small edits to layout

Revision 1.5  2005/02/15 10:12:57  mike
small edits

Revision 1.4  2005/02/10 17:12:48  mike
replace <cflocation> by call of url_continue.cfm in fbx_switch.cfm

Revision 1.3  2005/02/09 12:08:28  mike
add addtoken="No", etc.

Revision 1.2  2005/02/08 13:44:43  mike
code formatting changes, etc.

Revision 1.1  2005/02/04 19:56:48  mike
FB3 version made from wireframe with fusebuilder, with contents pasted from FB2 version, fbx_switch fully commented, and XFA usage improved throughout
--->
</cfsilent>
