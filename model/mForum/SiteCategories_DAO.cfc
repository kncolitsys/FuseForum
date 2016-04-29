
<cfcomponent displayname="SiteCategories Data Access Object"
	hint="I provide persistence for a single SiteCategories for the application">

	<cffunction name="init" access="public" returntype="SiteCategories_dao" output="false"
		displayname="SiteCategories Data Access Object Constructor" hint="I initialize the Data Access Object for SiteCategories objects.">
		<cfargument name="dsn" type="string" required="yes"
			displayname="Data Source Name" hint="I am the data source to use for persistence." />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>

	<cffunction name="create" access="public" returntype="void" output="false"
		displayname="CRUD: Create" hint="I create a new database record for the specified SiteCategories.">
		<cfargument name="SiteCategories" type="SiteCategories" required="yes"
			displayname="SiteCategories" hint="I am the SiteCategories for which to create a new record." />
		<cfset var qInsertSiteCategories = 0 />
		<!--- Get a memento of the object --->
		<cfset var memento = arguments.SiteCategories.getInstanceMemento() />
		<!--- Add it to the database --->
		<cfquery name="qInsertSiteCategories" datasource="#variables.DSN#" >
			INSERT INTO SiteCategories 
				  ( SiteCategories.SiteId,
					SiteCategories.CategoryId,
					SiteCategories.Sequence)
			VALUES (
			<cfqueryparam value="#val(memento.SiteId)#" CFSQLType="CF_SQL_INTEGER">,
			<cfqueryparam value="#val(memento.CategoryId)#" CFSQLType="CF_SQL_INTEGER">,
			<cfqueryparam value="#val(memento.Sequence)#" CFSQLType="CF_SQL_SMALLINT">)
		</cfquery>
	</cffunction>

	<cffunction name="read" access="public" returntype="void" output="false"
		displayname="CRUD: Read" hint="I read the specified database record into a SiteCategories object.<br />Throws: SITECATEGORIES.MISSING if the specified SiteCategories cannot be found.">
		<cfargument name="SiteCategories" type="SiteCategories" required="yes"
			displayname="SiteCategories" hint="I am the SiteCategories into which data is read." />
		<!--- Primary Key --->
		<cfargument name="SiteCategoriesId" type="numeric" required="yes"
			displayname="SiteCategories ID" hint="I am the ID of the SiteCategories database record to read." />
		<cfset var qSiteCategories = 0 />
		<cfset var memento = structNew() />
		<!--- Get the record from the database --->
		<cfquery name="qSiteCategories" datasource="#variables.DSN#" >
			SELECT	SiteCategories.SiteCategoriesId,
					SiteCategories.SiteId,
					SiteCategories.CategoryId,
					SiteCategories.Sequence
			FROM	SiteCategories
			WHERE SiteCategories.SiteCategoriesId = <cfqueryparam value="#val(arguments.SiteCategoriesId)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>

		<cfif qSiteCategories.recordCount eq 1>
		<!--- Create a memento --->
			<cfset memento.SiteCategoriesId = qSiteCategories.SiteCategoriesId />
			<cfset memento.SiteId = qSiteCategories.SiteId />
			<cfset memento.CategoryId = qSiteCategories.CategoryId />
			<cfset memento.Sequence = qSiteCategories.Sequence />
			<cfset arguments.SiteCategories.setInstanceMemento(memento) />
		<cfelse>
			<cfthrow type="SITECATEGORIES.MISSING" message="No such SiteCategories" detail="OID=#arguments.SiteCategoriesId#" />
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" returntype="void" output="false"
		displayname="CRUD: Update" hint="I update the database from an SiteCategories.">
		<cfargument name="SiteCategories" type="SiteCategories" required="yes"
			displayname="SiteCategories" hint="I am the SiteCategories whose record should be updated." />
		<cfset var qUpdateSiteCategories = 0 />
		<cfset var memento = arguments.SiteCategories.getInstanceMemento() />
		<!--- Update the record in the database --->
		<cfquery name="qUpdateSiteCategories" datasource="#variables.DSN#" >
			UPDATE SiteCategories
			SET
				SiteId = <cfqueryparam value="#val(memento.SiteId)#" CFSQLType="CF_SQL_INTEGER">,
				CategoryId = <cfqueryparam value="#val(memento.CategoryId)#" CFSQLType="CF_SQL_INTEGER">,
				Sequence = <cfqueryparam value="#val(memento.Sequence)#" CFSQLType="CF_SQL_SMALLINT">
			WHERE SiteCategories.SiteCategoriesId = <cfqueryparam value="#val(memento.SiteCategoriesId)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
	</cffunction>

	<cffunction name="delete" access="public" returntype="void" output="false"
		displayname="CRUD: Delete" hint="I delete an SiteCategories from the database.">
		<cfargument name="SiteCategories" type="SiteCategories" required="yes"
			displayname="SiteCategories" hint="I am the SiteCategories whose record should be deleted." />
		<cfset var qDeleteSiteCategories = 0 />
		<cfset var memento = arguments.SiteCategories.getInstanceMemento() />
		<!--- Delete the record from the database --->
		<cfquery name="qDeleteSiteCategories" datasource="#variables.DSN#" >
			DELETE FROM SiteCategories
			WHERE SiteCategories.SiteCategoriesId = <cfqueryparam value="#val(memento.SiteCategoriesId)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
	</cffunction>

</cfcomponent>
<!--- 
$Log: SiteCategories_DAO.cfc,v $
Revision 1.2  2007/06/14 14:01:14  kevin
Initial Open Source Version

Revision 1.3  2005/06/03 17:38:05  mike
enforce var scope

Revision 1.2  2005/05/11 10:41:15  kevin
Rename from MVC conversion

Revision 1.1  2005/04/22 17:23:49  mike
Fusebuilder Generated Code, modified a bit

 --->
