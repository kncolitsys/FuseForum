<!--- $RCSfile: arch_threads_DAO.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:10 $ --->
<cfcomponent displayname="arch_threads Data Access Object"
	hint="I provide persistence for a single arch_threads for the application">

	<cffunction name="init" access="public" returntype="arch_threads_dao" output="false"
		displayname="Arch_threads Data Access Object Constructor" hint="I initialize the Data Access Object for arch_threads objects.">
		<cfargument name="dsn" type="string" required="yes"
			displayname="Data Source Name" hint="I am the data source to use for persistence." />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>

	<cffunction name="create" access="public" returntype="void" output="false"
		displayname="CRUD: Create" hint="I create a new database record for the specified arch_threads.">
		<cfargument name="arch_threads" type="arch_threads" required="yes"
			displayname="Arch_threads" hint="I am the arch_threads for which to create a new record." />
		<cfset var qInsertArch_threads = 0 />
		<!--- Get a memento of the object --->
		<cfset var memento = arguments.arch_threads.getInstanceMemento() />
		<!--- Add it to the database --->
		<cfquery name="qInsertArch_threads" datasource="#variables.DSN#" >
			INSERT INTO arch_threads 
				  ( arch_threads.threadname,
					arch_threads.datecreated,
					arch_threads.messagecount,
					arch_threads.datelastpost,
					arch_threads.username)
			VALUES (
			<cfqueryparam value="#trim(memento.threadname)#" CFSQLType="CF_SQL_CHAR" maxLength="50">,
					#createodbcdatetime(memento.datecreated)#,
			<cfqueryparam value="#val(memento.messagecount)#" CFSQLType="CF_SQL_INTEGER">,
					#createodbcdatetime(memento.datelastpost)#,
			<cfqueryparam value="#trim(memento.username)#" CFSQLType="CF_SQL_CHAR" maxLength="100">)
		</cfquery>
	</cffunction>

	<cffunction name="read" access="public" returntype="void" output="false"
		displayname="CRUD: Read" hint="I read the specified database record into a arch_threads object.<br />Throws: ARCH_THREADS.MISSING if the specified arch_threads cannot be found.">
		<cfargument name="arch_threads" type="arch_threads" required="yes"
			displayname="Arch_threads" hint="I am the arch_threads into which data is read." />
		<!--- Primary Key --->
		<cfargument name="threadid" type="numeric" required="yes"
			displayname="Arch_threads ID" hint="I am the ID of the Arch_threads database record to read." />
		<cfset var qArch_threads = 0 />
		<cfset var memento = structNew() />
		<!--- Get the record from the database --->
		<cfquery name="qArch_threads" datasource="#variables.DSN#" >
			SELECT	arch_threads.threadid,
					arch_threads.threadname,
					arch_threads.datecreated,
					arch_threads.messagecount,
					arch_threads.datelastpost,
					arch_threads.username
			FROM	arch_threads
				WHERE arch_threads.threadid = <cfqueryparam value="#val(arguments.threadid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>

		<cfif qArch_threads.recordCount eq 1>
		<!--- Create a memento --->
			<cfset memento.threadid = qArch_threads.threadid />
			<cfset memento.threadname = qArch_threads.threadname />
			<cfset memento.datecreated = qArch_threads.datecreated />
			<cfset memento.messagecount = qArch_threads.messagecount />
			<cfset memento.datelastpost = qArch_threads.datelastpost />
			<cfset memento.username = qArch_threads.username />
			<cfset arguments.arch_threads.setInstanceMemento(memento) />
		<cfelse>
			<cfthrow type="ARCH_THREADS.MISSING" message="No such arch_threads" detail="OID=#arguments.threadid#" />
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" returntype="void" output="false"
		displayname="CRUD: Update" hint="I update the database from an arch_threads.">
		<cfargument name="arch_threads" type="arch_threads" required="yes"
			displayname="Arch_threads" hint="I am the arch_threads whose record should be updated." />
		<cfset var qUpdateArch_threads = 0 />
		<cfset var memento = arguments.arch_threads.getInstanceMemento() />
		<!--- Update the record in the database --->
		<cfquery name="qUpdateArch_threads" datasource="#variables.DSN#" >
			UPDATE arch_threads
				SET
					threadname = <cfqueryparam value="#memento.threadname#" CFSQLType="CF_SQL_CHAR" maxLength="50"><cfif memento.datecreated IS NOT "">,
					datecreated = #createodbcdatetime(memento.datecreated)#</cfif>,
					messagecount = <cfqueryparam value="#val(memento.messagecount)#" CFSQLType="CF_SQL_INTEGER"><cfif memento.datelastpost IS NOT "">,
					datelastpost = #createodbcdatetime(memento.datelastpost)#</cfif>,
					username = <cfqueryparam value="#memento.username#" CFSQLType="CF_SQL_CHAR" maxLength="100">
			WHERE arch_threads.threadid = <cfqueryparam value="#val(memento.threadid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
	</cffunction>

	<cffunction name="delete" access="public" returntype="void" output="false"
		displayname="CRUD: Delete" hint="I delete an arch_threads from the database.">
		<cfargument name="arch_threads" type="arch_threads" required="yes"
			displayname="arch_threads" hint="I am the arch_threads whose record should be deleted." />
		<cfset var qDeleteArch_threads = 0 />
		<cfset var memento = arguments.arch_threads.getInstanceMemento() />
		<!--- Delete the record from the database --->
		<cfquery name="qDeleteArch_threads" datasource="#variables.DSN#" >
			DELETE FROM arch_threads
				WHERE arch_threads.threadid = <cfqueryparam value="#val(memento.threadid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
	</cffunction>

</cfcomponent>
<!--- 
$Log: arch_threads_DAO.cfc,v $
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
