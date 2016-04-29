<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="act_postban.cfm">
	<responsibilities>
		I ban or unban the given individual or IP address range
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
			<string name="bantype" scope="attributes" />
			<string name="addban" scope="attributes" optional="Yes" />
			<string name="delbans" scope="attributes" optional="Yes" />
			<string name="ban" scope="attributes" optional="Yes" />
			<list name="banlist" scope="attributes" optional="Yes" />
		</in>
		<out>
		</out>
	</io>
</fusedoc>
--->

<cfif isDefined("attributes.addban")>
	
	<cfinvoke component="#Application.ao__AppObj_mForum_banning_Gateway#"
		method="findSelectedBanid"
		bantype="#attributes.bantype#"
		banstring="#attributes.ban#"
		returnvariable="checkinsert">
	<cfif checkinsert.recordcount EQ 0>
		
		<cfset variables.temp=Application.ao__AppObj_mForumAdmin_ForumAdmin_Facade.fInsertBanning(attributes.bantype,attributes.ban)>
	</cfif>
<cfelseif isDefined("attributes.delbans")>
	<cfif isDefined("attributes.banlist") AND ListLen(attributes.banlist) GT 0>
		
		<cfset variables.temp=Application.ao__AppObj_mForum_banning_Gateway.deleteList(attributes.banlist)>
	</cfif>
</cfif>

<!--- 
$Log: act_postban.cfm,v $
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

Revision 1.3  2005/05/12 16:32:00  mike
check that attributes.banlist is defined

Revision 1.2  2005/04/08 12:03:22  mike
changed to call Facade/Gateway/DAO cfc's

Revision 1.1  2005/03/29 13:28:26  mike
files moved from mForum

Revision 1.1  2005/03/09 13:49:09  mike
Moved to create MVC version

Revision 1.6  2005/02/24 13:57:25  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.5  2005/02/23 17:15:30  mike
small edits to layout

Revision 1.4  2005/02/10 17:12:59  mike
replace <cflocation> by call of url_continue.cfm in fbx_switch.cfm

Revision 1.3  2005/02/09 13:27:50  mike
add addtoken="No", improve fusedoc, etc.

Revision 1.2  2005/02/08 13:44:11  mike
code formatting changes

Revision 1.1  2005/02/04 19:56:48  mike
FB3 version made from wireframe with fusebuilder, with contents pasted from FB2 version, fbx_switch fully commented, and XFA usage improved throughout
--->
</cfsilent>
