<!--- $RCSfile: threads_DAO.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:14 $ --->
<cfcomponent displayname="threads Data Access Object"
	hint="I provide persistence for a single threads for the application">

	<cffunction name="init" access="public" returntype="threads_dao" output="false"
		displayname="Threads Data Access Object Constructor" hint="I initialize the Data Access Object for threads objects.">
		<cfargument name="dsn" type="string" required="yes"
			displayname="Data Source Name" hint="I am the data source to use for persistence." />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>

	<cffunction name="create" access="public" returntype="void" output="false"
		displayname="CRUD: Create" hint="I create a new database record for the specified threads.">
		<cfargument name="threads" type="threads" required="yes"
			displayname="Threads" hint="I am the threads for which to create a new record." />
		<cfset var qInsertThreads = 0 />
		<!--- Get a memento of the object --->
		<cfset var memento = arguments.threads.getInstanceMemento() />
		<!--- Add it to the database --->
		<cfquery name="qInsertThreads" datasource="#variables.DSN#" >
			INSERT INTO threads 
				(
				threads.threadname,
				threads.datecreated,
				threads.userid,
				threads.categoryid,
				threads.messagecount,
				threads.datelastpost,
				threads.approved,
				threads.archived
				threads.locked
				)
			VALUES
				(
			<cfqueryparam value="#trim(memento.threadname)#" CFSQLType="CF_SQL_CHAR" maxLength="50">,
					#createodbcdatetime(memento.datecreated)#,
			<cfqueryparam value="#val(memento.userid)#" CFSQLType="CF_SQL_INTEGER">,
			<cfqueryparam value="#val(memento.categoryid)#" CFSQLType="CF_SQL_INTEGER">,
			<cfqueryparam value="#val(memento.messagecount)#" CFSQLType="CF_SQL_INTEGER">,
					#createodbcdatetime(memento.datelastpost)#,
			<cfqueryparam value="#val(memento.approved)#" CFSQLType="CF_SQL_BOOLEAN">,
			<cfqueryparam value="#val(memento.archived)#" CFSQLType="CF_SQL_BOOLEAN">,
			<cfqueryparam value="#val(memento.locked)#" CFSQLType="CF_SQL_BOOLEAN">
				)
		</cfquery>
	</cffunction>

	<cffunction name="read" access="public" returntype="void" output="false"
		displayname="CRUD: Read" hint="I read the specified database record into a threads object.<br />Throws: THREADS.MISSING if the specified threads cannot be found.">
		<cfargument name="threads" type="threads" required="yes"
			displayname="Threads" hint="I am the threads into which data is read." />
		<!--- Primary Key --->
		<cfargument name="threadid" type="numeric" required="yes"
			displayname="Threads ID" hint="I am the ID of the Threads database record to read." />
		<cfset var qThreads = 0 />
		<cfset var memento = structNew() />
		<!--- Get the record from the database --->
		<cfquery name="qThreads" datasource="#variables.DSN#" >
			SELECT	threads.threadid,
					threads.threadname,
					threads.datecreated,
					threads.userid,
					threads.categoryid,
					threads.messagecount,
					threads.datelastpost,
					threads.approved,
					threads.archived,
					threads.locked
			FROM	threads
			WHERE	threads.threadid = <cfqueryparam value="#val(arguments.threadid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>

		<cfif qThreads.recordCount eq 1>
		<!--- Create a memento --->
			<cfset memento.threadid = qThreads.threadid />
			<cfset memento.threadname = qThreads.threadname />
			<cfset memento.datecreated = qThreads.datecreated />
			<cfset memento.userid = qThreads.userid />
			<cfset memento.categoryid = qThreads.categoryid />
			<cfset memento.messagecount = qThreads.messagecount />
			<cfset memento.datelastpost = qThreads.datelastpost />
			<cfset memento.approved = qThreads.approved />
			<cfset memento.archived = qThreads.archived />
			<cfset memento.locked = qThreads.locked />
			<cfset arguments.threads.setInstanceMemento(memento) />
		<cfelse>
			<cfthrow type="THREADS.MISSING" message="No such threads" detail="OID=#arguments.threadid#" />
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" returntype="void" output="false"
		displayname="CRUD: Update" hint="I update the database from an threads.">
		<cfargument name="threads" type="threads" required="yes"
			displayname="Threads" hint="I am the threads whose record should be updated." />
		<cfset var qUpdateThreads = 0 />
		<cfset var memento = arguments.threads.getInstanceMemento() />
		<!--- Update the record in the database --->
		<cfquery name="qUpdateThreads" datasource="#variables.DSN#" >
			UPDATE threads
			SET
				threadname = <cfqueryparam value="#memento.threadname#" CFSQLType="CF_SQL_CHAR" maxLength="50">
				<cfif memento.datecreated IS NOT "">,datecreated = #createodbcdatetime(memento.datecreated)#</cfif>
				,
				userid = <cfqueryparam value="#val(memento.userid)#" CFSQLType="CF_SQL_INTEGER">,
				categoryid = <cfqueryparam value="#val(memento.categoryid)#" CFSQLType="CF_SQL_INTEGER">,
				messagecount = <cfqueryparam value="#val(memento.messagecount)#" CFSQLType="CF_SQL_INTEGER">
				<cfif memento.datelastpost IS NOT "">,datelastpost = #createodbcdatetime(memento.datelastpost)#</cfif>
				,
				approved = <cfqueryparam value="#val(memento.approved)#" CFSQLType="CF_SQL_BOOLEAN">,
				archived = <cfqueryparam value="#val(memento.archived)#" CFSQLType="CF_SQL_BOOLEAN">,
				locked = <cfqueryparam value="#val(memento.locked)#" CFSQLType="CF_SQL_BOOLEAN">
			WHERE	threads.threadid = <cfqueryparam value="#val(memento.threadid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
	</cffunction>

	<cffunction name="delete" access="public" returntype="void" output="false"
		displayname="CRUD: Delete" hint="I delete an threads from the database.">
		<cfargument name="threads" type="threads" required="yes"
			displayname="threads" hint="I am the threads whose record should be deleted." />
		<cfset var qDeleteThreads = 0 />
		<cfset var memento = arguments.threads.getInstanceMemento() />
		<!--- Delete the record from the database --->
		<cfquery name="qDeleteThreads" datasource="#variables.DSN#" >
			DELETE FROM threads
			WHERE	threads.threadid = <cfqueryparam value="#val(memento.threadid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
	</cffunction>

</cfcomponent>
<!--- 
$Log: threads_DAO.cfc,v $
Revision 1.2  2007/06/14 14:01:14  kevin
Initial Open Source Version

Revision 1.6  2005/06/03 17:38:05  mike
enforce var scope

Revision 1.5  2005/05/11 10:41:15  kevin
Rename from MVC conversion

Revision 1.4  2005/04/20 11:42:49  mike
handle the new field archived

Revision 1.3  2005/04/06 18:01:29  mike
small edits

Revision 1.2  2005/03/31 14:07:04  kevin
Add CVS Info

Revision 1.1  2005/03/29 09:59:56  mike
Fusebuilder Generated Code
 --->

