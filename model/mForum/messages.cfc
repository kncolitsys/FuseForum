<!--- $RCSfile: messages.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:11 $ --->
<cfcomponent displayname="messages" hint="I model a single messages object.">

	<cfset variables.instance=structNew()>
	<cfset variables.instance.messageid="0">
	<cfset variables.instance.message="">
	<cfset variables.instance.messagedate="#now()#">
	<cfset variables.instance.threadid="0">
	<cfset variables.instance.userid="0">
	<cfset variables.instance.editmessage="">
	<cfset variables.instance.moderatormessage="">
	<cfset variables.instance.attachment="">
	<cfset variables.instance.filesize="0">
	<cfset variables.instance.approved="">
	<cfset variables.instance.archived="">
	<cfset variables.instance.timeoflastchange="">

	<cffunction name="init" access="public" returntype="messages" output="false"
		displayname="messages Constructor" hint="I initialize a messages.">
		<cfargument name="messageid" type="numeric" default="0" />
		<cfargument name="message" type="string" default="" />
		<cfargument name="messagedate" type="date" default="#now()#" />
		<cfargument name="threadid" type="numeric" default="0" />
		<cfargument name="userid" type="numeric" default="0" />
		<cfargument name="editmessage" type="string" default="" />
		<cfargument name="moderatormessage" type="string" default="" />
		<cfargument name="attachment" type="string" default="" />
		<cfargument name="filesize" type="numeric" default="0" />
		<cfargument name="approved" type="string" default="" />
		<cfargument name="archived" type="string" default="" />
		<cfargument name="timeoflastchange" type="string" default="" />
		<cfset variables.instance = structNew() />
		<cfset variables.instance.messageid = arguments.messageid />
		<cfset variables.instance.message = arguments.message />
		<cfset variables.instance.messagedate = arguments.messagedate />
		<cfset variables.instance.threadid = arguments.threadid />
		<cfset variables.instance.userid = arguments.userid />
		<cfset variables.instance.editmessage = arguments.editmessage />
		<cfset variables.instance.moderatormessage = arguments.moderatormessage />
		<cfset variables.instance.attachment = arguments.attachment />
		<cfset variables.instance.filesize = arguments.filesize />
		<cfset variables.instance.approved = arguments.approved />
		<cfset variables.instance.archived = arguments.archived />
		<cfset variables.instance.timeoflastchange = arguments.timeoflastchange />
		<cfset variables.missingFields = "" />
		<cfset variables.missingFieldNames = "" />
		<cfset variables.invalidFields = "" />
		<cfset variables.invalidFieldNames = "" />
		<cfreturn this />
	</cffunction>

	<cffunction name="getMessageid" access="public" returntype="numeric" output="false" 
		displayname="GetMessageid" hint="I return the value of messageid.">
		<cfreturn variables.instance.messageid />
	</cffunction>
	<cffunction name="setMessageid" access="private" returntype="void" output="false" 
		displayname="SetMessageid" hint="I set the value of messageid.">
		<cfargument name="messageid" type="numeric" default="0" />
		<cfset variables.instance.messageid = arguments.messageid />
	</cffunction>

	<cffunction name="getMessage" access="public" returntype="string" output="false" 
		displayname="GetMessage" hint="I return the value of message.">
		<cfreturn variables.instance.message />
	</cffunction>
	<cffunction name="setMessage" access="public" returntype="void" output="false" 
		displayname="SetMessage" hint="I set the value of message.">
		<cfargument name="message" type="string" default="" />
		<cfset variables.instance.message = arguments.message />
	</cffunction>

	<cffunction name="getMessagedate" access="public" returntype="date" output="false" 
		displayname="GetMessagedate" hint="I return the value of messagedate.">
		<cfreturn variables.instance.messagedate />
	</cffunction>
	<cffunction name="setMessagedate" access="private" returntype="void" output="false" 
		displayname="SetMessagedate" hint="I set the value of messagedate.">
		<cfargument name="messagedate" type="date" default="#now()#" />
		<cfset variables.instance.messagedate = arguments.messagedate />
	</cffunction>

	<cffunction name="getThreadid" access="public" returntype="numeric" output="false" 
		displayname="GetThreadid" hint="I return the value of threadid.">
		<cfreturn variables.instance.threadid />
	</cffunction>
	<cffunction name="setThreadid" access="private" returntype="void" output="false" 
		displayname="SetThreadid" hint="I set the value of threadid.">
		<cfargument name="threadid" type="numeric" default="0" />
		<cfset variables.instance.threadid = arguments.threadid />
	</cffunction>

	<cffunction name="getUserid" access="public" returntype="numeric" output="false" 
		displayname="GetUserid" hint="I return the value of userid.">
		<cfreturn variables.instance.userid />
	</cffunction>
	<cffunction name="setUserid" access="private" returntype="void" output="false" 
		displayname="SetUserid" hint="I set the value of userid.">
		<cfargument name="userid" type="numeric" default="0" />
		<cfset variables.instance.userid = arguments.userid />
	</cffunction>

	<cffunction name="getEditmessage" access="public" returntype="string" output="false" 
		displayname="GetEditmessage" hint="I return the value of editmessage.">
		<cfreturn variables.instance.editmessage />
	</cffunction>
	<cffunction name="setEditmessage" access="private" returntype="void" output="false" 
		displayname="SetEditmessage" hint="I set the value of editmessage.">
		<cfargument name="editmessage" type="string" default="" />
		<cfset variables.instance.editmessage = arguments.editmessage />
	</cffunction>

	<cffunction name="getModeratormessage" access="public" returntype="string" output="false" 
		displayname="GetModeratormessage" hint="I return the value of moderatormessage.">
		<cfreturn variables.instance.moderatormessage />
	</cffunction>
	<cffunction name="setModeratormessage" access="public" returntype="void" output="false" 
		displayname="SetModeratormessage" hint="I set the value of moderatormessage.">
		<cfargument name="moderatormessage" type="string" default="" />
		<cfset variables.instance.moderatormessage = arguments.moderatormessage />
	</cffunction>

	<cffunction name="getAttachment" access="public" returntype="string" output="false" 
		displayname="GetAttachment" hint="I return the value of attachment.">
		<cfreturn variables.instance.attachment />
	</cffunction>
	<cffunction name="setAttachment" access="private" returntype="void" output="false" 
		displayname="SetAttachment" hint="I set the value of attachment.">
		<cfargument name="attachment" type="string" default="" />
		<cfset variables.instance.attachment = arguments.attachment />
	</cffunction>

	<cffunction name="getFilesize" access="public" returntype="numeric" output="false" 
		displayname="GetFilesize" hint="I return the value of filesize.">
		<cfreturn variables.instance.filesize />
	</cffunction>
	<cffunction name="setFilesize" access="private" returntype="void" output="false" 
		displayname="SetFilesize" hint="I set the value of filesize.">
		<cfargument name="filesize" type="numeric" default="0" />
		<cfset variables.instance.filesize = arguments.filesize />
	</cffunction>

	<cffunction name="getApproved" access="public" returntype="string" output="false" 
		displayname="GetApproved" hint="I return the value of approved.">
		<cfreturn variables.instance.approved />
	</cffunction>
	<cffunction name="setApproved" access="public" returntype="void" output="false" 
		displayname="SetApproved" hint="I set the value of approved.">
		<cfargument name="approved" type="string" default="" />
		<cfset variables.instance.approved = arguments.approved />
	</cffunction>

	<cffunction name="getArchived" access="public" returntype="string" output="false" 
		displayname="GetArchived" hint="I return the value of archived.">
		<cfreturn variables.instance.archived />
	</cffunction>
	<cffunction name="setArchived" access="public" returntype="void" output="false" 
		displayname="SetArchived" hint="I set the value of archived.">
		<cfargument name="archived" type="string" default="" />
		<cfset variables.instance.archived = arguments.archived />
	</cffunction>

	<cffunction name="getInstanceMemento" access="public" returntype="struct" output="false"
		displayname="Get Instance Memento" hint="I return a memento of this messages's instance data.">
		<cfreturn variables.instance />
	</cffunction>

	<cffunction name="setInstanceMemento" access="public" returntype="messages" output="false"
		displayname="Set Instance Memento" hint="I set this messages's instance data from a new memento.">
		<cfargument name="memento" type="struct" required="yes"
			displayname="Memento" hint="I am a memento - a struct containing data." />
		<cfset variables.instance = arguments.memento />
		<cfreturn this />
	</cffunction>

	<cffunction name="validate" access="public" returntype="boolean" output="false"
		displayname="Validate messages" hint="I validate all the data fields in this messages object.">
		<cfset var valid = true />
		<cfset variables.missingFields = "" />
		<cfset variables.missingFieldNames = "" />
		<cfset variables.invalidFields = "" />
		<cfset variables.invalidFieldNames = "" />
		<cfinclude template="../../udfs/udf_checkdate.cfm" />

		<!--- Validation for messageid --->
		<!--- Primary Key, if present must be a number. --->
		<cfif isDefined("variables.instance.messageid") AND NOT isNumeric(variables.instance.messageid)>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"messageid") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Messageid") />
		</cfif>

		<!--- Validation for message --->
		<!--- Optional String Field, check that it does not exceed maximum length. --->
		<cfif isDefined("variables.instance.message") AND Len(variables.instance.message) GT 64000>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"message") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Message") />
		</cfif>

		<!--- Validation for messagedate --->
		<!--- Required Date field so it must be defined and non blank and a date. --->
		<cfif (NOT isDefined("variables.instance.messagedate")) OR variables.instance.messagedate IS "">
			<cfset valid = false />
			<cfset variables.missingFields = listAppend(variables.missingFields,"messagedate") />
			<cfset variables.missingFieldNames = listAppend(variables.missingFieldNames,"Messagedate") />
		<cfelseif NOT LSisDate(variables.instance.messagedate)>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"messagedate") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Messagedate") />
		</cfif>

		<!--- Validation for threadid --->
		<!--- Required Numeric field so it must be defined and a number. --->
		<cfif (NOT isDefined("variables.instance.threadid"))>
			<cfset valid = false />
			<cfset variables.missingFields = listAppend(variables.missingFields,"threadid") />
			<cfset variables.missingFieldNames = listAppend(variables.missingFieldNames,"Threadid") />
		<cfelseif NOT isNumeric(variables.instance.threadid)>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"threadid") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Threadid") />
		<cfelse>
		<!--- Field validated against a table --->
			<cfset othreads = createObject("component","threads").init()>
			<cftry>
				<cfset stthreads = request.threads_DAO.read(othreads,variables.instance.threadid)>
				<cfcatch>
					<cfset valid = false />
					<cfset variables.invalidFields = listAppend(variables.invalidFields,"threadid") />
					<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Threadid") />
				</cfcatch>
			</cftry>
		</cfif>

		<!--- Validation for userid --->
		<!--- Required Numeric field so it must be defined and a number. --->
		<cfif (NOT isDefined("variables.instance.userid"))>
			<cfset valid = false />
			<cfset variables.missingFields = listAppend(variables.missingFields,"userid") />
			<cfset variables.missingFieldNames = listAppend(variables.missingFieldNames,"Userid") />
		<cfelseif NOT isNumeric(variables.instance.userid)>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"userid") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Userid") />
		</cfif>

		<!--- Validation for editmessage --->
		<!--- Optional String Field, check that it does not exceed maximum length. --->
		<cfif isDefined("variables.instance.editmessage") AND Len(variables.instance.editmessage) GT 100>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"editmessage") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Editmessage") />
		</cfif>

		<!--- Validation for moderatormessage --->
		<!--- Optional String Field, check that it does not exceed maximum length. --->
		<cfif isDefined("variables.instance.moderatormessage") AND Len(variables.instance.moderatormessage) GT 100>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"moderatormessage") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Moderatormessage") />
		</cfif>

		<!--- Validation for attachment --->
		<!--- Optional String Field, check that it does not exceed maximum length. --->
		<cfif isDefined("variables.instance.attachment") AND Len(variables.instance.attachment) GT 50>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"attachment") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Attachment") />
		</cfif>

		<!--- Validation for filesize --->
		<!--- Optional Numeric field so if available must be a number. --->
		<cfif isDefined("variables.instance.filesize") AND variables.instance.filesize IS NOT "" AND NOT isNumeric(variables.instance.filesize)>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"filesize") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Filesize") />
		</cfif>

		<!--- Validation for approved --->
		<!--- Validation for archived --->

		<!--- Validation for timeoflastchange --->
		<!--- Optional String Field, check that it does not exceed maximum length. --->
		<!--- <cfif isDefined("variables.instance.timeoflastchange") AND Len(variables.instance.timeoflastchange) GT 8>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"timeoflastchange") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Timeoflastchange") />
		</cfif> --->
		<cfreturn valid />
	</cffunction>

	<cffunction name="getMissingFields" access="public" returntype="string" output="false"
		displayname="Get Missing Fields" hint="I return a comma-separated list of data fields that are missing from this messages.">
		<cfreturn variables.missingFields />
	</cffunction>

	<cffunction name="getMissingFieldNames" access="public" returntype="string" output="false"
		displayname="Get Missing Field Names" hint="I return a comma-separated list of the user friendly names of data fields that are missing from this messages.">
		<cfreturn variables.missingFieldNames />
	</cffunction>

	<cffunction name="getInvalidFields" access="public" returntype="string" output="false"
		displayname="Get Invalid Fields" hint="I return a comma-separated list of data fields that are invalid in this messages.">
		<cfreturn variables.invalidFields />
	</cffunction>

	<cffunction name="getInvalidFieldNames" access="public" returntype="string" output="false"
		displayname="Get Invalid Field Names" hint="I return a comma-separated list of the user friendly names of data fields that are invalid in this messages.">
		<cfreturn variables.invalidFieldNames />
	</cffunction>

</cfcomponent>

<!--- 
$Log: messages.cfc,v $
Revision 1.2  2007/06/14 14:01:11  kevin
Initial Open Source Version

Revision 1.8  2005/09/22 08:00:19  kevin
Move checkdate

Revision 1.7  2005/05/11 10:41:14  kevin
Rename from MVC conversion

Revision 1.6  2005/05/10 12:39:27  kevin
Change integer to numeric

Revision 1.5  2005/04/20 11:42:48  mike
handle the new field archived

Revision 1.4  2005/04/11 15:21:54  mike
remove the incorrect attempts to alter explicitly the field timeoflastchange , which is of SQL type timestamp/BINARY(8)

Revision 1.3  2005/04/11 12:32:14  mike
set some methods to access="public", so they can be called from ForumAdminFacade circuit

Revision 1.2  2005/03/31 14:07:04  kevin
Add CVS Info

Revision 1.1  2005/03/29 09:57:55  mike
Fusebuilder Generated Code

 --->
