<!--- $RCSfile: users_DAO.cfc,v $ $Revision: 1.3 $ $Author: kevin $ $Date: 2007/06/14 15:07:14 $ --->
<cfcomponent displayname="users Data Access Object"
	hint="I provide persistence for a single users for the application">

	<cffunction name="init" access="public" returntype="users_dao" output="false"
		displayname="Users Data Access Object Constructor" hint="I initialize the Data Access Object for users objects.">
		<cfargument name="dsn" type="string" required="yes"
			displayname="Data Source Name" hint="I am the data source to use for persistence." />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>

	<cffunction name="create" access="public" returntype="void" output="false"
		displayname="CRUD: Create" hint="I create a new database record for the specified users.">
		<cfargument name="users" type="users" required="yes"
			displayname="Users" hint="I am the users for which to create a new record." />
		<cfset var qInsertUsers = 0 />
		<!--- Get a memento of the object --->
		<cfset var memento = arguments.users.getInstanceMemento() />
		<!--- Add it to the database --->
		<cfquery name="qInsertUsers" datasource="#variables.DSN#" >
			INSERT INTO users 
				  ( users.username,
					users.password,
					users.emailaddress,
					users.city,
					users.signature,
					users.datecreated,
					users.threadorder,
					users.messageorder,
					users.active,
					users.firstname,
					users.lastname,
					users.numberofthreads,
					users.numberofmessages,
					users.datelastvisited,
					users.showemail,
					users.defaultfuseaction,
					users.privatemessages,
					users.showprofile,
					users.emailsubs,
					users.profile)
			VALUES (
			<cfqueryparam value="#trim(memento.username)#" CFSQLType="CF_SQL_VARCHAR" maxLength="100">,
			<cfqueryparam value="#trim(memento.password)#" CFSQLType="CF_SQL_VARCHAR" maxLength="12">,
			<cfqueryparam value="#trim(memento.emailaddress)#" CFSQLType="CF_SQL_VARCHAR" maxLength="50">,
			<cfqueryparam value="#trim(memento.city)#" CFSQLType="CF_SQL_VARCHAR" maxLength="30">,
			<cfqueryparam value="#trim(memento.signature)#" CFSQLType="CF_SQL_CHAR" maxLength="150">,
					#createodbcdatetime(memento.datecreated)#,
			<cfqueryparam value="#trim(memento.threadorder)#" CFSQLType="CF_SQL_CHAR" maxLength="4">,
			<cfqueryparam value="#trim(memento.messageorder)#" CFSQLType="CF_SQL_CHAR" maxLength="4">,
			<cfqueryparam value="#val(memento.active)#" CFSQLType="CF_SQL_BOOLEAN">,
			<cfqueryparam value="#trim(memento.firstname)#" CFSQLType="CF_SQL_VARCHAR" maxLength="50">,
			<cfqueryparam value="#trim(memento.lastname)#" CFSQLType="CF_SQL_VARCHAR" maxLength="50">,
			<cfqueryparam value="#val(memento.numberofthreads)#" CFSQLType="CF_SQL_INTEGER">,
			<cfqueryparam value="#val(memento.numberofmessages)#" CFSQLType="CF_SQL_INTEGER">,
					#createodbcdatetime(memento.datelastvisited)#,
			<cfqueryparam value="#val(memento.showemail)#" CFSQLType="CF_SQL_BOOLEAN">,
			<cfqueryparam value="#trim(memento.defaultfuseaction)#" CFSQLType="CF_SQL_CHAR" maxLength="20">,
			<cfqueryparam value="#val(memento.privatemessages)#" CFSQLType="CF_SQL_BOOLEAN">,
			<cfqueryparam value="#val(memento.showprofile)#" CFSQLType="CF_SQL_BOOLEAN">,
			<cfqueryparam value="#val(memento.emailsubs)#" CFSQLType="CF_SQL_BOOLEAN">,
			<cfqueryparam value="#trim(memento.profile)#" CFSQLType="CF_SQL_CHAR" maxLength="200">)
		</cfquery>
	</cffunction>

	<cffunction name="read" access="public" returntype="void" output="false"
		displayname="CRUD: Read" hint="I read the specified database record into a users object.<br />Throws: USERS.MISSING if the specified users cannot be found.">
		<cfargument name="users" type="users" required="yes"
			displayname="Users" hint="I am the users into which data is read." />
		<!--- Primary Key --->
		<cfargument name="userid" type="numeric" required="yes"
			displayname="Users ID" hint="I am the ID of the Users database record to read." />
		<cfset var qUsers = 0 />
		<cfset var memento = structNew() />
		<!--- Get the record from the database --->
		<cfquery name="qUsers" datasource="#variables.DSN#" >
			SELECT	users.userid,
					users.username,
					users.password,
					users.emailaddress,
					users.city,
					users.signature,
					users.datecreated,
					users.threadorder,
					users.messageorder,
					users.active,
					users.firstname,
					users.lastname,
					users.numberofthreads,
					users.numberofmessages,
					users.datelastvisited,
					users.showemail,
					users.defaultfuseaction,
					users.privatemessages,
					users.showprofile,
					users.emailsubs,
					users.profile
			FROM	users
				WHERE users.userid = <cfqueryparam value="#val(arguments.userid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>

		<cfif qUsers.recordCount eq 1>
		<!--- Create a memento --->
			<cfset memento.userid = qUsers.userid />
			<cfset memento.username = qUsers.username />
			<cfset memento.password = qUsers.password />
			<cfset memento.emailaddress = qUsers.emailaddress />
			<cfset memento.city = qUsers.city />
			<cfset memento.signature = qUsers.signature />
			<cfset memento.datecreated = qUsers.datecreated />
			<cfset memento.threadorder = qUsers.threadorder />
			<cfset memento.messageorder = qUsers.messageorder />
			<cfset memento.active = qUsers.active />
			<cfset memento.firstname = qUsers.firstname />
			<cfset memento.lastname = qUsers.lastname />
			<cfset memento.numberofthreads = qUsers.numberofthreads />
			<cfset memento.numberofmessages = qUsers.numberofmessages />
			<cfset memento.datelastvisited = qUsers.datelastvisited />
			<cfset memento.showemail = qUsers.showemail />
			<cfset memento.defaultfuseaction = qUsers.defaultfuseaction />
			<cfset memento.privatemessages = qUsers.privatemessages />
			<cfset memento.showprofile = qUsers.showprofile />
			<cfset memento.emailsubs = qUsers.emailsubs />
			<cfset memento.profile = qUsers.profile />
			<cfset arguments.users.setInstanceMemento(memento) />
		<cfelse>
			<cfthrow type="USERS.MISSING" message="No such users" detail="OID=#arguments.userid#" />
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" returntype="void" output="false"
		displayname="CRUD: Update" hint="I update the database from an users.">
		<cfargument name="users" type="users" required="yes"
			displayname="Users" hint="I am the users whose record should be updated." />
		<cfset var qUpdateUsers = 0 />
		<cfset var memento = arguments.users.getInstanceMemento() />
		<!--- Update the record in the database --->
		<cfquery name="qUpdateUsers" datasource="#variables.DSN#" >
			UPDATE users
				SET
					username = <cfqueryparam value="#memento.username#" CFSQLType="CF_SQL_VARCHAR" maxLength="100">,
					password = <cfqueryparam value="#memento.password#" CFSQLType="CF_SQL_VARCHAR" maxLength="12">,
					emailaddress = <cfqueryparam value="#memento.emailaddress#" CFSQLType="CF_SQL_VARCHAR" maxLength="50">,
					city = <cfqueryparam value="#memento.city#" CFSQLType="CF_SQL_VARCHAR" maxLength="30">,
					signature = <cfqueryparam value="#memento.signature#" CFSQLType="CF_SQL_CHAR" maxLength="150"><cfif memento.datecreated IS NOT "">,
					datecreated = #createodbcdatetime(memento.datecreated)#</cfif>,
					threadorder = <cfqueryparam value="#memento.threadorder#" CFSQLType="CF_SQL_CHAR" maxLength="4">,
					messageorder = <cfqueryparam value="#memento.messageorder#" CFSQLType="CF_SQL_CHAR" maxLength="4">,
					active = <cfqueryparam value="#val(memento.active)#" CFSQLType="CF_SQL_BOOLEAN">,
					firstname = <cfqueryparam value="#memento.firstname#" CFSQLType="CF_SQL_VARCHAR" maxLength="50">,
					lastname = <cfqueryparam value="#memento.lastname#" CFSQLType="CF_SQL_VARCHAR" maxLength="50">,
					numberofthreads = <cfqueryparam value="#val(memento.numberofthreads)#" CFSQLType="CF_SQL_INTEGER">,
					numberofmessages = <cfqueryparam value="#val(memento.numberofmessages)#" CFSQLType="CF_SQL_INTEGER"><cfif memento.datelastvisited IS NOT "">,
					datelastvisited = #createodbcdatetime(memento.datelastvisited)#</cfif>,
					showemail = <cfqueryparam value="#val(memento.showemail)#" CFSQLType="CF_SQL_BOOLEAN">,
					defaultfuseaction = <cfqueryparam value="#memento.defaultfuseaction#" CFSQLType="CF_SQL_CHAR" maxLength="20">,
					privatemessages = <cfqueryparam value="#val(memento.privatemessages)#" CFSQLType="CF_SQL_BOOLEAN">,
					showprofile = <cfqueryparam value="#val(memento.showprofile)#" CFSQLType="CF_SQL_BOOLEAN">,
					emailsubs = <cfqueryparam value="#val(memento.emailsubs)#" CFSQLType="CF_SQL_BOOLEAN">,
					profile = <cfqueryparam value="#memento.profile#" CFSQLType="CF_SQL_CHAR" maxLength="200">
			WHERE users.userid = <cfqueryparam value="#val(memento.userid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
	</cffunction>

	<cffunction name="delete" access="public" returntype="void" output="false"
		displayname="CRUD: Delete" hint="I delete an users from the database.">
		<cfargument name="users" type="users" required="yes"
			displayname="users" hint="I am the users whose record should be deleted." />
		<cfset var qDeleteUsers = 0 />
		<cfset var memento = arguments.users.getInstanceMemento() />
		<!--- Delete the record from the database --->
		<cfquery name="qDeleteUsers" datasource="#variables.DSN#" >
			DELETE FROM users
				WHERE users.userid = <cfqueryparam value="#val(memento.userid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
	</cffunction>

</cfcomponent>
<!--- 
$Log: users_DAO.cfc,v $
Revision 1.3  2007/06/14 15:07:14  kevin
single email address

Revision 1.2  2007/06/14 14:01:14  kevin
Initial Open Source Version

Revision 1.4  2005/06/03 17:38:06  mike
enforce var scope

Revision 1.3  2005/05/11 10:41:15  kevin
Rename from MVC conversion

Revision 1.2  2005/03/31 14:07:04  kevin
Add CVS Info

Revision 1.1  2005/03/29 10:00:01  mike
Fusebuilder Generated Code

 --->
