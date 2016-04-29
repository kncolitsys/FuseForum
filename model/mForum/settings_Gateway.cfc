<!--- $RCSfile: settings_Gateway.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:14 $ --->
<cfcomponent displayname="Settings Gateway" hint="I am a data gateway to settings objects">
	<cffunction name="init" access="public" returntype="settings_gateway" output="false"
		displayname="Settings Gateway Constructor" hint="I initialize the settings gateway.">
		<cfargument name="dsn" type="string" required="yes"
			displayname="Data Source Name" hint="I am the data source to use for persistence." />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>

	<cffunction name="findAll" access="public" returntype="query" output="false"
		displayname="Find All" hint="I return a query containing all settings objects.">
		<cfargument name="orderby" type="string" required="No" default="" />
		<cfset var qSettings = 0 />
		<cfquery name="qSettings" datasource="#variables.DSN#" >
			SELECT	settings.settingid,
					settings.dateinstalled,
					settings.adminemail,
					settings.forumsname,
					settings.forumspath,
					settings.forumsurl,
					settings.emailmessage,
					settings.moderatoremail,
					settings.companyurl,
					settings.censorship,
					settings.querycaching,
					settings.cachingduration,
					settings.archive,
					settings.archivetimespan,
					settings.backgroundcolor1,
					settings.backgroundimage1,
					settings.textcolor1,
					settings.hyperlinkcolor1,
					settings.backgroundcolor2,
					settings.backgroundimage2,
					settings.textcolor2,
					settings.hyperlinkcolor2,
					settings.attachmentpath,
					settings.attachmentname,
					settings.attachmentmaxsize,
					settings.topiclistnumber,
					settings.messagelistnumber,
					settings.messageorder,
					settings.threadorder,
					settings.smtpserver,
					settings.privatemessages,
					settings.mailfooter,
					settings.logourl,
					settings.archivetimeofday
			FROM	settings
			<cfif isdefined("arguments.orderby") AND arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			<cfelse>
				ORDER BY settingid ASC
			</cfif>
		</cfquery>
		<cfreturn qSettings />
	</cffunction>

	<cffunction name="findAllEmailmessage" access="public" returntype="query" output="false"
		displayname="Find All emailmessage" hint="I return a query containing the emailmessage field of all settings objects.">
		<cfset var qEmailmessage = 0 />
		<cfquery name="qEmailmessage" datasource="#variables.DSN#" cachedwithin="#request.longtimespan#" >
			SELECT	settings.emailmessage
			FROM	settings
		</cfquery>
		<cfreturn qEmailmessage />
	</cffunction>

	<cffunction name="findAllDateinstalled" access="public" returntype="query" output="false"
		displayname="Find All dateinstalled" hint="I return a query containing the dateinstalled field of all settings objects.">
		<cfset var qDateinstalled = 0 />
		<cfquery name="qDateinstalled" datasource="#variables.DSN#" cachedwithin="#request.longtimespan#" >
			SELECT	settings.dateinstalled
			FROM	settings
		</cfquery>
		<cfreturn qDateinstalled />
	</cffunction>

	<cffunction name="findSelected" access="public" returntype="query" output="false"
		displayname="Find Selected" hint="I return a query containing settings objects, selected based on parameters passed.">
		<cfargument name="settingid" type="numeric" required="No" />
		<cfargument name="dateinstalled_min" type="date" required="No" />
		<cfargument name="dateinstalled_max" type="date" required="No" />
		<cfargument name="adminemail" type="string" required="No" />
		<cfargument name="forumsname" type="string" required="No" />
		<cfargument name="forumspath" type="string" required="No" />
		<cfargument name="forumsurl" type="string" required="No" />
		<cfargument name="emailmessage" type="string" required="No" />
		<cfargument name="moderatoremail" type="string" required="No" />
		<cfargument name="companyurl" type="string" required="No" />
		<cfargument name="censorship" type="any" required="No" />
		<cfargument name="querycaching" type="any" required="No" />
		<cfargument name="cachingduration" type="numeric" required="No" />
		<cfargument name="archive" type="any" required="No" />
		<cfargument name="archivetimespan" type="numeric" required="No" />
		<cfargument name="backgroundcolor1" type="string" required="No" />
		<cfargument name="backgroundimage1" type="string" required="No" />
		<cfargument name="textcolor1" type="string" required="No" />
		<cfargument name="hyperlinkcolor1" type="string" required="No" />
		<cfargument name="backgroundcolor2" type="string" required="No" />
		<cfargument name="backgroundimage2" type="string" required="No" />
		<cfargument name="textcolor2" type="string" required="No" />
		<cfargument name="hyperlinkcolor2" type="string" required="No" />
		<cfargument name="attachmentpath" type="string" required="No" />
		<cfargument name="attachmentname" type="string" required="No" />
		<cfargument name="attachmentmaxsize" type="numeric" required="No" />
		<cfargument name="topiclistnumber" type="numeric" required="No" />
		<cfargument name="messagelistnumber" type="numeric" required="No" />
		<cfargument name="messageorder" type="string" required="No" />
		<cfargument name="threadorder" type="string" required="No" />
		<cfargument name="smtpserver" type="string" required="No" />
		<cfargument name="privatemessages" type="any" required="No" />
		<cfargument name="mailfooter" type="string" required="No" />
		<cfargument name="logourl" type="string" required="No" />
		<cfargument name="archivetimeofday_min" type="date" required="No" />
		<cfargument name="archivetimeofday_max" type="date" required="No" />
		<cfargument name="orderby" type="string" required="No" default="" />
		<cfset var qSettings = 0 />
		<cfquery name="qSettings" datasource="#variables.DSN#" >
			SELECT	settings.settingid,
					settings.dateinstalled,
					settings.adminemail,
					settings.forumsname,
					settings.forumspath,
					settings.forumsurl,
					settings.emailmessage,
					settings.moderatoremail,
					settings.companyurl,
					settings.censorship,
					settings.querycaching,
					settings.cachingduration,
					settings.archive,
					settings.archivetimespan,
					settings.backgroundcolor1,
					settings.backgroundimage1,
					settings.textcolor1,
					settings.hyperlinkcolor1,
					settings.backgroundcolor2,
					settings.backgroundimage2,
					settings.textcolor2,
					settings.hyperlinkcolor2,
					settings.attachmentpath,
					settings.attachmentname,
					settings.attachmentmaxsize,
					settings.topiclistnumber,
					settings.messagelistnumber,
					settings.messageorder,
					settings.threadorder,
					settings.smtpserver,
					settings.privatemessages,
					settings.mailfooter,
					settings.logourl,
					settings.archivetimeofday
			FROM	settings
			<cfif isdefined("arguments.messagelistnumber") AND arguments.messagelistnumber IS NOT "">
				WHERE settings.messagelistnumber = <cfqueryparam value="#val(arguments.messagelistnumber)#" CFSQLType="CF_SQL_INTEGER">
			<cfelse>
				WHERE 0 = 0
			</cfif>
				<cfif isDefined("arguments.settingid") AND arguments.settingid IS NOT "">
					AND settings.settingid = <cfqueryparam value="#val(arguments.settingid)#" CFSQLType="CF_SQL_INTEGER">
				</cfif>
				<cfif isDefined("arguments.dateinstalled_min") AND arguments.dateinstalled_min IS NOT "">
					AND settings.dateinstalled >= #createodbcdatetime(arguments.dateinstalled_min)#
				</cfif>
				<cfif isDefined("arguments.dateinstalled_max") AND arguments.dateinstalled_max IS NOT "">
					AND settings.dateinstalled <= #createodbcdatetime(arguments.dateinstalled_max)#
				</cfif>
				<cfif isDefined("arguments.adminemail") AND arguments.adminemail IS NOT "">
					AND settings.adminemail = <cfqueryparam value="#arguments.adminemail#" CFSQLType="CF_SQL_CHAR" maxLength="150">
				</cfif>
				<cfif isDefined("arguments.forumsname") AND arguments.forumsname IS NOT "">
					AND settings.forumsname = <cfqueryparam value="#arguments.forumsname#" CFSQLType="CF_SQL_CHAR" maxLength="50">
				</cfif>
				<cfif isDefined("arguments.forumspath") AND arguments.forumspath IS NOT "">
					AND settings.forumspath = <cfqueryparam value="#arguments.forumspath#" CFSQLType="CF_SQL_CHAR" maxLength="150">
				</cfif>
				<cfif isDefined("arguments.forumsurl") AND arguments.forumsurl IS NOT "">
					AND settings.forumsurl = <cfqueryparam value="#arguments.forumsurl#" CFSQLType="CF_SQL_CHAR" maxLength="150">
				</cfif>
				<cfif isDefined("arguments.emailmessage") AND arguments.emailmessage IS NOT "">
					AND settings.emailmessage = <cfqueryparam value="#arguments.emailmessage#" CFSQLType="CF_SQL_CHAR" maxLength="64000">
				</cfif>
				<cfif isDefined("arguments.moderatoremail") AND arguments.moderatoremail IS NOT "">
					AND settings.moderatoremail = <cfqueryparam value="#arguments.moderatoremail#" CFSQLType="CF_SQL_CHAR" maxLength="150">
				</cfif>
				<cfif isDefined("arguments.companyurl") AND arguments.companyurl IS NOT "">
					AND settings.companyurl = <cfqueryparam value="#arguments.companyurl#" CFSQLType="CF_SQL_CHAR" maxLength="150">
				</cfif>
				<cfif isDefined("arguments.censorship") AND arguments.censorship IS NOT "">
					AND settings.censorship = <cfqueryparam value="#val(arguments.censorship)#" CFSQLType="CF_SQL_BOOLEAN">
				</cfif>
				<cfif isDefined("arguments.querycaching") AND arguments.querycaching IS NOT "">
					AND settings.querycaching = <cfqueryparam value="#val(arguments.querycaching)#" CFSQLType="CF_SQL_BOOLEAN">
				</cfif>
				<cfif isDefined("arguments.cachingduration") AND arguments.cachingduration IS NOT "">
					AND settings.cachingduration = <cfqueryparam value="#val(arguments.cachingduration)#" CFSQLType="CF_SQL_INTEGER">
				</cfif>
				<cfif isDefined("arguments.archive") AND arguments.archive IS NOT "">
					AND settings.archive = <cfqueryparam value="#val(arguments.archive)#" CFSQLType="CF_SQL_BOOLEAN">
				</cfif>
				<cfif isDefined("arguments.archivetimespan") AND arguments.archivetimespan IS NOT "">
					AND settings.archivetimespan = <cfqueryparam value="#val(arguments.archivetimespan)#" CFSQLType="CF_SQL_INTEGER">
				</cfif>
				<cfif isDefined("arguments.backgroundcolor1") AND arguments.backgroundcolor1 IS NOT "">
					AND settings.backgroundcolor1 = <cfqueryparam value="#arguments.backgroundcolor1#" CFSQLType="CF_SQL_CHAR" maxLength="6">
				</cfif>
				<cfif isDefined("arguments.backgroundimage1") AND arguments.backgroundimage1 IS NOT "">
					AND settings.backgroundimage1 = <cfqueryparam value="#arguments.backgroundimage1#" CFSQLType="CF_SQL_CHAR" maxLength="50">
				</cfif>
				<cfif isDefined("arguments.textcolor1") AND arguments.textcolor1 IS NOT "">
					AND settings.textcolor1 = <cfqueryparam value="#arguments.textcolor1#" CFSQLType="CF_SQL_CHAR" maxLength="6">
				</cfif>
				<cfif isDefined("arguments.hyperlinkcolor1") AND arguments.hyperlinkcolor1 IS NOT "">
					AND settings.hyperlinkcolor1 = <cfqueryparam value="#arguments.hyperlinkcolor1#" CFSQLType="CF_SQL_CHAR" maxLength="6">
				</cfif>
				<cfif isDefined("arguments.backgroundcolor2") AND arguments.backgroundcolor2 IS NOT "">
					AND settings.backgroundcolor2 = <cfqueryparam value="#arguments.backgroundcolor2#" CFSQLType="CF_SQL_CHAR" maxLength="6">
				</cfif>
				<cfif isDefined("arguments.backgroundimage2") AND arguments.backgroundimage2 IS NOT "">
					AND settings.backgroundimage2 = <cfqueryparam value="#arguments.backgroundimage2#" CFSQLType="CF_SQL_CHAR" maxLength="50">
				</cfif>
				<cfif isDefined("arguments.textcolor2") AND arguments.textcolor2 IS NOT "">
					AND settings.textcolor2 = <cfqueryparam value="#arguments.textcolor2#" CFSQLType="CF_SQL_CHAR" maxLength="6">
				</cfif>
				<cfif isDefined("arguments.hyperlinkcolor2") AND arguments.hyperlinkcolor2 IS NOT "">
					AND settings.hyperlinkcolor2 = <cfqueryparam value="#arguments.hyperlinkcolor2#" CFSQLType="CF_SQL_CHAR" maxLength="6">
				</cfif>
				<cfif isDefined("arguments.attachmentpath") AND arguments.attachmentpath IS NOT "">
					AND settings.attachmentpath = <cfqueryparam value="#arguments.attachmentpath#" CFSQLType="CF_SQL_CHAR" maxLength="50">
				</cfif>
				<cfif isDefined("arguments.attachmentname") AND arguments.attachmentname IS NOT "">
					AND settings.attachmentname = <cfqueryparam value="#arguments.attachmentname#" CFSQLType="CF_SQL_CHAR" maxLength="50">
				</cfif>
				<cfif isDefined("arguments.attachmentmaxsize") AND arguments.attachmentmaxsize IS NOT "">
					AND settings.attachmentmaxsize = <cfqueryparam value="#val(arguments.attachmentmaxsize)#" CFSQLType="CF_SQL_INTEGER">
				</cfif>
				<cfif isDefined("arguments.topiclistnumber") AND arguments.topiclistnumber IS NOT "">
					AND settings.topiclistnumber = <cfqueryparam value="#val(arguments.topiclistnumber)#" CFSQLType="CF_SQL_INTEGER">
				</cfif>
				<cfif isDefined("arguments.messageorder") AND arguments.messageorder IS NOT "">
					AND settings.messageorder = <cfqueryparam value="#arguments.messageorder#" CFSQLType="CF_SQL_CHAR" maxLength="4">
				</cfif>
				<cfif isDefined("arguments.threadorder") AND arguments.threadorder IS NOT "">
					AND settings.threadorder = <cfqueryparam value="#arguments.threadorder#" CFSQLType="CF_SQL_CHAR" maxLength="4">
				</cfif>
				<cfif isDefined("arguments.smtpserver") AND arguments.smtpserver IS NOT "">
					AND settings.smtpserver = <cfqueryparam value="#arguments.smtpserver#" CFSQLType="CF_SQL_CHAR" maxLength="50">
				</cfif>
				<cfif isDefined("arguments.privatemessages") AND arguments.privatemessages IS NOT "">
					AND settings.privatemessages = <cfqueryparam value="#val(arguments.privatemessages)#" CFSQLType="CF_SQL_BOOLEAN">
				</cfif>
				<cfif isDefined("arguments.mailfooter") AND arguments.mailfooter IS NOT "">
					AND settings.mailfooter = <cfqueryparam value="#arguments.mailfooter#" CFSQLType="CF_SQL_CHAR" maxLength="50">
				</cfif>
				<cfif isDefined("arguments.logourl") AND arguments.logourl IS NOT "">
					AND settings.logourl = <cfqueryparam value="#arguments.logourl#" CFSQLType="CF_SQL_CHAR" maxLength="150">
				</cfif>
				<cfif isDefined("arguments.archivetimeofday_min") AND arguments.archivetimeofday_min IS NOT "">
					AND settings.archivetimeofday >= #createodbcdatetime(arguments.archivetimeofday_min)#
				</cfif>
				<cfif isDefined("arguments.archivetimeofday_max") AND arguments.archivetimeofday_max IS NOT "">
					AND settings.archivetimeofday <= #createodbcdatetime(arguments.archivetimeofday_max)#
				</cfif>
			<cfif isdefined("arguments.orderby") AND arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			<cfelse>
				ORDER BY messagelistnumber ASC
			</cfif>
		</cfquery>
		<cfreturn qSettings />
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
$Log: settings_Gateway.cfc,v $
Revision 1.2  2007/06/14 14:01:14  kevin
Initial Open Source Version

Revision 1.8  2005/06/03 17:38:05  mike
enforce var scope

Revision 1.7  2005/05/11 10:41:15  kevin
Rename from MVC conversion

Revision 1.6  2005/05/06 15:20:02  mike
add cachedwithin, etc.

Revision 1.5  2005/04/15 17:19:29  mike
added <cfargument name="orderby" to findAll()

Revision 1.4  2005/04/11 10:59:25  mike
new methods findAllEmailmessage() etc.

Revision 1.3  2005/04/06 17:55:35  mike
messagelistnumber was incorrectly set as primary key; change to settingid

Revision 1.2  2005/03/31 14:07:04  kevin
Add CVS Info

Revision 1.1  2005/03/29 09:59:54  mike
Fusebuilder Generated Code

 --->
