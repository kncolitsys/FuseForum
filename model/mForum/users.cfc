<!--- $RCSfile: users.cfc,v $ $Revision: 1.3 $ $Author: kevin $ $Date: 2007/06/14 15:07:14 $ --->
<cfcomponent displayname="users" hint="I model a single users object.">

	<cfset variables.instance=structNew()>
	<cfset variables.instance.userid="0">
	<cfset variables.instance.username="">
	<cfset variables.instance.password="">
	<cfset variables.instance.emailaddress="">
	<cfset variables.instance.city="">
	<cfset variables.instance.signature="">
	<cfset variables.instance.datecreated="#now()#">
	<cfset variables.instance.threadorder="">
	<cfset variables.instance.messageorder="">
	<cfset variables.instance.active="">
	<cfset variables.instance.firstname="">
	<cfset variables.instance.lastname="">
	<cfset variables.instance.numberofthreads="0">
	<cfset variables.instance.numberofmessages="0">
	<cfset variables.instance.datelastvisited="#now()#">
	<cfset variables.instance.showemail="">
	<cfset variables.instance.defaultfuseaction="">
	<cfset variables.instance.privatemessages="">
	<cfset variables.instance.showprofile="">
	<cfset variables.instance.emailsubs="">
	<cfset variables.instance.profile="">
	
	<cffunction name="init" access="public" returntype="users" output="false"
		displayname="users Constructor" hint="I initialize a users.">
		<cfargument name="userid" type="numeric" default="0" />
		<cfargument name="username" type="string" default="" />
		<cfargument name="password" type="string" default="" />
		<cfargument name="emailaddress" type="string" default="" />
		<cfargument name="city" type="string" default="" />
		<cfargument name="signature" type="string" default="" />
		<cfargument name="datecreated" type="date" default="#now()#" />
		<cfargument name="threadorder" type="string" default="" />
		<cfargument name="messageorder" type="string" default="" />
		<cfargument name="active" type="string" default="" />
		<cfargument name="firstname" type="string" default="" />
		<cfargument name="lastname" type="string" default="" />
		<cfargument name="numberofthreads" type="numeric" default="0" />
		<cfargument name="numberofmessages" type="numeric" default="0" />
		<cfargument name="datelastvisited" type="date" default="#now()#" />
		<cfargument name="showemail" type="string" default="" />
		<cfargument name="defaultfuseaction" type="string" default="" />
		<cfargument name="privatemessages" type="string" default="" />
		<cfargument name="showprofile" type="string" default="" />
		<cfargument name="emailsubs" type="string" default="" />
		<cfargument name="profile" type="string" default="" />
		<cfset variables.instance = structNew() />
		<cfset variables.instance.userid = arguments.userid />
		<cfset variables.instance.username = arguments.username />
		<cfset variables.instance.password = arguments.password />
		<cfset variables.instance.emailaddress = arguments.emailaddress />
		<cfset variables.instance.city = arguments.city />
		<cfset variables.instance.signature = arguments.signature />
		<cfset variables.instance.datecreated = arguments.datecreated />
		<cfset variables.instance.threadorder = arguments.threadorder />
		<cfset variables.instance.messageorder = arguments.messageorder />
		<cfset variables.instance.active = arguments.active />
		<cfset variables.instance.firstname = arguments.firstname />
		<cfset variables.instance.lastname = arguments.lastname />
		<cfset variables.instance.numberofthreads = arguments.numberofthreads />
		<cfset variables.instance.numberofmessages = arguments.numberofmessages />
		<cfset variables.instance.datelastvisited = arguments.datelastvisited />
		<cfset variables.instance.showemail = arguments.showemail />
		<cfset variables.instance.defaultfuseaction = arguments.defaultfuseaction />
		<cfset variables.instance.privatemessages = arguments.privatemessages />
		<cfset variables.instance.showprofile = arguments.showprofile />
		<cfset variables.instance.emailsubs = arguments.emailsubs />
		<cfset variables.instance.profile = arguments.profile />
		<cfset variables.missingFields = "" />
		<cfset variables.missingFieldNames = "" />
		<cfset variables.invalidFields = "" />
		<cfset variables.invalidFieldNames = "" />
		<cfreturn this />
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

	<cffunction name="getUsername" access="public" returntype="string" output="false" 
		displayname="GetUsername" hint="I return the value of username.">
		<cfreturn variables.instance.username />
	</cffunction>
	<cffunction name="setUsername" access="private" returntype="void" output="false" 
		displayname="SetUsername" hint="I set the value of username.">
		<cfargument name="username" type="string" default="" />
		<cfset variables.instance.username = arguments.username />
	</cffunction>

	<cffunction name="getPassword" access="public" returntype="string" output="false" 
		displayname="GetPassword" hint="I return the value of password.">
		<cfreturn variables.instance.password />
	</cffunction>
	<cffunction name="setPassword" access="private" returntype="void" output="false" 
		displayname="SetPassword" hint="I set the value of password.">
		<cfargument name="password" type="string" default="" />
		<cfset variables.instance.password = arguments.password />
	</cffunction>

	<cffunction name="getEmailAddress" access="public" returntype="string" output="false" 
		displayname="GetEmailAddress" hint="I return the value of emailaddress.">
		<cfreturn variables.instance.emailaddress />
	</cffunction>
	<cffunction name="setEmailAddress" access="private" returntype="void" output="false" 
		displayname="SetEmailAddress" hint="I set the value of emailaddress.">
		<cfargument name="emailaddress" type="string" default="" />
		<cfset variables.instance.emailaddress = arguments.emailaddress />
	</cffunction>

	<cffunction name="getCity" access="public" returntype="string" output="false" 
		displayname="GetCity" hint="I return the value of city.">
		<cfreturn variables.instance.city />
	</cffunction>
	<cffunction name="setCity" access="private" returntype="void" output="false" 
		displayname="SetCity" hint="I set the value of city.">
		<cfargument name="city" type="string" default="" />
		<cfset variables.instance.city = arguments.city />
	</cffunction>

	<cffunction name="getSignature" access="public" returntype="string" output="false" 
		displayname="GetSignature" hint="I return the value of signature.">
		<cfreturn variables.instance.signature />
	</cffunction>
	<cffunction name="setSignature" access="private" returntype="void" output="false" 
		displayname="SetSignature" hint="I set the value of signature.">
		<cfargument name="signature" type="string" default="" />
		<cfset variables.instance.signature = arguments.signature />
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

	<cffunction name="getThreadorder" access="public" returntype="string" output="false" 
		displayname="GetThreadorder" hint="I return the value of threadorder.">
		<cfreturn variables.instance.threadorder />
	</cffunction>
	<cffunction name="setThreadorder" access="private" returntype="void" output="false" 
		displayname="SetThreadorder" hint="I set the value of threadorder.">
		<cfargument name="threadorder" type="string" default="" />
		<cfset variables.instance.threadorder = arguments.threadorder />
	</cffunction>

	<cffunction name="getMessageorder" access="public" returntype="string" output="false" 
		displayname="GetMessageorder" hint="I return the value of messageorder.">
		<cfreturn variables.instance.messageorder />
	</cffunction>
	<cffunction name="setMessageorder" access="private" returntype="void" output="false" 
		displayname="SetMessageorder" hint="I set the value of messageorder.">
		<cfargument name="messageorder" type="string" default="" />
		<cfset variables.instance.messageorder = arguments.messageorder />
	</cffunction>

	<cffunction name="getActive" access="public" returntype="string" output="false" 
		displayname="GetActive" hint="I return the value of active.">
		<cfreturn variables.instance.active />
	</cffunction>
	<cffunction name="setActive" access="private" returntype="void" output="false" 
		displayname="SetActive" hint="I set the value of active.">
		<cfargument name="active" type="string" default="" />
		<cfset variables.instance.active = arguments.active />
	</cffunction>

	<cffunction name="getFirstname" access="public" returntype="string" output="false" 
		displayname="GetFirstname" hint="I return the value of firstname.">
		<cfreturn variables.instance.firstname />
	</cffunction>
	<cffunction name="setFirstname" access="private" returntype="void" output="false" 
		displayname="SetFirstname" hint="I set the value of firstname.">
		<cfargument name="firstname" type="string" default="" />
		<cfset variables.instance.firstname = arguments.firstname />
	</cffunction>

	<cffunction name="getLastname" access="public" returntype="string" output="false" 
		displayname="GetLastname" hint="I return the value of lastname.">
		<cfreturn variables.instance.lastname />
	</cffunction>
	<cffunction name="setLastname" access="private" returntype="void" output="false" 
		displayname="SetLastname" hint="I set the value of lastname.">
		<cfargument name="lastname" type="string" default="" />
		<cfset variables.instance.lastname = arguments.lastname />
	</cffunction>

	<cffunction name="getNumberofthreads" access="public" returntype="numeric" output="false" 
		displayname="GetNumberofthreads" hint="I return the value of numberofthreads.">
		<cfreturn variables.instance.numberofthreads />
	</cffunction>
	<cffunction name="setNumberofthreads" access="private" returntype="void" output="false" 
		displayname="SetNumberofthreads" hint="I set the value of numberofthreads.">
		<cfargument name="numberofthreads" type="numeric" default="0" />
		<cfset variables.instance.numberofthreads = arguments.numberofthreads />
	</cffunction>

	<cffunction name="getNumberofmessages" access="public" returntype="numeric" output="false" 
		displayname="GetNumberofmessages" hint="I return the value of numberofmessages.">
		<cfreturn variables.instance.numberofmessages />
	</cffunction>
	<cffunction name="setNumberofmessages" access="private" returntype="void" output="false" 
		displayname="SetNumberofmessages" hint="I set the value of numberofmessages.">
		<cfargument name="numberofmessages" type="numeric" default="0" />
		<cfset variables.instance.numberofmessages = arguments.numberofmessages />
	</cffunction>

	<cffunction name="getDatelastvisited" access="public" returntype="date" output="false" 
		displayname="GetDatelastvisited" hint="I return the value of datelastvisited.">
		<cfreturn variables.instance.datelastvisited />
	</cffunction>
	<cffunction name="setDatelastvisited" access="private" returntype="void" output="false" 
		displayname="SetDatelastvisited" hint="I set the value of datelastvisited.">
		<cfargument name="datelastvisited" type="date" default="#now()#" />
		<cfset variables.instance.datelastvisited = arguments.datelastvisited />
	</cffunction>

	<cffunction name="getShowemail" access="public" returntype="string" output="false" 
		displayname="GetShowemail" hint="I return the value of showemail.">
		<cfreturn variables.instance.showemail />
	</cffunction>
	<cffunction name="setShowemail" access="private" returntype="void" output="false" 
		displayname="SetShowemail" hint="I set the value of showemail.">
		<cfargument name="showemail" type="string" default="" />
		<cfset variables.instance.showemail = arguments.showemail />
	</cffunction>

	<cffunction name="getDefaultfuseaction" access="public" returntype="string" output="false" 
		displayname="GetDefaultfuseaction" hint="I return the value of defaultfuseaction.">
		<cfreturn variables.instance.defaultfuseaction />
	</cffunction>
	<cffunction name="setDefaultfuseaction" access="private" returntype="void" output="false" 
		displayname="SetDefaultfuseaction" hint="I set the value of defaultfuseaction.">
		<cfargument name="defaultfuseaction" type="string" default="" />
		<cfset variables.instance.defaultfuseaction = arguments.defaultfuseaction />
	</cffunction>

	<cffunction name="getPrivatemessages" access="public" returntype="string" output="false" 
		displayname="GetPrivatemessages" hint="I return the value of privatemessages.">
		<cfreturn variables.instance.privatemessages />
	</cffunction>
	<cffunction name="setPrivatemessages" access="private" returntype="void" output="false" 
		displayname="SetPrivatemessages" hint="I set the value of privatemessages.">
		<cfargument name="privatemessages" type="string" default="" />
		<cfset variables.instance.privatemessages = arguments.privatemessages />
	</cffunction>

	<cffunction name="getShowprofile" access="public" returntype="string" output="false" 
		displayname="GetShowprofile" hint="I return the value of showprofile.">
		<cfreturn variables.instance.showprofile />
	</cffunction>
	<cffunction name="setShowprofile" access="private" returntype="void" output="false" 
		displayname="SetShowprofile" hint="I set the value of showprofile.">
		<cfargument name="showprofile" type="string" default="" />
		<cfset variables.instance.showprofile = arguments.showprofile />
	</cffunction>

	<cffunction name="getEmailsubs" access="public" returntype="string" output="false" 
		displayname="GetEmailsubs" hint="I return the value of emailsubs.">
		<cfreturn variables.instance.emailsubs />
	</cffunction>
	<cffunction name="setEmailsubs" access="private" returntype="void" output="false" 
		displayname="SetEmailsubs" hint="I set the value of emailsubs.">
		<cfargument name="emailsubs" type="string" default="" />
		<cfset variables.instance.emailsubs = arguments.emailsubs />
	</cffunction>

	<cffunction name="getProfile" access="public" returntype="string" output="false" 
		displayname="GetProfile" hint="I return the value of profile.">
		<cfreturn variables.instance.profile />
	</cffunction>
	<cffunction name="setProfile" access="private" returntype="void" output="false" 
		displayname="SetProfile" hint="I set the value of profile.">
		<cfargument name="profile" type="string" default="" />
		<cfset variables.instance.profile = arguments.profile />
	</cffunction>

	<cffunction name="getInstanceMemento" access="public" returntype="struct" output="false"
		displayname="Get Instance Memento" hint="I return a memento of this users's instance data.">
		<cfreturn variables.instance />
	</cffunction>

	<cffunction name="setInstanceMemento" access="public" returntype="users" output="false"
		displayname="Set Instance Memento" hint="I set this users's instance data from a new memento.">
		<cfargument name="memento" type="struct" required="yes"
			displayname="Memento" hint="I am a memento - a struct containing data." />
		<cfset variables.instance = arguments.memento />
		<cfreturn this />
	</cffunction>

	<cffunction name="validate" access="public" returntype="boolean" output="false"
		displayname="Validate users" hint="I validate all the data fields in this users object.">
		<cfset var valid = true />
		<cfset variables.missingFields = "" />
		<cfset variables.missingFieldNames = "" />
		<cfset variables.invalidFields = "" />
		<cfset variables.invalidFieldNames = "" />
		<cfinclude template="../../udfs/udf_checkdate.cfm" />

		<!--- Validation for userid --->
		<!--- Primary Key, if present must be a number. --->
		<cfif isDefined("variables.instance.userid") AND NOT isNumeric(variables.instance.userid)>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"userid") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Userid") />
		</cfif>

		<!--- Validation for username --->
		<!--- Optional String Field, check that it does not exceed maximum length. --->
		<cfif isDefined("variables.instance.username") AND Len(variables.instance.username) GT 100>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"username") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Username") />
		</cfif>

		<!--- Validation for password --->
		<!--- Optional String Field, check that it does not exceed maximum length. --->
		<cfif isDefined("variables.instance.password") AND Len(variables.instance.password) GT 12>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"password") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Password") />
		</cfif>

		<!--- Validation for emailaddress --->
		<!--- Optional String Field, check that it does not exceed maximum length. --->
		<cfif isDefined("variables.instance.emailaddress") AND Len(variables.instance.emailaddress) GT 50>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"emailaddress") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"emailaddress") />
		</cfif>

		<!--- Validation for city --->
		<!--- Optional String Field, check that it does not exceed maximum length. --->
		<cfif isDefined("variables.instance.city") AND Len(variables.instance.city) GT 30>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"city") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"City") />
		</cfif>

		<!--- Validation for signature --->
		<!--- Optional String Field, check that it does not exceed maximum length. --->
		<cfif isDefined("variables.instance.signature") AND Len(variables.instance.signature) GT 150>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"signature") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Signature") />
		</cfif>

		<!--- Validation for datecreated --->
		<!--- Optional Date field so if available must be a date. --->
		<cfif isDefined("variables.instance.datecreated") AND variables.instance.datecreated IS NOT "" AND checkDate(variables.instance.datecreated) IS "Invalid">
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"datecreated") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Datecreated") />
		</cfif>

		<!--- Validation for threadorder --->
		<!--- Optional String Field, check that it does not exceed maximum length. --->
		<cfif isDefined("variables.instance.threadorder") AND Len(variables.instance.threadorder) GT 4>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"threadorder") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Threadorder") />
		</cfif>

		<!--- Validation for messageorder --->
		<!--- Optional String Field, check that it does not exceed maximum length. --->
		<cfif isDefined("variables.instance.messageorder") AND Len(variables.instance.messageorder) GT 4>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"messageorder") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Messageorder") />
		</cfif>

		<!--- Validation for active --->

		<!--- Validation for firstname --->
		<!--- Optional String Field, check that it does not exceed maximum length. --->
		<cfif isDefined("variables.instance.firstname") AND Len(variables.instance.firstname) GT 50>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"firstname") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Firstname") />
		</cfif>

		<!--- Validation for lastname --->
		<!--- Optional String Field, check that it does not exceed maximum length. --->
		<cfif isDefined("variables.instance.lastname") AND Len(variables.instance.lastname) GT 50>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"lastname") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Lastname") />
		</cfif>

		<!--- Validation for numberofthreads --->
		<!--- Optional Numeric field so if available must be a number. --->
		<cfif isDefined("variables.instance.numberofthreads") AND variables.instance.numberofthreads IS NOT "" AND NOT isNumeric(variables.instance.numberofthreads)>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"numberofthreads") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Numberofthreads") />
		</cfif>

		<!--- Validation for numberofmessages --->
		<!--- Optional Numeric field so if available must be a number. --->
		<cfif isDefined("variables.instance.numberofmessages") AND variables.instance.numberofmessages IS NOT "" AND NOT isNumeric(variables.instance.numberofmessages)>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"numberofmessages") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Numberofmessages") />
		</cfif>

		<!--- Validation for datelastvisited --->
		<!--- Optional Date field so if available must be a date. --->
		<cfif isDefined("variables.instance.datelastvisited") AND variables.instance.datelastvisited IS NOT "" AND checkDate(variables.instance.datelastvisited) IS "Invalid">
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"datelastvisited") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Datelastvisited") />
		</cfif>

		<!--- Validation for showemail --->

		<!--- Validation for defaultfuseaction --->
		<!--- Optional String Field, check that it does not exceed maximum length. --->
		<cfif isDefined("variables.instance.defaultfuseaction") AND Len(variables.instance.defaultfuseaction) GT 20>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"defaultfuseaction") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Defaultfuseaction") />
		</cfif>

		<!--- Validation for privatemessages --->

		<!--- Validation for showprofile --->

		<!--- Validation for emailsubs --->

		<!--- Validation for profile --->
		<!--- Optional String Field, check that it does not exceed maximum length. --->
		<cfif isDefined("variables.instance.profile") AND Len(variables.instance.profile) GT 200>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"profile") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Profile") />
		</cfif>
		
		<cfreturn valid />
	</cffunction>

	<cffunction name="getMissingFields" access="public" returntype="string" output="false"
		displayname="Get Missing Fields" hint="I return a comma-separated list of data fields that are missing from this users.">
		<cfreturn variables.missingFields />
	</cffunction>

	<cffunction name="getMissingFieldNames" access="public" returntype="string" output="false"
		displayname="Get Missing Field Names" hint="I return a comma-separated list of the user friendly names of data fields that are missing from this users.">
		<cfreturn variables.missingFieldNames />
	</cffunction>

	<cffunction name="getInvalidFields" access="public" returntype="string" output="false"
		displayname="Get Invalid Fields" hint="I return a comma-separated list of data fields that are invalid in this users.">
		<cfreturn variables.invalidFields />
	</cffunction>

	<cffunction name="getInvalidFieldNames" access="public" returntype="string" output="false"
		displayname="Get Invalid Field Names" hint="I return a comma-separated list of the user friendly names of data fields that are invalid in this users.">
		<cfreturn variables.invalidFieldNames />
	</cffunction>

</cfcomponent>

<!--- 
$Log: users.cfc,v $
Revision 1.3  2007/06/14 15:07:14  kevin
single email address

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

Revision 1.1  2005/03/29 10:00:00  mike
Fusebuilder Generated Code

 --->
