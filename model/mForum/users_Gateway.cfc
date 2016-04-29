<!--- $RCSfile: users_Gateway.cfc,v $ $Revision: 1.3 $ $Author: kevin $ $Date: 2007/06/14 15:07:14 $ --->
<cfcomponent displayname="Users Gateway" hint="I am a data gateway to users objects">
	<cffunction name="init" access="public" returntype="users_gateway" output="false"
		displayname="Users Gateway Constructor" hint="I initialize the users gateway.">
		<cfargument name="dsn" type="string" required="yes"
			displayname="Data Source Name" hint="I am the data source to use for persistence." />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>

	<cffunction name="findAll" access="public" returntype="query" output="false"
		displayname="Find All" hint="I return a query containing all users objects.">
		<cfargument name="orderby" type="string" required="No" default="" />
		<cfset var qUsers = 0 />
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
			<cfif isdefined("arguments.orderby") AND arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			<cfelse>
				ORDER BY userid ASC
			</cfif>
		</cfquery>
		<cfreturn qUsers />
	</cffunction>

	<cffunction name="findSelected" access="public" returntype="query" output="false"
		displayname="Find Selected" hint="I return a query containing users objects, selected based on parameters passed.">
		<cfargument name="userid" type="numeric" required="No" />
		<cfargument name="username" type="string" required="No" />
		<cfargument name="password" type="string" required="No" />
		<cfargument name="emailaddress" type="string" required="No" />
		<cfargument name="city" type="string" required="No" />
		<cfargument name="signature" type="string" required="No" />
		<cfargument name="datecreated_min" type="date" required="No" />
		<cfargument name="datecreated_max" type="date" required="No" />
		<cfargument name="threadorder" type="string" required="No" />
		<cfargument name="messageorder" type="string" required="No" />
		<cfargument name="active" type="any" required="No" />
		<cfargument name="firstname" type="string" required="No" />
		<cfargument name="lastname" type="string" required="No" />
		<cfargument name="numberofthreads" type="numeric" required="No" />
		<cfargument name="numberofmessages" type="numeric" required="No" />
		<cfargument name="datelastvisited_min" type="date" required="No" />
		<cfargument name="datelastvisited_max" type="date" required="No" />
		<cfargument name="showemail" type="any" required="No" />
		<cfargument name="defaultfuseaction" type="string" required="No" />
		<cfargument name="privatemessages" type="any" required="No" />
		<cfargument name="showprofile" type="any" required="No" />
		<cfargument name="emailsubs" type="any" required="No" />
		<cfargument name="profile" type="string" required="No" />
		<cfargument name="orderby" type="string" required="No" default="" />
		<cfset var qUsers = 0 />
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
			<cfif isdefined("arguments.userid") AND arguments.userid IS NOT "">
				WHERE users.userid = <cfqueryparam value="#val(arguments.userid)#" CFSQLType="CF_SQL_INTEGER">
			<cfelse>
				WHERE 0 = 0
			</cfif>
				<cfif isDefined("arguments.username") AND arguments.username IS NOT "">
					AND users.username = <cfqueryparam value="#arguments.username#" CFSQLType="CF_SQL_VARCHAR" maxLength="100">
				</cfif>
				<cfif isDefined("arguments.password") AND arguments.password IS NOT "">
					AND users.password = <cfqueryparam value="#arguments.password#" CFSQLType="CF_SQL_VARCHAR" maxLength="12">
				</cfif>
				<cfif isDefined("arguments.emailaddress") AND arguments.emailaddress IS NOT "">
					AND users.emailaddress = <cfqueryparam value="#arguments.emailaddress#" CFSQLType="CF_SQL_VARCHAR" maxLength="50">
				</cfif>
				<cfif isDefined("arguments.city") AND arguments.city IS NOT "">
					AND users.city = <cfqueryparam value="#arguments.city#" CFSQLType="CF_SQL_VARCHAR" maxLength="30">
				</cfif>
				<cfif isDefined("arguments.signature") AND arguments.signature IS NOT "">
					AND users.signature = <cfqueryparam value="#arguments.signature#" CFSQLType="CF_SQL_CHAR" maxLength="150">
				</cfif>
				<cfif isDefined("arguments.datecreated_min") AND arguments.datecreated_min IS NOT "">
					AND users.datecreated >= #createodbcdatetime(arguments.datecreated_min)#
				</cfif>
				<cfif isDefined("arguments.datecreated_max") AND arguments.datecreated_max IS NOT "">
					AND users.datecreated <= #createodbcdatetime(arguments.datecreated_max)#
				</cfif>
				<cfif isDefined("arguments.threadorder") AND arguments.threadorder IS NOT "">
					AND users.threadorder = <cfqueryparam value="#arguments.threadorder#" CFSQLType="CF_SQL_CHAR" maxLength="4">
				</cfif>
				<cfif isDefined("arguments.messageorder") AND arguments.messageorder IS NOT "">
					AND users.messageorder = <cfqueryparam value="#arguments.messageorder#" CFSQLType="CF_SQL_CHAR" maxLength="4">
				</cfif>
				<cfif isDefined("arguments.active") AND arguments.active IS NOT "">
					AND users.active = <cfqueryparam value="#val(arguments.active)#" CFSQLType="CF_SQL_BOOLEAN">
				</cfif>
				<cfif isDefined("arguments.firstname") AND arguments.firstname IS NOT "">
					AND users.firstname = <cfqueryparam value="#arguments.firstname#" CFSQLType="CF_SQL_VARCHAR" maxLength="50">
				</cfif>
				<cfif isDefined("arguments.lastname") AND arguments.lastname IS NOT "">
					AND users.lastname = <cfqueryparam value="#arguments.lastname#" CFSQLType="CF_SQL_VARCHAR" maxLength="50">
				</cfif>
				<cfif isDefined("arguments.numberofthreads") AND arguments.numberofthreads IS NOT "">
					AND users.numberofthreads = <cfqueryparam value="#val(arguments.numberofthreads)#" CFSQLType="CF_SQL_INTEGER">
				</cfif>
				<cfif isDefined("arguments.numberofmessages") AND arguments.numberofmessages IS NOT "">
					AND users.numberofmessages = <cfqueryparam value="#val(arguments.numberofmessages)#" CFSQLType="CF_SQL_INTEGER">
				</cfif>
				<cfif isDefined("arguments.datelastvisited_min") AND arguments.datelastvisited_min IS NOT "">
					AND users.datelastvisited >= #createodbcdatetime(arguments.datelastvisited_min)#
				</cfif>
				<cfif isDefined("arguments.datelastvisited_max") AND arguments.datelastvisited_max IS NOT "">
					AND users.datelastvisited <= #createodbcdatetime(arguments.datelastvisited_max)#
				</cfif>
				<cfif isDefined("arguments.showemail") AND arguments.showemail IS NOT "">
					AND users.showemail = <cfqueryparam value="#val(arguments.showemail)#" CFSQLType="CF_SQL_BOOLEAN">
				</cfif>
				<cfif isDefined("arguments.defaultfuseaction") AND arguments.defaultfuseaction IS NOT "">
					AND users.defaultfuseaction = <cfqueryparam value="#arguments.defaultfuseaction#" CFSQLType="CF_SQL_CHAR" maxLength="20">
				</cfif>
				<cfif isDefined("arguments.privatemessages") AND arguments.privatemessages IS NOT "">
					AND users.privatemessages = <cfqueryparam value="#val(arguments.privatemessages)#" CFSQLType="CF_SQL_BOOLEAN">
				</cfif>
				<cfif isDefined("arguments.showprofile") AND arguments.showprofile IS NOT "">
					AND users.showprofile = <cfqueryparam value="#val(arguments.showprofile)#" CFSQLType="CF_SQL_BOOLEAN">
				</cfif>
				<cfif isDefined("arguments.emailsubs") AND arguments.emailsubs IS NOT "">
					AND users.emailsubs = <cfqueryparam value="#val(arguments.emailsubs)#" CFSQLType="CF_SQL_BOOLEAN">
				</cfif>
				<cfif isDefined("arguments.profile") AND arguments.profile IS NOT "">
					AND users.profile = <cfqueryparam value="#arguments.profile#" CFSQLType="CF_SQL_CHAR" maxLength="200">
				</cfif>
				
			<cfif isdefined("arguments.orderby") AND arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			<cfelse>
				ORDER BY userid ASC
			</cfif>
		</cfquery>
		<cfreturn qUsers />
	</cffunction>

	<cffunction name="findSelectedByPrivatemessages" access="public" returntype="query" output="false"
		displayname="Find Selected By Privatemessages" hint="I return a query containing users objects, selected based on parameters passed.">
		<cfargument name="userid" type="numeric" required="No" />
		<cfargument name="privatemessages" type="any" required="No" />
		<cfargument name="orderby" type="string" required="No" default="" />
		<cfset var qUsers = 0 />
		<cfquery name="qUsers" datasource="#variables.DSN#" >
			SELECT	users.userid,
					users.username
			FROM	users
			<cfif isdefined("arguments.userid") AND arguments.userid IS NOT "">
				WHERE users.userid = <cfqueryparam value="#val(arguments.userid)#" CFSQLType="CF_SQL_INTEGER">
			<cfelse>
				WHERE 0 = 0
			</cfif>
			<cfif isDefined("arguments.privatemessages") AND arguments.privatemessages IS NOT "">
				AND users.privatemessages = <cfqueryparam value="#val(arguments.privatemessages)#" CFSQLType="CF_SQL_BOOLEAN">
			</cfif>
			<cfif isdefined("arguments.orderby") AND arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			<cfelse>
				ORDER BY userid ASC
			</cfif>
		</cfquery>
		<cfreturn qUsers />
	</cffunction>

	<cffunction name="Iterator" 
		access="Public"
		returntype="fusebuilder.sqlgen.patterns.AbstractIterator">
		<cfset var myIterator = createObject("component", "fusebuilder.sqlgen.patterns.QueryIterator")>
		<cfinvoke component="#myIterator#" method="init" collection="#this.findAll()#">
		<cfreturn myiterator>
	</cffunction>

	<cffunction name="ValueListHandler"
		access="Public"
		returntype="fusebuilder.sqlgen.patterns.AbstractValueList">
		<cfset var myValueList = createObject("component", "fusebuilder.sqlgen.patterns.QueryValueList")>
		<cfinvoke component="#myValueList#" method="init" collection="#this.findAll()#">
		<cfreturn myValueList>
	</cffunction>

</cfcomponent>
<!--- 
$Log: users_Gateway.cfc,v $
Revision 1.3  2007/06/14 15:07:14  kevin
single email address

Revision 1.2  2007/06/14 14:01:14  kevin
Initial Open Source Version

Revision 1.6  2005/06/03 17:38:06  mike
enforce var scope

Revision 1.5  2005/05/13 17:50:17  mike
new function findSelectedByPrivatemessages()

Revision 1.4  2005/05/11 10:41:15  kevin
Rename from MVC conversion

Revision 1.3  2005/04/15 17:19:30  mike
added <cfargument name="orderby" to findAll()

Revision 1.2  2005/03/31 14:07:04  kevin
Add CVS Info

Revision 1.1  2005/03/29 10:00:01  mike
Fusebuilder Generated Code

 --->
