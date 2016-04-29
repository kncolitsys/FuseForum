<!--- $RCSfile: subscriptions_Gateway.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:14 $ --->
<cfcomponent displayname="Subscriptions Gateway" hint="I am a data gateway to subscriptions objects">
	<cffunction name="init" access="public" returntype="subscriptions_gateway" output="false"
		displayname="Subscriptions Gateway Constructor" hint="I initialize the subscriptions gateway.">
		<cfargument name="dsn" type="string" required="yes"
			displayname="Data Source Name" hint="I am the data source to use for persistence." />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>

	<cffunction name="findAll" access="public" returntype="query" output="false"
		displayname="Find All" hint="I return a query containing all subscriptions objects.">
		<cfargument name="orderby" type="string" required="No" default="" />
		<cfset var qSubscriptions = 0 />
		<cfquery name="qSubscriptions" datasource="#variables.DSN#" >
			SELECT	subscriptions.recordid,
					subscriptions.userid,
					subscriptions.threadid
			FROM	subscriptions
			<cfif isdefined("arguments.orderby") AND arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			<cfelse>
				ORDER BY recordid ASC
			</cfif>
		</cfquery>
		<cfreturn qSubscriptions />
	</cffunction>

	<cffunction name="findSelected" access="public" returntype="query" output="false"
		displayname="Find Selected" hint="I return a query containing subscriptions objects, selected based on parameters passed.">
		<cfargument name="recordid" type="numeric" required="No" />
		<cfargument name="userid" type="numeric" required="No" />
		<cfargument name="threadid" type="numeric" required="No" />
		<cfargument name="orderby" type="string" required="No" default="" />
		<cfset var qSubscriptions = 0 />
		<cfquery name="qSubscriptions" datasource="#variables.DSN#" >
			SELECT	subscriptions.recordid,
					subscriptions.userid,
					subscriptions.threadid
			FROM	subscriptions
			<cfif isdefined("arguments.recordid") AND arguments.recordid IS NOT "">
				WHERE subscriptions.recordid = <cfqueryparam value="#val(arguments.recordid)#" CFSQLType="CF_SQL_INTEGER">
			<cfelse>
				WHERE 0 = 0
			</cfif>
				<cfif isDefined("arguments.userid") AND arguments.userid IS NOT "">
					AND subscriptions.userid = <cfqueryparam value="#val(arguments.userid)#" CFSQLType="CF_SQL_INTEGER">
				</cfif>
				<cfif isDefined("arguments.threadid") AND arguments.threadid IS NOT "">
					AND subscriptions.threadid = <cfqueryparam value="#val(arguments.threadid)#" CFSQLType="CF_SQL_INTEGER">
				</cfif>
			<cfif isdefined("arguments.orderby") AND arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			<cfelse>
				ORDER BY recordid ASC
			</cfif>
		</cfquery>
		<cfreturn qSubscriptions />
	</cffunction>

	<cffunction name="deleteSelected" access="public" returntype="boolean" output="false"
		displayname="Delete Selected" hint="I delete subscriptions objects, selected based on parameters passed.">
		<cfargument name="threadid" type="numeric" required="Yes" />
		<cfargument name="userid" type="numeric" required="No" />
		<cfquery datasource="#variables.DSN#" >
			DELETE FROM	subscriptions
			WHERE subscriptions.threadid = <cfqueryparam value="#val(arguments.threadid)#" CFSQLType="CF_SQL_INTEGER">
			<cfif isDefined("arguments.userid") AND arguments.userid IS NOT "">
				AND subscriptions.userid = <cfqueryparam value="#val(arguments.userid)#" CFSQLType="CF_SQL_INTEGER">
			</cfif>
		</cfquery>
		<cfreturn "true" />
	</cffunction>

	<cffunction name="deleteSelectedBySubscriptions" access="public" returntype="boolean" output="false"
		displayname="Delete Selected By Subscriptions" hint="I delete subscriptions objects, selected based on parameters passed.">
		<cfargument name="lsubscriptions" type="string" required="Yes" />
		<cfif ListLen(arguments.lsubscriptions)>
			<cfquery datasource="#variables.DSN#" >
				DELETE FROM	subscriptions
				WHERE	recordid IN (<cfqueryparam cfsqltype="CF_SQL_INTEGER" list="Yes" value="#arguments.lsubscriptions#">)
			</cfquery>
		</cfif>
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
$Log: subscriptions_Gateway.cfc,v $
Revision 1.2  2007/06/14 14:01:14  kevin
Initial Open Source Version

Revision 1.7  2005/06/03 17:38:05  mike
enforce var scope

Revision 1.6  2005/05/11 10:41:15  kevin
Rename from MVC conversion

Revision 1.5  2005/05/06 15:19:06  mike
add new method deleteSelectedBySubscriptions()

Revision 1.4  2005/04/15 17:19:30  mike
added <cfargument name="orderby" to findAll()

Revision 1.3  2005/04/06 18:05:33  mike
added deleteSelected function

Revision 1.2  2005/03/31 14:07:04  kevin
Add CVS Info

Revision 1.1  2005/03/29 09:59:55  mike
Fusebuilder Generated Code

 --->
