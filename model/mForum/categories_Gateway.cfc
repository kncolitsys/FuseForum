<!--- $RCSfile: categories_Gateway.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:11 $ --->
<cfcomponent displayname="Categories Gateway" hint="I am a data gateway to categories objects">
	<cffunction name="init" access="public" returntype="categories_gateway" output="false"
		displayname="Categories Gateway Constructor" hint="I initialize the categories gateway.">
		<cfargument name="dsn" type="string" required="yes"
			displayname="Data Source Name" hint="I am the data source to use for persistence." />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>

	<cffunction name="findAll" access="public" returntype="query" output="false"
		displayname="Find All" hint="I return a query containing all categories objects.">
		<cfargument name="orderby" type="string" required="No" default="" />
		<cfset var qCategories = 0 />
		<cfquery name="qCategories" datasource="#variables.DSN#" >
			SELECT	categories.categoryid,
					categories.categoryname,
					categories.description,
					categories.status,
					categories.allowattachments,
					categories.messagelimit,
					categories.archivedays,
					categories.approval,
					categories.readonly,
					categories.categoryowner,
					categories.visibleto
			FROM	categories
			<cfif isdefined("arguments.orderby") AND arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			<cfelse>
				ORDER BY categoryid ASC
			</cfif>
		</cfquery>
		<cfreturn qCategories />
	</cffunction>

	<cffunction name="findSelected" access="public" returntype="query" output="false"
		displayname="Find Selected" hint="I return a query containing categories objects, selected based on parameters passed.">
		<cfargument name="categoryid" type="numeric" required="No" />
		<cfargument name="categoryname" type="string" required="No" />
		<cfargument name="description" type="string" required="No" />
		<cfargument name="status" type="string" required="No" />
		<cfargument name="allowattachments" type="any" required="No" />
		<cfargument name="messagelimit" type="numeric" required="No" />
		<cfargument name="archivedays" type="numeric" required="No" />
		<cfargument name="approval" type="any" required="No" />
		<cfargument name="readonly" type="any" required="No" />
		<cfargument name="categoryowner" type="numeric" required="No" />
		<cfargument name="visibleto" type="string" required="No" />
		<cfargument name="orderby" type="string" required="No" default="" />
		<cfset var qCategories = 0 />
		<cfquery name="qCategories" datasource="#variables.DSN#" >
			SELECT	categories.categoryid,
					categories.categoryname,
					categories.description,
					categories.status,
					categories.allowattachments,
					categories.messagelimit,
					categories.archivedays,
					categories.approval,
					categories.readonly,
					categories.categoryowner,
					categories.visibleto
			FROM	categories
			<cfif isdefined("arguments.categoryid") AND arguments.categoryid IS NOT "">
				WHERE categories.categoryid = <cfqueryparam value="#val(arguments.categoryid)#" CFSQLType="CF_SQL_INTEGER">
			<cfelse>
				WHERE 0 = 0
			</cfif>
				<cfif isDefined("arguments.categoryname") AND arguments.categoryname IS NOT "">
					AND categories.categoryname = <cfqueryparam value="#arguments.categoryname#" CFSQLType="CF_SQL_CHAR" maxLength="50">
				</cfif>
				<cfif isDefined("arguments.description") AND arguments.description IS NOT "">
					AND categories.description = <cfqueryparam value="#arguments.description#" CFSQLType="CF_SQL_CHAR" maxLength="100">
				</cfif>
				<cfif isDefined("arguments.status") AND arguments.status IS NOT "">
					AND categories.status = <cfqueryparam value="#arguments.status#" CFSQLType="CF_SQL_CHAR" maxLength="50">
				</cfif>
				<cfif isDefined("arguments.allowattachments") AND arguments.allowattachments IS NOT "">
					AND categories.allowattachments = <cfqueryparam value="#val(arguments.allowattachments)#" CFSQLType="CF_SQL_BOOLEAN">
				</cfif>
				<cfif isDefined("arguments.messagelimit") AND arguments.messagelimit IS NOT "">
					AND categories.messagelimit = <cfqueryparam value="#val(arguments.messagelimit)#" CFSQLType="CF_SQL_INTEGER">
				</cfif>
				<cfif isDefined("arguments.archivedays") AND arguments.archivedays IS NOT "">
					AND categories.archivedays = <cfqueryparam value="#val(arguments.archivedays)#" CFSQLType="CF_SQL_INTEGER">
				</cfif>
				<cfif isDefined("arguments.approval") AND arguments.approval IS NOT "">
					AND categories.approval = <cfqueryparam value="#val(arguments.approval)#" CFSQLType="CF_SQL_BOOLEAN">
				</cfif>
				<cfif isDefined("arguments.readonly") AND arguments.readonly IS NOT "">
					AND categories.readonly = <cfqueryparam value="#val(arguments.readonly)#" CFSQLType="CF_SQL_BOOLEAN">
				</cfif>
				<cfif isDefined("arguments.categoryowner") AND arguments.categoryowner IS NOT "">
					AND categories.categoryowner = <cfqueryparam value="#val(arguments.categoryowner)#" CFSQLType="CF_SQL_INTEGER">
				</cfif>
				<cfif isDefined("arguments.visibleto") AND arguments.visibleto IS NOT "">
					AND categories.visibleto = <cfqueryparam value="#arguments.visibleto#" CFSQLType="CF_SQL_CHAR" maxLength="15">
				</cfif>
			<cfif isdefined("arguments.orderby") AND arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			<cfelse>
				ORDER BY categoryid ASC
			</cfif>
		</cfquery>
		<cfreturn qCategories />
	</cffunction>

	<cffunction name="findNotSelected" access="public" returntype="query" output="false"
		displayname="Find Not Selected" hint="I return a query containing categories objects other than the specified one.">
		<cfargument name="categoryid" type="numeric" required="Yes" />
		<cfargument name="orderby" type="string" required="No" default="" />
		<cfset var qCategories = 0 />
		<cfquery name="qCategories" datasource="#variables.DSN#" >
			SELECT	categories.categoryid,
					categories.categoryname,
					categories.description,
					categories.status,
					categories.allowattachments,
					categories.messagelimit,
					categories.archivedays,
					categories.approval,
					categories.readonly,
					categories.categoryowner,
					categories.visibleto
			FROM	categories
				WHERE categories.categoryid != <cfqueryparam value="#val(arguments.categoryid)#" CFSQLType="CF_SQL_INTEGER">
			<cfif isdefined("arguments.orderby") AND arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			<cfelse>
				ORDER BY categoryid ASC
			</cfif>
		</cfquery>
		<cfreturn qCategories />
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
$Log: categories_Gateway.cfc,v $
Revision 1.2  2007/06/14 14:01:11  kevin
Initial Open Source Version

Revision 1.7  2005/06/03 17:38:04  mike
enforce var scope

Revision 1.6  2005/05/11 10:41:15  kevin
Rename from MVC conversion

Revision 1.5  2005/04/20 11:43:14  mike
handle the new field archivedays

Revision 1.4  2005/04/15 17:19:27  mike
added <cfargument name="orderby" to findAll()

Revision 1.3  2005/03/31 17:13:00  mike
add new method "findNotSelected"

Revision 1.2  2005/03/31 14:07:03  kevin
Add CVS Info

Revision 1.1  2005/03/29 09:56:19  mike
Fusebuilder Generated Code

 --->
