<!--- $RCSfile: privatemessages.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:11 $ --->
<cfcomponent displayname="privatemessages" hint="I model a single privatemessages object.">

	<cfset variables.instance=structNew()>
	<cfset variables.instance.messageid="0">
	<cfset variables.instance.userid="0">
	<cfset variables.instance.message="">
	<cfset variables.instance.senderid="0">
	<cfset variables.instance.messagedate="#now()#">

	<cffunction name="init" access="public" returntype="privatemessages" output="false"
		displayname="privatemessages Constructor" hint="I initialize a privatemessages.">
		<cfargument name="messageid" type="numeric" default="0" />
		<cfargument name="userid" type="numeric" default="0" />
		<cfargument name="message" type="string" default="" />
		<cfargument name="senderid" type="numeric" default="0" />
		<cfargument name="messagedate" type="date" default="#now()#" />
		<cfset variables.instance = structNew() />
		<cfset variables.instance.messageid = arguments.messageid />
		<cfset variables.instance.userid = arguments.userid />
		<cfset variables.instance.message = arguments.message />
		<cfset variables.instance.senderid = arguments.senderid />
		<cfset variables.instance.messagedate = arguments.messagedate />
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

	<cffunction name="getUserid" access="public" returntype="numeric" output="false" 
		displayname="GetUserid" hint="I return the value of userid.">
		<cfreturn variables.instance.userid />
	</cffunction>
	<cffunction name="setUserid" access="private" returntype="void" output="false" 
		displayname="SetUserid" hint="I set the value of userid.">
		<cfargument name="userid" type="numeric" default="0" />
		<cfset variables.instance.userid = arguments.userid />
	</cffunction>

	<cffunction name="getMessage" access="public" returntype="string" output="false" 
		displayname="GetMessage" hint="I return the value of message.">
		<cfreturn variables.instance.message />
	</cffunction>
	<cffunction name="setMessage" access="private" returntype="void" output="false" 
		displayname="SetMessage" hint="I set the value of message.">
		<cfargument name="message" type="string" default="" />
		<cfset variables.instance.message = arguments.message />
	</cffunction>

	<cffunction name="getSenderid" access="public" returntype="numeric" output="false" 
		displayname="GetSenderid" hint="I return the value of senderid.">
		<cfreturn variables.instance.senderid />
	</cffunction>
	<cffunction name="setSenderid" access="private" returntype="void" output="false" 
		displayname="SetSenderid" hint="I set the value of senderid.">
		<cfargument name="senderid" type="numeric" default="0" />
		<cfset variables.instance.senderid = arguments.senderid />
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

	<cffunction name="getInstanceMemento" access="public" returntype="struct" output="false"
		displayname="Get Instance Memento" hint="I return a memento of this privatemessages's instance data.">
		<cfreturn variables.instance />
	</cffunction>

	<cffunction name="setInstanceMemento" access="public" returntype="privatemessages" output="false"
		displayname="Set Instance Memento" hint="I set this privatemessages's instance data from a new memento.">
		<cfargument name="memento" type="struct" required="yes"
			displayname="Memento" hint="I am a memento - a struct containing data." />
		<cfset variables.instance = arguments.memento />
		<cfreturn this />
	</cffunction>

	<cffunction name="validate" access="public" returntype="boolean" output="false"
		displayname="Validate privatemessages" hint="I validate all the data fields in this privatemessages object.">
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

		<!--- Validation for message --->
		<!--- Optional String Field, check that it does not exceed maximum length. --->
		<cfif isDefined("variables.instance.message") AND Len(variables.instance.message) GT 64000>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"message") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Message") />
		</cfif>

		<!--- Validation for senderid --->
		<!--- Required Numeric field so it must be defined and a number. --->
		<cfif (NOT isDefined("variables.instance.senderid"))>
			<cfset valid = false />
			<cfset variables.missingFields = listAppend(variables.missingFields,"senderid") />
			<cfset variables.missingFieldNames = listAppend(variables.missingFieldNames,"Senderid") />
		<cfelseif NOT isNumeric(variables.instance.senderid)>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"senderid") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Senderid") />
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
		<cfreturn valid />
	</cffunction>

	<cffunction name="getMissingFields" access="public" returntype="string" output="false"
		displayname="Get Missing Fields" hint="I return a comma-separated list of data fields that are missing from this privatemessages.">
		<cfreturn variables.missingFields />
	</cffunction>

	<cffunction name="getMissingFieldNames" access="public" returntype="string" output="false"
		displayname="Get Missing Field Names" hint="I return a comma-separated list of the user friendly names of data fields that are missing from this privatemessages.">
		<cfreturn variables.missingFieldNames />
	</cffunction>

	<cffunction name="getInvalidFields" access="public" returntype="string" output="false"
		displayname="Get Invalid Fields" hint="I return a comma-separated list of data fields that are invalid in this privatemessages.">
		<cfreturn variables.invalidFields />
	</cffunction>

	<cffunction name="getInvalidFieldNames" access="public" returntype="string" output="false"
		displayname="Get Invalid Field Names" hint="I return a comma-separated list of the user friendly names of data fields that are invalid in this privatemessages.">
		<cfreturn variables.invalidFieldNames />
	</cffunction>

</cfcomponent>

<!--- 
$Log: privatemessages.cfc,v $
Revision 1.2  2007/06/14 14:01:11  kevin
Initial Open Source Version

Revision 1.5  2005/09/22 08:00:19  kevin
Move checkdate

Revision 1.4  2005/05/11 10:41:14  kevin
Rename from MVC conversion

Revision 1.3  2005/05/10 12:39:27  kevin
Change integer to numeric

Revision 1.2  2005/03/31 14:07:04  kevin
Add CVS Info

Revision 1.1  2005/03/29 09:57:55  mike
Fusebuilder Generated Code

 --->
