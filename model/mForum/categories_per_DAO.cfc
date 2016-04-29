<!--- $RCSfile: categories_per_DAO.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:11 $ --->
<cfcomponent displayname="categories_per Data Access Object"
	hint="I provide persistence for a single categories_per for the application">

	<cffunction name="init" access="public" returntype="categories_per_dao" output="false"
		displayname="Categories_per Data Access Object Constructor" hint="I initialize the Data Access Object for categories_per objects.">
		<cfargument name="dsn" type="string" required="yes"
			displayname="Data Source Name" hint="I am the data source to use for persistence." />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>

	<cffunction name="create" access="public" returntype="void" output="false"
		displayname="CRUD: Create" hint="I create a new database record for the specified categories_per.">
		<cfargument name="categories_per" type="categories_per" required="yes"
			displayname="Categories_per" hint="I am the categories_per for which to create a new record." />
		<cfset var qInsertCategories_per = 0 />
		<!--- Get a memento of the object --->
		<cfset var memento = arguments.categories_per.getInstanceMemento() />
		<!--- Add it to the database --->
		<cfquery name="qInsertCategories_per" datasource="#variables.DSN#" >
			INSERT INTO categories_per 
				  ( categories_per.userid)
			VALUES (
			<cfqueryparam value="#val(memento.userid)#" CFSQLType="CF_SQL_INTEGER">)
		</cfquery>
	</cffunction>

	<cffunction name="read" access="public" returntype="void" output="false"
		displayname="CRUD: Read" hint="I read the specified database record into a categories_per object.<br />Throws: CATEGORIES_PER.MISSING if the specified categories_per cannot be found.">
		<cfargument name="categories_per" type="categories_per" required="yes"
			displayname="Categories_per" hint="I am the categories_per into which data is read." />
		<!--- Primary Key --->
		<cfargument name="categoryid" type="numeric" required="yes"
			displayname="Categories_per ID" hint="I am the ID of the Categories_per database record to read." />
		<cfset var qCategories_per = 0 />
		<cfset var memento = structNew() />
		<!--- Get the record from the database --->
		<cfquery name="qCategories_per" datasource="#variables.DSN#" >
			SELECT	categories_per.categoryid,
					categories_per.userid
			FROM	categories_per
				WHERE categories_per.categoryid = <cfqueryparam value="#val(arguments.categoryid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>

		<cfif qCategories_per.recordCount eq 1>
		<!--- Create a memento --->
			<cfset memento.categoryid = qCategories_per.categoryid />
			<cfset memento.userid = qCategories_per.userid />
			<cfset arguments.categories_per.setInstanceMemento(memento) />
		<cfelse>
			<cfthrow type="CATEGORIES_PER.MISSING" message="No such categories_per" detail="OID=#arguments.categoryid#" />
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" returntype="void" output="false"
		displayname="CRUD: Update" hint="I update the database from an categories_per.">
		<cfargument name="categories_per" type="categories_per" required="yes"
			displayname="Categories_per" hint="I am the categories_per whose record should be updated." />
		<cfset var qUpdateCategories_per = 0 />
		<cfset var memento = arguments.categories_per.getInstanceMemento() />
		<!--- Update the record in the database --->
		<cfquery name="qUpdateCategories_per" datasource="#variables.DSN#" >
			UPDATE categories_per
				SET
					userid = <cfqueryparam value="#val(memento.userid)#" CFSQLType="CF_SQL_INTEGER">
			WHERE categories_per.categoryid = <cfqueryparam value="#val(memento.categoryid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
	</cffunction>

	<cffunction name="delete" access="public" returntype="void" output="false"
		displayname="CRUD: Delete" hint="I delete an categories_per from the database.">
		<cfargument name="categories_per" type="categories_per" required="yes"
			displayname="categories_per" hint="I am the categories_per whose record should be deleted." />
		<cfset var qDeleteCategories_per = 0 />
		<cfset var memento = arguments.categories_per.getInstanceMemento() />
		<!--- Delete the record from the database --->
		<cfquery name="qDeleteCategories_per" datasource="#variables.DSN#" >
			DELETE FROM categories_per
				WHERE categories_per.categoryid = <cfqueryparam value="#val(memento.categoryid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
	</cffunction>

</cfcomponent>
<!--- 
$Log: categories_per_DAO.cfc,v $
Revision 1.2  2007/06/14 14:01:11  kevin
Initial Open Source Version

Revision 1.4  2005/06/03 17:38:04  mike
enforce var scope

Revision 1.3  2005/05/11 10:41:15  kevin
Rename from MVC conversion

Revision 1.2  2005/03/31 14:07:03  kevin
Add CVS Info

Revision 1.1  2005/03/29 09:56:21  mike
Fusebuilder Generated Code

 --->
