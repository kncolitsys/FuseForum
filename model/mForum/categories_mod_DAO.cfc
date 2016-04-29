<!--- $RCSfile: categories_mod_DAO.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:11 $ --->
<cfcomponent displayname="categories_mod Data Access Object"
	hint="I provide persistence for a single categories_mod for the application">

	<cffunction name="init" access="public" returntype="categories_mod_dao" output="false"
		displayname="Categories_mod Data Access Object Constructor" hint="I initialize the Data Access Object for categories_mod objects.">
		<cfargument name="dsn" type="string" required="yes"
			displayname="Data Source Name" hint="I am the data source to use for persistence." />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>

	<cffunction name="create" access="public" returntype="void" output="false"
		displayname="CRUD: Create" hint="I create a new database record for the specified categories_mod.">
		<cfargument name="categories_mod" type="categories_mod" required="yes"
			displayname="Categories_mod" hint="I am the categories_mod for which to create a new record." />
		<cfset var qInsertCategories_mod = 0 />
		<!--- Get a memento of the object --->
		<cfset var memento = arguments.categories_mod.getInstanceMemento() />
		<!--- Add it to the database --->
		<cfquery name="qInsertCategories_mod" datasource="#variables.DSN#" >
			INSERT INTO categories_mod 
				(
				categories_mod.categoryid,
				categories_mod.userid
				)
			VALUES
				(
				<cfqueryparam value="#val(memento.categoryid)#" CFSQLType="CF_SQL_INTEGER">,
				<cfqueryparam value="#val(memento.userid)#" CFSQLType="CF_SQL_INTEGER">
				)
		</cfquery>
	</cffunction>

	<cffunction name="read" access="public" returntype="void" output="false"
		displayname="CRUD: Read" hint="I read the specified database record into a categories_mod object.<br />Throws: CATEGORIES_MOD.MISSING if the specified categories_mod cannot be found.">
		<cfargument name="categories_mod" type="categories_mod" required="yes"
			displayname="Categories_mod" hint="I am the categories_mod into which data is read." />
		<!--- Primary Key --->
		<cfargument name="categoryid" type="numeric" required="yes"
			displayname="Categories_mod ID" hint="I am the ID of the Categories_mod database record to read." />
		<cfset var qCategories_mod = 0 />
		<cfset var memento = structNew() />
		<!--- Get the record from the database --->
		<cfquery name="qCategories_mod" datasource="#variables.DSN#" >
			SELECT	categories_mod.categoryid,
					categories_mod.userid
			FROM	categories_mod
			WHERE categories_mod.categoryid = <cfqueryparam value="#val(arguments.categoryid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>

		<cfif qCategories_mod.recordCount eq 1>
		<!--- Create a memento --->
			<cfset memento.categoryid = qCategories_mod.categoryid />
			<cfset memento.userid = qCategories_mod.userid />
			<cfset arguments.categories_mod.setInstanceMemento(memento) />
		<cfelse>
			<cfthrow type="CATEGORIES_MOD.MISSING" message="No such categories_mod" detail="OID=#arguments.categoryid#" />
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" returntype="void" output="false"
		displayname="CRUD: Update" hint="I update the database from an categories_mod.">
		<cfargument name="categories_mod" type="categories_mod" required="yes"
			displayname="Categories_mod" hint="I am the categories_mod whose record should be updated." />
		<cfset var qUpdateCategories_mod = 0 />
		<cfset var memento = arguments.categories_mod.getInstanceMemento() />
		<!--- Update the record in the database --->
		<cfquery name="qUpdateCategories_mod" datasource="#variables.DSN#" >
			UPDATE categories_mod
				SET
					userid = <cfqueryparam value="#val(memento.userid)#" CFSQLType="CF_SQL_INTEGER">
			WHERE categories_mod.categoryid = <cfqueryparam value="#val(memento.categoryid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
	</cffunction>

	<cffunction name="delete" access="public" returntype="void" output="false"
		displayname="CRUD: Delete" hint="I delete an categories_mod from the database.">
		<cfargument name="categories_mod" type="categories_mod" required="yes"
			displayname="categories_mod" hint="I am the categories_mod whose record should be deleted." />
		<cfset var qDeleteCategories_mod = 0 />
		<cfset var memento = arguments.categories_mod.getInstanceMemento() />
		<!--- Delete the record from the database --->
		<cfquery name="qDeleteCategories_mod" datasource="#variables.DSN#" >
			DELETE FROM categories_mod
				WHERE categories_mod.categoryid = <cfqueryparam value="#val(memento.categoryid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
	</cffunction>

</cfcomponent>
<!--- 
$Log: categories_mod_DAO.cfc,v $
Revision 1.2  2007/06/14 14:01:11  kevin
Initial Open Source Version

Revision 1.5  2005/06/03 17:38:04  mike
enforce var scope

Revision 1.4  2005/05/11 10:41:15  kevin
Rename from MVC conversion

Revision 1.3  2005/04/11 12:27:38  mike
must set categories_mod.categoryid as well on INSERT

Revision 1.2  2005/03/31 14:07:03  kevin
Add CVS Info

Revision 1.1  2005/03/29 09:56:21  mike
Fusebuilder Generated Code

 --->
