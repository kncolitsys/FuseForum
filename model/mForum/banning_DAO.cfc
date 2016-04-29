<!--- $RCSfile: banning_DAO.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:10 $ --->
<cfcomponent displayname="banning Data Access Object"
	hint="I provide persistence for a single banning for the application">

	<cffunction name="init" access="public" returntype="banning_dao" output="false"
		displayname="Banning Data Access Object Constructor" hint="I initialize the Data Access Object for banning objects.">
		<cfargument name="dsn" type="string" required="yes"
			displayname="Data Source Name" hint="I am the data source to use for persistence." />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>

	<cffunction name="create" access="public" returntype="void" output="false"
		displayname="CRUD: Create" hint="I create a new database record for the specified banning.">
		<cfargument name="banning" type="banning" required="yes"
			displayname="Banning" hint="I am the banning for which to create a new record." />
		<cfset var qInsertBanning = 0 />
		<!--- Get a memento of the object --->
		<cfset var memento = arguments.banning.getInstanceMemento() />
		<!--- Add it to the database --->
		<cfquery name="qInsertBanning" datasource="#variables.DSN#" >
			INSERT INTO banning 
				  ( banning.bantype,
					banning.banstring)
			VALUES (
			<cfqueryparam value="#trim(memento.bantype)#" CFSQLType="CF_SQL_CHAR" maxLength="10">,
			<cfqueryparam value="#trim(memento.banstring)#" CFSQLType="CF_SQL_CHAR" maxLength="100">)
		</cfquery>
	</cffunction>

	<cffunction name="read" access="public" returntype="void" output="false"
		displayname="CRUD: Read" hint="I read the specified database record into a banning object.<br />Throws: BANNING.MISSING if the specified banning cannot be found.">
		<cfargument name="banning" type="banning" required="yes"
			displayname="Banning" hint="I am the banning into which data is read." />
		<!--- Primary Key --->
		<cfargument name="banid" type="numeric" required="yes"
			displayname="Banning ID" hint="I am the ID of the Banning database record to read." />
		<cfset var qBanning = 0 />
		<cfset var memento = structNew() />
		<!--- Get the record from the database --->
		<cfquery name="qBanning" datasource="#variables.DSN#" >
			SELECT	banning.banid,
					banning.bantype,
					banning.banstring
			FROM	banning
				WHERE banning.banid = <cfqueryparam value="#val(arguments.banid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>

		<cfif qBanning.recordCount eq 1>
		<!--- Create a memento --->
			<cfset memento.banid = qBanning.banid />
			<cfset memento.bantype = qBanning.bantype />
			<cfset memento.banstring = qBanning.banstring />
			<cfset arguments.banning.setInstanceMemento(memento) />
		<cfelse>
			<cfthrow type="BANNING.MISSING" message="No such banning" detail="OID=#arguments.banid#" />
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" returntype="void" output="false"
		displayname="CRUD: Update" hint="I update the database from an banning.">
		<cfargument name="banning" type="banning" required="yes"
			displayname="Banning" hint="I am the banning whose record should be updated." />
		<cfset var qUpdateBanning = 0 />
		<cfset var memento = arguments.banning.getInstanceMemento() />
		<!--- Update the record in the database --->
		<cfquery name="qUpdateBanning" datasource="#variables.DSN#" >
			UPDATE banning
				SET
					bantype = <cfqueryparam value="#memento.bantype#" CFSQLType="CF_SQL_CHAR" maxLength="10">,
					banstring = <cfqueryparam value="#memento.banstring#" CFSQLType="CF_SQL_CHAR" maxLength="100">
			WHERE banning.banid = <cfqueryparam value="#val(memento.banid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
	</cffunction>

	<cffunction name="delete" access="public" returntype="void" output="false"
		displayname="CRUD: Delete" hint="I delete an banning from the database.">
		<cfargument name="banning" type="banning" required="yes"
			displayname="banning" hint="I am the banning whose record should be deleted." />
		<cfset var qDeleteBanning = 0 />
		<cfset var memento = arguments.banning.getInstanceMemento() />
		<!--- Delete the record from the database --->
		<cfquery name="qDeleteBanning" datasource="#variables.DSN#" >
			DELETE FROM banning
				WHERE banning.banid = <cfqueryparam value="#val(memento.banid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
	</cffunction>

</cfcomponent>
<!--- 
$Log: banning_DAO.cfc,v $
Revision 1.2  2007/06/14 14:01:10  kevin
Initial Open Source Version

Revision 1.4  2005/06/03 17:38:03  mike
enforce var scope

Revision 1.3  2005/05/11 10:41:15  kevin
Rename from MVC conversion

Revision 1.2  2005/03/31 14:07:03  kevin
Add CVS Info

Revision 1.1  2005/03/29 09:56:18  mike
Fusebuilder Generated Code

 --->
