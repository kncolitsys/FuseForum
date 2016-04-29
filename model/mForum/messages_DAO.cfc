<!--- $RCSfile: messages_DAO.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:11 $ --->
<cfcomponent displayname="messages Data Access Object"
	hint="I provide persistence for a single messages for the application">

	<cffunction name="init" access="public" returntype="messages_dao" output="false"
		displayname="Messages Data Access Object Constructor" hint="I initialize the Data Access Object for messages objects.">
		<cfargument name="dsn" type="string" required="yes"
			displayname="Data Source Name" hint="I am the data source to use for persistence." />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>

	<cffunction name="create" access="public" returntype="void" output="false"
		displayname="CRUD: Create" hint="I create a new database record for the specified messages.">
		<cfargument name="messages" type="messages" required="yes"
			displayname="Messages" hint="I am the messages for which to create a new record." />
		<cfset var qInsertMessages = 0 />
		<!--- Get a memento of the object --->
		<cfset var memento = arguments.messages.getInstanceMemento() />
		<!--- Add it to the database --->
		<cfquery name="qInsertMessages" datasource="#variables.DSN#" >
			INSERT INTO messages 
				(
				messages.message,
				messages.messagedate,
				messages.threadid,
				messages.userid,
				messages.editmessage,
				messages.moderatormessage,
				messages.attachment,
				messages.filesize,
				messages.approved,
				messages.archived
				)
			VALUES
				(
			<cfqueryparam value="#trim(memento.message)#" CFSQLType="CF_SQL_CHAR" maxLength="64000">,
					#createodbcdatetime(memento.messagedate)#,
			<cfqueryparam value="#val(memento.threadid)#" CFSQLType="CF_SQL_INTEGER">,
			<cfqueryparam value="#val(memento.userid)#" CFSQLType="CF_SQL_INTEGER">,
			<cfqueryparam value="#trim(memento.editmessage)#" CFSQLType="CF_SQL_CHAR" maxLength="100">,
			<cfqueryparam value="#trim(memento.moderatormessage)#" CFSQLType="CF_SQL_CHAR" maxLength="100">,
			<cfqueryparam value="#trim(memento.attachment)#" CFSQLType="CF_SQL_CHAR" maxLength="50">,
			<cfqueryparam value="#val(memento.filesize)#" CFSQLType="CF_SQL_INTEGER">,
			<cfqueryparam value="#val(memento.approved)#" CFSQLType="CF_SQL_BOOLEAN">,
			<cfqueryparam value="#val(memento.archived)#" CFSQLType="CF_SQL_BOOLEAN">
				)
		</cfquery>
	</cffunction>

	<cffunction name="read" access="public" returntype="void" output="false"
		displayname="CRUD: Read" hint="I read the specified database record into a messages object.<br />Throws: MESSAGES.MISSING if the specified messages cannot be found.">
		<cfargument name="messages" type="messages" required="yes"
			displayname="Messages" hint="I am the messages into which data is read." />
		<!--- Primary Key --->
		<cfargument name="messageid" type="numeric" required="yes"
			displayname="Messages ID" hint="I am the ID of the Messages database record to read." />
		<cfset var qMessages = 0 />
		<cfset var memento = structNew() />
		<!--- Get the record from the database --->
		<cfquery name="qMessages" datasource="#variables.DSN#" >
			SELECT	messages.messageid,
					messages.message,
					messages.messagedate,
					messages.threadid,
					messages.userid,
					messages.editmessage,
					messages.moderatormessage,
					messages.attachment,
					messages.filesize,
					messages.approved,
					messages.archived,
					messages.timeoflastchange
			FROM	messages
			WHERE	messages.messageid = <cfqueryparam value="#val(arguments.messageid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>

		<cfif qMessages.recordCount eq 1>
		<!--- Create a memento --->
			<cfset memento.messageid = qMessages.messageid />
			<cfset memento.message = qMessages.message />
			<cfset memento.messagedate = qMessages.messagedate />
			<cfset memento.threadid = qMessages.threadid />
			<cfset memento.userid = qMessages.userid />
			<cfset memento.editmessage = qMessages.editmessage />
			<cfset memento.moderatormessage = qMessages.moderatormessage />
			<cfset memento.attachment = qMessages.attachment />
			<cfset memento.filesize = qMessages.filesize />
			<cfset memento.approved = qMessages.approved />
			<cfset memento.archived = qMessages.archived />
			<cfset memento.timeoflastchange = qMessages.timeoflastchange />
			<cfset arguments.messages.setInstanceMemento(memento) />
		<cfelse>
			<cfthrow type="MESSAGES.MISSING" message="No such messages" detail="OID=#arguments.messageid#" />
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" returntype="void" output="false"
		displayname="CRUD: Update" hint="I update the database from an messages.">
		<cfargument name="messages" type="messages" required="yes"
			displayname="Messages" hint="I am the messages whose record should be updated." />
		<cfset var qUpdateMessages = 0 />
		<cfset var memento = arguments.messages.getInstanceMemento() />
		<!--- Update the record in the database --->
		<cfquery name="qUpdateMessages" datasource="#variables.DSN#" >
			UPDATE messages
			SET
				message = <cfqueryparam value="#memento.message#" CFSQLType="CF_SQL_CHAR" maxLength="64000"><cfif memento.messagedate IS NOT "">,
				messagedate = #createodbcdatetime(memento.messagedate)#</cfif>,
				threadid = <cfqueryparam value="#val(memento.threadid)#" CFSQLType="CF_SQL_INTEGER">,
				userid = <cfqueryparam value="#val(memento.userid)#" CFSQLType="CF_SQL_INTEGER">,
				editmessage = <cfqueryparam value="#memento.editmessage#" CFSQLType="CF_SQL_CHAR" maxLength="100">,
				moderatormessage = <cfqueryparam value="#memento.moderatormessage#" CFSQLType="CF_SQL_CHAR" maxLength="100">,
				attachment = <cfqueryparam value="#memento.attachment#" CFSQLType="CF_SQL_CHAR" maxLength="50">,
				filesize = <cfqueryparam value="#val(memento.filesize)#" CFSQLType="CF_SQL_INTEGER">,
				approved = <cfqueryparam value="#val(memento.approved)#" CFSQLType="CF_SQL_BOOLEAN">,
				archived = <cfqueryparam value="#val(memento.archived)#" CFSQLType="CF_SQL_BOOLEAN">
			WHERE messages.messageid = <cfqueryparam value="#val(memento.messageid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
	</cffunction>

	<cffunction name="delete" access="public" returntype="void" output="false"
		displayname="CRUD: Delete" hint="I delete an messages from the database.">
		<cfargument name="messages" type="messages" required="yes"
			displayname="messages" hint="I am the messages whose record should be deleted." />
		<cfset var qDeleteMessages = 0 />
		<cfset var memento = arguments.messages.getInstanceMemento() />
		<!--- Delete the record from the database --->
		<cfquery name="qDeleteMessages" datasource="#variables.DSN#" >
			DELETE FROM messages
			WHERE	messages.messageid = <cfqueryparam value="#val(memento.messageid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
	</cffunction>

</cfcomponent>
<!--- 
$Log: messages_DAO.cfc,v $
Revision 1.2  2007/06/14 14:01:11  kevin
Initial Open Source Version

Revision 1.6  2005/06/03 17:38:04  mike
enforce var scope

Revision 1.5  2005/05/11 10:41:15  kevin
Rename from MVC conversion

Revision 1.4  2005/04/20 11:42:49  mike
handle the new field archived

Revision 1.3  2005/04/11 15:20:43  mike
remove the incorrect attempts to alter explicitly the filed timeoflastchange , which is of SQL type timestamp/BINARY(8)

Revision 1.2  2005/03/31 14:07:04  kevin
Add CVS Info

Revision 1.1  2005/03/29 09:57:55  mike
Fusebuilder Generated Code
 --->
