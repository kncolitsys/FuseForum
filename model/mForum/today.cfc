<!--- $RCSfile: today.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:14 $ --->
<cfcomponent displayname="today" hint="I model a single today object.">

	<cfset variables.instance=structNew()>
	<cfset variables.instance.postid="0">
	<cfset variables.instance.posttitle="">
	<cfset variables.instance.post="">
	<cfset variables.instance.postdate="#now()#">
	<cfset variables.instance.dateexpires="#now()#">

	<cffunction name="init" access="public" returntype="today" output="false"
		displayname="today Constructor" hint="I initialize a today.">
		<cfargument name="postid" type="numeric" default="0" />
		<cfargument name="posttitle" type="string" default="" />
		<cfargument name="post" type="string" default="" />
		<cfargument name="postdate" type="date" default="#now()#" />
		<cfargument name="dateexpires" type="date" default="#now()#" />
		<cfset variables.instance = structNew() />
		<cfset variables.instance.postid = arguments.postid />
		<cfset variables.instance.posttitle = arguments.posttitle />
		<cfset variables.instance.post = arguments.post />
		<cfset variables.instance.postdate = arguments.postdate />
		<cfset variables.instance.dateexpires = arguments.dateexpires />
		<cfset variables.missingFields = "" />
		<cfset variables.missingFieldNames = "" />
		<cfset variables.invalidFields = "" />
		<cfset variables.invalidFieldNames = "" />
		<cfreturn this />
	</cffunction>

	<cffunction name="getPostid" access="public" returntype="numeric" output="false" 
		displayname="GetPostid" hint="I return the value of postid.">
		<cfreturn variables.instance.postid />
	</cffunction>
	<cffunction name="setPostid" access="private" returntype="void" output="false" 
		displayname="SetPostid" hint="I set the value of postid.">
		<cfargument name="postid" type="numeric" default="0" />
		<cfset variables.instance.postid = arguments.postid />
	</cffunction>

	<cffunction name="getPosttitle" access="public" returntype="string" output="false" 
		displayname="GetPosttitle" hint="I return the value of posttitle.">
		<cfreturn variables.instance.posttitle />
	</cffunction>
	<cffunction name="setPosttitle" access="public" returntype="void" output="false" 
		displayname="SetPosttitle" hint="I set the value of posttitle.">
		<cfargument name="posttitle" type="string" default="" />
		<cfset variables.instance.posttitle = arguments.posttitle />
	</cffunction>

	<cffunction name="getPost" access="public" returntype="string" output="false" 
		displayname="GetPost" hint="I return the value of post.">
		<cfreturn variables.instance.post />
	</cffunction>
	<cffunction name="setPost" access="public" returntype="void" output="false" 
		displayname="SetPost" hint="I set the value of post.">
		<cfargument name="post" type="string" default="" />
		<cfset variables.instance.post = arguments.post />
	</cffunction>

	<cffunction name="getPostdate" access="public" returntype="date" output="false" 
		displayname="GetPostdate" hint="I return the value of postdate.">
		<cfreturn variables.instance.postdate />
	</cffunction>
	<cffunction name="setPostdate" access="public" returntype="void" output="false" 
		displayname="SetPostdate" hint="I set the value of postdate.">
		<cfargument name="postdate" type="date" default="#now()#" />
		<cfset variables.instance.postdate = arguments.postdate />
	</cffunction>

	<cffunction name="getDateexpires" access="public" returntype="date" output="false" 
		displayname="GetDateexpires" hint="I return the value of dateexpires.">
		<cfreturn variables.instance.dateexpires />
	</cffunction>
	<cffunction name="setDateexpires" access="public" returntype="void" output="false" 
		displayname="SetDateexpires" hint="I set the value of dateexpires.">
		<cfargument name="dateexpires" type="date" default="#now()#" />
		<cfset variables.instance.dateexpires = arguments.dateexpires />
	</cffunction>

	<cffunction name="getInstanceMemento" access="public" returntype="struct" output="false"
		displayname="Get Instance Memento" hint="I return a memento of this today's instance data.">
		<cfreturn variables.instance />
	</cffunction>

	<cffunction name="setInstanceMemento" access="public" returntype="today" output="false"
		displayname="Set Instance Memento" hint="I set this today's instance data from a new memento.">
		<cfargument name="memento" type="struct" required="yes"
			displayname="Memento" hint="I am a memento - a struct containing data." />
		<cfset variables.instance = arguments.memento />
		<cfreturn this />
	</cffunction>

	<cffunction name="validate" access="public" returntype="boolean" output="false"
		displayname="Validate today" hint="I validate all the data fields in this today object.">
		<cfset var valid = true />
		<cfset variables.missingFields = "" />
		<cfset variables.missingFieldNames = "" />
		<cfset variables.invalidFields = "" />
		<cfset variables.invalidFieldNames = "" />
		<cfinclude template="../../udfs/udf_checkdate.cfm" />

		<!--- Validation for postid --->
		<!--- Primary Key, if present must be a number. --->
		<cfif isDefined("variables.instance.postid") AND NOT isNumeric(variables.instance.postid)>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"postid") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Postid") />
		</cfif>

		<!--- Validation for posttitle --->
		<!--- Required String field so it must be defined and non blank. --->
		<cfif (NOT isDefined("variables.instance.posttitle")) OR variables.instance.posttitle IS "">
			<cfset valid = false />
			<cfset variables.missingFields = listAppend(variables.missingFields,"posttitle") />
			<cfset variables.missingFieldNames = listAppend(variables.missingFieldNames,"Posttitle") />
		<cfelseif Len(variables.instance.posttitle) GT 50>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"posttitle") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Posttitle") />
		</cfif>

		<!--- Validation for post --->
		<!--- Optional String Field, check that it does not exceed maximum length. --->
		<cfif isDefined("variables.instance.post") AND Len(variables.instance.post) GT 64000>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"post") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Post") />
		</cfif>

		<!--- Validation for postdate --->
		<!--- Required Date field so it must be defined and non blank and a date. --->
		<cfif (NOT isDefined("variables.instance.postdate")) OR variables.instance.postdate IS "">
			<cfset valid = false />
			<cfset variables.missingFields = listAppend(variables.missingFields,"postdate") />
			<cfset variables.missingFieldNames = listAppend(variables.missingFieldNames,"Postdate") />
		<cfelseif NOT LSisDate(variables.instance.postdate)>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"postdate") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Postdate") />
		</cfif>

		<!--- Validation for dateexpires --->
		<!--- Optional Date field so if available must be a date. --->
		<cfif isDefined("variables.instance.dateexpires") AND variables.instance.dateexpires IS NOT "" AND checkDate(variables.instance.dateexpires) IS "Invalid">
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"dateexpires") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Dateexpires") />
		</cfif>
		<cfreturn valid />
	</cffunction>

	<cffunction name="getMissingFields" access="public" returntype="string" output="false"
		displayname="Get Missing Fields" hint="I return a comma-separated list of data fields that are missing from this today.">
		<cfreturn variables.missingFields />
	</cffunction>

	<cffunction name="getMissingFieldNames" access="public" returntype="string" output="false"
		displayname="Get Missing Field Names" hint="I return a comma-separated list of the user friendly names of data fields that are missing from this today.">
		<cfreturn variables.missingFieldNames />
	</cffunction>

	<cffunction name="getInvalidFields" access="public" returntype="string" output="false"
		displayname="Get Invalid Fields" hint="I return a comma-separated list of data fields that are invalid in this today.">
		<cfreturn variables.invalidFields />
	</cffunction>

	<cffunction name="getInvalidFieldNames" access="public" returntype="string" output="false"
		displayname="Get Invalid Field Names" hint="I return a comma-separated list of the user friendly names of data fields that are invalid in this today.">
		<cfreturn variables.invalidFieldNames />
	</cffunction>

</cfcomponent>

<!--- 
$Log: today.cfc,v $
Revision 1.2  2007/06/14 14:01:14  kevin
Initial Open Source Version

Revision 1.6  2005/09/22 07:59:41  kevin
Move checkdate

Revision 1.5  2005/05/11 10:41:14  kevin
Rename from MVC conversion

Revision 1.4  2005/05/10 12:39:27  kevin
Change integer to numeric

Revision 1.3  2005/04/11 12:32:16  mike
set some methods to access="public", so they can be called from ForumAdminFacade circuit

Revision 1.2  2005/03/31 14:07:04  kevin
Add CVS Info

Revision 1.1  2005/03/29 09:59:56  mike
Fusebuilder Generated Code

 --->
