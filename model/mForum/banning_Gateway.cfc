<!--- $RCSfile: banning_Gateway.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:11 $ --->
<cfcomponent displayname="Banning Gateway" hint="I am a data gateway to banning objects">
	<cffunction name="init" access="public" returntype="banning_gateway" output="false"
		displayname="Banning Gateway Constructor" hint="I initialize the banning gateway.">
		<cfargument name="dsn" type="string" required="yes"
			displayname="Data Source Name" hint="I am the data source to use for persistence." />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>

	<cffunction name="findAll" access="public" returntype="query" output="false"
		displayname="Find All" hint="I return a query containing all banning objects.">
		<cfargument name="orderby" type="string" required="No" default="" />
		<cfset var qBanning = 0 />
		<cfquery name="qBanning" datasource="#variables.DSN#" >
			SELECT	banning.banid,
					banning.bantype,
					banning.banstring
			FROM	banning
			<cfif isdefined("arguments.orderby") AND arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			<cfelse>
				ORDER BY banid ASC
			</cfif>
		</cfquery>
		<cfreturn qBanning />
	</cffunction>

	<cffunction name="findSelected" access="public" returntype="query" output="false"
		displayname="Find Selected" hint="I return a query containing banning objects, selected based on parameters passed.">
		<cfargument name="banid" type="numeric" required="No" />
		<cfargument name="bantype" type="string" required="No" />
		<cfargument name="banstring" type="string" required="No" />
		<cfargument name="orderby" type="string" required="No" default="" />
		<cfset var qBanning = 0 />
		<cfquery name="qBanning" datasource="#variables.DSN#" >
			SELECT	banning.banid,
					banning.bantype,
					banning.banstring
			FROM	banning
			<cfif isdefined("arguments.banid") AND arguments.banid IS NOT "">
				WHERE banning.banid = <cfqueryparam value="#val(arguments.banid)#" CFSQLType="CF_SQL_INTEGER">
			<cfelse>
				WHERE 0 = 0
			</cfif>
				<cfif isDefined("arguments.bantype")>
					AND banning.bantype = <cfqueryparam value="#arguments.bantype#" CFSQLType="CF_SQL_CHAR" maxLength="10">
				</cfif>
				<cfif isDefined("arguments.banstring") AND arguments.banstring IS NOT "">
					AND banning.banstring = <cfqueryparam value="#arguments.banstring#" CFSQLType="CF_SQL_CHAR" maxLength="100">
				</cfif>
			<cfif isdefined("arguments.orderby") AND arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			<cfelse>
				ORDER BY banid ASC
			</cfif>
		</cfquery>
		<cfreturn qBanning />
	</cffunction>

	<cffunction name="findSelectedBanid" access="public" returntype="query" output="false"
		displayname="Find Selected banid" hint="I return a query containing the banid field of banning objects, selected based on parameters passed.">
		<cfargument name="banid" type="numeric" required="No" />
		<cfargument name="bantype" type="string" required="No" />
		<cfargument name="banstring" type="string" required="No" />
		<cfargument name="orderby" type="string" required="No" default="" />
		<cfset var qBanning = 0 />
		<cfquery name="qBanning" datasource="#variables.DSN#" >
			SELECT	banning.banid
			FROM	banning
			<cfif isdefined("arguments.banid") AND arguments.banid IS NOT "">
				WHERE banning.banid = <cfqueryparam value="#val(arguments.banid)#" CFSQLType="CF_SQL_INTEGER">
			<cfelse>
				WHERE 0 = 0
			</cfif>
				<cfif isDefined("arguments.bantype") AND arguments.bantype IS NOT "">
					AND banning.bantype = <cfqueryparam value="#arguments.bantype#" CFSQLType="CF_SQL_CHAR" maxLength="10">
				</cfif>
				<cfif isDefined("arguments.banstring") AND arguments.banstring IS NOT "">
					AND banning.banstring = <cfqueryparam value="#arguments.banstring#" CFSQLType="CF_SQL_CHAR" maxLength="100">
				</cfif>
			<cfif isdefined("arguments.orderby") AND arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			<cfelse>
				ORDER BY banid ASC
			</cfif>
		</cfquery>
		<cfreturn qBanning />
	</cffunction>

	<cffunction name="deleteList" access="public" returntype="boolean" output="false"
		displayname="Delete List" hint="I delete banning objects, as per the list passed.">
		<cfargument name="banlist" type="string" required="Yes" />
		<cfquery datasource="#variables.DSN#" >
			DELETE FROM	banning
			WHERE	banning.banid IN (#arguments.banlist#)
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
$Log: banning_Gateway.cfc,v $
Revision 1.2  2007/06/14 14:01:11  kevin
Initial Open Source Version

Revision 1.8  2005/06/03 17:38:03  mike
enforce var scope

Revision 1.7  2005/05/12 16:08:58  mike
remove the test for bantype EQ ""

Revision 1.6  2005/05/11 10:41:15  kevin
Rename from MVC conversion

Revision 1.5  2005/04/15 17:19:26  mike
added <cfargument name="orderby" to findAll()

Revision 1.4  2005/04/11 10:58:20  mike
new method findSelectedBanid() etc.

Revision 1.3  2005/04/06 17:52:49  mike
added deleteList function

Revision 1.2  2005/03/31 14:07:03  kevin
Add CVS Info

Revision 1.1  2005/03/29 09:56:18  mike
Fusebuilder Generated Code

 --->
