<!--- $RCSfile: friends_Gateway.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:11 $ --->
<cfcomponent displayname="Friends Gateway" hint="I am a data gateway to friends objects">
	<cffunction name="init" access="public" returntype="friends_gateway" output="false"
		displayname="Friends Gateway Constructor" hint="I initialize the friends gateway.">
		<cfargument name="dsn" type="string" required="yes"
			displayname="Data Source Name" hint="I am the data source to use for persistence." />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>

	<cffunction name="findAll" access="public" returntype="query" output="false"
		displayname="Find All" hint="I return a query containing all friends objects.">
		<cfargument name="orderby" type="string" required="No" default="" />
		<cfset var qFriends = 0 />
		<cfquery name="qFriends" datasource="#variables.DSN#" >
			SELECT	friends.recordid,
					friends.userid,
					friends.friendid
			FROM	friends
			<cfif isdefined("arguments.orderby") AND arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			<cfelse>
				ORDER BY recordid ASC
			</cfif>
		</cfquery>
		<cfreturn qFriends />
	</cffunction>

	<cffunction name="findSelected" access="public" returntype="query" output="false"
		displayname="Find Selected" hint="I return a query containing friends objects, selected based on parameters passed.">
		<cfargument name="recordid" type="numeric" required="No" />
		<cfargument name="userid" type="numeric" required="No" />
		<cfargument name="friendid" type="numeric" required="No" />
		<cfargument name="orderby" type="string" required="No" default="" />
		<cfset var qFriends = 0 />
		<cfquery name="qFriends" datasource="#variables.DSN#" >
			SELECT	friends.recordid,
					friends.userid,
					friends.friendid
			FROM	friends
			<cfif isdefined("arguments.recordid") AND arguments.recordid IS NOT "">
				WHERE friends.recordid = <cfqueryparam value="#val(arguments.recordid)#" CFSQLType="CF_SQL_INTEGER">
			<cfelse>
				WHERE 0 = 0
			</cfif>
				<cfif isDefined("arguments.userid") AND arguments.userid IS NOT "">
					AND friends.userid = <cfqueryparam value="#val(arguments.userid)#" CFSQLType="CF_SQL_INTEGER">
				</cfif>
				<cfif isDefined("arguments.friendid") AND arguments.friendid IS NOT "">
					AND friends.friendid = <cfqueryparam value="#val(arguments.friendid)#" CFSQLType="CF_SQL_INTEGER">
				</cfif>
			<cfif isdefined("arguments.orderby") AND arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			<cfelse>
				ORDER BY recordid ASC
			</cfif>
		</cfquery>
		<cfreturn qFriends />
	</cffunction>

	<cffunction name="deleteSelected" access="public" returntype="boolean" output="false"
		displayname="Delete Selected" hint="I delete friends objects, selected based on parameters passed.">
		<cfargument name="userid" type="numeric" required="Yes" />
		<cfargument name="friendid" type="numeric" required="No" />
		<cfset var qFriends = 0 />
		<cfquery name="qFriends" datasource="#variables.DSN#" >
			DELETE FROM	friends
			WHERE friends.userid = <cfqueryparam value="#val(arguments.userid)#" CFSQLType="CF_SQL_INTEGER">
			<cfif isDefined("arguments.friendid") AND arguments.friendid IS NOT "">
				AND friends.friendid = <cfqueryparam value="#val(arguments.friendid)#" CFSQLType="CF_SQL_INTEGER">
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
$Log: friends_Gateway.cfc,v $
Revision 1.2  2007/06/14 14:01:11  kevin
Initial Open Source Version

Revision 1.6  2005/06/03 17:38:04  mike
enforce var scope

Revision 1.5  2005/05/11 10:41:15  kevin
Rename from MVC conversion

Revision 1.4  2005/05/06 15:20:54  mike
add new method deleteSelected()

Revision 1.3  2005/04/15 17:19:29  mike
added <cfargument name="orderby" to findAll()

Revision 1.2  2005/03/31 14:07:04  kevin
Add CVS Info

Revision 1.1  2005/03/29 09:57:55  mike
Fusebuilder Generated Code

 --->
