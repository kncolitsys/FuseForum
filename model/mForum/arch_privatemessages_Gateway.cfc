<!--- $RCSfile: arch_privatemessages_Gateway.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:10 $ --->
<cfcomponent displayname="Arch_privatemessages Gateway" hint="I am a data gateway to arch_privatemessages objects">
	<cffunction name="init" access="public" returntype="arch_privatemessages_gateway" output="false"
		displayname="Arch_privatemessages Gateway Constructor" hint="I initialize the arch_privatemessages gateway.">
		<cfargument name="dsn" type="string" required="yes"
			displayname="Data Source Name" hint="I am the data source to use for persistence." />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>

	<cffunction name="findAll" access="public" returntype="query" output="false"
		displayname="Find All" hint="I return a query containing all arch_privatemessages objects.">
		<cfargument name="orderby" type="string" required="No" default="" />
		<cfset var qArch_privatemessages = 0 />
		<cfquery name="qArch_privatemessages" datasource="#variables.DSN#" >
			SELECT	arch_privatemessages.messageid,
					arch_privatemessages.userid,
					arch_privatemessages.message,
					arch_privatemessages.senderid,
					arch_privatemessages.messagedate,
					arch_privatemessages.arch_date
			FROM	arch_privatemessages
			<cfif isdefined("arguments.orderby") AND arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			<cfelse>
				ORDER BY messageid ASC
			</cfif>
		</cfquery>
		<cfreturn qArch_privatemessages />
	</cffunction>

	<cffunction name="findSelected" access="public" returntype="query" output="false"
		displayname="Find Selected" hint="I return a query containing arch_privatemessages objects, selected based on parameters passed.">
		<cfargument name="messageid" type="numeric" required="No" />
		<cfargument name="userid" type="numeric" required="No" />
		<cfargument name="message" type="string" required="No" />
		<cfargument name="senderid" type="numeric" required="No" />
		<cfargument name="messagedate_min" type="date" required="No" />
		<cfargument name="messagedate_max" type="date" required="No" />
		<cfargument name="arch_date_min" type="date" required="No" />
		<cfargument name="arch_date_max" type="date" required="No" />
		<cfargument name="orderby" type="string" required="No" default="" />
		<cfset var qArch_privatemessages = 0 />
		<cfquery name="qArch_privatemessages" datasource="#variables.DSN#" >
			SELECT	arch_privatemessages.messageid,
					arch_privatemessages.userid,
					arch_privatemessages.message,
					arch_privatemessages.senderid,
					arch_privatemessages.messagedate,
					arch_privatemessages.arch_date
			FROM	arch_privatemessages
			<cfif isdefined("arguments.messageid") AND arguments.messageid IS NOT "">
				WHERE arch_privatemessages.messageid = <cfqueryparam value="#val(arguments.messageid)#" CFSQLType="CF_SQL_INTEGER">
			<cfelse>
				WHERE 0 = 0
			</cfif>
				<cfif isDefined("arguments.userid") AND arguments.userid IS NOT "">
					AND arch_privatemessages.userid = <cfqueryparam value="#val(arguments.userid)#" CFSQLType="CF_SQL_INTEGER">
				</cfif>
				<cfif isDefined("arguments.message") AND arguments.message IS NOT "">
					AND arch_privatemessages.message = <cfqueryparam value="#arguments.message#" CFSQLType="CF_SQL_CHAR" maxLength="64000">
				</cfif>
				<cfif isDefined("arguments.senderid") AND arguments.senderid IS NOT "">
					AND arch_privatemessages.senderid = <cfqueryparam value="#val(arguments.senderid)#" CFSQLType="CF_SQL_INTEGER">
				</cfif>
				<cfif isDefined("arguments.messagedate_min") AND arguments.messagedate_min IS NOT "">
					AND arch_privatemessages.messagedate >= #createodbcdatetime(arguments.messagedate_min)#
				</cfif>
				<cfif isDefined("arguments.messagedate_max") AND arguments.messagedate_max IS NOT "">
					AND arch_privatemessages.messagedate <= #createodbcdatetime(arguments.messagedate_max)#
				</cfif>
				<cfif isDefined("arguments.arch_date_min") AND arguments.arch_date_min IS NOT "">
					AND arch_privatemessages.arch_date >= #createodbcdatetime(arguments.arch_date_min)#
				</cfif>
				<cfif isDefined("arguments.arch_date_max") AND arguments.arch_date_max IS NOT "">
					AND arch_privatemessages.arch_date <= #createodbcdatetime(arguments.arch_date_max)#
				</cfif>
			<cfif isdefined("arguments.orderby") AND arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			<cfelse>
				ORDER BY messageid ASC
			</cfif>
		</cfquery>
		<cfreturn qArch_privatemessages />
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
$Log: arch_privatemessages_Gateway.cfc,v $
Revision 1.2  2007/06/14 14:01:10  kevin
Initial Open Source Version

Revision 1.5  2005/06/03 17:38:03  mike
enforce var scope

Revision 1.4  2005/05/11 10:41:15  kevin
Rename from MVC conversion

Revision 1.3  2005/04/15 17:19:26  mike
added <cfargument name="orderby" to findAll()

Revision 1.2  2005/03/31 14:07:03  kevin
Add CVS Info

Revision 1.1  2005/03/29 09:56:17  mike
Fusebuilder Generated Code

 --->
