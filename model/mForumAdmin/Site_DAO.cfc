<!--- $RCSfile: Site_DAO.cfc,v $ $Revision: 1.1 $ $Author: kevin $ $Date: 2007/06/15 13:59:05 $ --->
<cfcomponent displayname="Site Data Access Object"
	hint="I provide persistence for a single Site for the application">

	<cffunction name="init" access="public" returntype="Site_dao" output="false"
		displayname="Site Data Access Object Constructor" hint="I initialize the Data Access Object for Site objects.">
		<cfargument name="dsn" type="string" required="yes"
			displayname="Data Source Name" hint="I am the data source to use for persistence." />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>

	<cffunction name="create" access="public" returntype="void" output="false"
		displayname="CRUD: Create" hint="I create a new database record for the specified Site.">
		<cfargument name="Site" type="Site" required="yes"
			displayname="Site" hint="I am the Site for which to create a new record." />
		<cfset var qInsertSite = 0 />
		<!--- Get a memento of the object --->
		<cfset var memento = arguments.Site.getInstanceMemento() />
		<!--- Add it to the database --->
	 	<cftransaction isolation="SERIALIZABLE">
		<cfquery name="qInsertSite" datasource="#variables.DSN#" >
			INSERT INTO Site 
				  ( Site.SiteName,
					Site.SiteURL,
					Site.RootDirectory,
					Site.ImagePath,
					Site.AttachmentPath,
					Site.StyleSheetPath,
					Site.DownloadPath,
					Site.CFAppName)
			VALUES (
			<cfqueryparam value="#trim(memento.SiteName)#" CFSQLType="CF_SQL_CHAR" maxLength="50">,
			<cfqueryparam value="#trim(memento.SiteURL)#" CFSQLType="CF_SQL_CHAR" maxLength="255">,
			<cfqueryparam value="#trim(memento.RootDirectory)#" CFSQLType="CF_SQL_CHAR" maxLength="255">,
			<cfqueryparam value="#trim(memento.ImagePath)#" CFSQLType="CF_SQL_CHAR" maxLength="255">,
			<cfqueryparam value="#trim(memento.AttachmentPath)#" CFSQLType="CF_SQL_CHAR" maxLength="255">,
			<cfqueryparam value="#trim(memento.StyleSheetPath)#" CFSQLType="CF_SQL_CHAR" maxLength="255">,
			<cfqueryparam value="#trim(memento.DownloadPath)#" CFSQLType="CF_SQL_CHAR" maxLength="255">,
			<cfqueryparam value="#trim(memento.CFAppName)#" CFSQLType="CF_SQL_CHAR" maxLength="50">)
		</cfquery>
		<!--- Find the SiteId and store it in the object --->
		<cfquery name="qNewSite" datasource="#variables.DSN#">
			SELECT	max(SiteId) AS newSiteId
			FROM	Site
		</cfquery>
		</cftransaction>
		<cfset memento.SiteId=qNewSite.newSiteId>
	</cffunction>

	<cffunction name="read" access="public" returntype="void" output="false"
		displayname="CRUD: Read" hint="I read the specified database record into a Site object.<br />Throws: SITE.MISSING if the specified Site cannot be found.">
		<cfargument name="Site" type="Site" required="yes"
			displayname="Site" hint="I am the Site into which data is read." />
		<!--- Primary Key --->
		<cfargument name="SiteId" type="numeric" required="yes"
			displayname="Site ID" hint="I am the ID of the Site database record to read." />
		<cfset var qSite = 0 />

		<cfset var memento = structNew() />
		<!--- Get the record from the database --->
		<cfquery name="qSite" datasource="#variables.DSN#" >
			SELECT	Site.SiteId,
					Site.SiteName,
					Site.SiteURL,
					Site.RootDirectory,
					Site.ImagePath,
					Site.AttachmentPath,
					Site.StyleSheetPath,
					Site.DownloadPath,
					Site.CFAppName,
					Site.Adverts,
					Site.Menu,
					Site.Links,
					Site.Downloads,
					Site.Polls,
					Site.Events,
					Site.Forums,
					Site.Hide,
					Site.Subscriptions,
					Site.StoryCategory,
					Site.StorySMS,
					Site.StoryPosition,
					Site.StoryTeaser,
					Site.StoryTeaserOnHomePage,
					Site.StoryIssueNo,
					Site.StoryAuthorPicture,
					Site.StoryNewsAlert,
					tblStoryType.StoryType
			FROM	Site
			WHERE 	Site.SiteId = <cfqueryparam value="#val(arguments.SiteId)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>

		<cfif qSite.recordCount eq 1>
		<!--- Create a memento --->
			<cfset memento.SiteId = qSite.SiteId />
			<cfset memento.SiteName = qSite.SiteName />
			<cfset memento.SiteURL = qSite.SiteURL />
			<cfset memento.StoryType = qSite.StoryType />
			<cfset memento.RootDirectory = qSite.RootDirectory />
			<cfset memento.ImagePath = qSite.ImagePath />
			<cfset memento.AttachmentPath = qSite.AttachmentPath />
			<cfset memento.StyleSheetPath = qSite.StyleSheetPath />
			<cfset memento.DownloadPath = qSite.DownloadPath />
			<cfset memento.CFAppName = qSite.CFAppName />
			<cfset arguments.Site.setInstanceMemento(memento) />
		<cfelse>
			<cfthrow type="SITE.MISSING" message="No such Site" detail="OID=#arguments.SiteId#" />
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" returntype="void" output="false"
		displayname="CRUD: Update" hint="I update the database from an Site.">
		<cfargument name="Site" type="Site" required="yes"
			displayname="Site" hint="I am the Site whose record should be updated." />
		<cfset var qUpdateSite = 0 />
		<cfset var memento = arguments.Site.getInstanceMemento() />
		<!--- Update the record in the database --->
		<cfquery name="qUpdateSite" datasource="#variables.DSN#" >
			UPDATE Site
				SET
					SiteName = <cfqueryparam value="#memento.SiteName#" CFSQLType="CF_SQL_CHAR" maxLength="50">,
					SiteURL = <cfqueryparam value="#memento.SiteURL#" CFSQLType="CF_SQL_CHAR" maxLength="255">,
					RootDirectory = <cfqueryparam value="#memento.RootDirectory#" CFSQLType="CF_SQL_CHAR" maxLength="255">,
					ImagePath = <cfqueryparam value="#memento.ImagePath#" CFSQLType="CF_SQL_CHAR" maxLength="255">,
					AttachmentPath = <cfqueryparam value="#memento.AttachmentPath#" CFSQLType="CF_SQL_CHAR" maxLength="255">,
					StyleSheetPath = <cfqueryparam value="#memento.StyleSheetPath#" CFSQLType="CF_SQL_CHAR" maxLength="255">,
					DownloadPath = <cfqueryparam value="#memento.DownloadPath#" CFSQLType="CF_SQL_CHAR" maxLength="255">,
					CFAppName = <cfqueryparam value="#memento.CFAppName#" CFSQLType="CF_SQL_CHAR" maxLength="50">
					
			WHERE Site.SiteId = <cfqueryparam value="#val(memento.SiteId)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
	</cffunction>

	<cffunction name="delete" access="public" returntype="void" output="false"
		displayname="CRUD: Delete" hint="I delete an Site from the database.">
		<cfargument name="Site" type="Site" required="yes"
			displayname="Site" hint="I am the Site whose record should be deleted." />
		<cfset var qDeleteSite = 0 />
		<cfset var memento = arguments.Site.getInstanceMemento() />
		<!--- Delete the record from the database --->
		<cfquery name="qDeleteSite" datasource="#variables.DSN#" >
			DELETE FROM Site
				WHERE Site.SiteId = <cfqueryparam value="#val(memento.SiteId)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
	</cffunction>

</cfcomponent>
<!--- 
$Log: Site_DAO.cfc,v $
Revision 1.1  2007/06/15 13:59:05  kevin
Add Admin Modules

Revision 1.16  2006/08/11 12:55:17  mike
change cfc objects from Server to Application scope

Revision 1.15  2006/06/23 17:21:19  mike
new naming convention for cfc objects

Revision 1.14  2006/05/10 17:49:59  mike
edits made to handle the 9 new fields in Site

Revision 1.13  2006/02/10 15:33:40  mike
create dummy publication when a new site is created

Revision 1.12  2005/07/01 11:23:24  kevin
Add DownloadPath

Revision 1.11  2005/06/21 07:08:24  kevin
Style sheet for editor saved in site table

Revision 1.10  2005/06/16 11:04:29  kevin
New field for site AppName

Revision 1.9  2005/06/10 16:05:43  kevin
Component Path name fix

Revision 1.8  2005/06/08 13:54:36  kevin
Rebuild with new fields by Fusebuilder

Revision 1.7  2005/06/03 17:38:07  mike
enforce var scope

Revision 1.6  2005/05/11 10:41:11  kevin
Rename from MVC conversion

Revision 1.5  2005/05/10 12:39:26  kevin
Change integer to numeric

Revision 1.4  2005/03/31 14:07:05  kevin
Add CVS Info

Revision 1.3  2005/03/31 13:59:56  kevin
Path Fix

Revision 1.2  2005/03/10 13:16:54  kevin
Inital File from EnglandRugby

Revision 1.1.2.1  2005/03/10 12:23:03  kevin
Files generated by fusebuilder.

 --->
