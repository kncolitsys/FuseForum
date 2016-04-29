<!--- $RCSfile: arch_threads_Gateway.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:10 $ --->
<cfcomponent displayname="Arch_threads Gateway" hint="I am a data gateway to arch_threads objects">
	<cffunction name="init" access="public" returntype="arch_threads_gateway" output="false"
		displayname="Arch_threads Gateway Constructor" hint="I initialize the arch_threads gateway.">
		<cfargument name="dsn" type="string" required="yes"
			displayname="Data Source Name" hint="I am the data source to use for persistence." />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>

	<cffunction name="findAll" access="public" returntype="query" output="false"
		displayname="Find All" hint="I return a query containing all arch_threads objects.">
		<cfargument name="orderby" type="string" required="No" default="" />
		<cfset var qArch_threads = 0 />
		<cfquery name="qArch_threads" datasource="#variables.DSN#" >
			SELECT	arch_threads.threadid,
					arch_threads.threadname,
					arch_threads.datecreated,
					arch_threads.messagecount,
					arch_threads.datelastpost,
					arch_threads.username
			FROM	arch_threads
			<cfif isdefined("arguments.orderby") AND arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			<cfelse>
				ORDER BY threadid ASC
			</cfif>
		</cfquery>
		<cfreturn qArch_threads />
	</cffunction>

	<cffunction name="findSelected" access="public" returntype="query" output="false"
		displayname="Find Selected" hint="I return a query containing arch_threads objects, selected based on parameters passed.">
		<cfargument name="threadid" type="numeric" required="No" />
		<cfargument name="threadname" type="string" required="No" />
		<cfargument name="datecreated_min" type="date" required="No" />
		<cfargument name="datecreated_max" type="date" required="No" />
		<cfargument name="messagecount" type="numeric" required="No" />
		<cfargument name="datelastpost_min" type="date" required="No" />
		<cfargument name="datelastpost_max" type="date" required="No" />
		<cfargument name="username" type="string" required="No" />
		<cfargument name="orderby" type="string" required="No" default="" />
		<cfset var qArch_threads = 0 />
		<cfquery name="qArch_threads" datasource="#variables.DSN#" >
			SELECT	arch_threads.threadid,
					arch_threads.threadname,
					arch_threads.datecreated,
					arch_threads.messagecount,
					arch_threads.datelastpost,
					arch_threads.username
			FROM	arch_threads
			<cfif isdefined("arguments.threadid") AND arguments.threadid IS NOT "">
				WHERE arch_threads.threadid = <cfqueryparam value="#val(arguments.threadid)#" CFSQLType="CF_SQL_INTEGER">
			<cfelse>
				WHERE 0 = 0
			</cfif>
				<cfif isDefined("arguments.threadname") AND arguments.threadname IS NOT "">
					AND arch_threads.threadname = <cfqueryparam value="#arguments.threadname#" CFSQLType="CF_SQL_CHAR" maxLength="50">
				</cfif>
				<cfif isDefined("arguments.datecreated_min") AND arguments.datecreated_min IS NOT "">
					AND arch_threads.datecreated >= #createodbcdatetime(arguments.datecreated_min)#
				</cfif>
				<cfif isDefined("arguments.datecreated_max") AND arguments.datecreated_max IS NOT "">
					AND arch_threads.datecreated <= #createodbcdatetime(arguments.datecreated_max)#
				</cfif>
				<cfif isDefined("arguments.messagecount") AND arguments.messagecount IS NOT "">
					AND arch_threads.messagecount = <cfqueryparam value="#val(arguments.messagecount)#" CFSQLType="CF_SQL_INTEGER">
				</cfif>
				<cfif isDefined("arguments.datelastpost_min") AND arguments.datelastpost_min IS NOT "">
					AND arch_threads.datelastpost >= #createodbcdatetime(arguments.datelastpost_min)#
				</cfif>
				<cfif isDefined("arguments.datelastpost_max") AND arguments.datelastpost_max IS NOT "">
					AND arch_threads.datelastpost <= #createodbcdatetime(arguments.datelastpost_max)#
				</cfif>
				<cfif isDefined("arguments.username") AND arguments.username IS NOT "">
					AND arch_threads.username = <cfqueryparam value="#arguments.username#" CFSQLType="CF_SQL_CHAR" maxLength="100">
				</cfif>
			<cfif isdefined("arguments.orderby") AND arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			<cfelse>
				ORDER BY threadid ASC
			</cfif>
		</cfquery>
		<cfreturn qArch_threads />
	</cffunction>

	<cffunction name="countAll" access="public" returntype="query" output="false"
		displayname="Count All" hint="I return a query counting all arch_threads objects.">
		<cfset var qArch_threads = 0 />
		<cfquery name="qArch_threads" datasource="#variables.DSN#" >
			SELECT	Count(threadid) AS threadcount
			FROM	arch_threads
		</cfquery>
		<cfreturn qArch_threads />
	</cffunction>

	<cffunction name="countSelected" access="public" returntype="query" output="false"
		displayname="Count Selected" hint="I return a query counting arch_threads objects, selected based on parameters passed.">
		<cfargument name="condition" type="string" required="Yes" />
		<cfargument name="datestring" type="string" required="Yes" />
		<cfset var qArch_threads = 0 />
		<cfquery name="qArch_threads" datasource="#variables.DSN#" >
			SELECT	Count(threadid) AS threadcount
			FROM	arch_threads
			WHERE 	#arguments.condition# #preservesinglequotes(arguments.datestring)#
		</cfquery>
		<cfreturn qArch_threads />
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
$Log: arch_threads_Gateway.cfc,v $
Revision 1.2  2007/06/14 14:01:10  kevin
Initial Open Source Version

Revision 1.6  2005/06/03 17:38:03  mike
enforce var scope

Revision 1.5  2005/05/11 10:41:15  kevin
Rename from MVC conversion

Revision 1.4  2005/04/15 17:19:26  mike
added <cfargument name="orderby" to findAll()

Revision 1.3  2005/04/11 10:56:30  mike
new methods countSelected() etc.

Revision 1.2  2005/03/31 14:07:03  kevin
Add CVS Info

Revision 1.1  2005/03/29 09:56:18  mike
Fusebuilder Generated Code

 --->
