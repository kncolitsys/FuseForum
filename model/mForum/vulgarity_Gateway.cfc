<!--- $RCSfile: vulgarity_Gateway.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:15 $ --->
<cfcomponent displayname="Vulgarity Gateway" hint="I am a data gateway to vulgarity objects">
	<cffunction name="init" access="public" returntype="vulgarity_gateway" output="false"
		displayname="Vulgarity Gateway Constructor" hint="I initialize the vulgarity gateway.">
		<cfargument name="dsn" type="string" required="yes"
			displayname="Data Source Name" hint="I am the data source to use for persistence." />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>

	<cffunction name="findAll" access="public" returntype="query" output="false"
		displayname="Find All" hint="I return a query containing all vulgarity objects.">
		<cfargument name="orderby" type="string" required="No" default="" />
		<cfset var qVulgarity = 0 />
		<cfquery name="qVulgarity" datasource="#variables.DSN#" >
			SELECT	vulgarity.vulgarityid,
					vulgarity.vulgarity
			FROM	vulgarity
			<cfif isdefined("arguments.orderby") AND arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			<cfelse>
				ORDER BY vulgarityid ASC
			</cfif>
		</cfquery>
		<cfreturn qVulgarity />
	</cffunction>

	<cffunction name="findSelected" access="public" returntype="query" output="false"
		displayname="Find Selected" hint="I return a query containing vulgarity objects, selected based on parameters passed.">
		<cfargument name="vulgarityid" type="numeric" required="No" />
		<cfargument name="vulgarity" type="string" required="No" />
		<cfargument name="orderby" type="string" required="No" default="" />
		<cfset var qVulgarity = 0 />
		<cfquery name="qVulgarity" datasource="#variables.DSN#" >
			SELECT	vulgarity.vulgarityid,
					vulgarity.vulgarity
			FROM	vulgarity
			<cfif isdefined("arguments.vulgarityid") AND arguments.vulgarityid IS NOT "">
				WHERE vulgarity.vulgarityid = <cfqueryparam value="#val(arguments.vulgarityid)#" CFSQLType="CF_SQL_INTEGER">
			<cfelse>
				WHERE 0 = 0
			</cfif>
				<cfif isDefined("arguments.vulgarity") AND arguments.vulgarity IS NOT "">
					AND vulgarity.vulgarity = <cfqueryparam value="#arguments.vulgarity#" CFSQLType="CF_SQL_CHAR" maxLength="30">
				</cfif>
			<cfif isdefined("arguments.orderby") AND arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			<cfelse>
				ORDER BY vulgarityid ASC
			</cfif>
		</cfquery>
		<cfreturn qVulgarity />
	</cffunction>

	<cffunction name="deleteSelected" access="public" returntype="boolean" output="false"
		displayname="Delete Selected" hint="I delete vulgarity objects, selected based on parameters passed.">
		<cfargument name="vulgarityid" type="numeric" required="Yes" />
		<cfquery datasource="#variables.DSN#" >
			DELETE FROM	vulgarity
			WHERE	vulgarity.vulgarityid = <cfqueryparam value="#val(arguments.vulgarityid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn "true" />
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
$Log: vulgarity_Gateway.cfc,v $
Revision 1.2  2007/06/14 14:01:15  kevin
Initial Open Source Version

Revision 1.7  2005/06/03 17:38:06  mike
enforce var scope

Revision 1.6  2005/05/22 12:25:45  mike
remove the cachedwithin on FindAll(); add new function deleteSelected()

Revision 1.5  2005/05/11 10:41:15  kevin
Rename from MVC conversion

Revision 1.4  2005/05/06 15:18:05  mike
add cachedwithin

Revision 1.3  2005/04/15 17:19:30  mike
added <cfargument name="orderby" to findAll()

Revision 1.2  2005/03/31 14:07:04  kevin
Add CVS Info

Revision 1.1  2005/03/29 10:00:04  mike
Fusebuilder Generated Code

 --->
