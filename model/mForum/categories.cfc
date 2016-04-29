<!--- $RCSfile: categories.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:11 $ --->
<cfcomponent displayname="categories" hint="I model a single categories object.">

	<cfset variables.instance=structNew()>
	<cfset variables.instance.categoryid="0">
	<cfset variables.instance.categoryname="">
	<cfset variables.instance.description="">
	<cfset variables.instance.status="">
	<cfset variables.instance.allowattachments="">
	<cfset variables.instance.messagelimit="0">
	<cfset variables.instance.archivedays="0">
	<cfset variables.instance.approval="">
	<cfset variables.instance.readonly="">
	<cfset variables.instance.categoryowner="0">
	<cfset variables.instance.visibleto="">

	<cffunction name="init" access="public" returntype="categories" output="false"
		displayname="categories Constructor" hint="I initialize a categories.">
		<cfargument name="categoryid" type="numeric" default="0" />
		<cfargument name="categoryname" type="string" default="" />
		<cfargument name="description" type="string" default="" />
		<cfargument name="status" type="string" default="" />
		<cfargument name="allowattachments" type="string" default="" />
		<cfargument name="messagelimit" type="numeric" default="0" />
		<cfargument name="archivedays" type="numeric" default="0" />
		<cfargument name="approval" type="string" default="" />
		<cfargument name="readonly" type="string" default="" />
		<cfargument name="categoryowner" type="numeric" default="0" />
		<cfargument name="visibleto" type="string" default="" />
		<cfset variables.instance = structNew() />
		<cfset variables.instance.categoryid = arguments.categoryid />
		<cfset variables.instance.categoryname = arguments.categoryname />
		<cfset variables.instance.description = arguments.description />
		<cfset variables.instance.status = arguments.status />
		<cfset variables.instance.allowattachments = arguments.allowattachments />
		<cfset variables.instance.messagelimit = arguments.messagelimit />
		<cfset variables.instance.archivedays = arguments.archivedays />
		<cfset variables.instance.approval = arguments.approval />
		<cfset variables.instance.readonly = arguments.readonly />
		<cfset variables.instance.categoryowner = arguments.categoryowner />
		<cfset variables.instance.visibleto = arguments.visibleto />
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

	<cffunction name="getCategoryname" access="public" returntype="string" output="false" 
		displayname="GetCategoryname" hint="I return the value of categoryname.">
		<cfreturn variables.instance.categoryname />
	</cffunction>
	<cffunction name="setCategoryname" access="public" returntype="void" output="false" 
		displayname="SetCategoryname" hint="I set the value of categoryname.">
		<cfargument name="categoryname" type="string" default="" />
		<cfset variables.instance.categoryname = arguments.categoryname />
	</cffunction>

	<cffunction name="getDescription" access="public" returntype="string" output="false" 
		displayname="GetDescription" hint="I return the value of description.">
		<cfreturn variables.instance.description />
	</cffunction>
	<cffunction name="setDescription" access="public" returntype="void" output="false" 
		displayname="SetDescription" hint="I set the value of description.">
		<cfargument name="description" type="string" default="" />
		<cfset variables.instance.description = arguments.description />
	</cffunction>

	<cffunction name="getStatus" access="public" returntype="string" output="false" 
		displayname="GetStatus" hint="I return the value of status.">
		<cfreturn variables.instance.status />
	</cffunction>
	<cffunction name="setStatus" access="public" returntype="void" output="false" 
		displayname="SetStatus" hint="I set the value of status.">
		<cfargument name="status" type="string" default="" />
		<cfset variables.instance.status = arguments.status />
	</cffunction>

	<cffunction name="getAllowattachments" access="public" returntype="string" output="false" 
		displayname="GetAllowattachments" hint="I return the value of allowattachments.">
		<cfreturn variables.instance.allowattachments />
	</cffunction>
	<cffunction name="setAllowattachments" access="public" returntype="void" output="false" 
		displayname="SetAllowattachments" hint="I set the value of allowattachments.">
		<cfargument name="allowattachments" type="string" default="" />
		<cfset variables.instance.allowattachments = arguments.allowattachments />
	</cffunction>

	<cffunction name="getMessagelimit" access="public" returntype="numeric" output="false" 
		displayname="GetMessagelimit" hint="I return the value of messagelimit.">
		<cfreturn variables.instance.messagelimit />
	</cffunction>
	<cffunction name="setMessagelimit" access="public" returntype="void" output="false" 
		displayname="SetMessagelimit" hint="I set the value of messagelimit.">
		<cfargument name="messagelimit" type="numeric" default="0" />
		<cfset variables.instance.messagelimit = arguments.messagelimit />
	</cffunction>

	<cffunction name="getArchivedays" access="public" returntype="numeric" output="false" 
		displayname="GetArchivedays" hint="I return the value of archivedays.">
		<cfreturn variables.instance.archivedays />
	</cffunction>
	<cffunction name="setArchivedays" access="public" returntype="void" output="false" 
		displayname="SetArchivedays" hint="I set the value of archivedays.">
		<cfargument name="archivedays" type="numeric" default="0" />
		<cfset variables.instance.archivedays = arguments.archivedays />
	</cffunction>

	<cffunction name="getApproval" access="public" returntype="string" output="false" 
		displayname="GetApproval" hint="I return the value of approval.">
		<cfreturn variables.instance.approval />
	</cffunction>
	<cffunction name="setApproval" access="public" returntype="void" output="false" 
		displayname="SetApproval" hint="I set the value of approval.">
		<cfargument name="approval" type="string" default="" />
		<cfset variables.instance.approval = arguments.approval />
	</cffunction>

	<cffunction name="getReadonly" access="public" returntype="string" output="false" 
		displayname="GetReadonly" hint="I return the value of readonly.">
		<cfreturn variables.instance.readonly />
	</cffunction>
	<cffunction name="setReadonly" access="public" returntype="void" output="false" 
		displayname="SetReadonly" hint="I set the value of readonly.">
		<cfargument name="readonly" type="string" default="" />
		<cfset variables.instance.readonly = arguments.readonly />
	</cffunction>

	<cffunction name="getCategoryowner" access="public" returntype="numeric" output="false" 
		displayname="GetCategoryowner" hint="I return the value of categoryowner.">
		<cfreturn variables.instance.categoryowner />
	</cffunction>
	<cffunction name="setCategoryowner" access="private" returntype="void" output="false" 
		displayname="SetCategoryowner" hint="I set the value of categoryowner.">
		<cfargument name="categoryowner" type="numeric" default="0" />
		<cfset variables.instance.categoryowner = arguments.categoryowner />
	</cffunction>

	<cffunction name="getVisibleto" access="public" returntype="string" output="false" 
		displayname="GetVisibleto" hint="I return the value of visibleto.">
		<cfreturn variables.instance.visibleto />
	</cffunction>
	<cffunction name="setVisibleto" access="public" returntype="void" output="false" 
		displayname="SetVisibleto" hint="I set the value of visibleto.">
		<cfargument name="visibleto" type="string" default="" />
		<cfset variables.instance.visibleto = arguments.visibleto />
	</cffunction>

	<cffunction name="getInstanceMemento" access="public" returntype="struct" output="false"
		displayname="Get Instance Memento" hint="I return a memento of this categories's instance data.">
		<cfreturn variables.instance />
	</cffunction>

	<cffunction name="setInstanceMemento" access="public" returntype="categories" output="false"
		displayname="Set Instance Memento" hint="I set this categories's instance data from a new memento.">
		<cfargument name="memento" type="struct" required="yes"
			displayname="Memento" hint="I am a memento - a struct containing data." />
		<cfset variables.instance = arguments.memento />
		<cfreturn this />
	</cffunction>

	<cffunction name="validate" access="public" returntype="boolean" output="false"
		displayname="Validate categories" hint="I validate all the data fields in this categories object.">
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

		<!--- Validation for categoryname --->
		<!--- Required String field so it must be defined and non blank. --->
		<cfif (NOT isDefined("variables.instance.categoryname")) OR variables.instance.categoryname IS "">
			<cfset valid = false />
			<cfset variables.missingFields = listAppend(variables.missingFields,"categoryname") />
			<cfset variables.missingFieldNames = listAppend(variables.missingFieldNames,"Categoryname") />
		<cfelseif Len(variables.instance.categoryname) GT 50>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"categoryname") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Categoryname") />
		</cfif>

		<!--- Validation for description --->
		<!--- Optional String Field, check that it does not exceed maximum length. --->
		<cfif isDefined("variables.instance.description") AND Len(variables.instance.description) GT 100>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"description") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Description") />
		</cfif>

		<!--- Validation for status --->
		<!--- Optional String Field, check that it does not exceed maximum length. --->
		<cfif isDefined("variables.instance.status") AND Len(variables.instance.status) GT 50>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"status") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Status") />
		</cfif>

		<!--- Validation for allowattachments --->

		<!--- Validation for messagelimit --->
		<!--- Optional Numeric field so if available must be a number. --->
		<cfif isDefined("variables.instance.messagelimit") AND variables.instance.messagelimit IS NOT "" AND NOT isNumeric(variables.instance.messagelimit)>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"messagelimit") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Messagelimit") />
		</cfif>

		<!--- Validation for archivedays --->
		<!--- Optional Numeric field so if available must be a number. --->
		<cfif isDefined("variables.instance.archivedays") AND variables.instance.archivedays IS NOT "" AND NOT isNumeric(variables.instance.archivedays)>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"archivedays") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Archivedays") />
		</cfif>

		<!--- Validation for approval --->

		<!--- Validation for readonly --->

		<!--- Validation for categoryowner --->
		<!--- Optional Numeric field so if available must be a number. --->
		<cfif isDefined("variables.instance.categoryowner") AND variables.instance.categoryowner IS NOT "" AND NOT isNumeric(variables.instance.categoryowner)>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"categoryowner") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Categoryowner") />
		</cfif>

		<!--- Validation for visibleto --->
		<!--- Optional String Field, check that it does not exceed maximum length. --->
		<cfif isDefined("variables.instance.visibleto") AND Len(variables.instance.visibleto) GT 15>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"visibleto") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Visibleto") />
		</cfif>
		<cfreturn valid />
	</cffunction>

	<cffunction name="getMissingFields" access="public" returntype="string" output="false"
		displayname="Get Missing Fields" hint="I return a comma-separated list of data fields that are missing from this categories.">
		<cfreturn variables.missingFields />
	</cffunction>

	<cffunction name="getMissingFieldNames" access="public" returntype="string" output="false"
		displayname="Get Missing Field Names" hint="I return a comma-separated list of the user friendly names of data fields that are missing from this categories.">
		<cfreturn variables.missingFieldNames />
	</cffunction>

	<cffunction name="getInvalidFields" access="public" returntype="string" output="false"
		displayname="Get Invalid Fields" hint="I return a comma-separated list of data fields that are invalid in this categories.">
		<cfreturn variables.invalidFields />
	</cffunction>

	<cffunction name="getInvalidFieldNames" access="public" returntype="string" output="false"
		displayname="Get Invalid Field Names" hint="I return a comma-separated list of the user friendly names of data fields that are invalid in this categories.">
		<cfreturn variables.invalidFieldNames />
	</cffunction>

</cfcomponent>

<!--- 
$Log: categories.cfc,v $
Revision 1.2  2007/06/14 14:01:11  kevin
Initial Open Source Version

Revision 1.7  2005/09/22 08:04:20  kevin
Move checkdate

Revision 1.6  2005/05/11 10:41:15  kevin
Rename from MVC conversion

Revision 1.5  2005/05/10 12:38:34  kevin
Change integer to numeric

Revision 1.4  2005/04/20 11:43:14  mike
handle the new field archivedays

Revision 1.3  2005/04/11 12:32:14  mike
set some methods to access="public", so they can be called from ForumAdminFacade circuit

Revision 1.2  2005/03/31 14:07:03  kevin
Add CVS Info

Revision 1.1  2005/03/29 09:56:18  mike
Fusebuilder Generated Code

 --->
