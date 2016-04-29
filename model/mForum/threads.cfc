<!--- $RCSfile: threads.cfc,v $ $Revision: 1.2 $ $Author: kevin $ $Date: 2007/06/14 14:01:14 $ --->
<cfcomponent displayname="threads" hint="I model a single threads object.">

	<cfset variables.instance=structNew()>
	<cfset variables.instance.threadid="0">
	<cfset variables.instance.threadname="">
	<cfset variables.instance.datecreated="#now()#">
	<cfset variables.instance.userid="0">
	<cfset variables.instance.categoryid="0">
	<cfset variables.instance.messagecount="0">
	<cfset variables.instance.datelastpost="#now()#">
	<cfset variables.instance.approved="">
	<cfset variables.instance.locked="">
	<cfset variables.instance.archived="">

	<cffunction name="init" access="public" returntype="threads" output="false"
		displayname="threads Constructor" hint="I initialize a threads.">
		<cfargument name="threadid" type="numeric" default="0" />
		<cfargument name="threadname" type="string" default="" />
		<cfargument name="datecreated" type="date" default="#now()#" />
		<cfargument name="userid" type="numeric" default="0" />
		<cfargument name="categoryid" type="numeric" default="0" />
		<cfargument name="messagecount" type="numeric" default="0" />
		<cfargument name="datelastpost" type="date" default="#now()#" />
		<cfargument name="approved" type="string" default="" />
		<cfargument name="locked" type="string" default="" />
		<cfargument name="archived" type="string" default="" />
		<cfset variables.instance = structNew() />
		<cfset variables.instance.threadid = arguments.threadid />
		<cfset variables.instance.threadname = arguments.threadname />
		<cfset variables.instance.datecreated = arguments.datecreated />
		<cfset variables.instance.userid = arguments.userid />
		<cfset variables.instance.categoryid = arguments.categoryid />
		<cfset variables.instance.messagecount = arguments.messagecount />
		<cfset variables.instance.datelastpost = arguments.datelastpost />
		<cfset variables.instance.approved = arguments.approved />
		<cfset variables.instance.locked = arguments.locked />
		<cfset variables.instance.archived = arguments.archived />
		<cfset variables.missingFields = "" />
		<cfset variables.missingFieldNames = "" />
		<cfset variables.invalidFields = "" />
		<cfset variables.invalidFieldNames = "" />
		<cfreturn this />
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

	<cffunction name="getThreadname" access="public" returntype="string" output="false" 
		displayname="GetThreadname" hint="I return the value of threadname.">
		<cfreturn variables.instance.threadname />
	</cffunction>
	<cffunction name="setThreadname" access="public" returntype="void" output="false" 
		displayname="SetThreadname" hint="I set the value of threadname.">
		<cfargument name="threadname" type="string" default="" />
		<cfset variables.instance.threadname = arguments.threadname />
	</cffunction>

	<cffunction name="getDatecreated" access="public" returntype="date" output="false" 
		displayname="GetDatecreated" hint="I return the value of datecreated.">
		<cfreturn variables.instance.datecreated />
	</cffunction>
	<cffunction name="setDatecreated" access="private" returntype="void" output="false" 
		displayname="SetDatecreated" hint="I set the value of datecreated.">
		<cfargument name="datecreated" type="date" default="#now()#" />
		<cfset variables.instance.datecreated = arguments.datecreated />
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

	<cffunction name="getCategoryid" access="public" returntype="numeric" output="false" 
		displayname="GetCategoryid" hint="I return the value of categoryid.">
		<cfreturn variables.instance.categoryid />
	</cffunction>
	<cffunction name="setCategoryid" access="public" returntype="void" output="false" 
		displayname="SetCategoryid" hint="I set the value of categoryid.">
		<cfargument name="categoryid" type="numeric" default="0" />
		<cfset variables.instance.categoryid = arguments.categoryid />
	</cffunction>

	<cffunction name="getMessagecount" access="public" returntype="numeric" output="false" 
		displayname="GetMessagecount" hint="I return the value of messagecount.">
		<cfreturn variables.instance.messagecount />
	</cffunction>
	<cffunction name="setMessagecount" access="public" returntype="void" output="false" 
		displayname="SetMessagecount" hint="I set the value of messagecount.">
		<cfargument name="messagecount" type="numeric" default="0" />
		<cfset variables.instance.messagecount = arguments.messagecount />
	</cffunction>

	<cffunction name="getDatelastpost" access="public" returntype="date" output="false" 
		displayname="GetDatelastpost" hint="I return the value of datelastpost.">
		<cfreturn variables.instance.datelastpost />
	</cffunction>
	<cffunction name="setDatelastpost" access="public" returntype="void" output="false" 
		displayname="SetDatelastpost" hint="I set the value of datelastpost.">
		<cfargument name="datelastpost" type="date" default="#now()#" />
		<cfset variables.instance.datelastpost = arguments.datelastpost />
	</cffunction>

	<cffunction name="getApproved" access="public" returntype="string" output="false" 
		displayname="GetApproved" hint="I return the value of approved.">
		<cfreturn variables.instance.approved />
	</cffunction>
	<cffunction name="setApproved" access="public" returntype="void" output="false" 
		displayname="SetApproved" hint="I set the value of approved.">
		<cfargument name="approved" type="string" default="" />
		<cfset variables.instance.approved = arguments.approved />
	</cffunction>

	<cffunction name="getLocked" access="public" returntype="string" output="false" 
		displayname="GetLocked" hint="I return the value of locked.">
		<cfreturn variables.instance.locked />
	</cffunction>
	<cffunction name="setLocked" access="public" returntype="void" output="false" 
		displayname="SetLocked" hint="I set the value of locked.">
		<cfargument name="locked" type="string" default="" />
		<cfset variables.instance.locked = arguments.locked />
	</cffunction>

	<cffunction name="getArchived" access="public" returntype="string" output="false" 
		displayname="GetArchived" hint="I return the value of archived.">
		<cfreturn variables.instance.archived />
	</cffunction>
	<cffunction name="setArchived" access="public" returntype="void" output="false" 
		displayname="SetArchived" hint="I set the value of archived.">
		<cfargument name="archived" type="string" default="" />
		<cfset variables.instance.archived = arguments.archived />
	</cffunction>

	<cffunction name="getInstanceMemento" access="public" returntype="struct" output="false"
		displayname="Get Instance Memento" hint="I return a memento of this threads's instance data.">
		<cfreturn variables.instance />
	</cffunction>

	<cffunction name="setInstanceMemento" access="public" returntype="threads" output="false"
		displayname="Set Instance Memento" hint="I set this threads's instance data from a new memento.">
		<cfargument name="memento" type="struct" required="yes"
			displayname="Memento" hint="I am a memento - a struct containing data." />
		<cfset variables.instance = arguments.memento />
		<cfreturn this />
	</cffunction>

	<cffunction name="validate" access="public" returntype="boolean" output="false"
		displayname="Validate threads" hint="I validate all the data fields in this threads object.">
		<cfset var valid = true />
		<cfset variables.missingFields = "" />
		<cfset variables.missingFieldNames = "" />
		<cfset variables.invalidFields = "" />
		<cfset variables.invalidFieldNames = "" />
		<cfinclude template="../../udfs/udf_checkdate.cfm" />

		<!--- Validation for threadid --->
		<!--- Primary Key, if present must be a number. --->
		<cfif isDefined("variables.instance.threadid") AND NOT isNumeric(variables.instance.threadid)>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"threadid") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Threadid") />
		</cfif>

		<!--- Validation for threadname --->
		<!--- Required String field so it must be defined and non blank. --->
		<cfif (NOT isDefined("variables.instance.threadname")) OR variables.instance.threadname IS "">
			<cfset valid = false />
			<cfset variables.missingFields = listAppend(variables.missingFields,"threadname") />
			<cfset variables.missingFieldNames = listAppend(variables.missingFieldNames,"Threadname") />
		<cfelseif Len(variables.instance.threadname) GT 50>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"threadname") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Threadname") />
		</cfif>

		<!--- Validation for datecreated --->
		<!--- Required Date field so it must be defined and non blank and a date. --->
		<cfif (NOT isDefined("variables.instance.datecreated")) OR variables.instance.datecreated IS "">
			<cfset valid = false />
			<cfset variables.missingFields = listAppend(variables.missingFields,"datecreated") />
			<cfset variables.missingFieldNames = listAppend(variables.missingFieldNames,"Datecreated") />
		<cfelseif NOT LSisDate(variables.instance.datecreated)>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"datecreated") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Datecreated") />
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

		<!--- Validation for categoryid --->
		<!--- Required Numeric field so it must be defined and a number. --->
		<cfif (NOT isDefined("variables.instance.categoryid"))>
			<cfset valid = false />
			<cfset variables.missingFields = listAppend(variables.missingFields,"categoryid") />
			<cfset variables.missingFieldNames = listAppend(variables.missingFieldNames,"Categoryid") />
		<cfelseif NOT isNumeric(variables.instance.categoryid)>
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

		<!--- Validation for messagecount --->
		<!--- Required Numeric field so it must be defined and a number. --->
		<cfif (NOT isDefined("variables.instance.messagecount"))>
			<cfset valid = false />
			<cfset variables.missingFields = listAppend(variables.missingFields,"messagecount") />
			<cfset variables.missingFieldNames = listAppend(variables.missingFieldNames,"Messagecount") />
		<cfelseif NOT isNumeric(variables.instance.messagecount)>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"messagecount") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Messagecount") />
		</cfif>

		<!--- Validation for datelastpost --->
		<!--- Required Date field so it must be defined and non blank and a date. --->
		<cfif (NOT isDefined("variables.instance.datelastpost")) OR variables.instance.datelastpost IS "">
			<cfset valid = false />
			<cfset variables.missingFields = listAppend(variables.missingFields,"datelastpost") />
			<cfset variables.missingFieldNames = listAppend(variables.missingFieldNames,"Datelastpost") />
		<cfelseif NOT LSisDate(variables.instance.datelastpost)>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"datelastpost") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Datelastpost") />
		</cfif>

		<!--- Validation for approved --->
		<!--- Validation for locked --->
		<!--- Validation for archived --->

		<cfreturn valid />
	</cffunction>

	<cffunction name="getMissingFields" access="public" returntype="string" output="false"
		displayname="Get Missing Fields" hint="I return a comma-separated list of data fields that are missing from this threads.">
		<cfreturn variables.missingFields />
	</cffunction>

	<cffunction name="getMissingFieldNames" access="public" returntype="string" output="false"
		displayname="Get Missing Field Names" hint="I return a comma-separated list of the user friendly names of data fields that are missing from this threads.">
		<cfreturn variables.missingFieldNames />
	</cffunction>

	<cffunction name="getInvalidFields" access="public" returntype="string" output="false"
		displayname="Get Invalid Fields" hint="I return a comma-separated list of data fields that are invalid in this threads.">
		<cfreturn variables.invalidFields />
	</cffunction>

	<cffunction name="getInvalidFieldNames" access="public" returntype="string" output="false"
		displayname="Get Invalid Field Names" hint="I return a comma-separated list of the user friendly names of data fields that are invalid in this threads.">
		<cfreturn variables.invalidFieldNames />
	</cffunction>

</cfcomponent>

<!--- 
$Log: threads.cfc,v $
Revision 1.2  2007/06/14 14:01:14  kevin
Initial Open Source Version

Revision 1.9  2005/09/22 07:59:41  kevin
Move checkdate

Revision 1.8  2005/05/11 10:41:14  kevin
Rename from MVC conversion

Revision 1.7  2005/05/10 12:39:27  kevin
Change integer to numeric

Revision 1.6  2005/04/20 11:42:49  mike
handle the new field archived

Revision 1.5  2005/04/11 16:39:08  mike
setCategoryid must be access="public"

Revision 1.4  2005/04/11 15:24:36  mike
fix Fusebuilder bug: returntype="numeric" =>returntype="numeric"

Revision 1.3  2005/04/11 12:32:16  mike
set some methods to access="public", so they can be called from ForumAdminFacade circuit

Revision 1.2  2005/03/31 14:07:04  kevin
Add CVS Info

Revision 1.1  2005/03/29 09:59:56  mike
Fusebuilder Generated Code

 --->
