<!--- $RCSfile: categories_mod.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:11 $ --->
<cfcomponent displayname="categories_mod" hint="I model a single categories_mod object.">

	<cfset variables.instance=structNew()>
	<cfset variables.instance.categoryid="0">
	<cfset variables.instance.userid="0">

	<cffunction name="init" access="public" returntype="categories_mod" output="false"
		displayname="categories_mod Constructor" hint="I initialize a categories_mod.">
		<cfargument name="categoryid" type="numeric" default="0" />
		<cfargument name="userid" type="numeric" default="0" />
		<cfset variables.instance = structNew() />
		<cfset variables.instance.categoryid = arguments.categoryid />
		<cfset variables.instance.userid = arguments.userid />
		<cfset variables.missingFields = "" />
		<cfset variables.missingFieldNames = "" />
		<cfset variables.invalidFields = "" />
		<cfset variables.invalidFieldNames = "" />
		<cfreturn this />
	</cffunction>

	<cffunction name="getCategoryid" access="public" returntype="numeric" output="false" 
		displayname="GetCategoryid" hint="I return the value of categoryid.">
		<cfreturn variables.instance.categoryid />
	</cffunction>
	<cffunction name="setCategoryid" access="public" returntype="void" output="false" 
		displayname="SetCategoryid" hint="I set the value of categoryid.">
		<cfargument name="categoryid" type="numeric" default="0" />
		<cfset variables.instance.categoryid = arguments.categoryid />
	</cffunction>

	<cffunction name="getUserid" access="public" returntype="numeric" output="false" 
		displayname="GetUserid" hint="I return the value of userid.">
		<cfreturn variables.instance.userid />
	</cffunction>
	<cffunction name="setUserid" access="public" returntype="void" output="false" 
		displayname="SetUserid" hint="I set the value of userid.">
		<cfargument name="userid" type="numeric" default="0" />
		<cfset variables.instance.userid = arguments.userid />
	</cffunction>

	<cffunction name="getInstanceMemento" access="public" returntype="struct" output="false"
		displayname="Get Instance Memento" hint="I return a memento of this categories_mod's instance data.">
		<cfreturn variables.instance />
	</cffunction>

	<cffunction name="setInstanceMemento" access="public" returntype="categories_mod" output="false"
		displayname="Set Instance Memento" hint="I set this categories_mod's instance data from a new memento.">
		<cfargument name="memento" type="struct" required="yes"
			displayname="Memento" hint="I am a memento - a struct containing data." />
		<cfset variables.instance = arguments.memento />
		<cfreturn this />
	</cffunction>

	<cffunction name="validate" access="public" returntype="boolean" output="false"
		displayname="Validate categories_mod" hint="I validate all the data fields in this categories_mod object.">
		<cfset var valid = true />
		<cfset variables.missingFields = "" />
		<cfset variables.missingFieldNames = "" />
		<cfset variables.invalidFields = "" />
		<cfset variables.invalidFieldNames = "" />
		<cfinclude template="../../udfs/udf_checkdate.cfm" />

		<!--- Validation for categoryid --->
		<!--- Primary Key, if present must be a number. --->
		<cfif isDefined("variables.instance.categoryid") AND NOT isNumeric(variables.instance.categoryid)>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"categoryid") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Categoryid") />
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
		<cfreturn valid />
	</cffunction>

	<cffunction name="getMissingFields" access="public" returntype="string" output="false"
		displayname="Get Missing Fields" hint="I return a comma-separated list of data fields that are missing from this categories_mod.">
		<cfreturn variables.missingFields />
	</cffunction>

	<cffunction name="getMissingFieldNames" access="public" returntype="string" output="false"
		displayname="Get Missing Field Names" hint="I return a comma-separated list of the user friendly names of data fields that are missing from this categories_mod.">
		<cfreturn variables.missingFieldNames />
	</cffunction>

	<cffunction name="getInvalidFields" access="public" returntype="string" output="false"
		displayname="Get Invalid Fields" hint="I return a comma-separated list of data fields that are invalid in this categories_mod.">
		<cfreturn variables.invalidFields />
	</cffunction>

	<cffunction name="getInvalidFieldNames" access="public" returntype="string" output="false"
		displayname="Get Invalid Field Names" hint="I return a comma-separated list of the user friendly names of data fields that are invalid in this categories_mod.">
		<cfreturn variables.invalidFieldNames />
	</cffunction>

</cfcomponent>

<!--- 
$Log: categories_mod.cfc,v $
Revision 1.2  2007/06/14 14:01:11  kevin
Initial Open Source Version

Revision 1.6  2005/09/22 08:04:20  kevin
Move checkdate

Revision 1.5  2005/05/11 10:41:15  kevin
Rename from MVC conversion

Revision 1.4  2005/05/10 12:38:45  kevin
Change integer to numeric

Revision 1.3  2005/04/11 12:32:14  mike
set some methods to access="public", so they can be called from ForumAdminFacade circuit

Revision 1.2  2005/03/31 14:07:03  kevin
Add CVS Info

Revision 1.1  2005/03/29 09:56:21  mike
Fusebuilder Generated Code

 --->
