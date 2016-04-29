<!--- $RCSfile: privatemessages_DAO.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:11 $ --->
<cfcomponent displayname="privatemessages Data Access Object"
	hint="I provide persistence for a single privatemessages for the application">

	<cffunction name="init" access="public" returntype="privatemessages_dao" output="false"
		displayname="Privatemessages Data Access Object Constructor" hint="I initialize the Data Access Object for privatemessages objects.">
		<cfargument name="dsn" type="string" required="yes"
			displayname="Data Source Name" hint="I am the data source to use for persistence." />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>

	<cffunction name="create" access="public" returntype="void" output="false"
		displayname="CRUD: Create" hint="I create a new database record for the specified privatemessages.">
		<cfargument name="privatemessages" type="privatemessages" required="yes"
			displayname="Privatemessages" hint="I am the privatemessages for which to create a new record." />
		<cfset var qInsertPrivatemessages = 0 />
		<!--- Get a memento of the object --->
		<cfset var memento = arguments.privatemessages.getInstanceMemento() />
		<!--- Add it to the database --->
		<cfquery name="qInsertPrivatemessages" datasource="#variables.DSN#" >
			INSERT INTO privatemessages 
				  ( privatemessages.userid,
					privatemessages.message,
					privatemessages.senderid,
					privatemessages.messagedate)
			VALUES (
			<cfqueryparam value="#val(memento.userid)#" CFSQLType="CF_SQL_INTEGER">,
			<cfqueryparam value="#trim(memento.message)#" CFSQLType="CF_SQL_CHAR" maxLength="64000">,
			<cfqueryparam value="#val(memento.senderid)#" CFSQLType="CF_SQL_INTEGER">,
					#createodbcdatetime(memento.messagedate)#)
		</cfquery>
	</cffunction>

	<cffunction name="read" access="public" returntype="void" output="false"
		displayname="CRUD: Read" hint="I read the specified database record into a privatemessages object.<br />Throws: PRIVATEMESSAGES.MISSING if the specified privatemessages cannot be found.">
		<cfargument name="privatemessages" type="privatemessages" required="yes"
			displayname="Privatemessages" hint="I am the privatemessages into which data is read." />
		<!--- Primary Key --->
		<cfargument name="messageid" type="numeric" required="yes"
			displayname="Privatemessages ID" hint="I am the ID of the Privatemessages database record to read." />
		<cfset var qPrivatemessages = 0 />
		<cfset var memento = structNew() />
		<!--- Get the record from the database --->
		<cfquery name="qPrivatemessages" datasource="#variables.DSN#" >
			SELECT	privatemessages.messageid,
					privatemessages.userid,
					privatemessages.message,
					privatemessages.senderid,
					privatemessages.messagedate
			FROM	privatemessages
				WHERE privatemessages.messageid = <cfqueryparam value="#val(arguments.messageid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>

		<cfif qPrivatemessages.recordCount eq 1>
		<!--- Create a memento --->
			<cfset memento.messageid = qPrivatemessages.messageid />
			<cfset memento.userid = qPrivatemessages.userid />
			<cfset memento.message = qPrivatemessages.message />
			<cfset memento.senderid = qPrivatemessages.senderid />
			<cfset memento.messagedate = qPrivatemessages.messagedate />
			<cfset arguments.privatemessages.setInstanceMemento(memento) />
		<cfelse>
			<cfthrow type="PRIVATEMESSAGES.MISSING" message="No such privatemessages" detail="OID=#arguments.messageid#" />
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" returntype="void" output="false"
		displayname="CRUD: Update" hint="I update the database from an privatemessages.">
		<cfargument name="privatemessages" type="privatemessages" required="yes"
			displayname="Privatemessages" hint="I am the privatemessages whose record should be updated." />
		<cfset var qUpdatePrivatemessages = 0 />
		<cfset var memento = arguments.privatemessages.getInstanceMemento() />
		<!--- Update the record in the database --->
		<cfquery name="qUpdatePrivatemessages" datasource="#variables.DSN#" >
			UPDATE privatemessages
				SET
					userid = <cfqueryparam value="#val(memento.userid)#" CFSQLType="CF_SQL_INTEGER">,
					message = <cfqueryparam value="#memento.message#" CFSQLType="CF_SQL_CHAR" maxLength="64000">,
					senderid = <cfqueryparam value="#val(memento.senderid)#" CFSQLType="CF_SQL_INTEGER"><cfif memento.messagedate IS NOT "">,
					messagedate = #createodbcdatetime(memento.messagedate)#</cfif>
			WHERE privatemessages.messageid = <cfqueryparam value="#val(memento.messageid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
	</cffunction>

	<cffunction name="delete" access="public" returntype="void" output="false"
		displayname="CRUD: Delete" hint="I delete an privatemessages from the database.">
		<cfargument name="privatemessages" type="privatemessages" required="yes"
			displayname="privatemessages" hint="I am the privatemessages whose record should be deleted." />
		<cfset var qDeletePrivatemessages = 0 />
		<cfset var memento = arguments.privatemessages.getInstanceMemento() />
		<!--- Delete the record from the database --->
		<cfquery name="qDeletePrivatemessages" datasource="#variables.DSN#" >
			DELETE FROM privatemessages
				WHERE privatemessages.messageid = <cfqueryparam value="#val(memento.messageid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
	</cffunction>

</cfcomponent>
<!--- 
$Log: privatemessages_DAO.cfc,v $
Revision 1.2  2007/06/14 14:01:11  kevin
Initial Open Source Version

Revision 1.4  2005/06/03 17:38:04  mike
enforce var scope

Revision 1.3  2005/05/11 10:41:15  kevin
Rename from MVC conversion

Revision 1.2  2005/03/31 14:07:04  kevin
Add CVS Info

Revision 1.1  2005/03/29 09:57:56  mike
Fusebuilder Generated Code

 --->
