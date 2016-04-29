<!--- $RCSfile: userlevels.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:14 $ --->
<cfcomponent displayname="userlevels" hint="I model a single userlevels object.">

	<cfset variables.instance=structNew()>
	<cfset variables.instance.userlevelid="0">
	<cfset variables.instance.userlevel="">

	<cffunction name="init" access="public" returntype="userlevels" output="false"
		displayname="userlevels Constructor" hint="I initialize a userlevels.">
		<cfargument name="userlevelid" type="numeric" default="0" />
		<cfargument name="userlevel" type="string" default="" />
		<cfset variables.instance = structNew() />
		<cfset variables.instance.userlevelid = arguments.userlevelid />
		<cfset variables.instance.userlevel = arguments.userlevel />
		<cfset variables.missingFields = "" />
		<cfset variables.missingFieldNames = "" />
		<cfset variables.invalidFields = "" />
		<cfset variables.invalidFieldNames = "" />
		<cfreturn this />
	</cffunction>

	<cffunction name="getUserlevelid" access="public" returntype="numeric" output="false" 
		displayname="GetUserlevelid" hint="I return the value of userlevelid.">
		<cfreturn variables.instance.userlevelid />
	</cffunction>
	<cffunction name="setUserlevelid" access="private" returntype="void" output="false" 
		displayname="SetUserlevelid" hint="I set the value of userlevelid.">
		<cfargument name="userlevelid" type="numeric" default="0" />
		<cfset variables.instance.userlevelid = arguments.userlevelid />
	</cffunction>

	<cffunction name="getUserlevel" access="public" returntype="string" output="false" 
		displayname="GetUserlevel" hint="I return the value of userlevel.">
		<cfreturn variables.instance.userlevel />
	</cffunction>
	<cffunction name="setUserlevel" access="private" returntype="void" output="false" 
		displayname="SetUserlevel" hint="I set the value of userlevel.">
		<cfargument name="userlevel" type="string" default="" />
		<cfset variables.instance.userlevel = arguments.userlevel />
	</cffunction>

	<cffunction name="getInstanceMemento" access="public" returntype="struct" output="false"
		displayname="Get Instance Memento" hint="I return a memento of this userlevels's instance data.">
		<cfreturn variables.instance />
	</cffunction>

	<cffunction name="setInstanceMemento" access="public" returntype="userlevels" output="false"
		displayname="Set Instance Memento" hint="I set this userlevels's instance data from a new memento.">
		<cfargument name="memento" type="struct" required="yes"
			displayname="Memento" hint="I am a memento - a struct containing data." />
		<cfset variables.instance = arguments.memento />
		<cfreturn this />
	</cffunction>

	<cffunction name="validate" access="public" returntype="boolean" output="false"
		displayname="Validate userlevels" hint="I validate all the data fields in this userlevels object.">
		<cfset var valid = true />
		<cfset variables.missingFields = "" />
		<cfset variables.missingFieldNames = "" />
		<cfset variables.invalidFields = "" />
		<cfset variables.invalidFieldNames = "" />
		<cfinclude template="../../udfs/udf_checkdate.cfm" />

		<!--- Validation for userlevelid --->
		<!--- Primary Key, if present must be a number. --->
		<cfif isDefined("variables.instance.userlevelid") AND NOT isNumeric(variables.instance.userlevelid)>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"userlevelid") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Userlevelid") />
		</cfif>

		<!--- Validation for userlevel --->
		<!--- Required String field so it must be defined and non blank. --->
		<cfif (NOT isDefined("variables.instance.userlevel")) OR variables.instance.userlevel IS "">
			<cfset valid = false />
			<cfset variables.missingFields = listAppend(variables.missingFields,"userlevel") />
			<cfset variables.missingFieldNames = listAppend(variables.missingFieldNames,"Userlevel") />
		<cfelseif Len(variables.instance.userlevel) GT 50>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"userlevel") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Userlevel") />
		</cfif>
		<cfreturn valid />
	</cffunction>

	<cffunction name="getMissingFields" access="public" returntype="string" output="false"
		displayname="Get Missing Fields" hint="I return a comma-separated list of data fields that are missing from this userlevels.">
		<cfreturn variables.missingFields />
	</cffunction>

	<cffunction name="getMissingFieldNames" access="public" returntype="string" output="false"
		displayname="Get Missing Field Names" hint="I return a comma-separated list of the user friendly names of data fields that are missing from this userlevels.">
		<cfreturn variables.missingFieldNames />
	</cffunction>

	<cffunction name="getInvalidFields" access="public" returntype="string" output="false"
		displayname="Get Invalid Fields" hint="I return a comma-separated list of data fields that are invalid in this userlevels.">
		<cfreturn variables.invalidFields />
	</cffunction>

	<cffunction name="getInvalidFieldNames" access="public" returntype="string" output="false"
		displayname="Get Invalid Field Names" hint="I return a comma-separated list of the user friendly names of data fields that are invalid in this userlevels.">
		<cfreturn variables.invalidFieldNames />
	</cffunction>

</cfcomponent>

<!--- 
$Log: userlevels.cfc,v $
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

Revision 1.1  2005/03/29 09:59:59  mike
Fusebuilder Generated Code

 --->
