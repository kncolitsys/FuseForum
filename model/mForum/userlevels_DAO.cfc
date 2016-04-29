<!--- $RCSfile: userlevels_DAO.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:14 $ --->
<cfcomponent displayname="userlevels Data Access Object"
	hint="I provide persistence for a single userlevels for the application">

	<cffunction name="init" access="public" returntype="userlevels_dao" output="false"
		displayname="Userlevels Data Access Object Constructor" hint="I initialize the Data Access Object for userlevels objects.">
		<cfargument name="dsn" type="string" required="yes"
			displayname="Data Source Name" hint="I am the data source to use for persistence." />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>

	<cffunction name="create" access="public" returntype="void" output="false"
		displayname="CRUD: Create" hint="I create a new database record for the specified userlevels.">
		<cfargument name="userlevels" type="userlevels" required="yes"
			displayname="Userlevels" hint="I am the userlevels for which to create a new record." />
		<cfset var qInsertUserlevels = 0 />
		<!--- Get a memento of the object --->
		<cfset var memento = arguments.userlevels.getInstanceMemento() />
		<!--- Add it to the database --->
		<cfquery name="qInsertUserlevels" datasource="#variables.DSN#" >
			INSERT INTO userlevels 
				  ( userlevels.userlevel)
			VALUES (
			<cfqueryparam value="#trim(memento.userlevel)#" CFSQLType="CF_SQL_CHAR" maxLength="50">)
		</cfquery>
	</cffunction>

	<cffunction name="read" access="public" returntype="void" output="false"
		displayname="CRUD: Read" hint="I read the specified database record into a userlevels object.<br />Throws: USERLEVELS.MISSING if the specified userlevels cannot be found.">
		<cfargument name="userlevels" type="userlevels" required="yes"
			displayname="Userlevels" hint="I am the userlevels into which data is read." />
		<!--- Primary Key --->
		<cfargument name="userlevelid" type="numeric" required="yes"
			displayname="Userlevels ID" hint="I am the ID of the Userlevels database record to read." />
		<cfset var qUserlevels = 0 />
		<cfset var memento = structNew() />
		<!--- Get the record from the database --->
		<cfquery name="qUserlevels" datasource="#variables.DSN#" >
			SELECT	userlevels.userlevelid,
					userlevels.userlevel
			FROM	userlevels
				WHERE userlevels.userlevelid = <cfqueryparam value="#val(arguments.userlevelid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>

		<cfif qUserlevels.recordCount eq 1>
		<!--- Create a memento --->
			<cfset memento.userlevelid = qUserlevels.userlevelid />
			<cfset memento.userlevel = qUserlevels.userlevel />
			<cfset arguments.userlevels.setInstanceMemento(memento) />
		<cfelse>
			<cfthrow type="USERLEVELS.MISSING" message="No such userlevels" detail="OID=#arguments.userlevelid#" />
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" returntype="void" output="false"
		displayname="CRUD: Update" hint="I update the database from an userlevels.">
		<cfargument name="userlevels" type="userlevels" required="yes"
			displayname="Userlevels" hint="I am the userlevels whose record should be updated." />
		<cfset var qUpdateUserlevels = 0 />
		<cfset var memento = arguments.userlevels.getInstanceMemento() />
		<!--- Update the record in the database --->
		<cfquery name="qUpdateUserlevels" datasource="#variables.DSN#" >
			UPDATE userlevels
				SET
					userlevel = <cfqueryparam value="#memento.userlevel#" CFSQLType="CF_SQL_CHAR" maxLength="50">
			WHERE userlevels.userlevelid = <cfqueryparam value="#val(memento.userlevelid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
	</cffunction>

	<cffunction name="delete" access="public" returntype="void" output="false"
		displayname="CRUD: Delete" hint="I delete an userlevels from the database.">
		<cfargument name="userlevels" type="userlevels" required="yes"
			displayname="userlevels" hint="I am the userlevels whose record should be deleted." />
		<cfset var qDeleteUserlevels = 0 />
		<cfset var memento = arguments.userlevels.getInstanceMemento() />
		<!--- Delete the record from the database --->
		<cfquery name="qDeleteUserlevels" datasource="#variables.DSN#" >
			DELETE FROM userlevels
				WHERE userlevels.userlevelid = <cfqueryparam value="#val(memento.userlevelid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
	</cffunction>

</cfcomponent>
<!--- 
$Log: userlevels_DAO.cfc,v $
Revision 1.2  2007/06/14 14:01:14  kevin
Initial Open Source Version

Revision 1.4  2005/06/03 17:38:06  mike
enforce var scope

Revision 1.3  2005/05/11 10:41:15  kevin
Rename from MVC conversion

Revision 1.2  2005/03/31 14:07:04  kevin
Add CVS Info

Revision 1.1  2005/03/29 10:00:00  mike
Fusebuilder Generated Code

 --->
