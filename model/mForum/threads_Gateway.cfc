<!--- $RCSfile: threads_Gateway.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:14 $ --->
<cfcomponent displayname="Threads Gateway" hint="I am a data gateway to threads objects">
	<cffunction name="init" access="public" returntype="threads_gateway" output="false"
		displayname="Threads Gateway Constructor" hint="I initialize the threads gateway.">
		<cfargument name="dsn" type="string" required="yes"
			displayname="Data Source Name" hint="I am the data source to use for persistence." />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>

	<cffunction name="findAll" access="public" returntype="query" output="false"
		displayname="Find All" hint="I return a query containing all threads objects.">
		<cfargument name="orderby" type="string" required="No" default="" />
		<cfset var qThreads = 0 />
		<cfquery name="qThreads" datasource="#variables.DSN#" >
			SELECT	threads.threadid,
					threads.threadname,
					threads.datecreated,
					threads.userid,
					threads.categoryid,
					threads.messagecount,
					threads.datelastpost,
					threads.approved,
					threads.archived,
					threads.locked
			FROM	threads
			<cfif isdefined("arguments.orderby") AND arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			<cfelse>
				ORDER BY threadid ASC
			</cfif>
		</cfquery>
		<cfreturn qThreads />
	</cffunction>

	<cffunction name="findSelected" access="public" returntype="query" output="false"
		displayname="Find Selected" hint="I return a query containing threads objects, selected based on parameters passed.">
		<cfargument name="threadid" type="numeric" required="No" />
		<cfargument name="threadname" type="string" required="No" />
		<cfargument name="datecreated_min" type="date" required="No" />
		<cfargument name="datecreated_max" type="date" required="No" />
		<cfargument name="userid" type="numeric" required="No" />
		<cfargument name="categoryid" type="numeric" required="No" />
		<cfargument name="messagecount" type="numeric" required="No" />
		<cfargument name="datelastpost_min" type="date" required="No" />
		<cfargument name="datelastpost_max" type="date" required="No" />
		<cfargument name="approved" type="boolean" required="No" />
		<cfargument name="archived" type="boolean" required="No" />
		<cfargument name="locked" type="boolean" required="No" />
		<cfargument name="orderby" type="string" required="No" default="" />
		<cfset var qThreads = 0 />
		<cfquery name="qThreads" datasource="#variables.DSN#" >
			SELECT	threads.threadid,
					threads.threadname,
					threads.datecreated,
					threads.userid,
					threads.categoryid,
					threads.messagecount,
					threads.datelastpost,
					threads.approved,
					threads.archived,
					threads.locked
			FROM	threads
			<cfif isdefined("arguments.threadid") AND arguments.threadid IS NOT "">
				WHERE threads.threadid = <cfqueryparam value="#val(arguments.threadid)#" CFSQLType="CF_SQL_INTEGER">
			<cfelse>
				WHERE 0 = 0
			</cfif>
				<cfif isDefined("arguments.threadname") AND arguments.threadname IS NOT "">
					AND threads.threadname = <cfqueryparam value="#arguments.threadname#" CFSQLType="CF_SQL_CHAR" maxLength="50">
				</cfif>
				<cfif isDefined("arguments.datecreated_min") AND arguments.datecreated_min IS NOT "">
					AND threads.datecreated >= #createodbcdatetime(arguments.datecreated_min)#
				</cfif>
				<cfif isDefined("arguments.datecreated_max") AND arguments.datecreated_max IS NOT "">
					AND threads.datecreated <= #createodbcdatetime(arguments.datecreated_max)#
				</cfif>
				<cfif isDefined("arguments.userid") AND arguments.userid IS NOT "">
					AND threads.userid = <cfqueryparam value="#val(arguments.userid)#" CFSQLType="CF_SQL_INTEGER">
				</cfif>
				<cfif isDefined("arguments.categoryid") AND arguments.categoryid IS NOT "">
					AND threads.categoryid = <cfqueryparam value="#val(arguments.categoryid)#" CFSQLType="CF_SQL_INTEGER">
				</cfif>
				<cfif isDefined("arguments.messagecount") AND arguments.messagecount IS NOT "">
					AND threads.messagecount = <cfqueryparam value="#val(arguments.messagecount)#" CFSQLType="CF_SQL_INTEGER">
				</cfif>
				<cfif isDefined("arguments.datelastpost_min") AND arguments.datelastpost_min IS NOT "">
					AND threads.datelastpost >= #createodbcdatetime(arguments.datelastpost_min)#
				</cfif>
				<cfif isDefined("arguments.datelastpost_max") AND arguments.datelastpost_max IS NOT "">
					AND threads.datelastpost <= #createodbcdatetime(arguments.datelastpost_max)#
				</cfif>
				<cfif isDefined("arguments.approved") AND arguments.approved IS NOT "">
					AND threads.approved = <cfqueryparam value="#val(arguments.approved)#" CFSQLType="CF_SQL_BOOLEAN">
				</cfif>
				<cfif isDefined("arguments.archived") AND arguments.archived IS NOT "">
					AND threads.archived = <cfqueryparam value="#val(arguments.archived)#" CFSQLType="CF_SQL_BOOLEAN">
				</cfif>
				<cfif isDefined("arguments.locked") AND arguments.locked IS NOT "">
					AND threads.locked = <cfqueryparam value="#val(arguments.locked)#" CFSQLType="CF_SQL_BOOLEAN">
				</cfif>
			<cfif isdefined("arguments.orderby") AND arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			<cfelse>
				ORDER BY threadid ASC
			</cfif>
		</cfquery>
		<cfreturn qThreads />
	</cffunction>

	<cffunction name="findLatest" access="public" returntype="query" output="false"
		displayname="Find Latest" hint="I return a query containing threads objects, selected based on parameters passed.">
		<cfargument name="lForums" type="string" required="Yes" />
		<cfargument name="orderby" type="string" required="No" default="" />
		<cfset var qFindLatest = 0 />
		<cfquery name="qFindLatest" datasource="#variables.DSN#" maxrows="4" cachedwithin="#request.VeryShortTimespan#" >
			SELECT	threads.threadid,
					threads.threadname,
					threads.datecreated,
					threads.userid,
					threads.categoryid,
					threads.messagecount,
					threads.datelastpost,
					threads.approved,
					threads.archived,
					threads.locked
			FROM	threads
			WHERE	(threads.approved = 1 OR threads.approved IS NULL)
			<cfif ListLen(arguments.lForums)>
				AND	threads.categoryid IN (<cfqueryparam cfsqltype="CF_SQL_INTEGER" list="Yes" value="#arguments.lForums#">)
			<cfelse>
				AND	0 = 1
			</cfif>
			<cfif isDefined("arguments.orderby") AND arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			<cfelse>
				ORDER BY threadid ASC
			</cfif>
		</cfquery>
		<cfreturn qFindLatest />
	</cffunction>

	<cffunction name="fCategory" access="public" returntype="query" output="false"
		displayname="Category" hint="I return a query containing the category of the selected thread.">
		<cfargument name="threadid" type="numeric" required="Yes" />
		<cfset var qCategory = 0 />
		<cfquery name="qCategory" datasource="#variables.DSN#" >
			SELECT	threads.categoryid
			FROM	threads
			WHERE	threads.threadid = <cfqueryparam value="#val(arguments.threadid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn qCategory />
	</cffunction>

	<cffunction name="fThreadInfo" access="public" returntype="query" output="false"
		displayname="Thread Info" hint="I return a query containing info on threads of the selected category.">
		<cfargument name="categoryid" type="numeric" required="Yes" />
		<cfargument name="orderby" type="string" required="No" default="" />
		<cfset var qThreadInfo = 0 />
		<cfquery name="qThreadInfo" datasource="#variables.DSN#" >
			SELECT	DISTINCT
					threads.threadid, 
					threads.datelastpost, 
			    	threads.messagecount
			FROM 	threads
			WHERE	threads.categoryid = <cfqueryparam value="#val(arguments.categoryid)#" CFSQLType="CF_SQL_INTEGER">
				AND	(threads.Approved = 1 OR threads.Approved IS NULL)
			<cfif arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			</cfif>
		</cfquery>
		<cfreturn qThreadInfo />
	</cffunction>

	<cffunction name="countAll" access="public" returntype="query" output="false"
		displayname="Count All" hint="I return a query counting all threads objects.">
		<cfset var qThreads = 0 />
		<cfquery name="qThreads" datasource="#variables.DSN#" >
			SELECT	Count(threadid) AS threadcount
			FROM	threads
		</cfquery>
		<cfreturn qThreads />
	</cffunction>

	<cffunction name="countForumMessages" access="public" returntype="query" output="false"
		displayname="Count Forum Messages" hint="I return a query counting all messages in the given forum.">
		<cfargument name="categoryid" type="numeric" required="Yes" />
		<cfset var qMessages = 0 />
		<cfquery name="qMessages" datasource="#variables.DSN#" >
			SELECT	SUM(threads.messagecount) AS totalmessages
			FROM	threads
			WHERE	threads.categoryid = #arguments.categoryid#
		</cfquery>
		<cfreturn qMessages />
	</cffunction>

	<cffunction name="countSelected" access="public" returntype="query" output="false"
		displayname="Count Selected" hint="I return a query counting threads objects, selected based on parameters passed.">
		<cfargument name="condition" type="string" required="Yes" />
		<cfargument name="datestring" type="string" required="No" />
		<cfset var qThreads = 0 />
		<cfquery name="qThreads" datasource="#variables.DSN#" >
			SELECT	Count(threadid) AS threadcount
			FROM	threads
			WHERE 	#arguments.condition#
			<cfif isdefined("arguments.datestring") AND arguments.datestring IS NOT "">
				AND	datecreated #preservesinglequotes(arguments.datestring)#
			</cfif>
		</cfquery>
		<cfreturn qThreads />
	</cffunction>

	<cffunction name="updateSelected" access="public" returntype="boolean" output="false"
		displayname="Update Selected" hint="I update threads objects, selected based on parameters passed.">
		<cfargument name="categoryid" type="numeric" required="Yes" />
		<cfargument name="newcategory" type="numeric" required="Yes" />
		<cfquery datasource="#variables.DSN#" >
			UPDATE 	threads
			SET		categoryid = <cfqueryparam value="#val(arguments.newcategory)#" CFSQLType="CF_SQL_INTEGER">
			WHERE	categoryid = <cfqueryparam value="#val(arguments.categoryid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn "true" />
	</cffunction>

	<cffunction name="updateMessageCount" access="public" returntype="boolean" output="false"
		displayname="Update Message Count" hint="I update messagecount in a threads object.">
		<cfargument name="threadid" type="numeric" required="Yes" />
		<cfargument name="datelastpost" type="date" required="No" default="now()" />
		<cfquery datasource="#variables.DSN#" >
			UPDATE 	threads
			SET		messagecount = [threads].[messagecount]+1,
					datelastpost = #createodbcdatetime(arguments.datelastpost)#
			WHERE	threadid = <cfqueryparam value="#val(arguments.threadid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
		<cfreturn "true" />
	</cffunction>

	<cffunction name="deleteSelected" access="public" returntype="boolean" output="false"
		displayname="Delete Selected" hint="I delete threads objects, selected based on parameters passed.">
		<cfargument name="categoryid" type="numeric" required="Yes" />
		<cfargument name="threadname" type="string" required="No" />
		<cfargument name="datecreated_min" type="date" required="No" />
		<cfargument name="datecreated_max" type="date" required="No" />
		<cfargument name="userid" type="numeric" required="No" />
		<cfargument name="messagecount" type="numeric" required="No" />
		<cfargument name="datelastpost_min" type="date" required="No" />
		<cfargument name="datelastpost_max" type="date" required="No" />
		<cfargument name="approved" type="any" required="No" />
		<cfargument name="archived" type="any" required="No" />
		<cfargument name="locked" type="any" required="No" />
		<cfquery name="qThreads" datasource="#variables.DSN#" >
			DELETE FROM	threads
			WHERE	threads.categoryid = <cfqueryparam value="#val(arguments.categoryid)#" CFSQLType="CF_SQL_INTEGER">
			<cfif isDefined("arguments.threadname") AND arguments.threadname IS NOT "">
				AND threads.threadname = <cfqueryparam value="#arguments.threadname#" CFSQLType="CF_SQL_CHAR" maxLength="50">
			</cfif>
			<cfif isDefined("arguments.datecreated_min") AND arguments.datecreated_min IS NOT "">
				AND threads.datecreated >= #createodbcdatetime(arguments.datecreated_min)#
			</cfif>
			<cfif isDefined("arguments.datecreated_max") AND arguments.datecreated_max IS NOT "">
				AND threads.datecreated <= #createodbcdatetime(arguments.datecreated_max)#
			</cfif>
			<cfif isDefined("arguments.userid") AND arguments.userid IS NOT "">
				AND threads.userid = <cfqueryparam value="#val(arguments.userid)#" CFSQLType="CF_SQL_INTEGER">
			</cfif>
			<cfif isDefined("arguments.messagecount") AND arguments.messagecount IS NOT "">
				AND threads.messagecount = <cfqueryparam value="#val(arguments.messagecount)#" CFSQLType="CF_SQL_INTEGER">
			</cfif>
			<cfif isDefined("arguments.datelastpost_min") AND arguments.datelastpost_min IS NOT "">
				AND threads.datelastpost >= #createodbcdatetime(arguments.datelastpost_min)#
			</cfif>
			<cfif isDefined("arguments.datelastpost_max") AND arguments.datelastpost_max IS NOT "">
				AND threads.datelastpost <= #createodbcdatetime(arguments.datelastpost_max)#
			</cfif>
			<cfif isDefined("arguments.approved") AND arguments.approved IS NOT "">
				AND threads.approved = <cfqueryparam value="#val(arguments.approved)#" CFSQLType="CF_SQL_BOOLEAN">
			</cfif>
			<cfif isDefined("arguments.archived") AND arguments.archived IS NOT "">
				AND threads.archived = <cfqueryparam value="#val(arguments.archived)#" CFSQLType="CF_SQL_BOOLEAN">
			</cfif>
			<cfif isDefined("arguments.locked") AND arguments.locked IS NOT "">
				AND threads.locked = <cfqueryparam value="#val(arguments.locked)#" CFSQLType="CF_SQL_BOOLEAN">
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
$Log: threads_Gateway.cfc,v $
Revision 1.2  2007/06/14 14:01:14  kevin
Initial Open Source Version

Revision 1.13  2005/06/03 17:38:06  mike
enforce var scope

Revision 1.12  2005/05/16 14:52:41  mike
new functions fThreadInfo() etc.

Revision 1.11  2005/05/16 14:10:51  mike
pass datelastpost explicitly, to ensure threads and messages records synchronised

Revision 1.10  2005/05/11 10:41:15  kevin
Rename from MVC conversion

Revision 1.9  2005/05/06 17:54:17  mike
new methods updateMessageCount() etc.

Revision 1.8  2005/04/20 11:42:49  mike
handle the new field archived

Revision 1.7  2005/04/15 17:19:30  mike
added <cfargument name="orderby" to findAll()

Revision 1.6  2005/04/11 16:38:07  mike
bug fix: deleteSelected has returntype = "boolean"

Revision 1.5  2005/04/11 12:18:06  mike
set argument type of locked to "boolean" etc.

Revision 1.4  2005/04/11 10:57:00  mike
new methods countSelected() etc.

Revision 1.3  2005/04/06 18:04:38  mike
added deleteSelected and updateSelected functions

Revision 1.2  2005/03/31 14:07:04  kevin
Add CVS Info

Revision 1.1  2005/03/29 09:59:56  mike
Fusebuilder Generated Code
 --->
