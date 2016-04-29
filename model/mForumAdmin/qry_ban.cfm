<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="qry_ban.cfm">
	<responsibilities>
		I get all current ban records of the given type
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
		</in>
		<out>
			<recordset name="bans" scope="variables" format="CFML">
				<number name="banid" />
				<string name="bantype"/>
				<string name="banstring"/>
			</recordset>
		</out>
	</io>
</fusedoc>
--->

<cfparam name="attributes.bantype" default="User"><!--- for added robustness, but should not be necessary --->

<cfinvoke component="#Application.ao__AppObj_mForum_banning_Gateway#"
	method="findSelected"
	bantype="#attributes.bantype#"
	orderby="banstring"
	returnvariable="bans">

<!--- 
$Log: qry_ban.cfm,v $
Revision 1.1  2007/06/15 13:59:05  kevin
Add Admin Modules

Revision 1.9  2006/08/11 12:54:13  mike
change cfc objects from Server to Application scope

Revision 1.8  2006/07/31 15:43:24  kevin
Remove old SQL

Revision 1.7  2006/06/23 17:19:56  mike
new naming convention for cfc objects

Revision 1.6  2005/09/05 15:47:31  kevin
Change DSN for forums.

Revision 1.5  2005/05/20 12:33:38  kevin
New server cfc naming convention

Revision 1.4  2005/05/12 16:31:32  mike
include orderby

Revision 1.3  2005/05/12 16:09:51  mike
default value for bantype, for extra robustness

Revision 1.2  2005/04/08 12:04:08  mike
changed to call Facade/Gateway/DAO cfc's

Revision 1.1  2005/03/29 13:28:27  mike
files moved from mForum

Revision 1.1  2005/03/09 13:53:00  mike
Moved to create MVC version

Revision 1.3  2005/02/24 13:57:40  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.2  2005/02/09 13:24:31  mike
improved fusedoc etc.

Revision 1.1  2005/02/04 19:56:51  mike
FB3 version made from wireframe with fusebuilder, with contents pasted from FB2 version, fbx_switch fully commented, and XFA usage improved throughout
--->
</cfsilent>
