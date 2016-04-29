<!--- $RCSfile: settings.cfc,v $ $Revision: 1.3 $ $Author: kevin $ $Date: 2007/06/15 14:00:08 $ --->
<cfcomponent displayname="settings" hint="I model a single settings object.">

	<cfset variables.instance=structNew()>
	<cfset variables.instance.settingid="0">
	<cfset variables.instance.dateinstalled="#now()#">
	<cfset variables.instance.adminemail="">
	<cfset variables.instance.forumsname="">
	<cfset variables.instance.forumspath="">
	<cfset variables.instance.forumsurl="">
	<cfset variables.instance.emailmessage="">
	<cfset variables.instance.moderatoremail="">
	<cfset variables.instance.companyurl="">
	<cfset variables.instance.censorship="">
	<cfset variables.instance.querycaching="">
	<cfset variables.instance.cachingduration="0">
	<cfset variables.instance.archive="">
	<cfset variables.instance.archivetimespan="0">
	<cfset variables.instance.backgroundcolor1="">
	<cfset variables.instance.backgroundimage1="">
	<cfset variables.instance.textcolor1="">
	<cfset variables.instance.hyperlinkcolor1="">
	<cfset variables.instance.backgroundcolor2="">
	<cfset variables.instance.backgroundimage2="">
	<cfset variables.instance.textcolor2="">
	<cfset variables.instance.hyperlinkcolor2="">
	<cfset variables.instance.attachmentpath="">
	<cfset variables.instance.attachmentname="">
	<cfset variables.instance.attachmentmaxsize="0">
	<cfset variables.instance.topiclistnumber="0">
	<cfset variables.instance.messagelistnumber="0">
	<cfset variables.instance.messageorder="">
	<cfset variables.instance.threadorder="">
	<cfset variables.instance.smtpserver="">
	<cfset variables.instance.privatemessages="">
	<cfset variables.instance.mailfooter="">
	<cfset variables.instance.logourl="">
	<cfset variables.instance.archivetimeofday="#now()#">

	<cffunction name="init" access="public" returntype="settings" output="false"
		displayname="settings Constructor" hint="I initialize a settings.">
		<cfargument name="settingid" type="numeric" default="0" />
		<cfargument name="dateinstalled" type="date" default="#now()#" />
		<cfargument name="adminemail" type="string" default="" />
		<cfargument name="forumsname" type="string" default="" />
		<cfargument name="forumspath" type="string" default="" />
		<cfargument name="forumsurl" type="string" default="" />
		<cfargument name="emailmessage" type="string" default="" />
		<cfargument name="moderatoremail" type="string" default="" />
		<cfargument name="companyurl" type="string" default="" />
		<cfargument name="censorship" type="string" default="" />
		<cfargument name="querycaching" type="string" default="" />
		<cfargument name="cachingduration" type="numeric" default="0" />
		<cfargument name="archive" type="string" default="" />
		<cfargument name="archivetimespan" type="numeric" default="0" />
		<cfargument name="backgroundcolor1" type="string" default="" />
		<cfargument name="backgroundimage1" type="string" default="" />
		<cfargument name="textcolor1" type="string" default="" />
		<cfargument name="hyperlinkcolor1" type="string" default="" />
		<cfargument name="backgroundcolor2" type="string" default="" />
		<cfargument name="backgroundimage2" type="string" default="" />
		<cfargument name="textcolor2" type="string" default="" />
		<cfargument name="hyperlinkcolor2" type="string" default="" />
		<cfargument name="attachmentpath" type="string" default="" />
		<cfargument name="attachmentname" type="string" default="" />
		<cfargument name="attachmentmaxsize" type="numeric" default="0" />
		<cfargument name="topiclistnumber" type="numeric" default="0" />
		<cfargument name="messagelistnumber" type="numeric" default="0" />
		<cfargument name="messageorder" type="string" default="" />
		<cfargument name="threadorder" type="string" default="" />
		<cfargument name="smtpserver" type="string" default="" />
		<cfargument name="privatemessages" type="string" default="" />
		<cfargument name="mailfooter" type="string" default="" />
		<cfargument name="logourl" type="string" default="" />
		<cfargument name="archivetimeofday" type="date" default="#now()#" />
		<cfset variables.instance = structNew() />
		<cfset variables.instance.settingid = arguments.settingid />
		<cfset variables.instance.dateinstalled = arguments.dateinstalled />
		<cfset variables.instance.adminemail = arguments.adminemail />
		<cfset variables.instance.forumsname = arguments.forumsname />
		<cfset variables.instance.forumspath = arguments.forumspath />
		<cfset variables.instance.forumsurl = arguments.forumsurl />
		<cfset variables.instance.emailmessage = arguments.emailmessage />
		<cfset variables.instance.moderatoremail = arguments.moderatoremail />
		<cfset variables.instance.companyurl = arguments.companyurl />
		<cfset variables.instance.censorship = arguments.censorship />
		<cfset variables.instance.querycaching = arguments.querycaching />
		<cfset variables.instance.cachingduration = arguments.cachingduration />
		<cfset variables.instance.archive = arguments.archive />
		<cfset variables.instance.archivetimespan = arguments.archivetimespan />
		<cfset variables.instance.backgroundcolor1 = arguments.backgroundcolor1 />
		<cfset variables.instance.backgroundimage1 = arguments.backgroundimage1 />
		<cfset variables.instance.textcolor1 = arguments.textcolor1 />
		<cfset variables.instance.hyperlinkcolor1 = arguments.hyperlinkcolor1 />
		<cfset variables.instance.backgroundcolor2 = arguments.backgroundcolor2 />
		<cfset variables.instance.backgroundimage2 = arguments.backgroundimage2 />
		<cfset variables.instance.textcolor2 = arguments.textcolor2 />
		<cfset variables.instance.hyperlinkcolor2 = arguments.hyperlinkcolor2 />
		<cfset variables.instance.attachmentpath = arguments.attachmentpath />
		<cfset variables.instance.attachmentname = arguments.attachmentname />
		<cfset variables.instance.attachmentmaxsize = arguments.attachmentmaxsize />
		<cfset variables.instance.topiclistnumber = arguments.topiclistnumber />
		<cfset variables.instance.messagelistnumber = arguments.messagelistnumber />
		<cfset variables.instance.messageorder = arguments.messageorder />
		<cfset variables.instance.threadorder = arguments.threadorder />
		<cfset variables.instance.smtpserver = arguments.smtpserver />
		<cfset variables.instance.privatemessages = arguments.privatemessages />
		<cfset variables.instance.mailfooter = arguments.mailfooter />
		<cfset variables.instance.logourl = arguments.logourl />
		<cfset variables.instance.archivetimeofday = arguments.archivetimeofday />
		<cfset variables.missingFields = "" />
		<cfset variables.missingFieldNames = "" />
		<cfset variables.invalidFields = "" />
		<cfset variables.invalidFieldNames = "" />
		<cfreturn this />
	</cffunction>

	<cffunction name="getSettingid" access="public" returntype="numeric" output="false" 
		displayname="GetSettingid" hint="I return the value of settingid.">
		<cfreturn variables.instance.settingid />
	</cffunction>
	<cffunction name="setSettingid" access="private" returntype="void" output="false" 
		displayname="SetSettingid" hint="I set the value of settingid.">
		<cfargument name="settingid" type="numeric" default="0" />
		<cfset variables.instance.settingid = arguments.settingid />
	</cffunction>

	<cffunction name="getDateinstalled" access="public" returntype="date" output="false" 
		displayname="GetDateinstalled" hint="I return the value of dateinstalled.">
		<cfreturn variables.instance.dateinstalled />
	</cffunction>
	<cffunction name="setDateinstalled" access="private" returntype="void" output="false" 
		displayname="SetDateinstalled" hint="I set the value of dateinstalled.">
		<cfargument name="dateinstalled" type="date" default="#now()#" />
		<cfset variables.instance.dateinstalled = arguments.dateinstalled />
	</cffunction>

	<cffunction name="getAdminemail" access="public" returntype="string" output="false" 
		displayname="GetAdminemail" hint="I return the value of adminemail.">
		<cfreturn variables.instance.adminemail />
	</cffunction>
	<cffunction name="setAdminemail" access="public" returntype="void" output="false" 
		displayname="SetAdminemail" hint="I set the value of adminemail.">
		<cfargument name="adminemail" type="string" default="" />
		<cfset variables.instance.adminemail = arguments.adminemail />
	</cffunction>

	<cffunction name="getForumsname" access="public" returntype="string" output="false" 
		displayname="GetForumsname" hint="I return the value of forumsname.">
		<cfreturn variables.instance.forumsname />
	</cffunction>
	<cffunction name="setForumsname" access="public" returntype="void" output="false" 
		displayname="SetForumsname" hint="I set the value of forumsname.">
		<cfargument name="forumsname" type="string" default="" />
		<cfset variables.instance.forumsname = arguments.forumsname />
	</cffunction>

	<cffunction name="getForumspath" access="public" returntype="string" output="false" 
		displayname="GetForumspath" hint="I return the value of forumspath.">
		<cfreturn variables.instance.forumspath />
	</cffunction>
	<cffunction name="setForumspath" access="private" returntype="void" output="false" 
		displayname="SetForumspath" hint="I set the value of forumspath.">
		<cfargument name="forumspath" type="string" default="" />
		<cfset variables.instance.forumspath = arguments.forumspath />
	</cffunction>

	<cffunction name="getForumsurl" access="public" returntype="string" output="false" 
		displayname="GetForumsurl" hint="I return the value of forumsurl.">
		<cfreturn variables.instance.forumsurl />
	</cffunction>
	<cffunction name="setForumsurl" access="public" returntype="void" output="false" 
		displayname="SetForumsurl" hint="I set the value of forumsurl.">
		<cfargument name="forumsurl" type="string" default="" />
		<cfset variables.instance.forumsurl = arguments.forumsurl />
	</cffunction>

	<cffunction name="getEmailmessage" access="public" returntype="string" output="false" 
		displayname="GetEmailmessage" hint="I return the value of emailmessage.">
		<cfreturn variables.instance.emailmessage />
	</cffunction>
	<cffunction name="setEmailmessage" access="private" returntype="void" output="false" 
		displayname="SetEmailmessage" hint="I set the value of emailmessage.">
		<cfargument name="emailmessage" type="string" default="" />
		<cfset variables.instance.emailmessage = arguments.emailmessage />
	</cffunction>

	<cffunction name="getModeratoremail" access="public" returntype="string" output="false" 
		displayname="GetModeratoremail" hint="I return the value of moderatoremail.">
		<cfreturn variables.instance.moderatoremail />
	</cffunction>
	<cffunction name="setModeratoremail" access="public" returntype="void" output="false" 
		displayname="SetModeratoremail" hint="I set the value of moderatoremail.">
		<cfargument name="moderatoremail" type="string" default="" />
		<cfset variables.instance.moderatoremail = arguments.moderatoremail />
	</cffunction>

	<cffunction name="getCompanyurl" access="public" returntype="string" output="false" 
		displayname="GetCompanyurl" hint="I return the value of companyurl.">
		<cfreturn variables.instance.companyurl />
	</cffunction>
	<cffunction name="setCompanyurl" access="private" returntype="void" output="false" 
		displayname="SetCompanyurl" hint="I set the value of companyurl.">
		<cfargument name="companyurl" type="string" default="" />
		<cfset variables.instance.companyurl = arguments.companyurl />
	</cffunction>

	<cffunction name="getCensorship" access="public" returntype="string" output="false" 
		displayname="GetCensorship" hint="I return the value of censorship.">
		<cfreturn variables.instance.censorship />
	</cffunction>
	<cffunction name="setCensorship" access="public" returntype="void" output="false" 
		displayname="SetCensorship" hint="I set the value of censorship.">
		<cfargument name="censorship" type="string" default="" />
		<cfset variables.instance.censorship = arguments.censorship />
	</cffunction>

	<cffunction name="getQuerycaching" access="public" returntype="string" output="false" 
		displayname="GetQuerycaching" hint="I return the value of querycaching.">
		<cfreturn variables.instance.querycaching />
	</cffunction>
	<!--- NB the following was set to access="private" which didn't let it be called from mForumAdmin --->
	<cffunction name="setQuerycaching" access="public" returntype="void" output="false" 
		displayname="SetQuerycaching" hint="I set the value of querycaching.">
		<cfargument name="querycaching" type="string" default="" />
		<cfset variables.instance.querycaching = arguments.querycaching />
	</cffunction>

	<cffunction name="getCachingduration" access="public" returntype="numeric" output="false" 
		displayname="GetCachingduration" hint="I return the value of cachingduration.">
		<cfreturn variables.instance.cachingduration />
	</cffunction>
	<!--- NB the following was set to access="private" which didn't let it be called from mForumAdmin --->
	<cffunction name="setCachingduration" access="public" returntype="void" output="false" 
		displayname="SetCachingduration" hint="I set the value of cachingduration.">
		<cfargument name="cachingduration" type="numeric" default="0" />
		<cfset variables.instance.cachingduration = arguments.cachingduration />
	</cffunction>

	<cffunction name="getArchive" access="public" returntype="string" output="false" 
		displayname="GetArchive" hint="I return the value of archive.">
		<cfreturn variables.instance.archive />
	</cffunction>
	<cffunction name="setArchive" access="public" returntype="void" output="false" 
		displayname="SetArchive" hint="I set the value of archive.">
		<cfargument name="archive" type="string" default="" />
		<cfset variables.instance.archive = arguments.archive />
	</cffunction>

	<cffunction name="getArchivetimespan" access="public" returntype="numeric" output="false" 
		displayname="GetArchivetimespan" hint="I return the value of archivetimespan.">
		<cfreturn variables.instance.archivetimespan />
	</cffunction>
	<cffunction name="setArchivetimespan" access="public" returntype="void" output="false" 
		displayname="SetArchivetimespan" hint="I set the value of archivetimespan.">
		<cfargument name="archivetimespan" type="numeric" default="0" />
		<cfset variables.instance.archivetimespan = arguments.archivetimespan />
	</cffunction>

	<cffunction name="getBackgroundcolor1" access="public" returntype="string" output="false" 
		displayname="GetBackgroundcolor1" hint="I return the value of backgroundcolor1.">
		<cfreturn variables.instance.backgroundcolor1 />
	</cffunction>
	<cffunction name="setBackgroundcolor1" access="private" returntype="void" output="false" 
		displayname="SetBackgroundcolor1" hint="I set the value of backgroundcolor1.">
		<cfargument name="backgroundcolor1" type="string" default="" />
		<cfset variables.instance.backgroundcolor1 = arguments.backgroundcolor1 />
	</cffunction>

	<cffunction name="getBackgroundimage1" access="public" returntype="string" output="false" 
		displayname="GetBackgroundimage1" hint="I return the value of backgroundimage1.">
		<cfreturn variables.instance.backgroundimage1 />
	</cffunction>
	<cffunction name="setBackgroundimage1" access="private" returntype="void" output="false" 
		displayname="SetBackgroundimage1" hint="I set the value of backgroundimage1.">
		<cfargument name="backgroundimage1" type="string" default="" />
		<cfset variables.instance.backgroundimage1 = arguments.backgroundimage1 />
	</cffunction>

	<cffunction name="getTextcolor1" access="public" returntype="string" output="false" 
		displayname="GetTextcolor1" hint="I return the value of textcolor1.">
		<cfreturn variables.instance.textcolor1 />
	</cffunction>
	<cffunction name="setTextcolor1" access="private" returntype="void" output="false" 
		displayname="SetTextcolor1" hint="I set the value of textcolor1.">
		<cfargument name="textcolor1" type="string" default="" />
		<cfset variables.instance.textcolor1 = arguments.textcolor1 />
	</cffunction>

	<cffunction name="getHyperlinkcolor1" access="public" returntype="string" output="false" 
		displayname="GetHyperlinkcolor1" hint="I return the value of hyperlinkcolor1.">
		<cfreturn variables.instance.hyperlinkcolor1 />
	</cffunction>
	<cffunction name="setHyperlinkcolor1" access="private" returntype="void" output="false" 
		displayname="SetHyperlinkcolor1" hint="I set the value of hyperlinkcolor1.">
		<cfargument name="hyperlinkcolor1" type="string" default="" />
		<cfset variables.instance.hyperlinkcolor1 = arguments.hyperlinkcolor1 />
	</cffunction>

	<cffunction name="getBackgroundcolor2" access="public" returntype="string" output="false" 
		displayname="GetBackgroundcolor2" hint="I return the value of backgroundcolor2.">
		<cfreturn variables.instance.backgroundcolor2 />
	</cffunction>
	<cffunction name="setBackgroundcolor2" access="private" returntype="void" output="false" 
		displayname="SetBackgroundcolor2" hint="I set the value of backgroundcolor2.">
		<cfargument name="backgroundcolor2" type="string" default="" />
		<cfset variables.instance.backgroundcolor2 = arguments.backgroundcolor2 />
	</cffunction>

	<cffunction name="getBackgroundimage2" access="public" returntype="string" output="false" 
		displayname="GetBackgroundimage2" hint="I return the value of backgroundimage2.">
		<cfreturn variables.instance.backgroundimage2 />
	</cffunction>
	<cffunction name="setBackgroundimage2" access="private" returntype="void" output="false" 
		displayname="SetBackgroundimage2" hint="I set the value of backgroundimage2.">
		<cfargument name="backgroundimage2" type="string" default="" />
		<cfset variables.instance.backgroundimage2 = arguments.backgroundimage2 />
	</cffunction>

	<cffunction name="getTextcolor2" access="public" returntype="string" output="false" 
		displayname="GetTextcolor2" hint="I return the value of textcolor2.">
		<cfreturn variables.instance.textcolor2 />
	</cffunction>
	<cffunction name="setTextcolor2" access="private" returntype="void" output="false" 
		displayname="SetTextcolor2" hint="I set the value of textcolor2.">
		<cfargument name="textcolor2" type="string" default="" />
		<cfset variables.instance.textcolor2 = arguments.textcolor2 />
	</cffunction>

	<cffunction name="getHyperlinkcolor2" access="public" returntype="string" output="false" 
		displayname="GetHyperlinkcolor2" hint="I return the value of hyperlinkcolor2.">
		<cfreturn variables.instance.hyperlinkcolor2 />
	</cffunction>
	<cffunction name="setHyperlinkcolor2" access="private" returntype="void" output="false" 
		displayname="SetHyperlinkcolor2" hint="I set the value of hyperlinkcolor2.">
		<cfargument name="hyperlinkcolor2" type="string" default="" />
		<cfset variables.instance.hyperlinkcolor2 = arguments.hyperlinkcolor2 />
	</cffunction>

	<cffunction name="getAttachmentpath" access="public" returntype="string" output="false" 
		displayname="GetAttachmentpath" hint="I return the value of attachmentpath.">
		<cfreturn variables.instance.attachmentpath />
	</cffunction>
	<cffunction name="setAttachmentpath" access="private" returntype="void" output="false" 
		displayname="SetAttachmentpath" hint="I set the value of attachmentpath.">
		<cfargument name="attachmentpath" type="string" default="" />
		<cfset variables.instance.attachmentpath = arguments.attachmentpath />
	</cffunction>

	<cffunction name="getAttachmentname" access="public" returntype="string" output="false" 
		displayname="GetAttachmentname" hint="I return the value of attachmentname.">
		<cfreturn variables.instance.attachmentname />
	</cffunction>
	<cffunction name="setAttachmentname" access="private" returntype="void" output="false" 
		displayname="SetAttachmentname" hint="I set the value of attachmentname.">
		<cfargument name="attachmentname" type="string" default="" />
		<cfset variables.instance.attachmentname = arguments.attachmentname />
	</cffunction>

	<cffunction name="getAttachmentmaxsize" access="public" returntype="numeric" output="false" 
		displayname="GetAttachmentmaxsize" hint="I return the value of attachmentmaxsize.">
		<cfreturn variables.instance.attachmentmaxsize />
	</cffunction>
	<cffunction name="setAttachmentmaxsize" access="private" returntype="void" output="false" 
		displayname="SetAttachmentmaxsize" hint="I set the value of attachmentmaxsize.">
		<cfargument name="attachmentmaxsize" type="numeric" default="0" />
		<cfset variables.instance.attachmentmaxsize = arguments.attachmentmaxsize />
	</cffunction>

	<cffunction name="getTopiclistnumber" access="public" returntype="numeric" output="false" 
		displayname="GetTopiclistnumber" hint="I return the value of topiclistnumber.">
		<cfreturn variables.instance.topiclistnumber />
	</cffunction>
	<cffunction name="setTopiclistnumber" access="private" returntype="void" output="false" 
		displayname="SetTopiclistnumber" hint="I set the value of topiclistnumber.">
		<cfargument name="topiclistnumber" type="numeric" default="0" />
		<cfset variables.instance.topiclistnumber = arguments.topiclistnumber />
	</cffunction>

	<cffunction name="getMessagelistnumber" access="public" returntype="numeric" output="false" 
		displayname="GetMessagelistnumber" hint="I return the value of messagelistnumber.">
		<cfreturn variables.instance.messagelistnumber />
	</cffunction>
	<cffunction name="setMessagelistnumber" access="private" returntype="void" output="false" 
		displayname="SetMessagelistnumber" hint="I set the value of messagelistnumber.">
		<cfargument name="messagelistnumber" type="numeric" default="0" />
		<cfset variables.instance.messagelistnumber = arguments.messagelistnumber />
	</cffunction>

	<cffunction name="getMessageorder" access="public" returntype="string" output="false" 
		displayname="GetMessageorder" hint="I return the value of messageorder.">
		<cfreturn variables.instance.messageorder />
	</cffunction>
	<cffunction name="setMessageorder" access="private" returntype="void" output="false" 
		displayname="SetMessageorder" hint="I set the value of messageorder.">
		<cfargument name="messageorder" type="string" default="" />
		<cfset variables.instance.messageorder = arguments.messageorder />
	</cffunction>

	<cffunction name="getThreadorder" access="public" returntype="string" output="false" 
		displayname="GetThreadorder" hint="I return the value of threadorder.">
		<cfreturn variables.instance.threadorder />
	</cffunction>
	<cffunction name="setThreadorder" access="private" returntype="void" output="false" 
		displayname="SetThreadorder" hint="I set the value of threadorder.">
		<cfargument name="threadorder" type="string" default="" />
		<cfset variables.instance.threadorder = arguments.threadorder />
	</cffunction>

	<cffunction name="getSmtpserver" access="public" returntype="string" output="false" 
		displayname="GetSmtpserver" hint="I return the value of smtpserver.">
		<cfreturn variables.instance.smtpserver />
	</cffunction>
	<cffunction name="setSmtpserver" access="public" returntype="void" output="false" 
		displayname="SetSmtpserver" hint="I set the value of smtpserver.">
		<cfargument name="smtpserver" type="string" default="" />
		<cfset variables.instance.smtpserver = arguments.smtpserver />
	</cffunction>

	<cffunction name="getPrivatemessages" access="public" returntype="string" output="false" 
		displayname="GetPrivatemessages" hint="I return the value of privatemessages.">
		<cfreturn variables.instance.privatemessages />
	</cffunction>
	<cffunction name="setPrivatemessages" access="public" returntype="void" output="false" 
		displayname="SetPrivatemessages" hint="I set the value of privatemessages.">
		<cfargument name="privatemessages" type="string" default="" />
		<cfset variables.instance.privatemessages = arguments.privatemessages />
	</cffunction>

	<cffunction name="getMailfooter" access="public" returntype="string" output="false" 
		displayname="GetMailfooter" hint="I return the value of mailfooter.">
		<cfreturn variables.instance.mailfooter />
	</cffunction>
	<cffunction name="setMailfooter" access="private" returntype="void" output="false" 
		displayname="SetMailfooter" hint="I set the value of mailfooter.">
		<cfargument name="mailfooter" type="string" default="" />
		<cfset variables.instance.mailfooter = arguments.mailfooter />
	</cffunction>

	<cffunction name="getLogourl" access="public" returntype="string" output="false" 
		displayname="GetLogourl" hint="I return the value of logourl.">
		<cfreturn variables.instance.logourl />
	</cffunction>
	<cffunction name="setLogourl" access="private" returntype="void" output="false" 
		displayname="SetLogourl" hint="I set the value of logourl.">
		<cfargument name="logourl" type="string" default="" />
		<cfset variables.instance.logourl = arguments.logourl />
	</cffunction>

	<cffunction name="getArchivetimeofday" access="public" returntype="date" output="false" 
		displayname="GetArchivetimeofday" hint="I return the value of archivetimeofday.">
		<cfreturn variables.instance.archivetimeofday />
	</cffunction>
	<cffunction name="setArchivetimeofday" access="public" returntype="void" output="false" 
		displayname="SetArchivetimeofday" hint="I set the value of archivetimeofday.">
		<cfargument name="archivetimeofday" type="date" default="#now()#" />
		<cfset variables.instance.archivetimeofday = arguments.archivetimeofday />
	</cffunction>

	<cffunction name="getInstanceMemento" access="public" returntype="struct" output="false"
		displayname="Get Instance Memento" hint="I return a memento of this settings's instance data.">
		<cfreturn variables.instance />
	</cffunction>

	<cffunction name="setInstanceMemento" access="public" returntype="settings" output="false"
		displayname="Set Instance Memento" hint="I set this settings's instance data from a new memento.">
		<cfargument name="memento" type="struct" required="yes"
			displayname="Memento" hint="I am a memento - a struct containing data." />
		<cfset variables.instance = arguments.memento />
		<cfreturn this />
	</cffunction>

	<cffunction name="validate" access="public" returntype="boolean" output="false"
		displayname="Validate settings" hint="I validate all the data fields in this settings object.">
		<cfset var valid = true />
		<cfset variables.missingFields = "" />
		<cfset variables.missingFieldNames = "" />
		<cfset variables.invalidFields = "" />
		<cfset variables.invalidFieldNames = "" />
		<cfinclude template="../../udfs/udf_checkdate.cfm" />

		<!--- Validation for settingid --->
		<!--- Required Numeric field so it must be defined and a number. --->
		<cfif (NOT isDefined("variables.instance.settingid"))>
			<cfset valid = false />
			<cfset variables.missingFields = listAppend(variables.missingFields,"settingid") />
			<cfset variables.missingFieldNames = listAppend(variables.missingFieldNames,"Settingid") />
		<cfelseif NOT isNumeric(variables.instance.settingid)>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"settingid") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Settingid") />
		</cfif>

		<!--- Validation for dateinstalled --->
		<!--- Required Date field so it must be defined and non blank and a date. --->
		<cfif (NOT isDefined("variables.instance.dateinstalled")) OR variables.instance.dateinstalled IS "">
			<cfset valid = false />
			<cfset variables.missingFields = listAppend(variables.missingFields,"dateinstalled") />
			<cfset variables.missingFieldNames = listAppend(variables.missingFieldNames,"Dateinstalled") />
		<cfelseif NOT LSisDate(variables.instance.dateinstalled)>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"dateinstalled") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Dateinstalled") />
		</cfif>

		<!--- Validation for adminemail --->
		<!--- Optional String Field, check that it does not exceed maximum length. --->
		<cfif isDefined("variables.instance.adminemail") AND Len(variables.instance.adminemail) GT 150>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"adminemail") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Adminemail") />
		</cfif>

		<!--- Validation for forumsname --->
		<!--- Required String field so it must be defined and non blank. --->
		<cfif (NOT isDefined("variables.instance.forumsname")) OR variables.instance.forumsname IS "">
			<cfset valid = false />
			<cfset variables.missingFields = listAppend(variables.missingFields,"forumsname") />
			<cfset variables.missingFieldNames = listAppend(variables.missingFieldNames,"Forumsname") />
		<cfelseif Len(variables.instance.forumsname) GT 50>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"forumsname") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Forumsname") />
		</cfif>

		<!--- Validation for forumspath --->
		<!--- Required String field so it must be defined and non blank. --->
		<cfif (NOT isDefined("variables.instance.forumspath")) OR variables.instance.forumspath IS "">
			<cfset valid = false />
			<cfset variables.missingFields = listAppend(variables.missingFields,"forumspath") />
			<cfset variables.missingFieldNames = listAppend(variables.missingFieldNames,"Forumspath") />
		<cfelseif Len(variables.instance.forumspath) GT 150>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"forumspath") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Forumspath") />
		</cfif>

		<!--- Validation for forumsurl --->
		<!--- Required String field so it must be defined and non blank. --->
		<cfif (NOT isDefined("variables.instance.forumsurl")) OR variables.instance.forumsurl IS "">
			<cfset valid = false />
			<cfset variables.missingFields = listAppend(variables.missingFields,"forumsurl") />
			<cfset variables.missingFieldNames = listAppend(variables.missingFieldNames,"Forumsurl") />
		<cfelseif Len(variables.instance.forumsurl) GT 150>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"forumsurl") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Forumsurl") />
		</cfif>

		<!--- Validation for emailmessage --->
		<!--- Optional String Field, check that it does not exceed maximum length. --->
		<cfif isDefined("variables.instance.emailmessage") AND Len(variables.instance.emailmessage) GT 64000>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"emailmessage") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Emailmessage") />
		</cfif>

		<!--- Validation for moderatoremail --->
		<!--- Optional String Field, check that it does not exceed maximum length. --->
		<cfif isDefined("variables.instance.moderatoremail") AND Len(variables.instance.moderatoremail) GT 150>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"moderatoremail") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Moderatoremail") />
		</cfif>

		<!--- Validation for companyurl --->
		<!--- Optional String Field, check that it does not exceed maximum length. --->
		<cfif isDefined("variables.instance.companyurl") AND Len(variables.instance.companyurl) GT 150>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"companyurl") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Companyurl") />
		</cfif>

		<!--- Validation for censorship --->

		<!--- Validation for querycaching --->

		<!--- Validation for cachingduration --->
		<!--- Optional Numeric field so if available must be a number. --->
		<cfif isDefined("variables.instance.cachingduration") AND variables.instance.cachingduration IS NOT "" AND NOT isNumeric(variables.instance.cachingduration)>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"cachingduration") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Cachingduration") />
		</cfif>

		<!--- Validation for archive --->

		<!--- Validation for archivetimespan --->
		<!--- Optional Numeric field so if available must be a number. --->
		<cfif isDefined("variables.instance.archivetimespan") AND variables.instance.archivetimespan IS NOT "" AND NOT isNumeric(variables.instance.archivetimespan)>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"archivetimespan") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Archivetimespan") />
		</cfif>

		<!--- Validation for backgroundcolor1 --->
		<!--- Required String field so it must be defined and non blank. --->
		<cfif (NOT isDefined("variables.instance.backgroundcolor1")) OR variables.instance.backgroundcolor1 IS "">
			<cfset valid = false />
			<cfset variables.missingFields = listAppend(variables.missingFields,"backgroundcolor1") />
			<cfset variables.missingFieldNames = listAppend(variables.missingFieldNames,"Backgroundcolor1") />
		<cfelseif Len(variables.instance.backgroundcolor1) GT 6>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"backgroundcolor1") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Backgroundcolor1") />
		</cfif>

		<!--- Validation for backgroundimage1 --->
		<!--- Optional String Field, check that it does not exceed maximum length. --->
		<cfif isDefined("variables.instance.backgroundimage1") AND Len(variables.instance.backgroundimage1) GT 50>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"backgroundimage1") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Backgroundimage1") />
		</cfif>

		<!--- Validation for textcolor1 --->
		<!--- Required String field so it must be defined and non blank. --->
		<cfif (NOT isDefined("variables.instance.textcolor1")) OR variables.instance.textcolor1 IS "">
			<cfset valid = false />
			<cfset variables.missingFields = listAppend(variables.missingFields,"textcolor1") />
			<cfset variables.missingFieldNames = listAppend(variables.missingFieldNames,"Textcolor1") />
		<cfelseif Len(variables.instance.textcolor1) GT 6>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"textcolor1") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Textcolor1") />
		</cfif>

		<!--- Validation for hyperlinkcolor1 --->
		<!--- Required String field so it must be defined and non blank. --->
		<cfif (NOT isDefined("variables.instance.hyperlinkcolor1")) OR variables.instance.hyperlinkcolor1 IS "">
			<cfset valid = false />
			<cfset variables.missingFields = listAppend(variables.missingFields,"hyperlinkcolor1") />
			<cfset variables.missingFieldNames = listAppend(variables.missingFieldNames,"Hyperlinkcolor1") />
		<cfelseif Len(variables.instance.hyperlinkcolor1) GT 6>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"hyperlinkcolor1") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Hyperlinkcolor1") />
		</cfif>

		<!--- Validation for backgroundcolor2 --->
		<!--- Required String field so it must be defined and non blank. --->
		<cfif (NOT isDefined("variables.instance.backgroundcolor2")) OR variables.instance.backgroundcolor2 IS "">
			<cfset valid = false />
			<cfset variables.missingFields = listAppend(variables.missingFields,"backgroundcolor2") />
			<cfset variables.missingFieldNames = listAppend(variables.missingFieldNames,"Backgroundcolor2") />
		<cfelseif Len(variables.instance.backgroundcolor2) GT 6>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"backgroundcolor2") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Backgroundcolor2") />
		</cfif>

		<!--- Validation for backgroundimage2 --->
		<!--- Optional String Field, check that it does not exceed maximum length. --->
		<cfif isDefined("variables.instance.backgroundimage2") AND Len(variables.instance.backgroundimage2) GT 50>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"backgroundimage2") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Backgroundimage2") />
		</cfif>

		<!--- Validation for textcolor2 --->
		<!--- Required String field so it must be defined and non blank. --->
		<cfif (NOT isDefined("variables.instance.textcolor2")) OR variables.instance.textcolor2 IS "">
			<cfset valid = false />
			<cfset variables.missingFields = listAppend(variables.missingFields,"textcolor2") />
			<cfset variables.missingFieldNames = listAppend(variables.missingFieldNames,"Textcolor2") />
		<cfelseif Len(variables.instance.textcolor2) GT 6>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"textcolor2") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Textcolor2") />
		</cfif>

		<!--- Validation for hyperlinkcolor2 --->
		<!--- Required String field so it must be defined and non blank. --->
		<cfif (NOT isDefined("variables.instance.hyperlinkcolor2")) OR variables.instance.hyperlinkcolor2 IS "">
			<cfset valid = false />
			<cfset variables.missingFields = listAppend(variables.missingFields,"hyperlinkcolor2") />
			<cfset variables.missingFieldNames = listAppend(variables.missingFieldNames,"Hyperlinkcolor2") />
		<cfelseif Len(variables.instance.hyperlinkcolor2) GT 6>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"hyperlinkcolor2") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Hyperlinkcolor2") />
		</cfif>

		<!--- Validation for attachmentpath --->
		<!--- Optional String Field, check that it does not exceed maximum length. --->
		<cfif isDefined("variables.instance.attachmentpath") AND Len(variables.instance.attachmentpath) GT 50>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"attachmentpath") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Attachmentpath") />
		</cfif>

		<!--- Validation for attachmentname --->
		<!--- Optional String Field, check that it does not exceed maximum length. --->
		<cfif isDefined("variables.instance.attachmentname") AND Len(variables.instance.attachmentname) GT 50>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"attachmentname") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Attachmentname") />
		</cfif>

		<!--- Validation for attachmentmaxsize --->
		<!--- Optional Numeric field so if available must be a number. --->
		<cfif isDefined("variables.instance.attachmentmaxsize") AND variables.instance.attachmentmaxsize IS NOT "" AND NOT isNumeric(variables.instance.attachmentmaxsize)>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"attachmentmaxsize") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Attachmentmaxsize") />
		</cfif>

		<!--- Validation for topiclistnumber --->
		<!--- Required Numeric field so it must be defined and a number. --->
		<cfif (NOT isDefined("variables.instance.topiclistnumber"))>
			<cfset valid = false />
			<cfset variables.missingFields = listAppend(variables.missingFields,"topiclistnumber") />
			<cfset variables.missingFieldNames = listAppend(variables.missingFieldNames,"Topiclistnumber") />
		<cfelseif NOT isNumeric(variables.instance.topiclistnumber)>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"topiclistnumber") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Topiclistnumber") />
		</cfif>

		<!--- Validation for messagelistnumber --->
		<!--- Required Numeric field so it must be defined and a number. --->
		<cfif (NOT isDefined("variables.instance.messagelistnumber"))>
			<cfset valid = false />
			<cfset variables.missingFields = listAppend(variables.missingFields,"messagelistnumber") />
			<cfset variables.missingFieldNames = listAppend(variables.missingFieldNames,"Messagelistnumber") />
		<cfelseif NOT isNumeric(variables.instance.messagelistnumber)>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"messagelistnumber") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Messagelistnumber") />
		</cfif>

		<!--- Validation for messageorder --->
		<!--- Required String field so it must be defined and non blank. --->
		<cfif (NOT isDefined("variables.instance.messageorder")) OR variables.instance.messageorder IS "">
			<cfset valid = false />
			<cfset variables.missingFields = listAppend(variables.missingFields,"messageorder") />
			<cfset variables.missingFieldNames = listAppend(variables.missingFieldNames,"Messageorder") />
		<cfelseif Len(variables.instance.messageorder) GT 4>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"messageorder") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Messageorder") />
		</cfif>

		<!--- Validation for threadorder --->
		<!--- Required String field so it must be defined and non blank. --->
		<cfif (NOT isDefined("variables.instance.threadorder")) OR variables.instance.threadorder IS "">
			<cfset valid = false />
			<cfset variables.missingFields = listAppend(variables.missingFields,"threadorder") />
			<cfset variables.missingFieldNames = listAppend(variables.missingFieldNames,"Threadorder") />
		<cfelseif Len(variables.instance.threadorder) GT 4>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"threadorder") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Threadorder") />
		</cfif>

		<!--- Validation for smtpserver --->
		<!--- Required String field so it must be defined and non blank. --->
		<cfif (NOT isDefined("variables.instance.smtpserver")) OR variables.instance.smtpserver IS "">
			<cfset valid = false />
			<cfset variables.missingFields = listAppend(variables.missingFields,"smtpserver") />
			<cfset variables.missingFieldNames = listAppend(variables.missingFieldNames,"Smtpserver") />
		<cfelseif Len(variables.instance.smtpserver) GT 50>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"smtpserver") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Smtpserver") />
		</cfif>

		<!--- Validation for privatemessages --->

		<!--- Validation for mailfooter --->
		<!--- Optional String Field, check that it does not exceed maximum length. --->
		<cfif isDefined("variables.instance.mailfooter") AND Len(variables.instance.mailfooter) GT 50>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"mailfooter") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Mailfooter") />
		</cfif>

		<!--- Validation for logourl --->
		<!--- Optional String Field, check that it does not exceed maximum length. --->
		<cfif isDefined("variables.instance.logourl") AND Len(variables.instance.logourl) GT 150>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"logourl") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Logourl") />
		</cfif>

		<!--- Validation for archivetimeofday --->
		<!--- Optional Date field so if available must be a date. --->
		<cfif isDefined("variables.instance.archivetimeofday") AND variables.instance.archivetimeofday IS NOT "" AND checkDate(variables.instance.archivetimeofday) IS "Invalid">
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"archivetimeofday") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Archivetimeofday") />
		</cfif>
		<cfreturn valid />
	</cffunction>

	<cffunction name="getMissingFields" access="public" returntype="string" output="false"
		displayname="Get Missing Fields" hint="I return a comma-separated list of data fields that are missing from this settings.">
		<cfreturn variables.missingFields />
	</cffunction>

	<cffunction name="getMissingFieldNames" access="public" returntype="string" output="false"
		displayname="Get Missing Field Names" hint="I return a comma-separated list of the user friendly names of data fields that are missing from this settings.">
		<cfreturn variables.missingFieldNames />
	</cffunction>

	<cffunction name="getInvalidFields" access="public" returntype="string" output="false"
		displayname="Get Invalid Fields" hint="I return a comma-separated list of data fields that are invalid in this settings.">
		<cfreturn variables.invalidFields />
	</cffunction>

	<cffunction name="getInvalidFieldNames" access="public" returntype="string" output="false"
		displayname="Get Invalid Field Names" hint="I return a comma-separated list of the user friendly names of data fields that are invalid in this settings.">
		<cfreturn variables.invalidFieldNames />
	</cffunction>

</cfcomponent>

<!--- 
$Log: settings.cfc,v $
Revision 1.3  2007/06/15 14:00:08  kevin
Add Admin Modules

Revision 1.2  2007/06/14 14:01:14  kevin
Initial Open Source Version

Revision 1.7  2005/09/22 07:59:41  kevin
Move checkdate

Revision 1.6  2005/05/11 10:41:14  kevin
Rename from MVC conversion

Revision 1.5  2005/05/10 12:39:27  kevin
Change integer to numeric

Revision 1.4  2005/04/11 12:32:15  mike
set some methods to access="public", so they can be called from ForumAdminFacade circuit

Revision 1.3  2005/04/06 17:57:15  mike
messagelistnumber was incorrectly set as primary key; change to settingid; change some setXxxfunctions to access="public"

Revision 1.2  2005/03/31 14:07:04  kevin
Add CVS Info

Revision 1.1  2005/03/29 09:59:49  mike
Fusebuilder Generated Code

 --->
