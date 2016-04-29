
<cfcomponent displayname="SiteCategories" hint="I model a single SiteCategories object.">

	<cfset variables.instance=structNew()>
	<cfset variables.instance.SiteCategoriesId="0">
	<cfset variables.instance.SiteId="0">
	<cfset variables.instance.CategoryId="0">
	<cfset variables.instance.Sequence="0">

	<cffunction name="init" access="public" returntype="SiteCategories" output="false"
		displayname="SiteCategories Constructor" hint="I initialize a SiteCategories.">
		<cfargument name="SiteCategoriesId" type="numeric" default="0" />
		<cfargument name="SiteId" type="numeric" default="0" />
		<cfargument name="CategoryId" type="numeric" default="0" />
		<cfargument name="Sequence" type="numeric" default="0" />
		<cfset variables.instance = structNew() />
		<cfset variables.instance.SiteCategoriesId = arguments.SiteCategoriesId />
		<cfset variables.instance.SiteId = arguments.SiteId />
		<cfset variables.instance.CategoryId = arguments.CategoryId />
		<cfset variables.instance.Sequence = arguments.Sequence />
		<cfset variables.missingFields = "" />
		<cfset variables.missingFieldNames = "" />
		<cfset variables.invalidFields = "" />
		<cfset variables.invalidFieldNames = "" />
		<cfreturn this />
	</cffunction>

	<cffunction name="getSitecategoriesid" access="public" returntype="numeric" output="false" 
		displayname="GetSitecategoriesid" hint="I return the value of SiteCategoriesId.">
		<cfreturn variables.instance.SiteCategoriesId />
	</cffunction>
	<cffunction name="setSitecategoriesid" access="private" returntype="void" output="false" 
		displayname="SetSitecategoriesid" hint="I set the value of SiteCategoriesId.">
		<cfargument name="SiteCategoriesId" type="numeric" default="0" />
		<cfset variables.instance.SiteCategoriesId = arguments.SiteCategoriesId />
	</cffunction>

	<cffunction name="getSiteid" access="public" returntype="numeric" output="false" 
		displayname="GetSiteid" hint="I return the value of SiteId.">
		<cfreturn variables.instance.SiteId />
	</cffunction>
	<cffunction name="setSiteid" access="private" returntype="void" output="false" 
		displayname="SetSiteid" hint="I set the value of SiteId.">
		<cfargument name="SiteId" type="numeric" default="0" />
		<cfset variables.instance.SiteId = arguments.SiteId />
	</cffunction>

	<cffunction name="getCategoryid" access="public" returntype="numeric" output="false" 
		displayname="GetCategoryid" hint="I return the value of CategoryId.">
		<cfreturn variables.instance.CategoryId />
	</cffunction>
	<cffunction name="setCategoryid" access="private" returntype="void" output="false" 
		displayname="SetCategoryid" hint="I set the value of CategoryId.">
		<cfargument name="CategoryId" type="numeric" default="0" />
		<cfset variables.instance.CategoryId = arguments.CategoryId />
	</cffunction>

	<cffunction name="getSequence" access="public" returntype="numeric" output="false" 
		displayname="GetSequence" hint="I return the value of Sequence.">
		<cfreturn variables.instance.Sequence />
	</cffunction>
	<cffunction name="setSequence" access="private" returntype="void" output="false" 
		displayname="SetSequence" hint="I set the value of Sequence.">
		<cfargument name="Sequence" type="numeric" default="0" />
		<cfset variables.instance.Sequence = arguments.Sequence />
	</cffunction>

	<cffunction name="getInstanceMemento" access="public" returntype="struct" output="false"
		displayname="Get Instance Memento" hint="I return a memento of this SiteCategories's instance data.">
		<cfreturn variables.instance />
	</cffunction>

	<cffunction name="setInstanceMemento" access="public" returntype="SiteCategories" output="false"
		displayname="Set Instance Memento" hint="I set this SiteCategories's instance data from a new memento.">
		<cfargument name="memento" type="struct" required="yes"
			displayname="Memento" hint="I am a memento - a struct containing data." />
		<cfset variables.instance = arguments.memento />
		<cfreturn this />
	</cffunction>

	<cffunction name="validate" access="public" returntype="boolean" output="false"
		displayname="Validate SiteCategories" hint="I validate all the data fields in this SiteCategories object.">
		<cfset var valid = true />
		<cfset variables.missingFields = "" />
		<cfset variables.missingFieldNames = "" />
		<cfset variables.invalidFields = "" />
		<cfset variables.invalidFieldNames = "" />
		<cfinclude template="../../udfs/udf_checkdate.cfm" />

		<!--- Validation for SiteCategoriesId --->
		<!--- Primary Key, if present must be a number. --->
		<cfif isDefined("variables.instance.SiteCategoriesId") AND NOT isNumeric(variables.instance.SiteCategoriesId)>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"SiteCategoriesId") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Sitecategoriesid") />
		</cfif>

		<!--- Validation for SiteId --->
		<!--- Required Numeric field so it must be defined and a number. --->
		<cfif (NOT isDefined("variables.instance.SiteId"))>
			<cfset valid = false />
			<cfset variables.missingFields = listAppend(variables.missingFields,"SiteId") />
			<cfset variables.missingFieldNames = listAppend(variables.missingFieldNames,"Siteid") />
		<cfelseif NOT isNumeric(variables.instance.SiteId)>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"SiteId") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Siteid") />
		</cfif>

		<!--- Validation for CategoryId --->
		<!--- Required Numeric field so it must be defined and a number. --->
		<cfif (NOT isDefined("variables.instance.CategoryId"))>
			<cfset valid = false />
			<cfset variables.missingFields = listAppend(variables.missingFields,"CategoryId") />
			<cfset variables.missingFieldNames = listAppend(variables.missingFieldNames,"Categoryid") />
		<cfelseif NOT isNumeric(variables.instance.CategoryId)>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"CategoryId") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Categoryid") />
		</cfif>

		<!--- Validation for Sequence --->
		<!--- Required Numeric field so it must be defined and a number. --->
		<cfif (NOT isDefined("variables.instance.Sequence"))>
			<cfset valid = false />
			<cfset variables.missingFields = listAppend(variables.missingFields,"Sequence") />
			<cfset variables.missingFieldNames = listAppend(variables.missingFieldNames,"Sequence") />
		<cfelseif NOT isNumeric(variables.instance.Sequence)>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"Sequence") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Sequence") />
		</cfif>
		<cfreturn valid />
	</cffunction>

	<cffunction name="getMissingFields" access="public" returntype="string" output="false"
		displayname="Get Missing Fields" hint="I return a comma-separated list of data fields that are missing from this SiteCategories.">
		<cfreturn variables.missingFields />
	</cffunction>

	<cffunction name="getMissingFieldNames" access="public" returntype="string" output="false"
		displayname="Get Missing Field Names" hint="I return a comma-separated list of the user friendly names of data fields that are missing from this SiteCategories.">
		<cfreturn variables.missingFieldNames />
	</cffunction>

	<cffunction name="getInvalidFields" access="public" returntype="string" output="false"
		displayname="Get Invalid Fields" hint="I return a comma-separated list of data fields that are invalid in this SiteCategories.">
		<cfreturn variables.invalidFields />
	</cffunction>

	<cffunction name="getInvalidFieldNames" access="public" returntype="string" output="false"
		displayname="Get Invalid Field Names" hint="I return a comma-separated list of the user friendly names of data fields that are invalid in this SiteCategories.">
		<cfreturn variables.invalidFieldNames />
	</cffunction>

</cfcomponent>

<!--- 
$Log: SiteCategories.cfc,v $
Revision 1.2  2007/06/14 14:01:14  kevin
Initial Open Source Version

Revision 1.4  2005/09/22 07:59:41  kevin
Move checkdate

Revision 1.3  2005/05/11 10:41:14  kevin
Rename from MVC conversion

Revision 1.2  2005/05/10 12:39:27  kevin
Change integer to numeric

Revision 1.1  2005/04/22 17:23:49  mike
Fusebuilder Generated Code, modified a bit

 --->
