<!--- $RCSfile: vulgarity.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:14 $ --->
<cfcomponent displayname="vulgarity" hint="I model a single vulgarity object.">

	<cfset variables.instance=structNew()>
	<cfset variables.instance.vulgarityid="0">
	<cfset variables.instance.vulgarity="">

	<cffunction name="init" access="public" returntype="vulgarity" output="false"
		displayname="vulgarity Constructor" hint="I initialize a vulgarity.">
		<cfargument name="vulgarityid" type="numeric" default="0" />
		<cfargument name="vulgarity" type="string" default="" />
		<cfset variables.instance = structNew() />
		<cfset variables.instance.vulgarityid = arguments.vulgarityid />
		<cfset variables.instance.vulgarity = arguments.vulgarity />
		<cfset variables.missingFields = "" />
		<cfset variables.missingFieldNames = "" />
		<cfset variables.invalidFields = "" />
		<cfset variables.invalidFieldNames = "" />
		<cfreturn this />
	</cffunction>

	<cffunction name="getVulgarityid" access="public" returntype="numeric" output="false" 
		displayname="GetVulgarityid" hint="I return the value of vulgarityid.">
		<cfreturn variables.instance.vulgarityid />
	</cffunction>
	<cffunction name="setVulgarityid" access="private" returntype="void" output="false" 
		displayname="SetVulgarityid" hint="I set the value of vulgarityid.">
		<cfargument name="vulgarityid" type="numeric" default="0" />
		<cfset variables.instance.vulgarityid = arguments.vulgarityid />
	</cffunction>

	<cffunction name="getVulgarity" access="public" returntype="string" output="false" 
		displayname="GetVulgarity" hint="I return the value of vulgarity.">
		<cfreturn variables.instance.vulgarity />
	</cffunction>
	<cffunction name="setVulgarity" access="private" returntype="void" output="false" 
		displayname="SetVulgarity" hint="I set the value of vulgarity.">
		<cfargument name="vulgarity" type="string" default="" />
		<cfset variables.instance.vulgarity = arguments.vulgarity />
	</cffunction>

	<cffunction name="getInstanceMemento" access="public" returntype="struct" output="false"
		displayname="Get Instance Memento" hint="I return a memento of this vulgarity's instance data.">
		<cfreturn variables.instance />
	</cffunction>

	<cffunction name="setInstanceMemento" access="public" returntype="vulgarity" output="false"
		displayname="Set Instance Memento" hint="I set this vulgarity's instance data from a new memento.">
		<cfargument name="memento" type="struct" required="yes"
			displayname="Memento" hint="I am a memento - a struct containing data." />
		<cfset variables.instance = arguments.memento />
		<cfreturn this />
	</cffunction>

	<cffunction name="validate" access="public" returntype="boolean" output="false"
		displayname="Validate vulgarity" hint="I validate all the data fields in this vulgarity object.">
		<cfset var valid = true />
		<cfset variables.missingFields = "" />
		<cfset variables.missingFieldNames = "" />
		<cfset variables.invalidFields = "" />
		<cfset variables.invalidFieldNames = "" />
		<cfinclude template="../../udfs/udf_checkdate.cfm" />

		<!--- Validation for vulgarityid --->
		<!--- Primary Key, if present must be a number. --->
		<cfif isDefined("variables.instance.vulgarityid") AND NOT isNumeric(variables.instance.vulgarityid)>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"vulgarityid") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Vulgarityid") />
		</cfif>

		<!--- Validation for vulgarity --->
		<!--- Required String field so it must be defined and non blank. --->
		<cfif (NOT isDefined("variables.instance.vulgarity")) OR variables.instance.vulgarity IS "">
			<cfset valid = false />
			<cfset variables.missingFields = listAppend(variables.missingFields,"vulgarity") />
			<cfset variables.missingFieldNames = listAppend(variables.missingFieldNames,"Vulgarity") />
		<cfelseif Len(variables.instance.vulgarity) GT 30>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"vulgarity") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Vulgarity") />
		</cfif>
		<cfreturn valid />
	</cffunction>

	<cffunction name="getMissingFields" access="public" returntype="string" output="false"
		displayname="Get Missing Fields" hint="I return a comma-separated list of data fields that are missing from this vulgarity.">
		<cfreturn variables.missingFields />
	</cffunction>

	<cffunction name="getMissingFieldNames" access="public" returntype="string" output="false"
		displayname="Get Missing Field Names" hint="I return a comma-separated list of the user friendly names of data fields that are missing from this vulgarity.">
		<cfreturn variables.missingFieldNames />
	</cffunction>

	<cffunction name="getInvalidFields" access="public" returntype="string" output="false"
		displayname="Get Invalid Fields" hint="I return a comma-separated list of data fields that are invalid in this vulgarity.">
		<cfreturn variables.invalidFields />
	</cffunction>

	<cffunction name="getInvalidFieldNames" access="public" returntype="string" output="false"
		displayname="Get Invalid Field Names" hint="I return a comma-separated list of the user friendly names of data fields that are invalid in this vulgarity.">
		<cfreturn variables.invalidFieldNames />
	</cffunction>

</cfcomponent>

<!--- 
$Log: vulgarity.cfc,v $
Revision 1.2  2007/06/14 14:01:14  kevin
Initial Open Source Version

Revision 1.5  2005/09/22 07:58:59  kevin
Move checkdate

Revision 1.4  2005/05/11 10:41:15  kevin
Rename from MVC conversion

Revision 1.3  2005/05/10 12:39:27  kevin
Change integer to numeric

Revision 1.2  2005/03/31 14:07:04  kevin
Add CVS Info

Revision 1.1  2005/03/29 10:00:03  mike
Fusebuilder Generated Code

 --->
