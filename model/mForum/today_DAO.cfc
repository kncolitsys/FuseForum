<!--- $RCSfile: today_DAO.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:14 $ --->
<cfcomponent displayname="today Data Access Object"
	hint="I provide persistence for a single today for the application">

	<cffunction name="init" access="public" returntype="today_dao" output="false"
		displayname="Today Data Access Object Constructor" hint="I initialize the Data Access Object for today objects.">
		<cfargument name="dsn" type="string" required="yes"
			displayname="Data Source Name" hint="I am the data source to use for persistence." />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>

	<cffunction name="create" access="public" returntype="void" output="false"
		displayname="CRUD: Create" hint="I create a new database record for the specified today.">
		<cfargument name="today" type="today" required="yes"
			displayname="Today" hint="I am the today for which to create a new record." />
		<cfset var qInsertToday = 0 />
		<!--- Get a memento of the object --->
		<cfset var memento = arguments.today.getInstanceMemento() />
		<!--- Add it to the database --->
		<cfquery name="qInsertToday" datasource="#variables.DSN#" >
			INSERT INTO today 
				  ( today.posttitle,
					today.post,
					today.postdate,
					today.dateexpires)
			VALUES (
			<cfqueryparam value="#trim(memento.posttitle)#" CFSQLType="CF_SQL_CHAR" maxLength="50">,
			<cfqueryparam value="#trim(memento.post)#" CFSQLType="CF_SQL_CHAR" maxLength="64000">,
					#createodbcdatetime(memento.postdate)#,
					#createodbcdatetime(memento.dateexpires)#)
		</cfquery>
	</cffunction>

	<cffunction name="read" access="public" returntype="void" output="false"
		displayname="CRUD: Read" hint="I read the specified database record into a today object.<br />Throws: TODAY.MISSING if the specified today cannot be found.">
		<cfargument name="today" type="today" required="yes"
			displayname="Today" hint="I am the today into which data is read." />
		<!--- Primary Key --->
		<cfargument name="postid" type="numeric" required="yes"
			displayname="Today ID" hint="I am the ID of the Today database record to read." />
		<cfset var qToday = 0 />
		<cfset var memento = structNew() />
		<!--- Get the record from the database --->
		<cfquery name="qToday" datasource="#variables.DSN#" >
			SELECT	today.postid,
					today.posttitle,
					today.post,
					today.postdate,
					today.dateexpires
			FROM	today
				WHERE today.postid = <cfqueryparam value="#val(arguments.postid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>

		<cfif qToday.recordCount eq 1>
		<!--- Create a memento --->
			<cfset memento.postid = qToday.postid />
			<cfset memento.posttitle = qToday.posttitle />
			<cfset memento.post = qToday.post />
			<cfset memento.postdate = qToday.postdate />
			<cfset memento.dateexpires = qToday.dateexpires />
			<cfset arguments.today.setInstanceMemento(memento) />
		<cfelse>
			<cfthrow type="TODAY.MISSING" message="No such today" detail="OID=#arguments.postid#" />
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" returntype="void" output="false"
		displayname="CRUD: Update" hint="I update the database from an today.">
		<cfargument name="today" type="today" required="yes"
			displayname="Today" hint="I am the today whose record should be updated." />
		<cfset var qUpdateToday = 0 />
		<cfset var memento = arguments.today.getInstanceMemento() />
		<!--- Update the record in the database --->
		<cfquery name="qUpdateToday" datasource="#variables.DSN#" >
			UPDATE today
				SET
					posttitle = <cfqueryparam value="#memento.posttitle#" CFSQLType="CF_SQL_CHAR" maxLength="50">,
					post = <cfqueryparam value="#memento.post#" CFSQLType="CF_SQL_CHAR" maxLength="64000"><cfif memento.postdate IS NOT "">,
					postdate = #createodbcdatetime(memento.postdate)#</cfif><cfif memento.dateexpires IS NOT "">,
					dateexpires = #createodbcdatetime(memento.dateexpires)#</cfif>
			WHERE today.postid = <cfqueryparam value="#val(memento.postid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
	</cffunction>

	<cffunction name="delete" access="public" returntype="void" output="false"
		displayname="CRUD: Delete" hint="I delete an today from the database.">
		<cfargument name="today" type="today" required="yes"
			displayname="today" hint="I am the today whose record should be deleted." />
		<cfset var qDeleteToday = 0 />
		<cfset var memento = arguments.today.getInstanceMemento() />
		<!--- Delete the record from the database --->
		<cfquery name="qDeleteToday" datasource="#variables.DSN#" >
			DELETE FROM today
				WHERE today.postid = <cfqueryparam value="#val(memento.postid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
	</cffunction>

</cfcomponent>
<!--- 
$Log: today_DAO.cfc,v $
Revision 1.2  2007/06/14 14:01:14  kevin
Initial Open Source Version

Revision 1.4  2005/06/03 17:38:06  mike
enforce var scope

Revision 1.3  2005/05/11 10:41:15  kevin
Rename from MVC conversion

Revision 1.2  2005/03/31 14:07:04  kevin
Add CVS Info

Revision 1.1  2005/03/29 09:59:59  mike
Fusebuilder Generated Code

 --->
