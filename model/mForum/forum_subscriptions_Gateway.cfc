<!--- $RCSfile: forum_subscriptions_Gateway.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:11 $ --->
<cfcomponent displayname="Forum_subscriptions Gateway" hint="I am a data gateway to forum_subscriptions objects">
	<cffunction name="init" access="public" returntype="forum_subscriptions_gateway" output="false"
		displayname="Forum_subscriptions Gateway Constructor" hint="I initialize the forum_subscriptions gateway.">
		<cfargument name="dsn" type="string" required="yes"
			displayname="Data Source Name" hint="I am the data source to use for persistence." />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>

	<cffunction name="findAll" access="public" returntype="query" output="false"
		displayname="Find All" hint="I return a query containing all forum_subscriptions objects.">
		<cfset var qForum_subscriptions = 0 />
		<cfquery name="qForum_subscriptions" datasource="#variables.DSN#" >
			SELECT	forum_subscriptions.fs_id,
					forum_subscriptions.fs_name_id,
					forum_subscriptions.fs_forum_id
			FROM	forum_subscriptions
			<cfif isdefined("arguments.orderby") AND arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			<cfelse>
				ORDER BY fs_id ASC
			</cfif>
		</cfquery>

		<cfreturn qForum_subscriptions />
	</cffunction>

	<cffunction name="findSelected" access="public" returntype="query" output="false"
		displayname="Find Selected" hint="I return a query containing forum_subscriptions objects, selected based on parameters passed.">
		<cfargument name="fs_id" type="numeric" required="No" />
		<cfargument name="fs_name_id" type="numeric" required="No" />
		<cfargument name="fs_forum_id" type="numeric" required="No" />
		<cfargument name="orderby" type="string" default="" />
		<cfset var qForum_subscriptions = 0 />
		<cfquery name="qForum_subscriptions" datasource="#variables.DSN#" >
			SELECT	forum_subscriptions.fs_id,
					forum_subscriptions.fs_name_id,
					forum_subscriptions.fs_forum_id
			FROM	forum_subscriptions
			<cfif isdefined("arguments.fs_id") AND arguments.fs_id IS NOT "">
				WHERE forum_subscriptions.fs_id = <cfqueryparam value="#val(arguments.fs_id)#" CFSQLType="CF_SQL_INTEGER">
			<cfelse>
				WHERE 0 = 0
			</cfif>
				<cfif isDefined("arguments.fs_name_id") AND arguments.fs_name_id IS NOT "">
					AND forum_subscriptions.fs_name_id = <cfqueryparam value="#val(arguments.fs_name_id)#" CFSQLType="CF_SQL_INTEGER">
				</cfif>
				<cfif isDefined("arguments.fs_forum_id") AND arguments.fs_forum_id IS NOT "">
					AND forum_subscriptions.fs_forum_id = <cfqueryparam value="#val(arguments.fs_forum_id)#" CFSQLType="CF_SQL_INTEGER">
				</cfif>
			<cfif isdefined("arguments.orderby") AND arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			<cfelse>
				ORDER BY fs_id ASC
			</cfif>
		</cfquery>

		<cfreturn qForum_subscriptions />
	</cffunction>

	<cffunction name="deleteSelectedBySubscriptions" access="public" returntype="boolean" output="false"
		displayname="Delete Selected By Subscriptions" hint="I delete forum_subscriptions objects, selected based on parameters passed.">
		<cfargument name="lsubscriptions" type="string" required="Yes" />
		<cfif ListLen(arguments.lsubscriptions)>
			<cfquery datasource="#variables.DSN#" >
				DELETE FROM	forum_subscriptions
				WHERE	forum_subscriptions.fs_id IN (<cfqueryparam cfsqltype="CF_SQL_INTEGER" list="Yes" value="#arguments.lsubscriptions#">)
			</cfquery>
		</cfif>
		<cfreturn "true" />
	</cffunction>

	<cffunction name="deleteSelectedByForum" access="public" returntype="boolean" output="false"
		displayname="Delete Selected By Forum" hint="I delete forum_subscriptions objects, selected based on parameters passed.">
		<cfargument name="fs_forum_id" type="numeric" required="Yes" />
		<cfquery datasource="#variables.DSN#" >
			DELETE FROM	forum_subscriptions
			WHERE	forum_subscriptions.fs_forum_id = <cfqueryparam value="#val(arguments.fs_forum_id)#" CFSQLType="CF_SQL_INTEGER">
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
$Log: forum_subscriptions_Gateway.cfc,v $
Revision 1.2  2007/06/14 14:01:11  kevin
Initial Open Source Version

Revision 1.7  2005/06/03 17:38:04  mike
enforce var scope

Revision 1.6  2005/05/26 15:23:38  mike
new method deleteSelectedBySubscriptions()

Revision 1.5  2005/05/24 10:32:54  mike
new method deleteSelectedByForum()

Revision 1.4  2005/05/21 10:45:06  mike
new function deleteSelectedBySubscriptions()

Revision 1.3  2005/05/20 10:39:17  mike
correct the paths (they were wrong when generated by fusebuilder)

Revision 1.2  2005/05/19 15:11:44  mike
code generated by fusebuilder

Revision 1.1  2005/05/19 15:08:11  mike
new file
 --->
