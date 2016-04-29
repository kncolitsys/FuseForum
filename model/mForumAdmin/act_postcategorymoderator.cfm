<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="act_postcategorymoderator.cfm">
	<responsibilities>
		I add or remove the given moderator from the given forum
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
			<string name="add" scope="attributes" optional="Yes" />
			<string name="del" scope="attributes" optional="Yes" />
			<number name="categoryid" scope="attributes" />
			<number name="addmoderator" scope="attributes" optional="Yes" />
			<number name="categorymoderator" scope="attributes" optional="Yes" />
		</in>
		<out>
		</out>
	</io>
</fusedoc>
--->

<cfif isDefined("attributes.add")>
	
	<cfset oCategories_mod=createObject("component","FuseForum.model.mForum.categories_mod").init(attributes.categoryid,attributes.addmoderator)>
	<!--- These next 2 lines are an alternative way of initialising the instance memento:- --->
	<!--- <cfset temp=oCategories_mod.setCategoryid(attributes.categoryid)> --->
	<!--- <cfset temp=oCategories_mod.setUserid(attributes.addmoderator)> --->
	<cfset temp=Application.ao__AppObj_mForum_categories_mod_DAO.create(oCategories_mod)>

<cfelseif isDefined("attributes.del")>
	
	<cfset variables.temp=Application.ao__AppObj_mForum_categories_mod_Gateway.deleteSelected(attributes.categoryid,attributes.categorymoderator)>
</cfif>

<!--- 
$Log: act_postcategorymoderator.cfm,v $
Revision 1.1  2007/06/15 13:59:05  kevin
Add Admin Modules

Revision 1.8  2006/08/11 12:52:26  mike
change cfc objects from Server to Application scope

Revision 1.7  2006/07/31 15:43:24  kevin
Remove old SQL

Revision 1.6  2006/06/23 17:19:55  mike
new naming convention for cfc objects

Revision 1.5  2005/09/05 15:47:31  kevin
Change DSN for forums.

Revision 1.4  2005/05/20 12:33:38  kevin
New server cfc naming convention

Revision 1.3  2005/05/11 10:41:17  kevin
Rename from MVC conversion

Revision 1.2  2005/04/07 15:42:42  mike
changed to call Facade/Gateway/DAO cfc's

Revision 1.1  2005/03/29 13:28:26  mike
files moved from mForum

Revision 1.1  2005/03/09 13:49:09  mike
Moved to create MVC version

Revision 1.6  2005/02/24 13:57:27  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.5  2005/02/23 17:15:51  mike
small edits to layout

Revision 1.4  2005/02/10 17:12:59  mike
replace <cflocation> by call of url_continue.cfm in fbx_switch.cfm

Revision 1.3  2005/02/09 13:51:52  mike
add addtoken="No", improve fusedoc, etc.

Revision 1.2  2005/02/07 18:17:38  mike
improved fusedoc etc.

Revision 1.1  2005/02/04 19:56:48  mike
FB3 version made from wireframe with fusebuilder, with contents pasted from FB2 version, fbx_switch fully commented, and XFA usage improved throughout
--->
</cfsilent>
