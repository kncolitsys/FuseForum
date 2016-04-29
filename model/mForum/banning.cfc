<!--- $RCSfile: banning.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:10 $ --->
<cfcomponent displayname="banning" hint="I model a single banning object.">

	<cfset variables.instance=structNew()>
	<cfset variables.instance.banid="0">
	<cfset variables.instance.bantype="">
	<cfset variables.instance.banstring="">

	<cffunction name="init" access="public" returntype="banning" output="false"
		displayname="banning Constructor" hint="I initialize a banning.">
		<cfargument name="banid" type="numeric" default="0" />
		<cfargument name="bantype" type="string" default="" />
		<cfargument name="banstring" type="string" default="" />
		<cfset variables.instance = structNew() />
		<cfset variables.instance.banid = arguments.banid />
		<cfset variables.instance.bantype = arguments.bantype />
		<cfset variables.instance.banstring = arguments.banstring />
		<cfset variables.missingFields = "" />
		<cfset variables.missingFieldNames = "" />
		<cfset variables.invalidFields = "" />
		<cfset variables.invalidFieldNames = "" />
		<cfreturn this />
	</cffunction>

	<cffunction name="getBanid" access="public" returntype="numeric" output="false" 
		displayname="GetBanid" hint="I return the value of banid.">
		<cfreturn variables.instance.banid />
	</cffunction>
	<cffunction name="setBanid" access="private" returntype="void" output="false" 
		displayname="SetBanid" hint="I set the value of banid.">
		<cfargument name="banid" type="numeric" default="0" />
		<cfset variables.instance.banid = arguments.banid />
	</cffunction>

	<cffunction name="getBantype" access="public" returntype="string" output="false" 
		displayname="GetBantype" hint="I return the value of bantype.">
		<cfreturn variables.instance.bantype />
	</cffunction>
	<cffunction name="setBantype" access="private" returntype="void" output="false" 
		displayname="SetBantype" hint="I set the value of bantype.">
		<cfargument name="bantype" type="string" default="" />
		<cfset variables.instance.bantype = arguments.bantype />
	</cffunction>

	<cffunction name="getBanstring" access="public" returntype="string" output="false" 
		displayname="GetBanstring" hint="I return the value of banstring.">
		<cfreturn variables.instance.banstring />
	</cffunction>
	<cffunction name="setBanstring" access="private" returntype="void" output="false" 
		displayname="SetBanstring" hint="I set the value of banstring.">
		<cfargument name="banstring" type="string" default="" />
		<cfset variables.instance.banstring = arguments.banstring />
	</cffunction>

	<cffunction name="getInstanceMemento" access="public" returntype="struct" output="false"
		displayname="Get Instance Memento" hint="I return a memento of this banning's instance data.">
		<cfreturn variables.instance />
	</cffunction>

	<cffunction name="setInstanceMemento" access="public" returntype="banning" output="false"
		displayname="Set Instance Memento" hint="I set this banning's instance data from a new memento.">
		<cfargument name="memento" type="struct" required="yes"
			displayname="Memento" hint="I am a memento - a struct containing data." />
		<cfset variables.instance = arguments.memento />
		<cfreturn this />
	</cffunction>

	<cffunction name="validate" access="public" returntype="boolean" output="false"
		displayname="Validate banning" hint="I validate all the data fields in this banning object.">
		<cfset var valid = true />
		<cfset variables.missingFields = "" />
		<cfset variables.missingFieldNames = "" />
		<cfset variables.invalidFields = "" />
		<cfset variables.invalidFieldNames = "" />
		<cfinclude template="../../udfs/udf_checkdate.cfm" />

		<!--- Validation for banid --->
		<!--- Primary Key, if present must be a number. --->
		<cfif isDefined("variables.instance.banid") AND NOT isNumeric(variables.instance.banid)>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"banid") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Banid") />
		</cfif>

		<!--- Validation for bantype --->
		<!--- Required String field so it must be defined and non blank. --->
		<cfif (NOT isDefined("variables.instance.bantype")) OR variables.instance.bantype IS "">
			<cfset valid = false />
			<cfset variables.missingFields = listAppend(variables.missingFields,"bantype") />
			<cfset variables.missingFieldNames = listAppend(variables.missingFieldNames,"Bantype") />
		<cfelseif Len(variables.instance.bantype) GT 10>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"bantype") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Bantype") />
		</cfif>

		<!--- Validation for banstring --->
		<!--- Required String field so it must be defined and non blank. --->
		<cfif (NOT isDefined("variables.instance.banstring")) OR variables.instance.banstring IS "">
			<cfset valid = false />
			<cfset variables.missingFields = listAppend(variables.missingFields,"banstring") />
			<cfset variables.missingFieldNames = listAppend(variables.missingFieldNames,"Banstring") />
		<cfelseif Len(variables.instance.banstring) GT 100>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"banstring") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Banstring") />
		</cfif>
		<cfreturn valid />
	</cffunction>

	<cffunction name="getMissingFields" access="public" returntype="string" output="false"
		displayname="Get Missing Fields" hint="I return a comma-separated list of data fields that are missing from this banning.">
		<cfreturn variables.missingFields />
	</cffunction>

	<cffunction name="getMissingFieldNames" access="public" returntype="string" output="false"
		displayname="Get Missing Field Names" hint="I return a comma-separated list of the user friendly names of data fields that are missing from this banning.">
		<cfreturn variables.missingFieldNames />
	</cffunction>

	<cffunction name="getInvalidFields" access="public" returntype="string" output="false"
		displayname="Get Invalid Fields" hint="I return a comma-separated list of data fields that are invalid in this banning.">
		<cfreturn variables.invalidFields />
	</cffunction>

	<cffunction name="getInvalidFieldNames" access="public" returntype="string" output="false"
		displayname="Get Invalid Field Names" hint="I return a comma-separated list of the user friendly names of data fields that are invalid in this banning.">
		<cfreturn variables.invalidFieldNames />
	</cffunction>

</cfcomponent>

<!--- 
$Log: banning.cfc,v $
Revision 1.2  2007/06/14 14:01:10  kevin
Initial Open Source Version

Revision 1.5  2005/09/22 08:04:20  kevin
Move checkdate

Revision 1.4  2005/05/11 10:41:15  kevin
Rename from MVC conversion

Revision 1.3  2005/05/10 12:38:12  kevin
Change integer to numeric

Revision 1.2  2005/03/31 14:07:03  kevin
Add CVS Info

Revision 1.1  2005/03/29 09:56:18  mike
Fusebuilder Generated Code

 --->
