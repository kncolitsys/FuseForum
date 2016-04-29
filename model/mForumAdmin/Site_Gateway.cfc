<!--- $RCSfile: Site_Gateway.cfc,v $ --->
<cfcomponent displayname="Site Gateway" hint="I am a data gateway to Site objects">
	<cffunction name="init" access="public" returntype="Site_gateway" output="false"
		displayname="Site Gateway Constructor" hint="I initialize the Site gateway.">
		<cfargument name="dsn" type="string" required="yes"
			displayname="Data Source Name" hint="I am the data source to use for persistence." />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>

	<cffunction name="findAll" access="public" returntype="query" output="false"
		displayname="Find All" hint="I return a query containing all Site objects.">
		<cfargument name="orderby" type="string" default="" />
		<cfset var qSite = 0 />
		<cfquery name="qSite" datasource="#variables.DSN#" >
			SELECT	Site.SiteId,
					Site.SiteName,
					Site.SiteURL,
					Site.RootDirectory,
					Site.ImagePath,
					Site.AttachmentPath,
					Site.StyleSheetPath,
					Site.DownloadPath,
					Site.CFAppName
			FROM	Site 
			<cfif isdefined("arguments.orderby") AND arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			<cfelse>
				ORDER BY Site.SiteId ASC
			</cfif>
		</cfquery>

		<cfreturn qSite />
	</cffunction>

	<cffunction name="findSelected" access="public" returntype="query" output="false"
		displayname="Find Selected" hint="I return a query containing Site objects, selected based on parameters passed.">
		<cfargument name="SiteId" type="numeric" required="No" />
		<cfargument name="SiteName" type="string" required="No" />
		<cfargument name="SiteURL" type="string" required="No" />
		<cfargument name="RootDirectory" type="string" required="No" />
		<cfargument name="ImagePath" type="string" required="No" />
		<cfargument name="AttachmentPath" type="string" required="No" />
		<cfargument name="StyleSheetPath" type="string" required="No" />
		<cfargument name="DownloadPath" type="string" required="No" />
		<cfargument name="CFAppName" type="string" required="No" />
		<cfargument name="orderby" type="string" default="" />
		<cfset var qSite = 0 />
		<cfquery name="qSite" datasource="#variables.DSN#" >
			SELECT	Site.SiteId,
					Site.SiteName,
					Site.SiteURL,
					Site.RootDirectory,
					Site.ImagePath,
					Site.AttachmentPath,
					Site.StyleSheetPath,
					Site.DownloadPath,
					Site.CFAppName
					
			FROM	Site
			<cfif isdefined("arguments.SiteId") AND arguments.SiteId IS NOT "">
				WHERE Site.SiteId = <cfqueryparam value="#val(arguments.SiteId)#" CFSQLType="CF_SQL_INTEGER">
			<cfelse>
				WHERE 0 = 0
			</cfif>
				<cfif isDefined("arguments.SiteName") AND arguments.SiteName IS NOT "">
					AND Site.SiteName = <cfqueryparam value="#arguments.SiteName#" CFSQLType="CF_SQL_CHAR" maxLength="50">
				</cfif>
				<cfif isDefined("arguments.SiteURL") AND arguments.SiteURL IS NOT "">
					AND Site.SiteURL = <cfqueryparam value="#arguments.SiteURL#" CFSQLType="CF_SQL_CHAR" maxLength="255">
				</cfif>
				<cfif isDefined("arguments.RootDirectory") AND arguments.RootDirectory IS NOT "">
					AND Site.RootDirectory = <cfqueryparam value="#arguments.RootDirectory#" CFSQLType="CF_SQL_CHAR" maxLength="255">
				</cfif>
				<cfif isDefined("arguments.ImagePath") AND arguments.ImagePath IS NOT "">
					AND Site.ImagePath = <cfqueryparam value="#arguments.ImagePath#" CFSQLType="CF_SQL_CHAR" maxLength="255">
				</cfif>
				<cfif isDefined("arguments.AttachmentPath") AND arguments.AttachmentPath IS NOT "">
					AND Site.AttachmentPath = <cfqueryparam value="#arguments.AttachmentPath#" CFSQLType="CF_SQL_CHAR" maxLength="255">
				</cfif>
				<cfif isDefined("arguments.StyleSheetPath") AND arguments.StyleSheetPath IS NOT "">
					AND Site.StyleSheetPath = <cfqueryparam value="#arguments.StyleSheetPath#" CFSQLType="CF_SQL_CHAR" maxLength="255">
				</cfif>
				<cfif isDefined("arguments.DownloadPath") AND arguments.DownloadPath IS NOT "">
					AND Site.DownloadPath = <cfqueryparam value="#arguments.DownloadPath#" CFSQLType="CF_SQL_CHAR" maxLength="255">
				</cfif>
				<cfif isDefined("arguments.CFAppName") AND arguments.CFAppName IS NOT "">
					AND Site.CFAppName = <cfqueryparam value="#arguments.CFAppName#" CFSQLType="CF_SQL_CHAR" maxLength="50">
				</cfif>
				
			<cfif isdefined("arguments.orderby") AND arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			<cfelse>
				ORDER BY Site.SiteId ASC
			</cfif>
		</cfquery>

		<cfreturn qSite />
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
$Log: Site_Gateway.cfc,v $
Revision 1.1  2007/06/15 13:59:05  kevin
Add Admin Modules

Revision 1.15  2006/05/10 17:49:59  mike
edits made to handle the 9 new fields in Site

Revision 1.14  2005/07/01 11:23:36  kevin
Add DownloadPath

Revision 1.13  2005/06/21 10:25:27  mike
Fix SQL Bug in Order By

Revision 1.12  2005/06/21 07:08:24  kevin
Style sheet for editor saved in site table

Revision 1.11  2005/06/16 11:04:29  kevin
New field for site AppName

Revision 1.10  2005/06/09 12:26:39  kevin
Fix SQL Bug in Order By

Revision 1.9  2005/06/08 13:58:53  kevin
Rebuild with new fields by Fusebuilder

 --->
