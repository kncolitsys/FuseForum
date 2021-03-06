<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="qry_moderatorthreads.cfm">
	<responsibilities>
		I get all the threads in the given Forum
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
			<string name="nextfuseaction" scope="attributes" />
			<boolean name="action" scope="attributes" optional="Yes" />
			<number name="categoryid" scope="attributes" optional="Yes" />
			<number name="threadid" scope="attributes" optional="Yes" />
		</in>
		<out>
			<recordset name="mod_threads" scope="variables" format="CFML">
				<number name="threadid" />
				<string name="threadname"/>
				<datetime name="datecreated"/>
			</recordset>
		</out>
	</io>
</fusedoc>
--->

<cfif attributes.nextfuseaction IS "ForumAdmin.LockThisThread" OR attributes.nextfuseaction IS "ForumAdmin.UnlockThisThread">
	<cfif attributes.action EQ 1><!--- i.e. "lock" --->
		<cfset variables.locked = 0>
	<cfelse>
		<cfset variables.locked = 1>
	</cfif>
	<cfif isdefined("attributes.threadid")>
		<cfinvoke component="#Application.ao__AppObj_mForum_threads_Gateway#"
			method="findSelected"
			threadid="#attributes.threadid#"
			locked="#variables.locked#"
			returnvariable="mod_threads">
	<cfelse>
		<cfinvoke component="#Application.ao__AppObj_mForum_threads_Gateway#"
			method="findSelected"
			categoryid="#attributes.categoryid#"
			locked="#variables.locked#"
			returnvariable="mod_threads">
	</cfif>
<cfelse>
	<cfif isdefined("attributes.threadid")>
		<cfinvoke component="#Application.ao__AppObj_mForum_threads_Gateway#"
			method="findSelected"
			threadid="#attributes.threadid#"
			returnvariable="mod_threads">
	<cfelse>
		<cfinvoke component="#Application.ao__AppObj_mForum_threads_Gateway#"
			method="findSelected"
			categoryid="#attributes.categoryid#"
			returnvariable="mod_threads">
	</cfif>
</cfif>

<!--- 
$Log: qry_moderatorthreads.cfm,v $
Revision 1.1  2007/06/15 13:59:05  kevin
Add Admin Modules

Revision 1.7  2006/08/11 12:54:47  mike
change cfc objects from Server to Application scope

Revision 1.6  2006/07/31 15:43:24  kevin
Remove old SQL

Revision 1.5  2006/06/23 17:19:56  mike
new naming convention for cfc objects

Revision 1.4  2005/09/05 15:47:31  kevin
Change DSN for forums.

Revision 1.3  2005/05/20 12:33:38  kevin
New server cfc naming convention

Revision 1.2  2005/04/11 12:18:38  mike
changed to call Facade/Gateway/DAO cfc's

Revision 1.1  2005/03/29 13:28:28  mike
files moved from mForum

Revision 1.2  2005/03/15 12:22:24  mike
replace use of "XFA" as a url param by "nextfuseaction"

Revision 1.1  2005/03/09 13:53:02  mike
Moved to create MVC version

Revision 1.4  2005/02/24 13:57:45  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.3  2005/02/23 17:20:14  mike
small edits to code layout

Revision 1.2  2005/02/08 17:20:53  mike
improved fusedoc etc.

Revision 1.1  2005/02/04 19:56:51  mike
FB3 version made from wireframe with fusebuilder, with contents pasted from FB2 version, fbx_switch fully commented, and XFA usage improved throughout
--->
</cfsilent>
