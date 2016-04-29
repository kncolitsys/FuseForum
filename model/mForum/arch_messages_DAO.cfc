<!--- $RCSfile: arch_messages_DAO.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:10 $ --->
<cfcomponent displayname="arch_messages Data Access Object"
	hint="I provide persistence for a single arch_messages for the application">

	<cffunction name="init" access="public" returntype="arch_messages_dao" output="false"
		displayname="Arch_messages Data Access Object Constructor" hint="I initialize the Data Access Object for arch_messages objects.">
		<cfargument name="dsn" type="string" required="yes"
			displayname="Data Source Name" hint="I am the data source to use for persistence." />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>

	<cffunction name="create" access="public" returntype="void" output="false"
		displayname="CRUD: Create" hint="I create a new database record for the specified arch_messages.">
		<cfargument name="arch_messages" type="arch_messages" required="yes"
			displayname="Arch_messages" hint="I am the arch_messages for which to create a new record." />
		<cfset var qInsertArch_messages = 0 />
		<!--- Get a memento of the object --->
		<cfset var memento = arguments.arch_messages.getInstanceMemento() />
		<!--- Add it to the database --->
		<cfquery name="qInsertArch_messages" datasource="#variables.DSN#" >
			INSERT INTO arch_messages 
				  ( arch_messages.message,
					arch_messages.messagedate,
					arch_messages.threadid,
					arch_messages.editmessage,
					arch_messages.attachment,
					arch_messages.filesize,
					arch_messages.moderatormessage,
					arch_messages.username,
					arch_messages.email)
			VALUES (
			<cfqueryparam value="#trim(memento.message)#" CFSQLType="CF_SQL_CHAR" maxLength="64000">,
					#createodbcdatetime(memento.messagedate)#,
			<cfqueryparam value="#val(memento.threadid)#" CFSQLType="CF_SQL_INTEGER">,
			<cfqueryparam value="#trim(memento.editmessage)#" CFSQLType="CF_SQL_CHAR" maxLength="100">,
			<cfqueryparam value="#trim(memento.attachment)#" CFSQLType="CF_SQL_CHAR" maxLength="50">,
			<cfqueryparam value="#val(memento.filesize)#" CFSQLType="CF_SQL_INTEGER">,
			<cfqueryparam value="#trim(memento.moderatormessage)#" CFSQLType="CF_SQL_CHAR" maxLength="100">,
			<cfqueryparam value="#trim(memento.username)#" CFSQLType="CF_SQL_CHAR" maxLength="100">,
			<cfqueryparam value="#trim(memento.email)#" CFSQLType="CF_SQL_CHAR" maxLength="50">)
		</cfquery>
	</cffunction>

	<cffunction name="read" access="public" returntype="void" output="false"
		displayname="CRUD: Read" hint="I read the specified database record into a arch_messages object.<br />Throws: ARCH_MESSAGES.MISSING if the specified arch_messages cannot be found.">
		<cfargument name="arch_messages" type="arch_messages" required="yes"
			displayname="Arch_messages" hint="I am the arch_messages into which data is read." />
		<!--- Primary Key --->
		<cfargument name="messageid" type="numeric" required="yes"
			displayname="Arch_messages ID" hint="I am the ID of the Arch_messages database record to read." />
		<cfset var qArch_messages = 0 />
		<cfset var memento = structNew() />
		<!--- Get the record from the database --->
		<cfquery name="qArch_messages" datasource="#variables.DSN#" >
			SELECT	arch_messages.messageid,
					arch_messages.message,
					arch_messages.messagedate,
					arch_messages.threadid,
					arch_messages.editmessage,
					arch_messages.attachment,
					arch_messages.filesize,
					arch_messages.moderatormessage,
					arch_messages.timeoflastchange,
					arch_messages.username,
					arch_messages.email
			FROM	arch_messages
				WHERE arch_messages.messageid = <cfqueryparam value="#val(arguments.messageid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>

		<cfif qArch_messages.recordCount eq 1>
		<!--- Create a memento --->
			<cfset memento.messageid = qArch_messages.messageid />
			<cfset memento.message = qArch_messages.message />
			<cfset memento.messagedate = qArch_messages.messagedate />
			<cfset memento.threadid = qArch_messages.threadid />
			<cfset memento.editmessage = qArch_messages.editmessage />
			<cfset memento.attachment = qArch_messages.attachment />
			<cfset memento.filesize = qArch_messages.filesize />
			<cfset memento.moderatormessage = qArch_messages.moderatormessage />
			<cfset memento.timeoflastchange = qArch_messages.timeoflastchange />
			<cfset memento.username = qArch_messages.username />
			<cfset memento.email = qArch_messages.email />
			<cfset arguments.arch_messages.setInstanceMemento(memento) />
		<cfelse>
			<cfthrow type="ARCH_MESSAGES.MISSING" message="No such arch_messages" detail="OID=#arguments.messageid#" />
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" returntype="void" output="false"
		displayname="CRUD: Update" hint="I update the database from an arch_messages.">
		<cfargument name="arch_messages" type="arch_messages" required="yes"
			displayname="Arch_messages" hint="I am the arch_messages whose record should be updated." />
		<cfset var qUpdateArch_messages = 0 />
		<cfset var memento = arguments.arch_messages.getInstanceMemento() />
		<!--- Update the record in the database --->
		<cfquery name="qUpdateArch_messages" datasource="#variables.DSN#" >
			UPDATE arch_messages
				SET
					message = <cfqueryparam value="#memento.message#" CFSQLType="CF_SQL_CHAR" maxLength="64000"><cfif memento.messagedate IS NOT "">,
					messagedate = #createodbcdatetime(memento.messagedate)#</cfif>,
					threadid = <cfqueryparam value="#val(memento.threadid)#" CFSQLType="CF_SQL_INTEGER">,
					editmessage = <cfqueryparam value="#memento.editmessage#" CFSQLType="CF_SQL_CHAR" maxLength="100">,
					attachment = <cfqueryparam value="#memento.attachment#" CFSQLType="CF_SQL_CHAR" maxLength="50">,
					filesize = <cfqueryparam value="#val(memento.filesize)#" CFSQLType="CF_SQL_INTEGER">,
					moderatormessage = <cfqueryparam value="#memento.moderatormessage#" CFSQLType="CF_SQL_CHAR" maxLength="100">,
					username = <cfqueryparam value="#memento.username#" CFSQLType="CF_SQL_CHAR" maxLength="100">,
					email = <cfqueryparam value="#memento.email#" CFSQLType="CF_SQL_CHAR" maxLength="50">
			WHERE arch_messages.messageid = <cfqueryparam value="#val(memento.messageid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
	</cffunction>

	<cffunction name="delete" access="public" returntype="void" output="false"
		displayname="CRUD: Delete" hint="I delete an arch_messages from the database.">
		<cfargument name="arch_messages" type="arch_messages" required="yes"
			displayname="arch_messages" hint="I am the arch_messages whose record should be deleted." />
		<cfset var qDeleteArch_messages = 0 />
		<cfset var memento = arguments.arch_messages.getInstanceMemento() />
		<!--- Delete the record from the database --->
		<cfquery name="qDeleteArch_messages" datasource="#variables.DSN#" >
			DELETE FROM arch_messages
				WHERE arch_messages.messageid = <cfqueryparam value="#val(memento.messageid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
	</cffunction>

</cfcomponent>
<!--- 
$Log: arch_messages_DAO.cfc,v $
Revision 1.2  2007/06/14 14:01:10  kevin
Initial Open Source Version

Revision 1.5  2005/06/03 17:38:03  mike
enforce var scope

Revision 1.4  2005/05/11 10:41:15  kevin
Rename from MVC conversion

Revision 1.3  2005/04/11 15:21:53  mike
remove the incorrect attempts to alter explicitly the field timeoflastchange , which is of SQL type timestamp/BINARY(8)

Revision 1.2  2005/03/31 14:07:03  kevin
Add CVS Info

Revision 1.1  2005/03/29 09:56:16  mike
Fusebuilder Generated Code

 --->
