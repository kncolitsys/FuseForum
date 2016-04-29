<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="act_postarchive.cfm">
	<responsibilities>
		I update the archiving fields of the Forums system
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
			<boolean name="archive" scope="attributes" />
			<number name="archivetimespan" scope="attributes" />
			<string name="archivetimeofday" scope="attributes" />
			<number name="settingid" scope="attributes" />
		</in>
		<out>
		</out>
	</io>
</fusedoc>
--->

<cfif Len(attributes.archivetimeofday)>
	<cfset attributes.archivetimeofday=createodbctime(createtime(listfirst(attributes.archivetimeofday,":"),listgetat(attributes.archivetimeofday,2,":"),listlast(attributes.archivetimeofday,":")))>
<cfelse>
	<cfset attributes.archivetimeofday=createodbctime(createtime(12,0,0))>
</cfif>
<!---
<cfquery name="updatearchiving" datasource="#request.forumDSN#">
	UPDATE 	settings
	SET		archive = #attributes.archive#,
			archivetimespan = #attributes.archivetimespan#,
			archivetimeofday = #attributes.archivetimeofday#
	WHERE	settingid = #attributes.settingid#
</cfquery>
--->
<cfset oSettings=createObject("component","FuseForum.model.mForum.settings").init()>
<cfset temp=Application.ao__AppObj_mForum_settings_DAO.read(oSettings,attributes.settingid)>
<cfset temp=oSettings.setArchive(attributes.archive)>
<cfset temp=oSettings.setArchivetimespan(attributes.archivetimespan)>
<cfset temp=oSettings.setArchivetimeofday(attributes.archivetimeofday)>
<cfset temp=Application.ao__AppObj_mForum_settings_DAO.update(oSettings)>
  
<!---
<CFSCHEDULE ACTION="Delete" TASK="Forum_Archive">
<cfif attributes.archive>
	<cfif Len(attributes.archivetimeofday) EQ 0>
		<cfset attributes.archivetimeofday="02:00:00">
	</cfif>
	<CFSCHEDULE ACTION="Update"
	    TASK="Forum_Archive"
	    OPERATION="HTTPRequest"
	    STARTDATE="#now()#"
	    STARTTIME="#attributes.archivetimeofday#"
	    URL="#request.forumsurl#/scheduled_tasks/#request.self#?fuseaction=archive"
	    INTERVAL="DAILY">	  
</cfif>
--->	  

<!--- 
$Log: act_postarchive.cfm,v $
Revision 1.1  2007/06/15 13:59:05  kevin
Add Admin Modules

Revision 1.7  2006/08/11 12:52:26  mike
change cfc objects from Server to Application scope

Revision 1.6  2006/06/23 17:19:55  mike
new naming convention for cfc objects

Revision 1.5  2005/09/05 15:47:31  kevin
Change DSN for forums.

Revision 1.4  2005/05/20 12:33:38  kevin
New server cfc naming convention

Revision 1.3  2005/05/11 10:41:17  kevin
Rename from MVC conversion

Revision 1.2  2005/04/11 15:50:33  mike
changed to call Facade/Gateway/DAO cfc's

Revision 1.1  2005/03/29 13:28:26  mike
files moved from mForum

Revision 1.1  2005/03/09 13:49:09  mike
Moved to create MVC version

Revision 1.6  2005/02/24 13:57:25  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.5  2005/02/10 17:12:58  mike
replace <cflocation> by call of url_continue.cfm in fbx_switch.cfm

Revision 1.4  2005/02/09 12:54:16  mike
improved fusedoc etc.

Revision 1.3  2005/02/08 17:09:23  mike
index.cfm => #request.self#

Revision 1.2  2005/02/08 13:43:21  mike
remove non-functioning call of <cfupdate> etc.

Revision 1.1  2005/02/04 19:56:48  mike
FB3 version made from wireframe with fusebuilder, with contents pasted from FB2 version, fbx_switch fully commented, and XFA usage improved throughout
--->
</cfsilent>
