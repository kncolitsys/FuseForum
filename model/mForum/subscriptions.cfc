<!--- $RCSfile: subscriptions.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:14 $ --->
<cfcomponent displayname="subscriptions" hint="I model a single subscriptions object.">

	<cfset variables.instance=structNew()>
	<cfset variables.instance.recordid="0">
	<cfset variables.instance.userid="0">
	<cfset variables.instance.threadid="0">

	<cffunction name="init" access="public" returntype="subscriptions" output="false"
		displayname="subscriptions Constructor" hint="I initialize a subscriptions.">
		<cfargument name="recordid" type="numeric" default="0" />
		<cfargument name="userid" type="numeric" default="0" />
		<cfargument name="threadid" type="numeric" default="0" />
		<cfset variables.instance = structNew() />
		<cfset variables.instance.recordid = arguments.recordid />
		<cfset variables.instance.userid = arguments.userid />
		<cfset variables.instance.threadid = arguments.threadid />
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

	<cffunction name="getThreadid" access="public" returntype="numeric" output="false" 
		displayname="GetThreadid" hint="I return the value of threadid.">
		<cfreturn variables.instance.threadid />
	</cffunction>
	<cffunction name="setThreadid" access="private" returntype="void" output="false" 
		displayname="SetThreadid" hint="I set the value of threadid.">
		<cfargument name="threadid" type="numeric" default="0" />
		<cfset variables.instance.threadid = arguments.threadid />
	</cffunction>

	<cffunction name="getInstanceMemento" access="public" returntype="struct" output="false"
		displayname="Get Instance Memento" hint="I return a memento of this subscriptions's instance data.">
		<cfreturn variables.instance />
	</cffunction>

	<cffunction name="setInstanceMemento" access="public" returntype="subscriptions" output="false"
		displayname="Set Instance Memento" hint="I set this subscriptions's instance data from a new memento.">
		<cfargument name="memento" type="struct" required="yes"
			displayname="Memento" hint="I am a memento - a struct containing data." />
		<cfset variables.instance = arguments.memento />
		<cfreturn this />
	</cffunction>

	<cffunction name="validate" access="public" returntype="boolean" output="false"
		displayname="Validate subscriptions" hint="I validate all the data fields in this subscriptions object.">
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
		<cfreturn valid />
	</cffunction>

	<cffunction name="getMissingFields" access="public" returntype="string" output="false"
		displayname="Get Missing Fields" hint="I return a comma-separated list of data fields that are missing from this subscriptions.">
		<cfreturn variables.missingFields />
	</cffunction>

	<cffunction name="getMissingFieldNames" access="public" returntype="string" output="false"
		displayname="Get Missing Field Names" hint="I return a comma-separated list of the user friendly names of data fields that are missing from this subscriptions.">
		<cfreturn variables.missingFieldNames />
	</cffunction>

	<cffunction name="getInvalidFields" access="public" returntype="string" output="false"
		displayname="Get Invalid Fields" hint="I return a comma-separated list of data fields that are invalid in this subscriptions.">
		<cfreturn variables.invalidFields />
	</cffunction>

	<cffunction name="getInvalidFieldNames" access="public" returntype="string" output="false"
		displayname="Get Invalid Field Names" hint="I return a comma-separated list of the user friendly names of data fields that are invalid in this subscriptions.">
		<cfreturn variables.invalidFieldNames />
	</cffunction>

</cfcomponent>

<!--- 
$Log: subscriptions.cfc,v $
Revision 1.2  2007/06/14 14:01:14  kevin
Initial Open Source Version

Revision 1.5  2005/09/22 07:59:41  kevin
Move checkdate

Revision 1.4  2005/05/11 10:41:14  kevin
Rename from MVC conversion

Revision 1.3  2005/05/10 12:39:27  kevin
Change integer to numeric

Revision 1.2  2005/03/31 14:07:04  kevin
Add CVS Info

Revision 1.1  2005/03/29 09:59:55  mike
Fusebuilder Generated Code

 --->
