<!--- $RCSfile: forum_subscriptions.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:11 $ --->
<cfcomponent displayname="forum_subscriptions" hint="I model a single forum_subscriptions object.">

	<cfset variables.instance=structNew()>
	<cfset variables.instance.fs_id="0">
	<cfset variables.instance.fs_name_id="0">
	<cfset variables.instance.fs_forum_id="0">

	<cffunction name="init" access="public" returntype="forum_subscriptions" output="false"
		displayname="forum_subscriptions Constructor" hint="I initialize a forum_subscriptions.">
		<cfargument name="fs_id" type="numeric" default="0" />
		<cfargument name="fs_name_id" type="numeric" default="0" />
		<cfargument name="fs_forum_id" type="numeric" default="0" />
		<cfset variables.instance = structNew() />
		<cfset variables.instance.fs_id = arguments.fs_id />
		<cfset variables.instance.fs_name_id = arguments.fs_name_id />
		<cfset variables.instance.fs_forum_id = arguments.fs_forum_id />
		<cfset variables.missingFields = "" />
		<cfset variables.missingFieldNames = "" />
		<cfset variables.invalidFields = "" />
		<cfset variables.invalidFieldNames = "" />
		<cfreturn this />
	</cffunction>

	<cffunction name="getFs_id" access="public" returntype="integer" output="false" 
		displayname="GetFs_id" hint="I return the value of fs_id.">
		<cfreturn variables.instance.fs_id />
	</cffunction>
	<cffunction name="setFs_id" access="private" returntype="void" output="false" 
		displayname="SetFs_id" hint="I set the value of fs_id.">
		<cfargument name="fs_id" type="numeric" default="0" />
		<cfset variables.instance.fs_id = arguments.fs_id />
	</cffunction>

	<cffunction name="getFs_name_id" access="public" returntype="integer" output="false" 
		displayname="GetFs_name_id" hint="I return the value of fs_name_id.">
		<cfreturn variables.instance.fs_name_id />
	</cffunction>
	<cffunction name="setFs_name_id" access="private" returntype="void" output="false" 
		displayname="SetFs_name_id" hint="I set the value of fs_name_id.">
		<cfargument name="fs_name_id" type="numeric" default="0" />
		<cfset variables.instance.fs_name_id = arguments.fs_name_id />
	</cffunction>

	<cffunction name="getFs_forum_id" access="public" returntype="integer" output="false" 
		displayname="GetFs_forum_id" hint="I return the value of fs_forum_id.">
		<cfreturn variables.instance.fs_forum_id />
	</cffunction>
	<cffunction name="setFs_forum_id" access="private" returntype="void" output="false" 
		displayname="SetFs_forum_id" hint="I set the value of fs_forum_id.">
		<cfargument name="fs_forum_id" type="numeric" default="0" />
		<cfset variables.instance.fs_forum_id = arguments.fs_forum_id />
	</cffunction>

	<cffunction name="getInstanceMemento" access="public" returntype="struct" output="false"
		displayname="Get Instance Memento" hint="I return a memento of this forum_subscriptions's instance data.">
		<cfreturn variables.instance />
	</cffunction>

	<cffunction name="setInstanceMemento" access="public" returntype="forum_subscriptions" output="false"
		displayname="Set Instance Memento" hint="I set this forum_subscriptions's instance data from a new memento.">
		<cfargument name="memento" type="struct" required="yes"
			displayname="Memento" hint="I am a memento - a struct containing data." />
		<cfset variables.instance = arguments.memento />
		<cfreturn this />
	</cffunction>

	<cffunction name="validate" access="public" returntype="boolean" output="false"
		displayname="Validate forum_subscriptions" hint="I validate all the data fields in this forum_subscriptions object.">
		<cfset var valid = true />
		<cfset variables.missingFields = "" />
		<cfset variables.missingFieldNames = "" />
		<cfset variables.invalidFields = "" />
		<cfset variables.invalidFieldNames = "" />
		<cfinclude template="../../udfs/udf_checkdate.cfm" />

		<!--- Validation for fs_id --->
		<!--- Primary Key, if present must be a number. --->
		<cfif isDefined("variables.instance.fs_id") AND NOT isNumeric(variables.instance.fs_id)>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"fs_id") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Fs Id") />
		</cfif>

		<!--- Validation for fs_name_id --->
		<!--- Required Numeric field so it must be defined and a number. --->
		<cfif (NOT isDefined("variables.instance.fs_name_id"))>
			<cfset valid = false />
			<cfset variables.missingFields = listAppend(variables.missingFields,"fs_name_id") />
			<cfset variables.missingFieldNames = listAppend(variables.missingFieldNames,"Fs Name Id") />
		<cfelseif NOT isNumeric(variables.instance.fs_name_id)>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"fs_name_id") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Fs Name Id") />
		</cfif>

		<!--- Validation for fs_forum_id --->
		<!--- Required Numeric field so it must be defined and a number. --->
		<cfif (NOT isDefined("variables.instance.fs_forum_id"))>
			<cfset valid = false />
			<cfset variables.missingFields = listAppend(variables.missingFields,"fs_forum_id") />
			<cfset variables.missingFieldNames = listAppend(variables.missingFieldNames,"Fs Forum Id") />
		<cfelseif NOT isNumeric(variables.instance.fs_forum_id)>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"fs_forum_id") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Fs Forum Id") />
		<cfelse>
		<!--- Field validated against a table --->
			<cfset ocategories = createObject("component","categories").init()>
			<cftry>
				<cfset stcategories = request.categories_DAO.read(ocategories,variables.instance.fs_forum_id)>
				<cfcatch>
					<cfset valid = false />
					<cfset variables.invalidFields = listAppend(variables.invalidFields,"fs_forum_id") />
					<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Fs Forum Id") />
				</cfcatch>
			</cftry>
		</cfif>
		<cfreturn valid />
	</cffunction>

	<cffunction name="getMissingFields" access="public" returntype="string" output="false"
		displayname="Get Missing Fields" hint="I return a comma-separated list of data fields that are missing from this forum_subscriptions.">
		<cfreturn variables.missingFields />
	</cffunction>

	<cffunction name="getMissingFieldNames" access="public" returntype="string" output="false"
		displayname="Get Missing Field Names" hint="I return a comma-separated list of the user friendly names of data fields that are missing from this forum_subscriptions.">
		<cfreturn variables.missingFieldNames />
	</cffunction>

	<cffunction name="getInvalidFields" access="public" returntype="string" output="false"
		displayname="Get Invalid Fields" hint="I return a comma-separated list of data fields that are invalid in this forum_subscriptions.">
		<cfreturn variables.invalidFields />
	</cffunction>

	<cffunction name="getInvalidFieldNames" access="public" returntype="string" output="false"
		displayname="Get Invalid Field Names" hint="I return a comma-separated list of the user friendly names of data fields that are invalid in this forum_subscriptions.">
		<cfreturn variables.invalidFieldNames />
	</cffunction>

</cfcomponent>

<!--- 
$Log: forum_subscriptions.cfc,v $
Revision 1.2  2007/06/14 14:01:11  kevin
Initial Open Source Version

Revision 1.4  2005/09/22 08:10:06  kevin
Move checkdate

Revision 1.3  2005/05/20 10:39:17  mike
correct the paths (they were wrong when generated by fusebuilder)

Revision 1.2  2005/05/19 15:11:44  mike
code generated by fusebuilder

Revision 1.1  2005/05/19 15:08:10  mike
new file
 --->
