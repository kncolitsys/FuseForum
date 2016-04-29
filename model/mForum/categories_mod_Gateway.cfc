<!--- $RCSfile: categories_mod_Gateway.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:11 $ --->
<cfcomponent displayname="Categories_mod Gateway" hint="I am a data gateway to categories_mod objects">
	<cffunction name="init" access="public" returntype="categories_mod_gateway" output="false"
		displayname="Categories_mod Gateway Constructor" hint="I initialize the categories_mod gateway.">
		<cfargument name="dsn" type="string" required="yes"
			displayname="Data Source Name" hint="I am the data source to use for persistence." />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>

	<cffunction name="findAll" access="public" returntype="query" output="false"
		displayname="Find All" hint="I return a query containing all categories_mod objects.">
		<cfargument name="orderby" type="string" required="No" default="" />
		<cfset var qCategories_mod = 0 />
		<cfquery name="qCategories_mod" datasource="#variables.DSN#" >
			SELECT	categories_mod.categoryid,
					categories_mod.userid
			FROM	categories_mod
			<cfif isdefined("arguments.orderby") AND arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			<cfelse>
				ORDER BY categoryid ASC
			</cfif>
		</cfquery>
		<cfreturn qCategories_mod />
	</cffunction>

	<cffunction name="findSelected" access="public" returntype="query" output="false"
		displayname="Find Selected" hint="I return a query containing categories_mod objects, selected based on parameters passed.">
		<cfargument name="categoryid" type="numeric" required="No" />
		<cfargument name="userid" type="numeric" required="No" />
		<cfargument name="orderby" type="string" required="No" default="" />
		<cfset var qCategories_mod = 0 />
		<cfquery name="qCategories_mod" datasource="#variables.DSN#" >
			SELECT	categories_mod.categoryid,
					categories_mod.userid
			FROM	categories_mod
			<cfif isdefined("arguments.categoryid") AND arguments.categoryid IS NOT "">
				WHERE categories_mod.categoryid = <cfqueryparam value="#val(arguments.categoryid)#" CFSQLType="CF_SQL_INTEGER">
			<cfelse>
				WHERE 0 = 0
			</cfif>
				<cfif isDefined("arguments.userid") AND arguments.userid IS NOT "">
					AND categories_mod.userid = <cfqueryparam value="#val(arguments.userid)#" CFSQLType="CF_SQL_INTEGER">
				</cfif>
			<cfif isdefined("arguments.orderby") AND arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			<cfelse>
				ORDER BY categoryid ASC
			</cfif>
		</cfquery>
		<cfreturn qCategories_mod />
	</cffunction>

	<cffunction name="deleteSelected" access="public" returntype="boolean" output="false"
		displayname="Delete Selected" hint="I delete categories_mod objects, selected based on parameters passed.">
		<cfargument name="categoryid" type="numeric" required="Yes" />
		<cfargument name="userid" type="numeric" required="No" />
		<cfquery datasource="#variables.DSN#" >
			DELETE FROM	categories_mod
			WHERE categories_mod.categoryid = <cfqueryparam value="#val(arguments.categoryid)#" CFSQLType="CF_SQL_INTEGER">
			<cfif isDefined("arguments.userid") AND arguments.userid IS NOT "">
				AND categories_mod.userid = <cfqueryparam value="#val(arguments.userid)#" CFSQLType="CF_SQL_INTEGER">
			</cfif>
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
$Log: categories_mod_Gateway.cfc,v $
Revision 1.2  2007/06/14 14:01:11  kevin
Initial Open Source Version

Revision 1.6  2005/06/03 17:38:04  mike
enforce var scope

Revision 1.5  2005/05/11 10:41:15  kevin
Rename from MVC conversion

Revision 1.4  2005/04/15 17:19:27  mike
added <cfargument name="orderby" to findAll()

Revision 1.3  2005/04/06 17:53:51  mike
added deleteSelected function

Revision 1.2  2005/03/31 14:07:03  kevin
Add CVS Info

Revision 1.1  2005/03/29 09:56:21  mike
Fusebuilder Generated Code

 --->
