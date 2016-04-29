<!--- $RCSfile: arch_privatemessages_DAO.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:10 $ --->
<cfcomponent displayname="arch_privatemessages Data Access Object"
	hint="I provide persistence for a single arch_privatemessages for the application">

	<cffunction name="init" access="public" returntype="arch_privatemessages_dao" output="false"
		displayname="Arch_privatemessages Data Access Object Constructor" hint="I initialize the Data Access Object for arch_privatemessages objects.">
		<cfargument name="dsn" type="string" required="yes"
			displayname="Data Source Name" hint="I am the data source to use for persistence." />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>

	<cffunction name="create" access="public" returntype="void" output="false"
		displayname="CRUD: Create" hint="I create a new database record for the specified arch_privatemessages.">
		<cfargument name="arch_privatemessages" type="arch_privatemessages" required="yes"
			displayname="Arch_privatemessages" hint="I am the arch_privatemessages for which to create a new record." />
		<cfset var qInsertArch_privatemessages = 0 />
		<!--- Get a memento of the object --->
		<cfset var memento = arguments.arch_privatemessages.getInstanceMemento() />
		<!--- Add it to the database --->
		<cfquery name="qInsertArch_privatemessages" datasource="#variables.DSN#" >
			INSERT INTO arch_privatemessages 
				  ( arch_privatemessages.userid,
					arch_privatemessages.message,
					arch_privatemessages.senderid,
					arch_privatemessages.messagedate,
					arch_privatemessages.arch_date)
			VALUES (
			<cfqueryparam value="#val(memento.userid)#" CFSQLType="CF_SQL_INTEGER">,
			<cfqueryparam value="#trim(memento.message)#" CFSQLType="CF_SQL_CHAR" maxLength="64000">,
			<cfqueryparam value="#val(memento.senderid)#" CFSQLType="CF_SQL_INTEGER">,
					#createodbcdatetime(memento.messagedate)#,
					#createodbcdatetime(memento.arch_date)#)
		</cfquery>
	</cffunction>

	<cffunction name="read" access="public" returntype="void" output="false"
		displayname="CRUD: Read" hint="I read the specified database record into a arch_privatemessages object.<br />Throws: ARCH_PRIVATEMESSAGES.MISSING if the specified arch_privatemessages cannot be found.">
		<cfargument name="arch_privatemessages" type="arch_privatemessages" required="yes"
			displayname="Arch_privatemessages" hint="I am the arch_privatemessages into which data is read." />
		<!--- Primary Key --->
		<cfargument name="messageid" type="numeric" required="yes"
			displayname="Arch_privatemessages ID" hint="I am the ID of the Arch_privatemessages database record to read." />
		<cfset var qArch_privatemessages = 0 />
		<cfset var memento = structNew() />
		<!--- Get the record from the database --->
		<cfquery name="qArch_privatemessages" datasource="#variables.DSN#" >
			SELECT	arch_privatemessages.messageid,
					arch_privatemessages.userid,
					arch_privatemessages.message,
					arch_privatemessages.senderid,
					arch_privatemessages.messagedate,
					arch_privatemessages.arch_date
			FROM	arch_privatemessages
				WHERE arch_privatemessages.messageid = <cfqueryparam value="#val(arguments.messageid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>

		<cfif qArch_privatemessages.recordCount eq 1>
		<!--- Create a memento --->
			<cfset memento.messageid = qArch_privatemessages.messageid />
			<cfset memento.userid = qArch_privatemessages.userid />
			<cfset memento.message = qArch_privatemessages.message />
			<cfset memento.senderid = qArch_privatemessages.senderid />
			<cfset memento.messagedate = qArch_privatemessages.messagedate />
			<cfset memento.arch_date = qArch_privatemessages.arch_date />
			<cfset arguments.arch_privatemessages.setInstanceMemento(memento) />
		<cfelse>
			<cfthrow type="ARCH_PRIVATEMESSAGES.MISSING" message="No such arch_privatemessages" detail="OID=#arguments.messageid#" />
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" returntype="void" output="false"
		displayname="CRUD: Update" hint="I update the database from an arch_privatemessages.">
		<cfargument name="arch_privatemessages" type="arch_privatemessages" required="yes"
			displayname="Arch_privatemessages" hint="I am the arch_privatemessages whose record should be updated." />
		<cfset var qUpdateArch_privatemessages = 0 />
		<cfset var memento = arguments.arch_privatemessages.getInstanceMemento() />
		<!--- Update the record in the database --->
		<cfquery name="qUpdateArch_privatemessages" datasource="#variables.DSN#" >
			UPDATE arch_privatemessages
				SET
					userid = <cfqueryparam value="#val(memento.userid)#" CFSQLType="CF_SQL_INTEGER">,
					message = <cfqueryparam value="#memento.message#" CFSQLType="CF_SQL_CHAR" maxLength="64000">,
					senderid = <cfqueryparam value="#val(memento.senderid)#" CFSQLType="CF_SQL_INTEGER"><cfif memento.messagedate IS NOT "">,
					messagedate = #createodbcdatetime(memento.messagedate)#</cfif><cfif memento.arch_date IS NOT "">,
					arch_date = #createodbcdatetime(memento.arch_date)#</cfif>
			WHERE arch_privatemessages.messageid = <cfqueryparam value="#val(memento.messageid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
	</cffunction>

	<cffunction name="delete" access="public" returntype="void" output="false"
		displayname="CRUD: Delete" hint="I delete an arch_privatemessages from the database.">
		<cfargument name="arch_privatemessages" type="arch_privatemessages" required="yes"
			displayname="arch_privatemessages" hint="I am the arch_privatemessages whose record should be deleted." />
		<cfset var qDeleteArch_privatemessages = 0 />
		<cfset var memento = arguments.arch_privatemessages.getInstanceMemento() />
		<!--- Delete the record from the database --->
		<cfquery name="qDeleteArch_privatemessages" datasource="#variables.DSN#" >
			DELETE FROM arch_privatemessages
				WHERE arch_privatemessages.messageid = <cfqueryparam value="#val(memento.messageid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
	</cffunction>

</cfcomponent>
<!--- 
$Log: arch_privatemessages_DAO.cfc,v $
Revision 1.2  2007/06/14 14:01:10  kevin
Initial Open Source Version

Revision 1.4  2005/06/03 17:38:03  mike
enforce var scope

Revision 1.3  2005/05/11 10:41:15  kevin
Rename from MVC conversion

Revision 1.2  2005/03/31 14:07:03  kevin
Add CVS Info

Revision 1.1  2005/03/29 09:56:17  mike
Fusebuilder Generated Code

 --->
