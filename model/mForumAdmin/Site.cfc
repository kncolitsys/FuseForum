<!--- $RCSfile: Site.cfc,v $ $Revision: 1.1 $ $Author: kevin $ $Date: 2007/06/15 13:59:05 $ --->
<cfcomponent displayname="Site" hint="I model a single Site object.">

	<cfset variables.instance=structNew()>
	<cfset variables.instance.SiteId="0">
	<cfset variables.instance.SiteName="">
	<cfset variables.instance.SiteURL="">
	<cfset variables.instance.RootDirectory="">
	<cfset variables.instance.ImagePath="">
	<cfset variables.instance.AttachmentPath="">
	<cfset variables.instance.StyleSheetPath="">
	<cfset variables.instance.DownloadPath="">
	<cfset variables.instance.CFAppName="">
	
	<cffunction name="init" access="public" returntype="Site" output="false"
		displayname="Site Constructor" hint="I initialize a Site.">
		<cfargument name="SiteId" type="numeric" default="0" />
		<cfargument name="SiteName" type="string" default="" />
		<cfargument name="SiteURL" type="string" default="" />
		<cfargument name="RootDirectory" type="string" default="" />
		<cfargument name="ImagePath" type="string" default="" />
		<cfargument name="AttachmentPath" type="string" default="" />
		<cfargument name="StyleSheetPath" type="string" default="" />
		<cfargument name="DownloadPath" type="string" default="" />
		<cfargument name="CFAppName" type="string" default="" />
		
		<cfset variables.instance = structNew() />
		<cfset variables.instance.SiteId = arguments.SiteId />
		<cfset variables.instance.SiteName = arguments.SiteName />
		<cfset variables.instance.SiteURL = arguments.SiteURL />
		<cfset variables.instance.RootDirectory = arguments.RootDirectory />
		<cfset variables.instance.ImagePath = arguments.ImagePath />
		<cfset variables.instance.AttachmentPath = arguments.AttachmentPath />
		<cfset variables.instance.StyleSheetPath = arguments.StyleSheetPath />
		<cfset variables.instance.DownloadPath = arguments.DownloadPath />
		<cfset variables.instance.CFAppName = arguments.CFAppName>
		
		<cfset variables.missingFields = "" />
		<cfset variables.missingFieldNames = "" />
		<cfset variables.invalidFields = "" />
		<cfset variables.invalidFieldNames = "" />
		<cfreturn this />
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

	<cffunction name="getSitename" access="public" returntype="string" output="false" 
		displayname="GetSitename" hint="I return the value of SiteName.">
		<cfreturn variables.instance.SiteName />
	</cffunction>
	<cffunction name="setSitename" access="private" returntype="void" output="false" 
		displayname="SetSitename" hint="I set the value of SiteName.">
		<cfargument name="SiteName" type="string" default="" />
		<cfset variables.instance.SiteName = arguments.SiteName />
	</cffunction>

	<cffunction name="getSiteurl" access="public" returntype="string" output="false" 
		displayname="GetSiteurl" hint="I return the value of SiteURL.">
		<cfreturn variables.instance.SiteURL />
	</cffunction>
	<cffunction name="setSiteurl" access="private" returntype="void" output="false" 
		displayname="SetSiteurl" hint="I set the value of SiteURL.">
		<cfargument name="SiteURL" type="string" default="" />
		<cfset variables.instance.SiteURL = arguments.SiteURL />
	</cffunction>

	<cffunction name="getRootDirectory" access="public" returntype="string" output="false" 
		displayname="GetRootDirectory" hint="I return the value of RootDirectory.">
		<cfreturn variables.instance.RootDirectory />
	</cffunction>
	<cffunction name="setRootDirectory" access="private" returntype="void" output="false" 
		displayname="SetRootDirectory" hint="I set the value of RootDirectory.">
		<cfargument name="RootDirectory" type="string" default="" />
		<cfset variables.instance.RootDirectory = arguments.RootDirectory />
	</cffunction>

	<cffunction name="getImagePath" access="public" returntype="string" output="false" 
		displayname="GetImagePath" hint="I return the value of ImagePath.">
		<cfreturn variables.instance.ImagePath />
	</cffunction>
	<cffunction name="setImagePath" access="private" returntype="void" output="false" 
		displayname="SetImagePath" hint="I set the value of ImagePath.">
		<cfargument name="ImagePath" type="string" default="" />
		<cfset variables.instance.ImagePath = arguments.ImagePath />
	</cffunction>

	<cffunction name="getAttachmentPath" access="public" returntype="string" output="false" 
		displayname="GetAttachmentPath" hint="I return the value of AttachmentPath.">
		<cfreturn variables.instance.AttachmentPath />
	</cffunction>
	<cffunction name="setAttachmentPath" access="private" returntype="void" output="false" 
		displayname="SetAttachmentPath" hint="I set the value of AttachmentPath.">
		<cfargument name="AttachmentPath" type="string" default="" />
		<cfset variables.instance.AttachmentPath = arguments.AttachmentPath />
	</cffunction>
	
	<cffunction name="getStyleSheetPath" access="public" returntype="string" output="false" 
		displayname="GetStyleSheetPath" hint="I return the value of StyleSheetPath.">
		<cfreturn variables.instance.StyleSheetPath />
	</cffunction>
	<cffunction name="setStyleSheetPath" access="private" returntype="void" output="false" 
		displayname="SetStyleSheetPath" hint="I set the value of StyleSheetPath.">
		<cfargument name="StyleSheetPath" type="string" default="" />
		<cfset variables.instance.StyleSheetPath = arguments.StyleSheetPath />
	</cffunction>
	
	<cffunction name="getDownloadPath" access="public" returntype="string" output="false" 
		displayname="Get DownloadPath" hint="I return the value of DownloadPath.">
		<cfreturn variables.instance.DownloadPath />
	</cffunction>
	<cffunction name="setDownloadPath" access="private" returntype="void" output="false" 
		displayname="SetDownloadPath" hint="I set the value of DownloadPath.">
		<cfargument name="DownloadPath" type="string" default="" />
		<cfset variables.instance.DownloadPath = arguments.DownloadPath />
	</cffunction>

	<cffunction name="getCFAppName" access="public" returntype="string" output="false" 
		displayname="GetCFAppName" hint="I return the value of CFAppName.">
		<cfreturn variables.instance.CFAppName />
	</cffunction>
	<cffunction name="setCFAppName" access="private" returntype="void" output="false" 
		displayname="SetCFAppName" hint="I set the value of CFAppName.">
		<cfargument name="CFAppName" type="string" default="" />
		<cfset variables.instance.CFAppName = arguments.CFAppName />
	</cffunction>
	
	<cffunction name="getInstanceMemento" access="public" returntype="struct" output="false"
 		displayname="Get Instance Memento" hint="I return a memento of this Site's instance data.">
 		<cfreturn variables.instance />
 	</cffunction>
 	<cffunction name="setInstanceMemento" access="public" returntype="Site" output="false"
 		displayname="Set Instance Memento" hint="I set this Site's instance data from a new memento.">
 		<cfargument name="memento" type="struct" required="yes"
 			displayname="Memento" hint="I am a memento - a struct containing data." />
 		<cfset variables.instance = arguments.memento />
 		<cfreturn this />
 	</cffunction>

	<cffunction name="validate" access="public" returntype="boolean" output="false"
		displayname="Validate Site" hint="I validate all the data fields in this Site object.">
		<cfset var valid = true />
		<cfset variables.missingFields = "" />
		<cfset variables.missingFieldNames = "" />
		<cfset variables.invalidFields = "" />
		<cfset variables.invalidFieldNames = "" />
		<cfinclude template="../../udfs/udf_checkdate.cfm" />

		<!--- Validation for SiteId --->
		<!--- Primary Key, if present must be a number. --->
		<cfif isDefined("variables.instance.SiteId") 
			AND NOT isNumeric(variables.instance.SiteId)
			AND trim(variables.instance.SiteId) IS NOT "">
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"SiteId") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Siteid") />
		</cfif>

		<!--- Validation for SiteName --->
		<!--- Required String field so it must be defined and non blank. --->
		<cfif (NOT isDefined("variables.instance.SiteName")) OR variables.instance.SiteName IS "">
			<cfset valid = false />
			<cfset variables.missingFields = listAppend(variables.missingFields,"SiteName") />
			<cfset variables.missingFieldNames = listAppend(variables.missingFieldNames,"Sitename") />
		<cfelseif Len(variables.instance.SiteName) GT 50>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"SiteName") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Sitename") />
		</cfif>

		<!--- Validation for SiteURL --->
		<!--- Required String field so it must be defined and non blank. --->
		<cfif (NOT isDefined("variables.instance.SiteURL")) OR variables.instance.SiteURL IS "">
			<cfset valid = false />
			<cfset variables.missingFields = listAppend(variables.missingFields,"SiteURL") />
			<cfset variables.missingFieldNames = listAppend(variables.missingFieldNames,"Siteurl") />
		<cfelseif Len(variables.instance.SiteURL) GT 255>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"SiteURL") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"Siteurl") />
		</cfif>

		<!--- Validation for RootDirectory --->
		<!--- Optional String Field, check that it does not exceed maximum length. --->
		<cfif isDefined("variables.instance.RootDirectory") AND Len(variables.instance.RootDirectory) GT 255>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"RootDirectory") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"RootDirectory") />
		</cfif>

		<!--- Validation for ImagePath --->
		<!--- Optional String Field, check that it does not exceed maximum length. --->
		<cfif isDefined("variables.instance.ImagePath") AND Len(variables.instance.ImagePath) GT 255>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"ImagePath") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"ImagePath") />
		</cfif>

		<!--- Validation for AttachmentPath --->
		<!--- Optional String Field, check that it does not exceed maximum length. --->
		<cfif isDefined("variables.instance.AttachmentPath") AND Len(variables.instance.AttachmentPath) GT 255>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"AttachmentPath") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"AttachmentPath") />
		</cfif>
		
		<!--- Validation for StyleSheetPath --->
		<!--- Optional String Field, check that it does not exceed maximum length. --->
		<cfif isDefined("variables.instance.StyleSheetPath") AND Len(variables.instance.StyleSheetPath) GT 255>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"StyleSheetPath") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"StyleSheetPath") />
		</cfif>
		
		<!--- Validation for DownloadPath --->
		<!--- Optional String Field, check that it does not exceed maximum length. --->
		<cfif isDefined("variables.instance.DownloadPath") AND Len(variables.instance.DownloadPath) GT 255>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"DownloadPath") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"DownloadPath") />
		</cfif>
		
		<!--- Validation for CFAppName --->
		<!--- Optional String Field, check that it does not exceed maximum length. --->
		<cfif isDefined("variables.instance.CFAppName") AND Len(variables.instance.CFAppName) GT 50>
			<cfset valid = false />
			<cfset variables.invalidFields = listAppend(variables.invalidFields,"CFAppName") />
			<cfset variables.invalidFieldNames = listAppend(variables.invalidFieldNames,"CFAppName") />
		</cfif>

		<cfreturn valid />
	</cffunction>

	<cffunction name="getMissingFields" access="public" returntype="string" output="false"
		displayname="Get Missing Fields" hint="I return a comma-separated list of data fields that are missing from this Site.">
		<cfreturn variables.missingFields />
	</cffunction>

	<cffunction name="getMissingFieldNames" access="public" returntype="string" output="false"
		displayname="Get Missing Field Names" hint="I return a comma-separated list of the user friendly names of data fields that are missing from this Site.">
		<cfreturn variables.missingFieldNames />
	</cffunction>

	<cffunction name="getInvalidFields" access="public" returntype="string" output="false"
		displayname="Get Invalid Fields" hint="I return a comma-separated list of data fields that are invalid in this Site.">
		<cfreturn variables.invalidFields />
	</cffunction>

	<cffunction name="getInvalidFieldNames" access="public" returntype="string" output="false"
		displayname="Get Invalid Field Names" hint="I return a comma-separated list of the user friendly names of data fields that are invalid in this Site.">
		<cfreturn variables.invalidFieldNames />
	</cffunction>

</cfcomponent>

<!--- 
$Log: Site.cfc,v $
Revision 1.1  2007/06/15 13:59:05  kevin
Add Admin Modules

Revision 1.17  2006/08/11 12:55:17  mike
change cfc objects from Server to Application scope

Revision 1.16  2006/08/01 15:35:57  mike
various bug-fixes, as applied in liveMay2006 branch

Revision 1.15  2006/06/23 17:21:18  mike
new naming convention for cfc objects

Revision 1.14  2006/05/10 17:49:59  mike
edits made to handle the 9 new fields in Site

Revision 1.13  2005/09/22 07:59:41  kevin
Move checkdate

Revision 1.12  2005/08/18 15:50:28  kevin
Fix Site Add Bug

Revision 1.11  2005/07/01 11:23:13  kevin
Add DownloadPath

Revision 1.10  2005/06/21 07:08:24  kevin
Style sheet for editor saved in site table

Revision 1.9  2005/06/16 11:04:29  kevin
New field for site AppName

Revision 1.8  2005/06/10 16:03:44  kevin
Validation against a table Bug

Revision 1.7  2005/06/08 13:44:29  kevin
Rebuild with new fields by Fusebuilder

Revision 1.6  2005/05/11 10:41:11  kevin
Rename from MVC conversion

Revision 1.5  2005/05/10 12:39:26  kevin
Change integer to numeric

Revision 1.4  2005/03/31 14:07:05  kevin
Add CVS Info

Revision 1.3  2005/03/31 13:59:56  kevin
Path Fix

Revision 1.2  2005/03/10 13:16:54  kevin
Inital File from EnglandRugby

Revision 1.1.2.1  2005/03/10 12:23:03  kevin
Files generated by fusebuilder.

 --->
