<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="qry_categories.cfm">
	<responsibilities>
		I get all the Forums
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
			<boolean name="userisadmin" scope="client or session" />
			<number name="userid" scope="request" />
		</in>
		<out>
			<recordset name="qCategories" scope="variables" format="CFML">
				<number name="categoryid" />
				<string name="categoryname" />
				<string name="description" />
				<string name="status" />
				<boolean name="allowattachments" />
				<number name="messagelimit" />
				<number name="archivedays" />
				<boolean name="approval" />
				<boolean name="readonly" />
				<number name="categoryowner" />
				<string name="visibleto" />
			</recordset>
		</out>
	</io>
</fusedoc>
--->

<cfif isDefined("request.persist.userisadmin") AND request.persist.userisadmin EQ 1>
	<cfset qCategories=Application.ao__AppObj_mForum_categories_Gateway.findAll()>
<cfelse>
	<cfset qCategories=Application.ao__AppObj_mForumAdmin_ForumAdmin_Facade.fAllForumsOfModerator(request.userid,"categoryname")>
</cfif>

<!--- 
$Log: qry_categories.cfm,v $
Revision 1.1  2007/06/15 13:59:05  kevin
Add Admin Modules

Revision 1.16  2006/08/11 12:54:13  mike
change cfc objects from Server to Application scope

Revision 1.15  2006/08/01 10:56:50  mike
correct the naming convention for the ForumAdmin_Facade.cfc object

Revision 1.14  2006/07/31 15:43:24  kevin
Remove old SQL

Revision 1.13  2006/06/23 17:19:56  mike
new naming convention for cfc objects

Revision 1.12  2005/09/05 15:47:31  kevin
Change DSN for forums.

Revision 1.11  2005/06/21 10:48:55  mike
test that request.persist.clientisadmin is defined

Revision 1.10  2005/06/11 09:28:22  mike
improve fusedoc

Revision 1.9  2005/06/11 08:42:27  mike
change client to generic persistent variables

Revision 1.8  2005/06/03 14:23:00  mike
bug fix: categoriesCat. => categories

Revision 1.7  2005/06/03 12:03:24  mike
bug fix: client.loggedinuser => request.userid

Revision 1.6  2005/05/21 15:26:35  mike
correct path for ForumAdmin_Facade

Revision 1.5  2005/05/20 12:33:38  kevin
New server cfc naming convention

Revision 1.4  2005/04/20 14:11:58  mike
change query name to qCategories; include new archivedays field

Revision 1.3  2005/04/01 13:43:42  mike
small edits

Revision 1.2  2005/04/01 12:15:58  mike
modify to call Facade &/or Gateway methods

Revision 1.1  2005/03/29 13:28:27  mike
files moved from mForum

Revision 1.1  2005/03/09 13:53:00  mike
Moved to create MVC version

Revision 1.4  2005/02/24 13:57:41  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.3  2005/02/23 17:18:02  mike
small edits to code layout

Revision 1.2  2005/02/09 16:28:47  mike
improved fusedoc, etc.

Revision 1.1  2005/02/04 19:56:51  mike
FB3 version made from wireframe with fusebuilder, with contents pasted from FB2 version, fbx_switch fully commented, and XFA usage improved throughout
--->
</cfsilent>
