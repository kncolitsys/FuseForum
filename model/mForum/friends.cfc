<!--- $RCSfile: friends.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:11 $ --->
<cfcomponent displayname="friends" hint="I model a single friends object.">

	<cfset variables.instance=structNew()>
	<cfset variables.instance.recordid="0">
	<cfset variables.instance.userid="0">
	<cfset variables.instance.friendid="0">

	<cffunction name="init" access="public" returntype="friends" output="false"
		displayname="friends Constructor" hint="I initialize a friends.">
		<cfargument name="recordid" type="numeric" default="0" />
		<cfargument name="userid" type="numeric" default="0" />
		<cfargument name="friendid" type="numeric" default="0" />
		<cfset variables.instance = structNew() />
		<cfset variables.instance.recordid = arguments.recordid />
		<cfset variables.instance.userid = arguments.userid />
		<cfset variables.instance.friendid = arguments.friendid />
		<cfset variables.missingFields = "" />
		<cfset variables.missingFieldNames = "" />
		<cfset variables.invalidFields = "" />
		<cfset variables.invalidFieldNames = "" />
		<cfreturn this />
	</cffunction>

	<cffunction name="getRecordid" access="public" returntype="numeric" output="false" 
		displayname="GetRecordid" hint="I return the value of recordid.">
		<cfreturn variables.instance.recordid />
	</cffunction>
	<cffunction name="setRecordid" access="private" returntype="void" output="false" 
		displayname="SetRecordid" hint="I set the value of recordid.">
		<cfargument name="recordid" type="numeric" default="0" />
		<cfset variables.instance.recordid = arguments.recordid />
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

	<cffunction name="getFriendid" access="public" returntype="numeric" output="false" 
		displayname="GetFriendid" hint="I return the value of friendid.">
		<cfreturn variables.instance.friendid />
	</cffunction>
	<cffunction name="setFriendid" access="private" returntype="void" output="false" 
		displayname="SetFriendid" hint="I set the value of friendid.">
		<cfargument name="friendid" type="numeric" default="0" />
		<cfset variables.instance.friendid = arguments.friendid />
	</cffunction>

	<cffunction name="getInstanceMemento" access="public" returntype="struct" output="false"
		displayname="Get Instance Memento" hint="I return a memento of this friends's instance data.">
		<cfreturn variables.instance />
	</cffunction>

	<cffunction name="setInstanceMemento" access="public" returntype="friends" output="false"
		displayname="Set Instance Memento" hint="I set this friends's instance data from a new memento.">
		<cfargument name="memento" type="struct" required="yes"
			displayname="Memento" hint="I am a memento - a struct containing data." />
		<cfset variables.instance = arguments.memento />
		<cfreturn this />
	</cffunction>

	<cffunction name="validate" access="public" returntype="boolean" output="false"
		displayname="Validate friends" hint="I validate all the data fields in this friends object.">
		<cfset var valid = true />
		<cfset variables.missingFields = "" />
		<cfset variables.missingFieldNames = "" />
		<cfset variables.invalidFields = "" />
		<cfset variables.invalidFieldNames = "" />
		<cfinclude template="../../udfs/udf_checkdate.cfm" />

		<!--- Validation for recordid --->
		<!--- Primary Key, if present must be a number. --->
		<cfif isDefined("variables.instance.recordid") AND NOT isNumeric(variables.instance.recordid)>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"recordid") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Recordid") />
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

		<!--- Validation for friendid --->
		<!--- Required Numeric field so it must be defined and a number. --->
		<cfif (NOT isDefined("variables.instance.friendid"))>
			<cfset valid = false />
			<cfset variables.missingFields = listAppend(variables.missingFields,"friendid") />
			<cfset variables.missingFieldNames = listAppend(variables.missingFieldNames,"Friendid") />
		<cfelseif NOT isNumeric(variables.instance.friendid)>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"friendid") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Friendid") />
		</cfif>
		<cfreturn valid />
	</cffunction>

	<cffunction name="getMissingFields" access="public" returntype="string" output="false"
		displayname="Get Missing Fields" hint="I return a comma-separated list of data fields that are missing from this friends.">
		<cfreturn variables.missingFields />
	</cffunction>

	<cffunction name="getMissingFieldNames" access="public" returntype="string" output="false"
		displayname="Get Missing Field Names" hint="I return a comma-separated list of the user friendly names of data fields that are missing from this friends.">
		<cfreturn variables.missingFieldNames />
	</cffunction>

	<cffunction name="getInvalidFields" access="public" returntype="string" output="false"
		displayname="Get Invalid Fields" hint="I return a comma-separated list of data fields that are invalid in this friends.">
		<cfreturn variables.invalidFields />
	</cffunction>

	<cffunction name="getInvalidFieldNames" access="public" returntype="string" output="false"
		displayname="Get Invalid Field Names" hint="I return a comma-separated list of the user friendly names of data fields that are invalid in this friends.">
		<cfreturn variables.invalidFieldNames />
	</cffunction>

</cfcomponent>

<!--- 
$Log: friends.cfc,v $
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

Revision 1.1  2005/03/29 09:57:54  mike
Fusebuilder Generated Code

 --->
