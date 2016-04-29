<!--- $RCSfile: categories_DAO.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:11 $ --->
<cfcomponent displayname="categories Data Access Object"
	hint="I provide persistence for a single categories for the application">

	<cffunction name="init" access="public" returntype="categories_dao" output="false"
		displayname="Categories Data Access Object Constructor" hint="I initialize the Data Access Object for categories objects.">
		<cfargument name="dsn" type="string" required="yes"
			displayname="Data Source Name" hint="I am the data source to use for persistence." />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>

	<cffunction name="create" access="public" returntype="void" output="false"
		displayname="CRUD: Create" hint="I create a new database record for the specified categories.">
		<cfargument name="categories" type="categories" required="yes"
			displayname="Categories" hint="I am the categories for which to create a new record." />
		<cfset var qInsertCategories = 0 />
		<!--- Get a memento of the object --->
		<cfset var memento = arguments.categories.getInstanceMemento() />
		<!--- Add it to the database --->
		<cfquery name="qInsertCategories" datasource="#variables.DSN#" >
			INSERT INTO categories 
				  ( categories.categoryname,
					categories.description,
					categories.status,
					categories.allowattachments,
					categories.messagelimit,
					categories.archivedays,
					categories.approval,
					categories.readonly,
					categories.categoryowner,
					categories.visibleto)
			VALUES (
			<cfqueryparam value="#trim(memento.categoryname)#" CFSQLType="CF_SQL_CHAR" maxLength="50">,
			<cfqueryparam value="#trim(memento.description)#" CFSQLType="CF_SQL_CHAR" maxLength="100">,
			<cfqueryparam value="#trim(memento.status)#" CFSQLType="CF_SQL_CHAR" maxLength="50">,
			<cfqueryparam value="#val(memento.allowattachments)#" CFSQLType="CF_SQL_BOOLEAN">,
			<cfqueryparam value="#val(memento.messagelimit)#" CFSQLType="CF_SQL_INTEGER">,
			<cfqueryparam value="#val(memento.archivedays)#" CFSQLType="CF_SQL_INTEGER">,
			<cfqueryparam value="#val(memento.approval)#" CFSQLType="CF_SQL_BOOLEAN">,
			<cfqueryparam value="#val(memento.readonly)#" CFSQLType="CF_SQL_BOOLEAN">,
			<cfqueryparam value="#val(memento.categoryowner)#" CFSQLType="CF_SQL_INTEGER">,
			<cfqueryparam value="#trim(memento.visibleto)#" CFSQLType="CF_SQL_CHAR" maxLength="15">)
		</cfquery>
	</cffunction>

	<cffunction name="read" access="public" returntype="void" output="false"
		displayname="CRUD: Read" hint="I read the specified database record into a categories object.<br />Throws: CATEGORIES.MISSING if the specified categories cannot be found.">
		<cfargument name="categories" type="categories" required="yes"
			displayname="Categories" hint="I am the categories into which data is read." />
		<!--- Primary Key --->
		<cfargument name="categoryid" type="numeric" required="yes"
			displayname="Categories ID" hint="I am the ID of the Categories database record to read." />
		<cfset var qCategories = 0 />
		<cfset var memento = structNew() />
		<!--- Get the record from the database --->
		<cfquery name="qCategories" datasource="#variables.DSN#" >
			SELECT	categories.categoryid,
					categories.categoryname,
					categories.description,
					categories.status,
					categories.allowattachments,
					categories.messagelimit,
					categories.archivedays,
					categories.approval,
					categories.readonly,
					categories.categoryowner,
					categories.visibleto
			FROM	categories
				WHERE categories.categoryid = <cfqueryparam value="#val(arguments.categoryid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>

		<cfif qCategories.recordCount eq 1>
		<!--- Create a memento --->
			<cfset memento.categoryid = qCategories.categoryid />
			<cfset memento.categoryname = qCategories.categoryname />
			<cfset memento.description = qCategories.description />
			<cfset memento.status = qCategories.status />
			<cfset memento.allowattachments = qCategories.allowattachments />
			<cfset memento.messagelimit = qCategories.messagelimit />
			<cfset memento.archivedays = qCategories.archivedays />
			<cfset memento.approval = qCategories.approval />
			<cfset memento.readonly = qCategories.readonly />
			<cfset memento.categoryowner = qCategories.categoryowner />
			<cfset memento.visibleto = qCategories.visibleto />
			<cfset arguments.categories.setInstanceMemento(memento) />
		<cfelse>
			<cfthrow type="CATEGORIES.MISSING" message="No such categories" detail="OID=#arguments.categoryid#" />
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" returntype="void" output="false"
		displayname="CRUD: Update" hint="I update the database from an categories.">
		<cfargument name="categories" type="categories" required="yes"
			displayname="Categories" hint="I am the categories whose record should be updated." />
		<cfset var qUpdateCategories = 0 />
		<cfset var memento = arguments.categories.getInstanceMemento() />
		<!--- Update the record in the database --->
		<cfquery name="qUpdateCategories" datasource="#variables.DSN#" >
			UPDATE categories
				SET
					categoryname = <cfqueryparam value="#memento.categoryname#" CFSQLType="CF_SQL_CHAR" maxLength="50">,
					description = <cfqueryparam value="#memento.description#" CFSQLType="CF_SQL_CHAR" maxLength="100">,
					status = <cfqueryparam value="#memento.status#" CFSQLType="CF_SQL_CHAR" maxLength="50">,
					allowattachments = <cfqueryparam value="#val(memento.allowattachments)#" CFSQLType="CF_SQL_BOOLEAN">,
					messagelimit = <cfqueryparam value="#val(memento.messagelimit)#" CFSQLType="CF_SQL_INTEGER">,
					archivedays = <cfqueryparam value="#val(memento.archivedays)#" CFSQLType="CF_SQL_INTEGER">,
					approval = <cfqueryparam value="#val(memento.approval)#" CFSQLType="CF_SQL_BOOLEAN">,
					readonly = <cfqueryparam value="#val(memento.readonly)#" CFSQLType="CF_SQL_BOOLEAN">,
					categoryowner = <cfqueryparam value="#val(memento.categoryowner)#" CFSQLType="CF_SQL_INTEGER">,
					visibleto = <cfqueryparam value="#memento.visibleto#" CFSQLType="CF_SQL_CHAR" maxLength="15">
			WHERE categories.categoryid = <cfqueryparam value="#val(memento.categoryid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
	</cffunction>

	<cffunction name="delete" access="public" returntype="void" output="false"
		displayname="CRUD: Delete" hint="I delete an categories from the database.">
		<cfargument name="categories" type="categories" required="yes"
			displayname="categories" hint="I am the categories whose record should be deleted." />
		<cfset var qDeleteCategories = 0 />
		<cfset var memento = arguments.categories.getInstanceMemento() />
		<!--- Delete the record from the database --->
		<cfquery name="qDeleteCategories" datasource="#variables.DSN#" >
			DELETE FROM categories
				WHERE categories.categoryid = <cfqueryparam value="#val(memento.categoryid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
	</cffunction>

</cfcomponent>
<!--- 
$Log: categories_DAO.cfc,v $
Revision 1.2  2007/06/14 14:01:11  kevin
Initial Open Source Version

Revision 1.5  2005/06/03 17:38:04  mike
enforce var scope

Revision 1.4  2005/05/11 10:41:15  kevin
Rename from MVC conversion

Revision 1.3  2005/04/20 11:43:14  mike
handle the new field archivedays

Revision 1.2  2005/03/31 14:07:03  kevin
Add CVS Info

Revision 1.1  2005/03/29 09:56:19  mike
Fusebuilder Generated Code

 --->
