<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="qry_categorymoderators.cfm">
	<responsibilities>
		I get all the moderators for the given forum
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
			<string name="userDSN" scope="request" />
			<number name="categoryid" scope="attributes" />
		</in>
		<out>
			<recordset name="categorytitle" scope="variables" format="CFML">
				<string name="categoryname"/>
			</recordset>
			<recordset name="categorymoderators" scope="variables" format="CFML">
				<number name="userid" />
				<string name="username"/>
			</recordset>
			<recordset name="allmoderators" scope="variables" format="CFML">
				<number name="name_id" />
				<string name="name_login_name"/>
			</recordset>
		</out>
	</io>
</fusedoc>
--->

<cfset categorytitle=Application.ao__AppObj_mForum_categories_Gateway.findSelected(attributes.categoryid)>

<cfset categorymoderators=Application.ao__AppObj_mForumAdmin_ForumAdmin_Facade.fCategoryModerators(attributes.categoryid,"usr.username")>

<cfset allmoderators=Application.ao__AppObj_mForumAdmin_ForumAdmin_Facade.fAllModerators(ValueList(categorymoderators.userid))>

<!--- 
$Log: qry_categorymoderators.cfm,v $
Revision 1.1  2007/06/15 13:59:05  kevin
Add Admin Modules

Revision 1.12  2006/08/11 12:54:13  mike
change cfc objects from Server to Application scope

Revision 1.11  2006/08/08 11:05:42  mike
don't pass orderby parameter to fAllModerators(); improve fusedoc

Revision 1.10  2006/08/01 10:56:50  mike
correct the naming convention for the ForumAdmin_Facade.cfc object

Revision 1.9  2006/07/31 15:45:01  kevin
Trafalgar Conversion: specify name of users view at init.

Revision 1.8  2006/06/23 17:19:56  mike
new naming convention for cfc objects

Revision 1.7  2005/09/05 15:47:31  kevin
Change DSN for forums.

Revision 1.6  2005/05/21 15:26:35  mike
correct path for ForumAdmin_Facade

Revision 1.5  2005/05/20 12:33:38  kevin
New server cfc naming convention

Revision 1.4  2005/04/11 12:40:02  mike
small bug fix

Revision 1.3  2005/04/01 13:44:12  mike
small edits

Revision 1.2  2005/03/31 17:14:13  mike
modify to cll Gateway & Facade methods

Revision 1.1  2005/03/29 13:28:27  mike
files moved from mForum

Revision 1.1  2005/03/09 13:53:00  mike
Moved to create MVC version

Revision 1.4  2005/02/24 13:57:42  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.3  2005/02/17 16:26:09  mike
delete the stored procedure code

Revision 1.2  2005/02/07 18:13:19  mike
convert stored procedure into (improved) <cfquery>s

Revision 1.1  2005/02/04 19:56:51  mike
FB3 version made from wireframe with fusebuilder, with contents pasted from FB2 version, fbx_switch fully commented, and XFA usage improved throughout
--->
</cfsilent>
