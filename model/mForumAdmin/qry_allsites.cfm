<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="qry_allsites.cfm">
	<responsibilities>
		 I query the database for all sites
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
			<string name="ContentDSN" scope="request" />
		</in>
		<out>
			<recordset name="qSites" scope="variables" format="CFML">
				<number name="SiteId" />
				<string name="SiteName" />
				<string name="SiteURL" />
			</recordset>
		</out>
	</io>
</fusedoc>
--->

<cfinvoke component="#Application.ao__AppObj_mForumAdmin_Site_Gateway#"
	method="findAll"
	orderby="Site.SiteId"
	returnvariable="qSites">

<!--- 
$Log: qry_allsites.cfm,v $
Revision 1.1  2007/06/15 13:59:05  kevin
Add Admin Modules

Revision 1.6  2006/08/11 12:54:13  mike
change cfc objects from Server to Application scope

Revision 1.5  2006/06/23 17:19:56  mike
new naming convention for cfc objects

Revision 1.4  2005/09/05 14:38:28  kevin
Add datasource check.

Revision 1.3  2005/06/21 10:25:07  mike
Fix SQL Bug in orderby

Revision 1.2  2005/05/20 12:33:38  kevin
New server cfc naming convention

Revision 1.1  2005/04/22 16:49:51  mike
new file

--->
</cfsilent>
