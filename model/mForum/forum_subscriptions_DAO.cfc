<!--- $RCSfile: forum_subscriptions_DAO.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:11 $ --->
<cfcomponent displayname="forum_subscriptions Data Access Object"
	hint="I provide persistence for a single forum_subscriptions for the application">

	<cffunction name="init" access="public" returntype="forum_subscriptions_dao" output="false"
		displayname="Forum_subscriptions Data Access Object Constructor" hint="I initialize the Data Access Object for forum_subscriptions objects.">
		<cfargument name="dsn" type="string" required="yes"
			displayname="Data Source Name" hint="I am the data source to use for persistence." />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>

	<cffunction name="create" access="public" returntype="void" output="false"
		displayname="CRUD: Create" hint="I create a new database record for the specified forum_subscriptions.">
		<cfargument name="forum_subscriptions" type="forum_subscriptions" required="yes"
			displayname="Forum_subscriptions" hint="I am the forum_subscriptions for which to create a new record." />
		<cfset var qInsertForum_subscriptions = 0 />
		<!--- Get a memento of the object --->
		<cfset var memento = arguments.forum_subscriptions.getInstanceMemento() />
		<!--- Add it to the database --->
		<cfquery name="qInsertForum_subscriptions" datasource="#variables.DSN#" >
			INSERT INTO forum_subscriptions 
				  ( forum_subscriptions.fs_name_id,
					forum_subscriptions.fs_forum_id)
			VALUES (
			<cfqueryparam value="#val(memento.fs_name_id)#" CFSQLType="CF_SQL_INTEGER">,
			<cfqueryparam value="#val(memento.fs_forum_id)#" CFSQLType="CF_SQL_INTEGER">)
		</cfquery>
	</cffunction>

	<cffunction name="read" access="public" returntype="void" output="false"
		displayname="CRUD: Read" hint="I read the specified database record into a forum_subscriptions object.<br />Throws: FORUM_SUBSCRIPTIONS.MISSING if the specified forum_subscriptions cannot be found.">
		<cfargument name="forum_subscriptions" type="forum_subscriptions" required="yes"
			displayname="Forum_subscriptions" hint="I am the forum_subscriptions into which data is read." />
		<!--- Primary Key --->
		<cfargument name="fs_id" type="numeric" required="yes"
			displayname="Forum_subscriptions ID" hint="I am the ID of the Forum_subscriptions database record to read." />
		<cfset var qForum_subscriptions = 0 />
		<cfset var memento = structNew() />
		<!--- Get the record from the database --->
		<cfquery name="qForum_subscriptions" datasource="#variables.DSN#" >
			SELECT	forum_subscriptions.fs_id,
					forum_subscriptions.fs_name_id,
					forum_subscriptions.fs_forum_id
			FROM	forum_subscriptions
				WHERE forum_subscriptions.fs_id = <cfqueryparam value="#val(arguments.fs_id)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>

		<cfif qForum_subscriptions.recordCount eq 1>
		<!--- Create a memento --->
			<cfset memento.fs_id = qForum_subscriptions.fs_id />
			<cfset memento.fs_name_id = qForum_subscriptions.fs_name_id />
			<cfset memento.fs_forum_id = qForum_subscriptions.fs_forum_id />
			<cfset arguments.forum_subscriptions.setInstanceMemento(memento) />
		<cfelse>
			<cfthrow type="FORUM_SUBSCRIPTIONS.MISSING" message="No such forum_subscriptions" detail="OID=#arguments.fs_id#" />
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" returntype="void" output="false"
		displayname="CRUD: Update" hint="I update the database from an forum_subscriptions.">
		<cfargument name="forum_subscriptions" type="forum_subscriptions" required="yes"
			displayname="Forum_subscriptions" hint="I am the forum_subscriptions whose record should be updated." />
		<cfset var qUpdateForum_subscriptions = 0 />
		<cfset var memento = arguments.forum_subscriptions.getInstanceMemento() />
		<!--- Update the record in the database --->
		<cfquery name="qUpdateForum_subscriptions" datasource="#variables.DSN#" >
			UPDATE forum_subscriptions
				SET
					fs_name_id = <cfqueryparam value="#val(memento.fs_name_id)#" CFSQLType="CF_SQL_INTEGER">,
					fs_forum_id = <cfqueryparam value="#val(memento.fs_forum_id)#" CFSQLType="CF_SQL_INTEGER">
			WHERE forum_subscriptions.fs_id = <cfqueryparam value="#val(memento.fs_id)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
	</cffunction>

	<cffunction name="delete" access="public" returntype="void" output="false"
		displayname="CRUD: Delete" hint="I delete an forum_subscriptions from the database.">
		<cfargument name="forum_subscriptions" type="forum_subscriptions" required="yes"
			displayname="forum_subscriptions" hint="I am the forum_subscriptions whose record should be deleted." />
		<cfset var qDeleteForum_subscriptions = 0 />
		<cfset var memento = arguments.forum_subscriptions.getInstanceMemento() />
		<!--- Delete the record from the database --->
		<cfquery name="qDeleteForum_subscriptions" datasource="#variables.DSN#" >
			DELETE FROM forum_subscriptions
				WHERE forum_subscriptions.fs_id = <cfqueryparam value="#val(memento.fs_id)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
	</cffunction>

</cfcomponent>
<!--- 
$Log: forum_subscriptions_DAO.cfc,v $
Revision 1.2  2007/06/14 14:01:11  kevin
Initial Open Source Version

Revision 1.4  2005/06/03 17:38:04  mike
enforce var scope

Revision 1.3  2005/05/20 10:39:17  mike
correct the paths (they were wrong when generated by fusebuilder)

Revision 1.2  2005/05/19 15:11:44  mike
code generated by fusebuilder

Revision 1.1  2005/05/19 15:08:11  mike
new file
 --->
