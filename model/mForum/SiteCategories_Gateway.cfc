
<cfcomponent displayname="SiteCategories Gateway" hint="I am a data gateway to SiteCategories objects">
	<cffunction name="init" access="public" returntype="SiteCategories_gateway" output="false"
		displayname="SiteCategories Gateway Constructor" hint="I initialize the SiteCategories gateway.">
		<cfargument name="dsn" type="string" required="yes"
			displayname="Data Source Name" hint="I am the data source to use for persistence." />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>

	<cffunction name="findAll" access="public" returntype="query" output="false"
		displayname="Find All" hint="I return a query containing all SiteCategories objects.">
		<cfargument name="orderby" type="string" required="No" default="" />
		<cfset var qSiteCategories = 0 />
		<cfquery name="qSiteCategories" datasource="#variables.DSN#" >
			SELECT	SiteCategories.SiteCategoriesId,
					SiteCategories.SiteId,
					SiteCategories.CategoryId,
					SiteCategories.Sequence
			FROM	SiteCategories
			<cfif isdefined("arguments.orderby") AND arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			<cfelse>
				ORDER BY SiteCategoriesId ASC
			</cfif>
		</cfquery>

		<cfreturn qSiteCategories />
	</cffunction>

	<cffunction name="findSelected" access="public" returntype="query" output="false"
		displayname="Find Selected" hint="I return a query containing SiteCategories objects, selected based on parameters passed.">
		<cfargument name="SiteCategoriesId" type="numeric" required="No" />
		<cfargument name="SiteId" type="numeric" required="No" />
		<cfargument name="CategoryId" type="numeric" required="No" />
		<cfargument name="Sequence" type="numeric" required="No" />
		<cfargument name="orderby" type="string" required="No" default="" />
		<cfset var qSiteCategories = 0 />
		<cfquery name="qSiteCategories" datasource="#variables.DSN#" >
			SELECT	SiteCategories.SiteCategoriesId,
					SiteCategories.SiteId,
					SiteCategories.CategoryId,
					SiteCategories.Sequence
			FROM	SiteCategories
			<cfif isdefined("arguments.SiteCategoriesId") AND arguments.SiteCategoriesId IS NOT "">
				WHERE SiteCategories.SiteCategoriesId = <cfqueryparam value="#val(arguments.SiteCategoriesId)#" CFSQLType="CF_SQL_INTEGER">
			<cfelse>
				WHERE 0 = 0
			</cfif>
				<cfif isDefined("arguments.SiteId") AND arguments.SiteId IS NOT "">
					AND SiteCategories.SiteId = <cfqueryparam value="#val(arguments.SiteId)#" CFSQLType="CF_SQL_INTEGER">
				</cfif>
				<cfif isDefined("arguments.CategoryId") AND arguments.CategoryId IS NOT "">
					AND SiteCategories.CategoryId = <cfqueryparam value="#val(arguments.CategoryId)#" CFSQLType="CF_SQL_INTEGER">
				</cfif>
				<cfif isDefined("arguments.Sequence") AND arguments.Sequence IS NOT "">
					AND SiteCategories.Sequence = <cfqueryparam value="#val(arguments.Sequence)#" CFSQLType="CF_SQL_SMALLINT">
				</cfif>
			<cfif isdefined("arguments.orderby") AND arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			<cfelse>
				ORDER BY SiteCategoriesId ASC
			</cfif>
		</cfquery>

		<cfreturn qSiteCategories />
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
$Log: SiteCategories_Gateway.cfc,v $
Revision 1.2  2007/06/14 14:01:14  kevin
Initial Open Source Version

Revision 1.3  2005/06/03 17:38:05  mike
enforce var scope

Revision 1.2  2005/05/11 10:41:15  kevin
Rename from MVC conversion

Revision 1.1  2005/04/22 17:23:49  mike
Fusebuilder Generated Code, modified a bit

 --->
