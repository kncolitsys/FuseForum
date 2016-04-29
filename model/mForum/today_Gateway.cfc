<!--- $RCSfile: today_Gateway.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:14 $ --->
<cfcomponent displayname="Today Gateway" hint="I am a data gateway to today objects">
	<cffunction name="init" access="public" returntype="today_gateway" output="false"
		displayname="Today Gateway Constructor" hint="I initialize the today gateway.">
		<cfargument name="dsn" type="string" required="yes"
			displayname="Data Source Name" hint="I am the data source to use for persistence." />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>

	<cffunction name="findAll" access="public" returntype="query" output="false"
		displayname="Find All" hint="I return a query containing all today objects.">
		<cfargument name="orderby" type="string" required="No" default="" />
		<cfset var qToday = 0 />
		<cfquery name="qToday" datasource="#variables.DSN#" >
			SELECT	today.postid,
					today.posttitle,
					today.post,
					today.postdate,
					today.dateexpires
			FROM	today
			<cfif isdefined("arguments.orderby") AND arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			<cfelse>
				ORDER BY postid ASC
			</cfif>
		</cfquery>
		<cfreturn qToday />
	</cffunction>

	<cffunction name="findSelected" access="public" returntype="query" output="false"
		displayname="Find Selected" hint="I return a query containing today objects, selected based on parameters passed.">
		<cfargument name="postid" type="numeric" required="No" />
		<cfargument name="posttitle" type="string" required="No" />
		<cfargument name="post" type="string" required="No" />
		<cfargument name="postdate_min" type="date" required="No" />
		<cfargument name="postdate_max" type="date" required="No" />
		<cfargument name="dateexpires_min" type="date" required="No" />
		<cfargument name="dateexpires_max" type="date" required="No" />
		<cfargument name="orderby" type="string" required="No" default="" />
		<cfset var qToday = 0 />
		<cfquery name="qToday" datasource="#variables.DSN#" >
			SELECT	today.postid,
					today.posttitle,
					today.post,
					today.postdate,
					today.dateexpires
			FROM	today
			<cfif isdefined("arguments.postid") AND arguments.postid IS NOT "">
				WHERE today.postid = <cfqueryparam value="#val(arguments.postid)#" CFSQLType="CF_SQL_INTEGER">
			<cfelse>
				WHERE 0 = 0
			</cfif>
				<cfif isDefined("arguments.posttitle") AND arguments.posttitle IS NOT "">
					AND today.posttitle = <cfqueryparam value="#arguments.posttitle#" CFSQLType="CF_SQL_CHAR" maxLength="50">
				</cfif>
				<cfif isDefined("arguments.post") AND arguments.post IS NOT "">
					AND today.post = <cfqueryparam value="#arguments.post#" CFSQLType="CF_SQL_CHAR" maxLength="64000">
				</cfif>
				<cfif isDefined("arguments.postdate_min") AND arguments.postdate_min IS NOT "">
					AND today.postdate >= #createodbcdatetime(arguments.postdate_min)#
				</cfif>
				<cfif isDefined("arguments.postdate_max") AND arguments.postdate_max IS NOT "">
					AND today.postdate <= #createodbcdatetime(arguments.postdate_max)#
				</cfif>
				<cfif isDefined("arguments.dateexpires_min") AND arguments.dateexpires_min IS NOT "">
					AND today.dateexpires >= #createodbcdatetime(arguments.dateexpires_min)#
				</cfif>
				<cfif isDefined("arguments.dateexpires_max") AND arguments.dateexpires_max IS NOT "">
					AND today.dateexpires <= #createodbcdatetime(arguments.dateexpires_max)#
				</cfif>
			<cfif isdefined("arguments.orderby") AND arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			<cfelse>
				ORDER BY postid ASC
			</cfif>
		</cfquery>
		<cfreturn qToday />
	</cffunction>

	<cffunction name="findUnexpired" access="public" returntype="query" output="false"
		displayname="Find Unexpired" hint="I return a query containing unexpired today objects.">
		<cfargument name="orderby" type="string" required="No" default="" />
		<cfset var qUnexpired = 0 />
		<cfquery name="qUnexpired" datasource="#variables.DSN#" >
			SELECT	today.postid,
					today.posttitle,
					today.post,
					today.postdate,
					today.dateexpires
			FROM	today
			WHERE	today.dateexpires > #createodbcdate(now())#
				OR	today.dateexpires IS NULL
			<cfif isdefined("arguments.orderby") AND arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			<cfelse>
				ORDER BY postid ASC
			</cfif>
		</cfquery>
		<cfreturn qUnexpired />
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
$Log: today_Gateway.cfc,v $
Revision 1.2  2007/06/14 14:01:14  kevin
Initial Open Source Version

Revision 1.7  2005/06/03 17:38:06  mike
enforce var scope

Revision 1.6  2005/05/11 10:41:15  kevin
Rename from MVC conversion

Revision 1.5  2005/05/10 10:47:11  mike
new method findUnexpired()

Revision 1.4  2005/04/15 17:19:30  mike
added <cfargument name="orderby" to findAll()

Revision 1.3  2005/04/11 12:29:08  mike
add missing orderby argument

Revision 1.2  2005/03/31 14:07:04  kevin
Add CVS Info

Revision 1.1  2005/03/29 09:59:59  mike
Fusebuilder Generated Code

 --->
