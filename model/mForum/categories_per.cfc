<!--- $RCSfile: categories_per.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:11 $ --->
<cfcomponent displayname="categories_per" hint="I model a single categories_per object.">

	<cfset variables.instance=structNew()>
	<cfset variables.instance.categoryid="0">
	<cfset variables.instance.userid="0">

	<cffunction name="init" access="public" returntype="categories_per" output="false"
		displayname="categories_per Constructor" hint="I initialize a categories_per.">
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
	<cffunction name="setCategoryid" access="private" returntype="void" output="false" 
		displayname="SetCategoryid" hint="I set the value of categoryid.">
		<cfargument name="categoryid" type="numeric" default="0" />
		<cfset variables.instance.categoryid = arguments.categoryid />
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

	<cffunction name="getInstanceMemento" access="public" returntype="struct" output="false"
		displayname="Get Instance Memento" hint="I return a memento of this categories_per's instance data.">
		<cfreturn variables.instance />
	</cffunction>

	<cffunction name="setInstanceMemento" access="public" returntype="categories_per" output="false"
		displayname="Set Instance Memento" hint="I set this categories_per's instance data from a new memento.">
		<cfargument name="memento" type="struct" required="yes"
			displayname="Memento" hint="I am a memento - a struct containing data." />
		<cfset variables.instance = arguments.memento />
		<cfreturn this />
	</cffunction>

	<cffunction name="validate" access="public" returntype="boolean" output="false"
		displayname="Validate categories_per" hint="I validate all the data fields in this categories_per object.">
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
		<cfelse>
		<!--- Field validated against a table --->
			<cfset ocategories = createObject("component","categories").init()>
			<cftry>
				<cfset stcategories = request.categories_DAO.read(ocategories,variables.instance.categoryid)>
				<cfcatch>
					<cfset valid = false />
					<cfset variables.invalidFields = listAppend(variables.invalidFields,"categoryid") />
					<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Categoryid") />
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
		<cfreturn valid />
	</cffunction>

	<cffunction name="getMissingFields" access="public" returntype="string" output="false"
		displayname="Get Missing Fields" hint="I return a comma-separated list of data fields that are missing from this categories_per.">
		<cfreturn variables.missingFields />
	</cffunction>

	<cffunction name="getMissingFieldNames" access="public" returntype="string" output="false"
		displayname="Get Missing Field Names" hint="I return a comma-separated list of the user friendly names of data fields that are missing from this categories_per.">
		<cfreturn variables.missingFieldNames />
	</cffunction>

	<cffunction name="getInvalidFields" access="public" returntype="string" output="false"
		displayname="Get Invalid Fields" hint="I return a comma-separated list of data fields that are invalid in this categories_per.">
		<cfreturn variables.invalidFields />
	</cffunction>

	<cffunction name="getInvalidFieldNames" access="public" returntype="string" output="false"
		displayname="Get Invalid Field Names" hint="I return a comma-separated list of the user friendly names of data fields that are invalid in this categories_per.">
		<cfreturn variables.invalidFieldNames />
	</cffunction>

</cfcomponent>

<!--- 
$Log: categories_per.cfc,v $
Revision 1.2  2007/06/14 14:01:11  kevin
Initial Open Source Version

Revision 1.5  2005/09/22 08:04:19  kevin
Move checkdate

Revision 1.4  2005/05/11 10:41:15  kevin
Rename from MVC conversion

Revision 1.3  2005/05/10 12:39:05  kevin
Change integer to numeric

Revision 1.2  2005/03/31 14:07:03  kevin
Add CVS Info

Revision 1.1  2005/03/29 09:56:21  mike
Fusebuilder Generated Code

 --->
