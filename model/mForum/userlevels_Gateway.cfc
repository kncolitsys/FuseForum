<!--- $RCSfile: userlevels_Gateway.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:14 $ --->
<cfcomponent displayname="Userlevels Gateway" hint="I am a data gateway to userlevels objects">
	<cffunction name="init" access="public" returntype="userlevels_gateway" output="false"
		displayname="Userlevels Gateway Constructor" hint="I initialize the userlevels gateway.">
		<cfargument name="dsn" type="string" required="yes"
			displayname="Data Source Name" hint="I am the data source to use for persistence." />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>

	<cffunction name="findAll" access="public" returntype="query" output="false"
		displayname="Find All" hint="I return a query containing all userlevels objects.">
		<cfargument name="orderby" type="string" required="No" default="" />
		<cfset var qUserlevels = 0 />
		<cfquery name="qUserlevels" datasource="#variables.DSN#" >
			SELECT	userlevels.userlevelid,
					userlevels.userlevel
			FROM	userlevels
			<cfif isdefined("arguments.orderby") AND arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			<cfelse>
				ORDER BY userlevelid ASC
			</cfif>
		</cfquery>
		<cfreturn qUserlevels />
	</cffunction>

	<cffunction name="findSelected" access="public" returntype="query" output="false"
		displayname="Find Selected" hint="I return a query containing userlevels objects, selected based on parameters passed.">
		<cfargument name="userlevelid" type="numeric" required="No" />
		<cfargument name="userlevel" type="string" required="No" />
		<cfargument name="orderby" type="string" required="No" default="" />
		<cfset var qUserlevels = 0 />
		<cfquery name="qUserlevels" datasource="#variables.DSN#" >
			SELECT	userlevels.userlevelid,
					userlevels.userlevel
			FROM	userlevels
			<cfif isdefined("arguments.userlevelid") AND arguments.userlevelid IS NOT "">
				WHERE userlevels.userlevelid = <cfqueryparam value="#val(arguments.userlevelid)#" CFSQLType="CF_SQL_INTEGER">
			<cfelse>
				WHERE 0 = 0
			</cfif>
				<cfif isDefined("arguments.userlevel") AND arguments.userlevel IS NOT "">
					AND userlevels.userlevel = <cfqueryparam value="#arguments.userlevel#" CFSQLType="CF_SQL_CHAR" maxLength="50">
				</cfif>
			<cfif isdefined("arguments.orderby") AND arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			<cfelse>
				ORDER BY userlevelid ASC
			</cfif>
		</cfquery>
		<cfreturn qUserlevels />
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
$Log: userlevels_Gateway.cfc,v $
Revision 1.2  2007/06/14 14:01:14  kevin
Initial Open Source Version

Revision 1.5  2005/06/03 17:38:06  mike
enforce var scope

Revision 1.4  2005/05/11 10:41:15  kevin
Rename from MVC conversion

Revision 1.3  2005/04/15 17:19:30  mike
added <cfargument name="orderby" to findAll()

Revision 1.2  2005/03/31 14:07:04  kevin
Add CVS Info

Revision 1.1  2005/03/29 10:00:00  mike
Fusebuilder Generated Code

 --->
