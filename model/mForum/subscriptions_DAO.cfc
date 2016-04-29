<!--- $RCSfile: subscriptions_DAO.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:14 $ --->
<cfcomponent displayname="subscriptions Data Access Object"
	hint="I provide persistence for a single subscriptions for the application">

	<cffunction name="init" access="public" returntype="subscriptions_dao" output="false"
		displayname="Subscriptions Data Access Object Constructor" hint="I initialize the Data Access Object for subscriptions objects.">
		<cfargument name="dsn" type="string" required="yes"
			displayname="Data Source Name" hint="I am the data source to use for persistence." />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>

	<cffunction name="create" access="public" returntype="void" output="false"
		displayname="CRUD: Create" hint="I create a new database record for the specified subscriptions.">
		<cfargument name="subscriptions" type="subscriptions" required="yes"
			displayname="Subscriptions" hint="I am the subscriptions for which to create a new record." />
		<cfset var qInsertSubscriptions = 0 />
		<!--- Get a memento of the object --->
		<cfset var memento = arguments.subscriptions.getInstanceMemento() />
		<!--- Add it to the database --->
		<cfquery name="qInsertSubscriptions" datasource="#variables.DSN#" >
			INSERT INTO subscriptions 
				  ( subscriptions.userid,
					subscriptions.threadid)
			VALUES (
			<cfqueryparam value="#val(memento.userid)#" CFSQLType="CF_SQL_INTEGER">,
			<cfqueryparam value="#val(memento.threadid)#" CFSQLType="CF_SQL_INTEGER">)
		</cfquery>
	</cffunction>

	<cffunction name="read" access="public" returntype="void" output="false"
		displayname="CRUD: Read" hint="I read the specified database record into a subscriptions object.<br />Throws: SUBSCRIPTIONS.MISSING if the specified subscriptions cannot be found.">
		<cfargument name="subscriptions" type="subscriptions" required="yes"
			displayname="Subscriptions" hint="I am the subscriptions into which data is read." />
		<!--- Primary Key --->
		<cfargument name="recordid" type="numeric" required="yes"
			displayname="Subscriptions ID" hint="I am the ID of the Subscriptions database record to read." />
		<cfset var qSubscriptions = 0 />
		<cfset var memento = structNew() />
		<!--- Get the record from the database --->
		<cfquery name="qSubscriptions" datasource="#variables.DSN#" >
			SELECT	subscriptions.recordid,
					subscriptions.userid,
					subscriptions.threadid
			FROM	subscriptions
				WHERE subscriptions.recordid = <cfqueryparam value="#val(arguments.recordid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>

		<cfif qSubscriptions.recordCount eq 1>
		<!--- Create a memento --->
			<cfset memento.recordid = qSubscriptions.recordid />
			<cfset memento.userid = qSubscriptions.userid />
			<cfset memento.threadid = qSubscriptions.threadid />
			<cfset arguments.subscriptions.setInstanceMemento(memento) />
		<cfelse>
			<cfthrow type="SUBSCRIPTIONS.MISSING" message="No such subscriptions" detail="OID=#arguments.recordid#" />
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" returntype="void" output="false"
		displayname="CRUD: Update" hint="I update the database from an subscriptions.">
		<cfargument name="subscriptions" type="subscriptions" required="yes"
			displayname="Subscriptions" hint="I am the subscriptions whose record should be updated." />
		<cfset var qUpdateSubscriptions = 0 />
		<cfset var memento = arguments.subscriptions.getInstanceMemento() />
		<!--- Update the record in the database --->
		<cfquery name="qUpdateSubscriptions" datasource="#variables.DSN#" >
			UPDATE subscriptions
				SET
					userid = <cfqueryparam value="#val(memento.userid)#" CFSQLType="CF_SQL_INTEGER">,
					threadid = <cfqueryparam value="#val(memento.threadid)#" CFSQLType="CF_SQL_INTEGER">
			WHERE subscriptions.recordid = <cfqueryparam value="#val(memento.recordid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
	</cffunction>

	<cffunction name="delete" access="public" returntype="void" output="false"
		displayname="CRUD: Delete" hint="I delete an subscriptions from the database.">
		<cfargument name="subscriptions" type="subscriptions" required="yes"
			displayname="subscriptions" hint="I am the subscriptions whose record should be deleted." />
		<cfset var qDeleteSubscriptions = 0 />
		<cfset var memento = arguments.subscriptions.getInstanceMemento() />
		<!--- Delete the record from the database --->
		<cfquery name="qDeleteSubscriptions" datasource="#variables.DSN#" >
			DELETE FROM subscriptions
				WHERE subscriptions.recordid = <cfqueryparam value="#val(memento.recordid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
	</cffunction>

</cfcomponent>
<!--- 
$Log: subscriptions_DAO.cfc,v $
Revision 1.2  2007/06/14 14:01:14  kevin
Initial Open Source Version

Revision 1.4  2005/06/03 17:38:05  mike
enforce var scope

Revision 1.3  2005/05/11 10:41:15  kevin
Rename from MVC conversion

Revision 1.2  2005/03/31 14:07:04  kevin
Add CVS Info

Revision 1.1  2005/03/29 09:59:55  mike
Fusebuilder Generated Code

 --->
