<!--- $RCSfile: settings_DAO.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:14 $ --->
<cfcomponent displayname="settings Data Access Object"
	hint="I provide persistence for a single settings for the application">

	<cffunction name="init" access="public" returntype="settings_dao" output="false"
		displayname="Settings Data Access Object Constructor" hint="I initialize the Data Access Object for settings objects.">
		<cfargument name="dsn" type="string" required="yes"
			displayname="Data Source Name" hint="I am the data source to use for persistence." />
		<cfset variables.dsn = arguments.dsn />
		<cfreturn this />
	</cffunction>

	<cffunction name="create" access="public" returntype="void" output="false"
		displayname="CRUD: Create" hint="I create a new database record for the specified settings.">
		<cfargument name="settings" type="settings" required="yes"
			displayname="Settings" hint="I am the settings for which to create a new record." />
		<cfset var qInsertSettings = 0 />
		<!--- Get a memento of the object --->
		<cfset var memento = arguments.settings.getInstanceMemento() />
		<!--- Add it to the database --->
		<cfquery name="qInsertSettings" datasource="#variables.DSN#" >
			INSERT INTO settings 
				  ( settings.settingid,
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
					settings.archivetimeofday)
			VALUES (
			<cfqueryparam value="#val(memento.settingid)#" CFSQLType="CF_SQL_INTEGER">,
					#createodbcdatetime(memento.dateinstalled)#,
			<cfqueryparam value="#trim(memento.adminemail)#" CFSQLType="CF_SQL_CHAR" maxLength="150">,
			<cfqueryparam value="#trim(memento.forumsname)#" CFSQLType="CF_SQL_CHAR" maxLength="50">,
			<cfqueryparam value="#trim(memento.forumspath)#" CFSQLType="CF_SQL_CHAR" maxLength="150">,
			<cfqueryparam value="#trim(memento.forumsurl)#" CFSQLType="CF_SQL_CHAR" maxLength="150">,
			<cfqueryparam value="#trim(memento.emailmessage)#" CFSQLType="CF_SQL_CHAR" maxLength="64000">,
			<cfqueryparam value="#trim(memento.moderatoremail)#" CFSQLType="CF_SQL_CHAR" maxLength="150">,
			<cfqueryparam value="#trim(memento.companyurl)#" CFSQLType="CF_SQL_CHAR" maxLength="150">,
			<cfqueryparam value="#val(memento.censorship)#" CFSQLType="CF_SQL_BOOLEAN">,
			<cfqueryparam value="#val(memento.querycaching)#" CFSQLType="CF_SQL_BOOLEAN">,
			<cfqueryparam value="#val(memento.cachingduration)#" CFSQLType="CF_SQL_INTEGER">,
			<cfqueryparam value="#val(memento.archive)#" CFSQLType="CF_SQL_BOOLEAN">,
			<cfqueryparam value="#val(memento.archivetimespan)#" CFSQLType="CF_SQL_INTEGER">,
			<cfqueryparam value="#trim(memento.backgroundcolor1)#" CFSQLType="CF_SQL_CHAR" maxLength="6">,
			<cfqueryparam value="#trim(memento.backgroundimage1)#" CFSQLType="CF_SQL_CHAR" maxLength="50">,
			<cfqueryparam value="#trim(memento.textcolor1)#" CFSQLType="CF_SQL_CHAR" maxLength="6">,
			<cfqueryparam value="#trim(memento.hyperlinkcolor1)#" CFSQLType="CF_SQL_CHAR" maxLength="6">,
			<cfqueryparam value="#trim(memento.backgroundcolor2)#" CFSQLType="CF_SQL_CHAR" maxLength="6">,
			<cfqueryparam value="#trim(memento.backgroundimage2)#" CFSQLType="CF_SQL_CHAR" maxLength="50">,
			<cfqueryparam value="#trim(memento.textcolor2)#" CFSQLType="CF_SQL_CHAR" maxLength="6">,
			<cfqueryparam value="#trim(memento.hyperlinkcolor2)#" CFSQLType="CF_SQL_CHAR" maxLength="6">,
			<cfqueryparam value="#trim(memento.attachmentpath)#" CFSQLType="CF_SQL_CHAR" maxLength="50">,
			<cfqueryparam value="#trim(memento.attachmentname)#" CFSQLType="CF_SQL_CHAR" maxLength="50">,
			<cfqueryparam value="#val(memento.attachmentmaxsize)#" CFSQLType="CF_SQL_INTEGER">,
			<cfqueryparam value="#val(memento.topiclistnumber)#" CFSQLType="CF_SQL_INTEGER">,
			<cfqueryparam value="#val(memento.messagelistnumber)#" CFSQLType="CF_SQL_INTEGER">,
			<cfqueryparam value="#trim(memento.messageorder)#" CFSQLType="CF_SQL_CHAR" maxLength="4">,
			<cfqueryparam value="#trim(memento.threadorder)#" CFSQLType="CF_SQL_CHAR" maxLength="4">,
			<cfqueryparam value="#trim(memento.smtpserver)#" CFSQLType="CF_SQL_CHAR" maxLength="50">,
			<cfqueryparam value="#val(memento.privatemessages)#" CFSQLType="CF_SQL_BOOLEAN">,
			<cfqueryparam value="#trim(memento.mailfooter)#" CFSQLType="CF_SQL_CHAR" maxLength="50">,
			<cfqueryparam value="#trim(memento.logourl)#" CFSQLType="CF_SQL_CHAR" maxLength="150">,
					#createodbcdatetime(memento.archivetimeofday)#)
		</cfquery>
	</cffunction>

	<cffunction name="read" access="public" returntype="void" output="false"
		displayname="CRUD: Read" hint="I read the specified database record into a settings object.<br />Throws: SETTINGS.MISSING if the specified settings cannot be found.">
		<cfargument name="settings" type="settings" required="yes"
			displayname="Settings" hint="I am the settings into which data is read." />
		<!--- Primary Key --->
		<cfargument name="settingid" type="numeric" required="yes"
			displayname="Settings ID" hint="I am the ID of the Settings database record to read." />
		<cfset var qSettings = 0 />
		<cfset var memento = structNew() />
		<!--- Get the record from the database --->
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
			WHERE	settings.settingid = <cfqueryparam value="#val(arguments.settingid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>

		<cfif qSettings.recordCount eq 1>
		<!--- Create a memento --->
			<cfset memento.settingid = qSettings.settingid />
			<cfset memento.dateinstalled = qSettings.dateinstalled />
			<cfset memento.adminemail = qSettings.adminemail />
			<cfset memento.forumsname = qSettings.forumsname />
			<cfset memento.forumspath = qSettings.forumspath />
			<cfset memento.forumsurl = qSettings.forumsurl />
			<cfset memento.emailmessage = qSettings.emailmessage />
			<cfset memento.moderatoremail = qSettings.moderatoremail />
			<cfset memento.companyurl = qSettings.companyurl />
			<cfset memento.censorship = qSettings.censorship />
			<cfset memento.querycaching = qSettings.querycaching />
			<cfset memento.cachingduration = qSettings.cachingduration />
			<cfset memento.archive = qSettings.archive />
			<cfset memento.archivetimespan = qSettings.archivetimespan />
			<cfset memento.backgroundcolor1 = qSettings.backgroundcolor1 />
			<cfset memento.backgroundimage1 = qSettings.backgroundimage1 />
			<cfset memento.textcolor1 = qSettings.textcolor1 />
			<cfset memento.hyperlinkcolor1 = qSettings.hyperlinkcolor1 />
			<cfset memento.backgroundcolor2 = qSettings.backgroundcolor2 />
			<cfset memento.backgroundimage2 = qSettings.backgroundimage2 />
			<cfset memento.textcolor2 = qSettings.textcolor2 />
			<cfset memento.hyperlinkcolor2 = qSettings.hyperlinkcolor2 />
			<cfset memento.attachmentpath = qSettings.attachmentpath />
			<cfset memento.attachmentname = qSettings.attachmentname />
			<cfset memento.attachmentmaxsize = qSettings.attachmentmaxsize />
			<cfset memento.topiclistnumber = qSettings.topiclistnumber />
			<cfset memento.messagelistnumber = qSettings.messagelistnumber />
			<cfset memento.messageorder = qSettings.messageorder />
			<cfset memento.threadorder = qSettings.threadorder />
			<cfset memento.smtpserver = qSettings.smtpserver />
			<cfset memento.privatemessages = qSettings.privatemessages />
			<cfset memento.mailfooter = qSettings.mailfooter />
			<cfset memento.logourl = qSettings.logourl />
			<cfset memento.archivetimeofday = qSettings.archivetimeofday />
			<cfset arguments.settings.setInstanceMemento(memento) />
		<cfelse>
			<cfthrow type="SETTINGS.MISSING" message="No such settings" detail="OID=#arguments.settingid#" />
		</cfif>
	</cffunction>

	<cffunction name="update" access="public" returntype="void" output="false"
		displayname="CRUD: Update" hint="I update the database from an settings.">
		<cfargument name="settings" type="settings" required="yes"
			displayname="Settings" hint="I am the settings whose record should be updated." />
		<cfset var qUpdateSettings = 0 />
		<cfset var memento = arguments.settings.getInstanceMemento() />
		<!--- Update the record in the database --->
		<cfquery name="qUpdateSettings" datasource="#variables.DSN#" >
			UPDATE settings
				SET
					<cfif memento.dateinstalled IS NOT "">dateinstalled = #createodbcdatetime(memento.dateinstalled)#,</cfif>
					adminemail = <cfqueryparam value="#memento.adminemail#" CFSQLType="CF_SQL_CHAR" maxLength="150">,
					forumsname = <cfqueryparam value="#memento.forumsname#" CFSQLType="CF_SQL_CHAR" maxLength="50">,
					forumspath = <cfqueryparam value="#memento.forumspath#" CFSQLType="CF_SQL_CHAR" maxLength="150">,
					forumsurl = <cfqueryparam value="#memento.forumsurl#" CFSQLType="CF_SQL_CHAR" maxLength="150">,
					emailmessage = <cfqueryparam value="#memento.emailmessage#" CFSQLType="CF_SQL_CHAR" maxLength="64000">,
					moderatoremail = <cfqueryparam value="#memento.moderatoremail#" CFSQLType="CF_SQL_CHAR" maxLength="150">,
					companyurl = <cfqueryparam value="#memento.companyurl#" CFSQLType="CF_SQL_CHAR" maxLength="150">,
					censorship = <cfqueryparam value="#val(memento.censorship)#" CFSQLType="CF_SQL_BOOLEAN">,
					querycaching = <cfqueryparam value="#val(memento.querycaching)#" CFSQLType="CF_SQL_BOOLEAN">,
					cachingduration = <cfqueryparam value="#val(memento.cachingduration)#" CFSQLType="CF_SQL_INTEGER">,
					archive = <cfqueryparam value="#val(memento.archive)#" CFSQLType="CF_SQL_BOOLEAN">,
					archivetimespan = <cfqueryparam value="#val(memento.archivetimespan)#" CFSQLType="CF_SQL_INTEGER">,
					backgroundcolor1 = <cfqueryparam value="#memento.backgroundcolor1#" CFSQLType="CF_SQL_CHAR" maxLength="6">,
					backgroundimage1 = <cfqueryparam value="#memento.backgroundimage1#" CFSQLType="CF_SQL_CHAR" maxLength="50">,
					textcolor1 = <cfqueryparam value="#memento.textcolor1#" CFSQLType="CF_SQL_CHAR" maxLength="6">,
					hyperlinkcolor1 = <cfqueryparam value="#memento.hyperlinkcolor1#" CFSQLType="CF_SQL_CHAR" maxLength="6">,
					backgroundcolor2 = <cfqueryparam value="#memento.backgroundcolor2#" CFSQLType="CF_SQL_CHAR" maxLength="6">,
					backgroundimage2 = <cfqueryparam value="#memento.backgroundimage2#" CFSQLType="CF_SQL_CHAR" maxLength="50">,
					textcolor2 = <cfqueryparam value="#memento.textcolor2#" CFSQLType="CF_SQL_CHAR" maxLength="6">,
					hyperlinkcolor2 = <cfqueryparam value="#memento.hyperlinkcolor2#" CFSQLType="CF_SQL_CHAR" maxLength="6">,
					attachmentpath = <cfqueryparam value="#memento.attachmentpath#" CFSQLType="CF_SQL_CHAR" maxLength="50">,
					attachmentname = <cfqueryparam value="#memento.attachmentname#" CFSQLType="CF_SQL_CHAR" maxLength="50">,
					attachmentmaxsize = <cfqueryparam value="#val(memento.attachmentmaxsize)#" CFSQLType="CF_SQL_INTEGER">,
					topiclistnumber = <cfqueryparam value="#val(memento.topiclistnumber)#" CFSQLType="CF_SQL_INTEGER">,
					messagelistnumber = <cfqueryparam value="#val(memento.messagelistnumber)#" CFSQLType="CF_SQL_INTEGER">,
					messageorder = <cfqueryparam value="#memento.messageorder#" CFSQLType="CF_SQL_CHAR" maxLength="4">,
					threadorder = <cfqueryparam value="#memento.threadorder#" CFSQLType="CF_SQL_CHAR" maxLength="4">,
					smtpserver = <cfqueryparam value="#memento.smtpserver#" CFSQLType="CF_SQL_CHAR" maxLength="50">,
					privatemessages = <cfqueryparam value="#val(memento.privatemessages)#" CFSQLType="CF_SQL_BOOLEAN">,
					mailfooter = <cfqueryparam value="#memento.mailfooter#" CFSQLType="CF_SQL_CHAR" maxLength="50">,
					logourl = <cfqueryparam value="#memento.logourl#" CFSQLType="CF_SQL_CHAR" maxLength="150"><cfif memento.archivetimeofday IS NOT "">,
					archivetimeofday = #createodbcdatetime(memento.archivetimeofday)#</cfif>
			WHERE settings.settingid = <cfqueryparam value="#val(memento.settingid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
	</cffunction>

	<cffunction name="delete" access="public" returntype="void" output="false"
		displayname="CRUD: Delete" hint="I delete an settings from the database.">
		<cfargument name="settings" type="settings" required="yes"
			displayname="settings" hint="I am the settings whose record should be deleted." />
		<cfset var qDeleteSettings = 0 />
		<cfset var memento = arguments.settings.getInstanceMemento() />
		<!--- Delete the record from the database --->
		<cfquery name="qDeleteSettings" datasource="#variables.DSN#" >
			DELETE FROM settings
			WHERE settings.settingid = <cfqueryparam value="#val(memento.settingid)#" CFSQLType="CF_SQL_INTEGER">
		</cfquery>
	</cffunction>

</cfcomponent>
<!--- 
$Log: settings_DAO.cfc,v $
Revision 1.2  2007/06/14 14:01:14  kevin
Initial Open Source Version

Revision 1.5  2005/06/03 17:38:05  mike
enforce var scope

Revision 1.4  2005/05/11 10:41:15  kevin
Rename from MVC conversion

Revision 1.3  2005/04/06 17:58:15  mike
messagelistnumber was incorrectly set as primary key; change to settingid; change some setXxxfunctions to access="public"

Revision 1.2  2005/03/31 14:07:04  kevin
Add CVS Info

Revision 1.1  2005/03/29 09:59:54  mike
Fusebuilder Generated Code

 --->
