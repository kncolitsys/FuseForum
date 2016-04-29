<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="act_updatecategory.cfm">
	<responsibilities>
		I insert or update a categories (Forum) record
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
			<number name="categoryid" scope="attributes" optional="Yes" />
			<string name="categoryname" scope="attributes" />
			<string name="description" scope="attributes" />
			<string name="status" scope="attributes" />
			<boolean name="allowattachments" scope="attributes" />
			<number name="messagelimit" scope="attributes" />
			<number name="archivedays" scope="attributes" />
			<boolean name="approval" scope="attributes" />
			<boolean name="readonly" scope="attributes" />
			<string name="visibleto" scope="attributes" />
		</in>
		<out>
		</out>
	</io>
</fusedoc>
--->

<cfif NOT isNumeric(attributes.messagelimit)>
	<cfset attributes.messagelimit=0>
</cfif>
<cfif NOT isNumeric(attributes.archivedays)>
	<cfset attributes.archivedays=0>
</cfif>
<cfset attributes.description=left(attributes.description,100)>

<cfif isDefined("attributes.categoryid")><!--- so we are editing an existing Forum --->
	
	<cfset oCategories=createObject("component","FuseForum.model.mForum.categories").init()>
	<cfset temp=Application.ao__AppObj_mForum_categories_DAO.read(oCategories,attributes.categoryid)>
	<cfset temp=oCategories.setCategoryname(attributes.categoryname)>
	<cfset temp=oCategories.setDescription(attributes.description)>
	<cfset temp=oCategories.setStatus(attributes.status)>
	<cfset temp=oCategories.setAllowattachments(attributes.allowattachments)>
	<cfset temp=oCategories.setMessagelimit(attributes.messagelimit)>
	<cfset temp=oCategories.setArchivedays(attributes.archivedays)>
	<cfset temp=oCategories.setApproval(attributes.approval)>
	<cfset temp=oCategories.setReadonly(attributes.readonly)>
	<cfset temp=oCategories.setVisibleto(attributes.visibleto)>
	<cfset temp=Application.ao__AppObj_mForum_categories_DAO.update(oCategories)>

<cfelse><!--- so we are creating a new Forum --->
	
	<cfset attributes.categoryid=Application.ao__AppObj_mForumAdmin_ForumAdmin_Facade.fInsertCategory(
		attributes.categoryname,
		attributes.description,
		attributes.status,
		attributes.allowattachments,
		attributes.messagelimit,
		attributes.archivedays,
		attributes.approval,
		attributes.readonly,
		attributes.visibleto
		)>
</cfif>

<!--- 
$Log: act_updatecategory.cfm,v $
Revision 1.1  2007/06/15 13:59:05  kevin
Add Admin Modules

Revision 1.14  2006/09/05 09:21:24  mike
test that messagelimit is numeric

Revision 1.13  2006/08/11 12:52:27  mike
change cfc objects from Server to Application scope

Revision 1.12  2006/08/01 10:56:50  mike
correct the naming convention for the ForumAdmin_Facade.cfc object

Revision 1.11  2006/07/31 15:43:24  kevin
Remove old SQL

Revision 1.10  2006/06/23 17:19:56  mike
new naming convention for cfc objects

Revision 1.9  2005/09/05 15:47:31  kevin
Change DSN for forums.

Revision 1.8  2005/05/21 15:26:34  mike
correct path for ForumAdmin_Facade

Revision 1.7  2005/05/20 12:33:38  kevin
New server cfc naming convention

Revision 1.6  2005/05/11 10:41:17  kevin
Rename from MVC conversion

Revision 1.5  2005/05/09 14:17:32  mike
suuply missing archivedays parameter

Revision 1.4  2005/04/29 12:34:09  mike
small edits

Revision 1.3  2005/04/20 14:13:13  mike
include new archivedays field

Revision 1.2  2005/04/07 15:03:25  mike
changed to call Facade/Gateway/DAO cfc's

Revision 1.1  2005/03/29 13:28:26  mike
files moved from mForum

Revision 1.1  2005/03/09 13:49:09  mike
Moved to create MVC version

Revision 1.8  2005/02/24 13:57:29  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.7  2005/02/23 17:17:08  mike
small edits to code layout

Revision 1.6  2005/02/10 17:12:59  mike
replace <cflocation> by call of url_continue.cfm in fbx_switch.cfm

Revision 1.5  2005/02/09 14:18:16  mike
improved fusedoc etc.

Revision 1.4  2005/02/09 10:55:49  mike
replace <cfinsert> by <cfquery>INSERT

Revision 1.3  2005/02/09 10:41:59  mike
add addtoken="No"

Revision 1.2  2005/02/07 18:18:04  mike
improved fusedoc etc.

Revision 1.1  2005/02/04 19:56:49  mike
FB3 version made from wireframe with fusebuilder, with contents pasted from FB2 version, fbx_switch fully commented, and XFA usage improved throughout
--->
</cfsilent>
