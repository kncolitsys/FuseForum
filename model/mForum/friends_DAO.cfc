<!--- $RCSfile: friends_DAO.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:11 $ --->
<cfcomponent displayname="friends Data Access Object"
	hint="I provide persistence for a single friends for the application">

	<cffunction name="init" access="public" returntype="friends_dao" output="false"
		displayname="Friends Data Access Object Constructor" hint="I initialize the Data Access Object for friends objects.">
		<cfargument name="dsn" type="string" required="yes"
			displayname="Data Source Name" hint="I am the data source to use for persistence." />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>

	<cffunction name="create" access="public" returntype="void" output="false"
		displayname="CRUD: Create" hint="I create a new database record for the specified friends.">
		<cfargument name="friends" type="friends" required="yes"
			displayname="Friends" hint="I am the friends for which to create a new record." />
		<cfset var qInsertFriends = 0 />
		<!--- Get a memento of the object --->
		<cfset var memento = arguments.friends.getInstanceMemento() />
		<!--- Add it to the database --->
		<cfquery name="qInsertFriends" datasource="#variables.DSN#" >
			INSERT INTO friends 
				  ( friends.userid,
					friends.friendid)
			VALUES (
			<cfqueryparam value="#val(memento.userid)#" CFSQLType="CF_SQL_INTEGER">,
			<cfqueryparam value="#val(memento.friendid)#" CFSQLType="CF_SQL_INTEGER">)
		</cfquery>
	</cffunction>

	<cffunction name="read" access="public" returntype="void" output="false"
		displayname="CRUD: Read" hint="I read the specified database record into a friends object.<br />Throws: FRIENDS.MISSING if the specified friends cannot be found.">
		<cfargument name="friends" type="friends" required="yes"
			displayname="Friends" hint="I am the friends into which data is read." />
		<!--- Primary Key --->
		<cfargument name="recordid" type="numeric" required="yes"
			displayname="Friends ID" hint="I am the ID of the Friends database record to read." />
		<cfset var qFriends = 0 />
		<cfset var memento = structNew() />
		<!--- Get the record from the database --->
		<cfquery name="qFriends" datasource="#variables.DSN#" >
			SELECT	friends.recordid,
					friends.userid,
					friends.friendid
			FROM	friends
				WHERE friends.recordid = <cfqueryparam value="#val(arguments.recordid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>

		<cfif qFriends.recordCount eq 1>
		<!--- Create a memento --->
			<cfset memento.recordid = qFriends.recordid />
			<cfset memento.userid = qFriends.userid />
			<cfset memento.friendid = qFriends.friendid />
			<cfset arguments.friends.setInstanceMemento(memento) />
		<cfelse>
			<cfthrow type="FRIENDS.MISSING" message="No such friends" detail="OID=#arguments.recordid#" />
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" returntype="void" output="false"
		displayname="CRUD: Update" hint="I update the database from an friends.">
		<cfargument name="friends" type="friends" required="yes"
			displayname="Friends" hint="I am the friends whose record should be updated." />
		<cfset var qUpdateFriends = 0 />
		<cfset var memento = arguments.friends.getInstanceMemento() />
		<!--- Update the record in the database --->
		<cfquery name="qUpdateFriends" datasource="#variables.DSN#" >
			UPDATE friends
				SET
					userid = <cfqueryparam value="#val(memento.userid)#" CFSQLType="CF_SQL_INTEGER">,
					friendid = <cfqueryparam value="#val(memento.friendid)#" CFSQLType="CF_SQL_INTEGER">
			WHERE friends.recordid = <cfqueryparam value="#val(memento.recordid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
	</cffunction>

	<cffunction name="delete" access="public" returntype="void" output="false"
		displayname="CRUD: Delete" hint="I delete an friends from the database.">
		<cfargument name="friends" type="friends" required="yes"
			displayname="friends" hint="I am the friends whose record should be deleted." />
		<cfset var qDeleteFriends = 0 />
		<cfset var memento = arguments.friends.getInstanceMemento() />
		<!--- Delete the record from the database --->
		<cfquery name="qDeleteFriends" datasource="#variables.DSN#" >
			DELETE FROM friends
				WHERE friends.recordid = <cfqueryparam value="#val(memento.recordid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
	</cffunction>

</cfcomponent>
<!--- 
$Log: friends_DAO.cfc,v $
Revision 1.2  2007/06/14 14:01:11  kevin
Initial Open Source Version

Revision 1.4  2005/06/03 17:38:04  mike
enforce var scope

Revision 1.3  2005/05/11 10:41:15  kevin
Rename from MVC conversion

Revision 1.2  2005/03/31 14:07:04  kevin
Add CVS Info

Revision 1.1  2005/03/29 09:57:55  mike
Fusebuilder Generated Code

 --->
