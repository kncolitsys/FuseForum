<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="qry_allsitecategories.cfm">
	<responsibilities>
		 I query the database for all SiteCategories records
	</responsibilities>
	<properties>
		<history author="Mike Oakes" email="mike@objectiveinternet.com" date="22-Apr-2005" role="Architect" type="Create" />
		<property name="copyright" value="(c)2005 Objective Internet Limited." />
		<property name="licence" value="See licence.txt" />
		<property name="version" value="$Revision: 1.1 $" />
		<property name="lastupdated" value="$Date: 2007/06/15 13:59:05 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
		</in>
		<out>
			<recordset name="qSiteCategories" scope="variables" format="CFML">
				<number name="SiteCategoriesId" />
				<number name="SiteId" />
				<number name="CategoryId" />
				<number name="Sequence" />
				<string name="categoryname" />
			</recordset>
		</out>
	</io>
</fusedoc>
--->


<cfset qSiteCategories=Application.ao__AppObj_mForumAdmin_ForumAdmin_Facade.fAllSiteCategories("SiteId ASC, Sequence ASC")>

<!--- 
$Log: qry_allsitecategories.cfm,v $
Revision 1.1  2007/06/15 13:59:05  kevin
Add Admin Modules

Revision 1.8  2006/08/11 12:54:13  mike
change cfc objects from Server to Application scope

Revision 1.7  2006/08/01 10:56:50  mike
correct the naming convention for the ForumAdmin_Facade.cfc object

Revision 1.6  2006/07/31 15:43:24  kevin
Remove old SQL

Revision 1.5  2006/06/23 17:19:56  mike
new naming convention for cfc objects

Revision 1.4  2005/09/05 15:47:31  kevin
Change DSN for forums.

Revision 1.3  2005/05/21 15:26:35  mike
correct path for ForumAdmin_Facade

Revision 1.2  2005/05/20 12:33:38  kevin
New server cfc naming convention

Revision 1.1  2005/04/22 17:54:13  mike
new file

--->
</cfsilent>
