<!--- $RCSfile: vulgarity_DAO.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:14 $ --->
<cfcomponent displayname="vulgarity Data Access Object"
	hint="I provide persistence for a single vulgarity for the application">

	<cffunction name="init" access="public" returntype="vulgarity_dao" output="false"
		displayname="Vulgarity Data Access Object Constructor" hint="I initialize the Data Access Object for vulgarity objects.">
		<cfargument name="dsn" type="string" required="yes"
			displayname="Data Source Name" hint="I am the data source to use for persistence." />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>

	<cffunction name="create" access="public" returntype="void" output="false"
		displayname="CRUD: Create" hint="I create a new database record for the specified vulgarity.">
		<cfargument name="vulgarity" type="vulgarity" required="yes"
			displayname="Vulgarity" hint="I am the vulgarity for which to create a new record." />
		<cfset var qInsertVulgarity = 0 />
		<!--- Get a memento of the object --->
		<cfset var memento = arguments.vulgarity.getInstanceMemento() />
		<!--- Add it to the database --->
		<cfquery name="qInsertVulgarity" datasource="#variables.DSN#" >
			INSERT INTO vulgarity 
				  ( vulgarity.vulgarity)
			VALUES (
			<cfqueryparam value="#trim(memento.vulgarity)#" CFSQLType="CF_SQL_CHAR" maxLength="30">)
		</cfquery>
	</cffunction>

	<cffunction name="read" access="public" returntype="void" output="false"
		displayname="CRUD: Read" hint="I read the specified database record into a vulgarity object.<br />Throws: VULGARITY.MISSING if the specified vulgarity cannot be found.">
		<cfargument name="vulgarity" type="vulgarity" required="yes"
			displayname="Vulgarity" hint="I am the vulgarity into which data is read." />
		<!--- Primary Key --->
		<cfargument name="vulgarityid" type="numeric" required="yes"
			displayname="Vulgarity ID" hint="I am the ID of the Vulgarity database record to read." />
		<cfset var qVulgarity = 0 />
		<cfset var memento = structNew() />
		<!--- Get the record from the database --->
		<cfquery name="qVulgarity" datasource="#variables.DSN#" >
			SELECT	vulgarity.vulgarityid,
					vulgarity.vulgarity
			FROM	vulgarity
				WHERE vulgarity.vulgarityid = <cfqueryparam value="#val(arguments.vulgarityid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>

		<cfif qVulgarity.recordCount eq 1>
		<!--- Create a memento --->
			<cfset memento.vulgarityid = qVulgarity.vulgarityid />
			<cfset memento.vulgarity = qVulgarity.vulgarity />
			<cfset arguments.vulgarity.setInstanceMemento(memento) />
		<cfelse>
			<cfthrow type="VULGARITY.MISSING" message="No such vulgarity" detail="OID=#arguments.vulgarityid#" />
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" returntype="void" output="false"
		displayname="CRUD: Update" hint="I update the database from an vulgarity.">
		<cfargument name="vulgarity" type="vulgarity" required="yes"
			displayname="Vulgarity" hint="I am the vulgarity whose record should be updated." />
		<cfset var qUpdateVulgarity = 0 />
		<cfset var memento = arguments.vulgarity.getInstanceMemento() />
		<!--- Update the record in the database --->
		<cfquery name="qUpdateVulgarity" datasource="#variables.DSN#" >
			UPDATE vulgarity
				SET
					vulgarity = <cfqueryparam value="#memento.vulgarity#" CFSQLType="CF_SQL_CHAR" maxLength="30">
			WHERE vulgarity.vulgarityid = <cfqueryparam value="#val(memento.vulgarityid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
	</cffunction>

	<cffunction name="delete" access="public" returntype="void" output="false"
		displayname="CRUD: Delete" hint="I delete an vulgarity from the database.">
		<cfargument name="vulgarity" type="vulgarity" required="yes"
			displayname="vulgarity" hint="I am the vulgarity whose record should be deleted." />
		<cfset var qDeleteVulgarity = 0 />
		<cfset var memento = arguments.vulgarity.getInstanceMemento() />
		<!--- Delete the record from the database --->
		<cfquery name="qDeleteVulgarity" datasource="#variables.DSN#" >
			DELETE FROM vulgarity
				WHERE vulgarity.vulgarityid = <cfqueryparam value="#val(memento.vulgarityid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
	</cffunction>

</cfcomponent>
<!--- 
$Log: vulgarity_DAO.cfc,v $
Revision 1.2  2007/06/14 14:01:14  kevin
Initial Open Source Version

Revision 1.4  2005/06/03 17:38:06  mike
enforce var scope

Revision 1.3  2005/05/11 10:41:15  kevin
Rename from MVC conversion

Revision 1.2  2005/03/31 14:07:04  kevin
Add CVS Info

Revision 1.1  2005/03/29 10:00:03  mike
Fusebuilder Generated Code

 --->
