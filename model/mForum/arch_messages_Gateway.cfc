<!--- $RCSfile: arch_messages_Gateway.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:10 $ --->
<cfcomponent displayname="Arch_messages Gateway" hint="I am a data gateway to arch_messages objects">
	<cffunction name="init" access="public" returntype="arch_messages_gateway" output="false"
		displayname="Arch_messages Gateway Constructor" hint="I initialize the arch_messages gateway.">
		<cfargument name="dsn" type="string" required="yes"
			displayname="Data Source Name" hint="I am the data source to use for persistence." />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>

	<cffunction name="findAll" access="public" returntype="query" output="false"
		displayname="Find All" hint="I return a query containing all arch_messages objects.">
		<cfargument name="orderby" type="string" required="No" default="" />
		<cfset var qArch_messages = 0 />
		<cfquery name="qArch_messages" datasource="#variables.DSN#" >
			SELECT	arch_messages.messageid,
					arch_messages.message,
					arch_messages.messagedate,
					arch_messages.threadid,
					arch_messages.editmessage,
					arch_messages.attachment,
					arch_messages.filesize,
					arch_messages.moderatormessage,
					arch_messages.timeoflastchange,
					arch_messages.username,
					arch_messages.email
			FROM	arch_messages
			<cfif isdefined("arguments.orderby") AND arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			<cfelse>
				ORDER BY messageid ASC
			</cfif>
		</cfquery>
		<cfreturn qArch_messages />
	</cffunction>

	<cffunction name="findSelected" access="public" returntype="query" output="false"
		displayname="Find Selected" hint="I return a query containing arch_messages objects, selected based on parameters passed.">
		<cfargument name="messageid" type="numeric" required="No" />
		<cfargument name="message" type="string" required="No" />
		<cfargument name="messagedate_min" type="date" required="No" />
		<cfargument name="messagedate_max" type="date" required="No" />
		<cfargument name="threadid" type="numeric" required="No" />
		<cfargument name="editmessage" type="string" required="No" />
		<cfargument name="attachment" type="string" required="No" />
		<cfargument name="filesize" type="numeric" required="No" />
		<cfargument name="moderatormessage" type="string" required="No" />
		<cfargument name="timeoflastchange" type="any" required="No" />
		<cfargument name="username" type="string" required="No" />
		<cfargument name="email" type="string" required="No" />
		<cfargument name="orderby" type="string" required="No" default="" />
		<cfset var qArch_messages = 0 />
		<cfquery name="qArch_messages" datasource="#variables.DSN#" >
			SELECT	arch_messages.messageid,
					arch_messages.message,
					arch_messages.messagedate,
					arch_messages.threadid,
					arch_messages.editmessage,
					arch_messages.attachment,
					arch_messages.filesize,
					arch_messages.moderatormessage,
					arch_messages.timeoflastchange,
					arch_messages.username,
					arch_messages.email
			FROM	arch_messages
			<cfif isdefined("arguments.messageid") AND arguments.messageid IS NOT "">
				WHERE arch_messages.messageid = <cfqueryparam value="#val(arguments.messageid)#" CFSQLType="CF_SQL_INTEGER">
			<cfelse>
				WHERE 0 = 0
			</cfif>
				<cfif isDefined("arguments.message") AND arguments.message IS NOT "">
					AND arch_messages.message = <cfqueryparam value="#arguments.message#" CFSQLType="CF_SQL_CHAR" maxLength="64000">
				</cfif>
				<cfif isDefined("arguments.messagedate_min") AND arguments.messagedate_min IS NOT "">
					AND arch_messages.messagedate >= #createodbcdatetime(arguments.messagedate_min)#
				</cfif>
				<cfif isDefined("arguments.messagedate_max") AND arguments.messagedate_max IS NOT "">
					AND arch_messages.messagedate <= #createodbcdatetime(arguments.messagedate_max)#
				</cfif>
				<cfif isDefined("arguments.threadid") AND arguments.threadid IS NOT "">
					AND arch_messages.threadid = <cfqueryparam value="#val(arguments.threadid)#" CFSQLType="CF_SQL_INTEGER">
				</cfif>
				<cfif isDefined("arguments.editmessage") AND arguments.editmessage IS NOT "">
					AND arch_messages.editmessage = <cfqueryparam value="#arguments.editmessage#" CFSQLType="CF_SQL_CHAR" maxLength="100">
				</cfif>
				<cfif isDefined("arguments.attachment") AND arguments.attachment IS NOT "">
					AND arch_messages.attachment = <cfqueryparam value="#arguments.attachment#" CFSQLType="CF_SQL_CHAR" maxLength="50">
				</cfif>
				<cfif isDefined("arguments.filesize") AND arguments.filesize IS NOT "">
					AND arch_messages.filesize = <cfqueryparam value="#val(arguments.filesize)#" CFSQLType="CF_SQL_INTEGER">
				</cfif>
				<cfif isDefined("arguments.moderatormessage") AND arguments.moderatormessage IS NOT "">
					AND arch_messages.moderatormessage = <cfqueryparam value="#arguments.moderatormessage#" CFSQLType="CF_SQL_CHAR" maxLength="100">
				</cfif>
				<cfif isDefined("arguments.username") AND arguments.username IS NOT "">
					AND arch_messages.username = <cfqueryparam value="#arguments.username#" CFSQLType="CF_SQL_CHAR" maxLength="100">
				</cfif>
				<cfif isDefined("arguments.email") AND arguments.email IS NOT "">
					AND arch_messages.email = <cfqueryparam value="#arguments.email#" CFSQLType="CF_SQL_CHAR" maxLength="50">
				</cfif>
			<cfif isdefined("arguments.orderby") AND arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			<cfelse>
				ORDER BY messageid ASC
			</cfif>
		</cfquery>
		<cfreturn qArch_messages />
	</cffunction>

	<cffunction name="countAll" access="public" returntype="query" output="false"
		displayname="Count All" hint="I return a query counting all arch_messages objects.">
		<cfset var qArch_messages = 0 />
		<cfquery name="qArch_messages" datasource="#variables.DSN#" >
			SELECT	Count(messageid) AS messagecount
			FROM	arch_messages
		</cfquery>
		<cfreturn qArch_messages />
	</cffunction>

	<cffunction name="countSelected" access="public" returntype="query" output="false"
		displayname="Count Selected" hint="I return a query counting arch_messages objects, selected based on parameters passed.">
		<cfargument name="condition" type="string" required="Yes" />
		<cfargument name="datestring" type="string" required="Yes" />
		<cfset var qArch_messages = 0 />
		<cfquery name="qArch_messages" datasource="#variables.DSN#" >
			SELECT	Count(messageid) AS messagecount
			FROM	arch_messages
			WHERE 	#arguments.condition# #preservesinglequotes(arguments.datestring)#
		</cfquery>
		<cfreturn qArch_messages />
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
$Log: arch_messages_Gateway.cfc,v $
Revision 1.2  2007/06/14 14:01:10  kevin
Initial Open Source Version

Revision 1.7  2005/06/03 17:38:03  mike
enforce var scope

Revision 1.6  2005/05/11 10:41:15  kevin
Rename from MVC conversion

Revision 1.5  2005/04/15 17:19:26  mike
added <cfargument name="orderby" to findAll()

Revision 1.4  2005/04/11 15:21:53  mike
remove the incorrect attempts to alter explicitly the field timeoflastchange , which is of SQL type timestamp/BINARY(8)

Revision 1.3  2005/04/11 10:56:03  mike
new methods countSelected() etc.

Revision 1.2  2005/03/31 14:07:03  kevin
Add CVS Info

Revision 1.1  2005/03/29 09:56:16  mike
Fusebuilder Generated Code

 --->
