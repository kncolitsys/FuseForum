<!--- $RCSfile: messages_Gateway.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:11 $ --->
<cfcomponent displayname="Messages Gateway" hint="I am a data gateway to messages objects">
	<cffunction name="init" access="public" returntype="messages_gateway" output="false"
		displayname="Messages Gateway Constructor" hint="I initialize the messages gateway.">
		<cfargument name="dsn" type="string" required="yes"
			displayname="Data Source Name" hint="I am the data source to use for persistence." />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>

	<cffunction name="findAll" access="public" returntype="query" output="false"
		displayname="Find All" hint="I return a query containing all messages objects.">
		<cfargument name="orderby" type="string" required="No" default="" />
		<cfset var qMessages = 0 />
		<cfquery name="qMessages" datasource="#variables.DSN#" >
			SELECT	messages.messageid,
					messages.message,
					messages.messagedate,
					messages.threadid,
					messages.userid,
					messages.editmessage,
					messages.moderatormessage,
					messages.attachment,
					messages.filesize,
					messages.approved,
					messages.archived,
					messages.timeoflastchange
			FROM	messages
			<cfif isdefined("arguments.orderby") AND arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			<cfelse>
				ORDER BY messageid ASC
			</cfif>
		</cfquery>
		<cfreturn qMessages />
	</cffunction>

	<cffunction name="findSelected" access="public" returntype="query" output="false"
		displayname="Find Selected" hint="I return a query containing messages objects, selected based on parameters passed.">
		<cfargument name="messageid" type="numeric" required="No" />
		<cfargument name="message" type="string" required="No" />
		<cfargument name="messagedate_min" type="date" required="No" />
		<cfargument name="messagedate_max" type="date" required="No" />
		<cfargument name="threadid" type="numeric" required="No" />
		<cfargument name="userid" type="numeric" required="No" />
		<cfargument name="editmessage" type="string" required="No" />
		<cfargument name="moderatormessage" type="string" required="No" />
		<cfargument name="attachment" type="string" required="No" />
		<cfargument name="filesize" type="numeric" required="No" />
		<cfargument name="approved" type="any" required="No" />
		<cfargument name="archived" type="any" required="No" />
		<cfargument name="timeoflastchange" type="any" required="No" />
		<cfargument name="orderby" type="string" required="No" default="" />
		<cfset var qMessages = 0 />
		<cfquery name="qMessages" datasource="#variables.DSN#" >
			SELECT	messages.messageid,
					messages.message,
					messages.messagedate,
					messages.threadid,
					threads.threadname,
					messages.userid,
					messages.editmessage,
					messages.moderatormessage,
					messages.attachment,
					messages.filesize,
					messages.approved,
					messages.archived,
					messages.timeoflastchange
			FROM	messages
				INNER JOIN threads ON threads.threadid = messages.threadid
			
			<cfif isdefined("arguments.messageid") AND arguments.messageid IS NOT "">
				WHERE messages.messageid = <cfqueryparam value="#val(arguments.messageid)#" CFSQLType="CF_SQL_INTEGER">
			<cfelse>
				WHERE 0 = 0
			</cfif>
				<cfif isDefined("arguments.message") AND arguments.message IS NOT "">
					AND messages.message = <cfqueryparam value="#arguments.message#" CFSQLType="CF_SQL_CHAR" maxLength="64000">
				</cfif>
				<cfif isDefined("arguments.messagedate_min") AND arguments.messagedate_min IS NOT "">
					AND messages.messagedate >= #createodbcdatetime(arguments.messagedate_min)#
				</cfif>
				<cfif isDefined("arguments.messagedate_max") AND arguments.messagedate_max IS NOT "">
					AND messages.messagedate <= #createodbcdatetime(arguments.messagedate_max)#
				</cfif>
				<cfif isDefined("arguments.threadid") AND arguments.threadid IS NOT "">
					AND messages.threadid = <cfqueryparam value="#val(arguments.threadid)#" CFSQLType="CF_SQL_INTEGER">
				</cfif>
				<cfif isDefined("arguments.userid") AND arguments.userid IS NOT "">
					AND messages.userid = <cfqueryparam value="#val(arguments.userid)#" CFSQLType="CF_SQL_INTEGER">
				</cfif>
				<cfif isDefined("arguments.editmessage") AND arguments.editmessage IS NOT "">
					AND messages.editmessage = <cfqueryparam value="#arguments.editmessage#" CFSQLType="CF_SQL_CHAR" maxLength="100">
				</cfif>
				<cfif isDefined("arguments.moderatormessage") AND arguments.moderatormessage IS NOT "">
					AND messages.moderatormessage = <cfqueryparam value="#arguments.moderatormessage#" CFSQLType="CF_SQL_CHAR" maxLength="100">
				</cfif>
				<cfif isDefined("arguments.attachment") AND arguments.attachment IS NOT "">
					AND messages.attachment = <cfqueryparam value="#arguments.attachment#" CFSQLType="CF_SQL_CHAR" maxLength="50">
				</cfif>
				<cfif isDefined("arguments.filesize") AND arguments.filesize IS NOT "">
					AND messages.filesize = <cfqueryparam value="#val(arguments.filesize)#" CFSQLType="CF_SQL_INTEGER">
				</cfif>
				<cfif isDefined("arguments.approved") AND arguments.approved IS NOT "">
					AND messages.approved = <cfqueryparam value="#val(arguments.approved)#" CFSQLType="CF_SQL_BOOLEAN">
				</cfif>
				<cfif isDefined("arguments.archived") AND arguments.archived IS NOT "">
					AND messages.archived = <cfqueryparam value="#val(arguments.archived)#" CFSQLType="CF_SQL_BOOLEAN">
				</cfif>
			<cfif isdefined("arguments.orderby") AND arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			<cfelse>
				ORDER BY messageid ASC
			</cfif>
		</cfquery>
		<cfreturn qMessages />
	</cffunction>

	<cffunction name="countAll" access="public" returntype="query" output="false"
		displayname="Count All" hint="I return a query counting all messages objects.">
		<cfset var qMessages = 0 />
		<cfquery name="qMessages" datasource="#variables.DSN#" >
			SELECT	Count(messageid) AS messagecount
			FROM	messages
		</cfquery>
		<cfreturn qMessages />
	</cffunction>

	<cffunction name="countAllByDay" access="public" returntype="query" output="false"
		displayname="Count All By Day" hint="I return a query counting all messages objects.">
		<cfset var qMessages = 0 />
		<cfquery name="qMessages" datasource="#variables.DSN#" >
			SELECT	DATEPART(dw, messagedate) AS Dayofweek, 
			    	COUNT(DATEPART(dw, messagedate)) AS NumberOfDups
			FROM	messages
			GROUP BY	DATEPART(dw, messagedate)
			ORDER BY	Dayofweek
		</cfquery>
		<cfreturn qMessages />
	</cffunction>

	<cffunction name="countAllByTime" access="public" returntype="query" output="false"
		displayname="Count All By Time" hint="I return a query counting all messages objects.">
		<cfset var qMessages = 0 />
		<cfquery name="qMessages" datasource="#variables.DSN#" >
			SELECT	DATEPART(hh, messagedate) AS hourofday, 
			    	COUNT(DATEPART(hh, messagedate)) AS NumberOfDups
			FROM	messages
			GROUP BY	DATEPART(hh, messagedate)
			ORDER BY	hourofday
		</cfquery>
		<cfreturn qMessages />
	</cffunction>

	<cffunction name="countSelected" access="public" returntype="query" output="false"
		displayname="Count Selected" hint="I return a query counting messages objects, selected based on parameters passed.">
		<cfargument name="condition" type="string" required="Yes" />
		<cfargument name="datestring" type="string" required="No" />
		<cfset var qMessages = 0 />
		<cfquery name="qMessages" datasource="#variables.DSN#" >
			SELECT	Count(messageid) AS messagecount
			FROM	messages
			WHERE 	#arguments.condition#
			<cfif isdefined("arguments.datestring") AND arguments.datestring IS NOT "">
				AND	messagedate #preservesinglequotes(arguments.datestring)#
			</cfif>
		</cfquery>
		<cfreturn qMessages />
	</cffunction>

	<cffunction name="countSelectedByDay" access="public" returntype="query" output="false"
		displayname="Count Selected By Day" hint="I return a query counting messages objects, selected based on parameters passed.">
		<cfargument name="datestring" type="string" required="No" />
		<cfset var qMessages = 0 />
		<cfquery name="qMessages" datasource="#variables.DSN#" >
			SELECT	DATEPART(dw, messagedate) AS Dayofweek, 
					COUNT(DATEPART(dw, messagedate)) AS NumberOfDups
			FROM	messages
			<cfif isdefined("arguments.datestring") AND arguments.datestring IS NOT "">
				WHERE	messagedate #preservesinglequotes(arguments.datestring)#
			</cfif>
			GROUP BY	DATEPART(dw, messagedate)
			ORDER BY	Dayofweek
		</cfquery>
		<cfreturn qMessages />
	</cffunction>

	<cffunction name="countSelectedByTime" access="public" returntype="query" output="false"
		displayname="Count Selected By Time" hint="I return a query counting messages objects, selected based on parameters passed.">
		<cfargument name="datestring" type="string" required="No" />
		<cfset var qMessages = 0 />
		<cfquery name="qMessages" datasource="#variables.DSN#" >
			SELECT	DATEPART(hh, messagedate) AS hourofday, 
					COUNT(DATEPART(hh, messagedate)) AS NumberOfDups
			FROM	messages
			<cfif isdefined("arguments.datestring") AND arguments.datestring IS NOT "">
				WHERE	messagedate #preservesinglequotes(arguments.datestring)#
			</cfif>
			GROUP BY	DATEPART(hh, messagedate)
			ORDER BY	hourofday
		</cfquery>
		<cfreturn qMessages />
	</cffunction>

	<cffunction name="updateSelected" access="public" returntype="boolean" output="false"
		displayname="Update Selected" hint="I update the given messages object, based on parameters passed.">
		<cfargument name="messageid" type="numeric" required="Yes" />
		<cfargument name="message" type="string" required="No" />
		<cfargument name="messagedate" type="date" required="No" />
		<cfargument name="threadid" type="numeric" required="No" />
		<cfargument name="userid" type="numeric" required="No" />
		<cfargument name="editmessage" type="string" required="No" />
		<cfargument name="moderatormessage" type="string" required="No" />
		<cfargument name="attachment" type="string" required="No" />
		<cfargument name="filesize" type="numeric" required="No" />
		<cfargument name="approved" type="any" required="No" />
		<cfargument name="archived" type="any" required="No" />
		<cfquery datasource="#variables.DSN#" >
			UPDATE	messages
			SET		timeoflastchange = timeoflastchange
			<cfif isDefined("arguments.message")>
				,message = <cfqueryparam value="#arguments.message#" CFSQLType="CF_SQL_CHAR" maxLength="64000">
			</cfif>
			<cfif isDefined("arguments.messagedate") AND isDate(arguments.messagedate)>
				,messagedate <= #createodbcdatetime(arguments.messagedate)#
			</cfif>
			<cfif isDefined("arguments.threadid")>
				,threadid = <cfqueryparam value="#val(arguments.threadid)#" CFSQLType="CF_SQL_INTEGER">
			</cfif>
			<cfif isDefined("arguments.userid")>
				,userid = <cfqueryparam value="#val(arguments.userid)#" CFSQLType="CF_SQL_INTEGER">
			</cfif>
			<cfif isDefined("arguments.editmessage")>
				,editmessage = <cfqueryparam value="#arguments.editmessage#" CFSQLType="CF_SQL_CHAR" maxLength="100">
			</cfif>
			<cfif isDefined("arguments.moderatormessage")>
				,moderatormessage = <cfqueryparam value="#arguments.moderatormessage#" CFSQLType="CF_SQL_CHAR" maxLength="100">
			</cfif>
			<cfif isDefined("arguments.attachment")>
				<cfif arguments.attachment IS NOT "">
					,attachment = <cfqueryparam value="#arguments.attachment#" CFSQLType="CF_SQL_CHAR" maxLength="50">
				<cfelse>
					,attachment = NULL
				</cfif>
			</cfif>
			<cfif isDefined("arguments.filesize")>
				,filesize = <cfqueryparam value="#val(arguments.filesize)#" CFSQLType="CF_SQL_INTEGER">
			</cfif>
			<cfif isDefined("arguments.approved")>
				,approved = <cfqueryparam value="#val(arguments.approved)#" CFSQLType="CF_SQL_BOOLEAN">
			</cfif>
			<cfif isDefined("arguments.archived")>
				,archived = <cfqueryparam value="#val(arguments.archived)#" CFSQLType="CF_SQL_BOOLEAN">
			</cfif>
			WHERE	messages.messageid = <cfqueryparam value="#val(arguments.messageid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn "true" />
	</cffunction>

	<cffunction name="deleteSelected" access="public" returntype="boolean" output="false"
		displayname="Delete Selected" hint="I delete messages objects, selected based on parameters passed.">
		<cfargument name="threadid" type="numeric" required="Yes" />
		<cfargument name="message" type="string" required="No" />
		<cfargument name="messagedate_min" type="date" required="No" />
		<cfargument name="messagedate_max" type="date" required="No" />
		<cfargument name="userid" type="numeric" required="No" />
		<cfargument name="editmessage" type="string" required="No" />
		<cfargument name="moderatormessage" type="string" required="No" />
		<cfargument name="attachment" type="string" required="No" />
		<cfargument name="filesize" type="numeric" required="No" />
		<cfargument name="approved" type="any" required="No" />
		<cfargument name="archived" type="any" required="No" />
		<cfargument name="timeoflastchange" type="any" required="No" />
		<cfquery datasource="#variables.DSN#" >
			DELETE FROM	messages
			WHERE	messages.threadid = <cfqueryparam value="#val(arguments.threadid)#" CFSQLType="CF_SQL_INTEGER">
			<cfif isDefined("arguments.message") AND arguments.message IS NOT "">
				AND messages.message = <cfqueryparam value="#arguments.message#" CFSQLType="CF_SQL_CHAR" maxLength="64000">
			</cfif>
			<cfif isDefined("arguments.messagedate_min") AND arguments.messagedate_min IS NOT "">
				AND messages.messagedate >= #createodbcdatetime(arguments.messagedate_min)#
			</cfif>
			<cfif isDefined("arguments.messagedate_max") AND arguments.messagedate_max IS NOT "">
				AND messages.messagedate <= #createodbcdatetime(arguments.messagedate_max)#
			</cfif>
			<cfif isDefined("arguments.userid") AND arguments.userid IS NOT "">
				AND messages.userid = <cfqueryparam value="#val(arguments.userid)#" CFSQLType="CF_SQL_INTEGER">
			</cfif>
			<cfif isDefined("arguments.editmessage") AND arguments.editmessage IS NOT "">
				AND messages.editmessage = <cfqueryparam value="#arguments.editmessage#" CFSQLType="CF_SQL_CHAR" maxLength="100">
			</cfif>
			<cfif isDefined("arguments.moderatormessage") AND arguments.moderatormessage IS NOT "">
				AND messages.moderatormessage = <cfqueryparam value="#arguments.moderatormessage#" CFSQLType="CF_SQL_CHAR" maxLength="100">
			</cfif>
			<cfif isDefined("arguments.attachment") AND arguments.attachment IS NOT "">
				AND messages.attachment = <cfqueryparam value="#arguments.attachment#" CFSQLType="CF_SQL_CHAR" maxLength="50">
			</cfif>
			<cfif isDefined("arguments.filesize") AND arguments.filesize IS NOT "">
				AND messages.filesize = <cfqueryparam value="#val(arguments.filesize)#" CFSQLType="CF_SQL_INTEGER">
			</cfif>
			<cfif isDefined("arguments.approved") AND arguments.approved IS NOT "">
				AND messages.approved = <cfqueryparam value="#val(arguments.approved)#" CFSQLType="CF_SQL_BOOLEAN">
			</cfif>
			<cfif isDefined("arguments.archived") AND arguments.archived IS NOT "">
				AND messages.archived = <cfqueryparam value="#val(arguments.archived)#" CFSQLType="CF_SQL_BOOLEAN">
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
$Log: messages_Gateway.cfc,v $
Revision 1.2  2007/06/14 14:01:11  kevin
Initial Open Source Version

Revision 1.12  2006/07/31 15:40:44  kevin
Add the name of the thread to the query.

Revision 1.11  2005/06/20 14:44:55  mike
bug fix: remove stray >

Revision 1.10  2005/06/03 17:38:04  mike
enforce var scope

Revision 1.9  2005/05/11 10:41:15  kevin
Rename from MVC conversion

Revision 1.8  2005/05/06 15:23:03  mike
new method updateSelected()

Revision 1.7  2005/04/20 11:42:49  mike
handle the new field archived

Revision 1.6  2005/04/15 17:19:29  mike
added <cfargument name="orderby" to findAll()

Revision 1.5  2005/04/11 15:21:54  mike
remove the incorrect attempts to alter explicitly the field timeoflastchange , which is of SQL type timestamp/BINARY(8)

Revision 1.4  2005/04/11 10:56:59  mike
new methods countSelected() etc.

Revision 1.3  2005/04/06 18:06:25  mike
added deleteSelected function

Revision 1.2  2005/03/31 14:07:04  kevin
Add CVS Info

Revision 1.1  2005/03/29 09:57:55  mike
Fusebuilder Generated Code
 --->
