<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="$RCSfile: fbx_settings.cfm,v $" language="ColdFusion MX 6.1" version="2.0">
	<responsibilities>
		I set up the environment variables for the application.
	</responsibilities>
	<properties>
		<history author="Kevin Roche" email="kevin@objectiveinternet.com" date="21-Oct-2004" role="Architect" type="Create" />
		<property name="copyright" value="(c)2004 Objective Internet Limited." />
		<property name="licence" value="Licensed under the Apache License, Version 2.0  See licence.txt" />
		<property name="version" value="$Revision: 1.6 $" />
		<property name="lastupdated" value="$Date: 2007/06/15 14:00:02 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			
		</in>
		<out>
			<string name="self" scope="request" comments="The name of the file to run the application"/>
			<string name="self" scope="variables" comments="The name of the file to run the application"/>
			
			<string name="URLquery" scope="variables" comments="Set the chars to be used in URL Links." />
			<string name="URLequals" scope="variables" comments="Set the chars to be used in URL Links." />
			<string name="URLand" scope="variables" comments="Set the chars to be used in URL Links." />
			<string name="URLend" scope="variables" comments="Set the chars to be used in URL Links." />
			<string name="siteEmail" scope="request" comments="Email address for the webmaster."/>
			<string name="siteKeywords" scope="request" comments="Used to set up keywords META tags."/>

			<string name="fusebox.suppresserrors" scope="variables" />
			<string name="URLtoken" scope="request" comments="version of Token with ? and & changed to /."/>

			<!-- Datasources -->
			<string name="AdsTagsDSN" scope="request"/>
			<string name="ContentDSN" scope="request"/>
			<string name="ForumDSN" scope="request"/>
			<string name="TrafalgarDSN" scope="request"/>
			<string name="userDSN" scope="request"/>
			<string name="pollsDSN" scope="request"/>

			<!-- Setting timeout values for caching -->
			<string name="Timespan" default="#CreateTimeSpan("0","1","0","0")#" scope="request"/>
			<string name="LongTimespan" default="#CreateTimeSpan("0","6","0","0")#"" scope="request"/>
			<string name="ShortTimespan" default="#CreateTimeSpan("0","0","15","0")#"" scope="request"/>
			<string name="VeryShortTimespan" default="#CreateTimeSpan("0","0","5","0")#"" scope="request"/>
			<string name="TimespanExpire" default="#CreateTimeSpan("0","0","0","0")#"" scope="request"/>

			<string name="Veritypath" scope="request" comments="path to the Verity collections root"/>
			<string name="webroot" scope="request" comments="Used for cffile"/>
			<string name="FurnitureRoot" scope="request" comments="used with images - Used for img tags"/>
			<string name="lservers" scope="request" comments="List of other servers in the cluster."/>

			<string name="browser" scope="request" comments="Shows IE,N6,NS"/>

			<string name="userid" scope="request" default="0" comments="nameid of the logged in user"/>

			<string name="page.title" default=""/>
			<string name="page.subtitle" default=""/>
			<string name="page.description" default=""/>

			<string name="SkinkerDownloadId" scope="request" comments="Dowload Id for the desktop news service program"/>
		</out>
	</io>
</fusedoc>
--->

<!--- In case no fuseaction was given, I'll set up one to use by default. --->
<cfparam name="attributes.fuseaction" default="Login.Login">

<!--- useful constants --->
<cfscript>
	request.self = "index.cfm";
	variables.self = "index.cfm";
	// use SS URLs by default - can be over-ridden in individual circuits like Login, Forum
	URLquery = "/";
	URLequals = "/";
	URLand = "/";
	URLend = ".cfm";
</cfscript>

<!--- should fusebox silently suppress its own error messages? default is FALSE --->
<cfset fusebox.suppresserrors = false><!--- ?ok in FB4.1? --->

<!--- Request.URLToken 	Copy of client.URLToken - Used to add to all links and avoid use of cookies --->
<cfset request.URLtoken	= "/" & REReplace(session.urltoken,"&|=","/","ALL")>
<!--- <cfset request.URLtoken = ""> --->

<!--- Setting timeout values for caching --->
<cfparam name="request.Timespan" default="#CreateTimeSpan("0","1","0","0")#">
<cfparam name="request.LongTimespan" default="#CreateTimeSpan("0","6","0","0")#">
<cfparam name="request.ShortTimespan" default="#CreateTimeSpan("0","0","15","0")#">
<cfparam name="request.VeryShortTimespan" default="#CreateTimeSpan("0","0","5","0")#">
<cfparam name="request.TimespanExpire" default="#CreateTimeSpan("0","0","0","0")#">

<!--- Create a list of of the page banner images in application scope --->
<cfif NOT(isdefined("application.pagebanners"))>
	<cfset thisPath = ExpandPath("*.*")>
	<cfset thisDirectory = GetDirectoryFromPath(thisPath)>
	<cfdirectory action = "list" directory = "#thisDirectory#furniture\pagebanners" name = "qBanners"> 
	<cflock timeout="10" scope="Application" throwOnTimeout = "Yes" type="Exclusive">
		<cfset application.lPageBanners = "">
		<cfloop query="qBanners">
			<cfset application.lPageBanners = listAppend(application.lPageBanners,"#qBanners.Name#")>
		</cfloop>
	</cflock>
</cfif>


<cfif isDefined("attributes.clearcache") OR isDefined("attributes.preview")>
	<!--- Clear the cache by setting timespan = 0 --->
	<cfset request.Timespan = request.TimespanExpire>
	<cfset request.LongTimespan = request.TimespanExpire>
	<cfset request.ShortTimespan = request.TimespanExpire>
	<cfset request.VeryShortTimespan = request.TimespanExpire>
</cfif>
<!--- Request.FurnitureRoot 	Server with images - Used for <img> tags --->
<cfparam name="request.FurnitureRoot" default="/Furniture">
<cfscript>
	request.furniture = "/Furniture/";
	// Initialise the list of servers and drives to copy the images to. app_server.cfm will add to this list.
	request.lservers = "";
</cfscript>

<!--- Browser checking --->
<cfif CGI.HTTP_USER_AGENT CONTAINS "MSIE">
	<cfset request.browser = "IE">
<cfelseif CGI.HTTP_USER_AGENT CONTAINS "Mozilla/4">
	<cfif cgi.http_user_agent contains "6">
		<cfset request.browser = "N6">
	<cfelse>
		<cfset request.browser = "NS">
	</cfif>
<cfelse>
	<cfset request.browser = "">
</cfif>


<!--- User is logged-in if session.userid is not 0 --->

<cfset session.userid = 2>

<cfif isDefined("session.userid")>
	<cfset request.userid = session.userid>
<cfelse>
	<cfset request.userid = 0>
</cfif>

<cfparam name="request.page.title" default="">
<cfparam name="request.page.subtitle" default="">
<cfparam name="request.page.description" default="">

<!--- Dowload Id for the desktop news service program --->
<cfset request.SkinkerDownloadId = 1>

<!--- 
$Log: fbx_settings.cfm,v $
Revision 1.6  2007/06/15 14:00:02  kevin
Add Admin Modules

Revision 1.5  2007/06/14 16:52:19  kevin
Remove specific comments

Revision 1.4  2007/06/14 16:38:41  kevin
Copyright statement

Revision 1.3  2007/06/14 15:06:13  kevin
Move DSN to app_server

Revision 1.2  2007/06/14 14:01:59  kevin
Initial Open Source Version

Revision 1.20  2006/09/25 14:05:26  mike
move request.TrafalgarDBName etc. to app_server files

Revision 1.19  2006/08/08 11:41:23  bob
Create application scope var with list of section banner images

Revision 1.18  2006/08/02 10:27:50  mike
delete request.ActivityForumDSN, etc.

Revision 1.17  2006/08/01 17:38:37  mike
redo the definition of datasources

Revision 1.16  2006/07/24 15:32:42  mike
add request.TrafalgarDSN

Revision 1.15  2006/06/23 17:47:08  mike
remove junk

Revision 1.14  2006/05/02 12:48:05  kevin
Move error handlers to catch fusebox errors.

Revision 1.13  2005/12/21 11:14:03  kevin
Add error handlers

Revision 1.12  2005/12/02 17:23:31  mike
DSN => ForumDSN

Revision 1.11  2005/07/28 11:17:23  mike
don't define request.DownloadPath

Revision 1.10  2005/07/19 08:02:06  kevin
Add Document Index to Index Build

Revision 1.9  2005/06/27 16:58:33  mike
set request.Veritypath in app_server only

Revision 1.8  2005/06/21 12:21:35  mike
request.ClientVarStore is not used

Revision 1.7  2005/06/16 18:54:42  mike
remove server-specific code, etc.

Revision 1.6  2005/05/27 13:20:12  kevin
add breadcrumb udf

Revision 1.5  2005/05/27 08:57:48  kevin
Remove duplicated clear cache settings

Revision 1.4  2005/05/18 16:13:25  mike
remove Blog references

Revision 1.3  2005/05/09 17:59:41  mike
improve fusedoc, etc.

Revision 1.2  2005/05/05 12:25:36  mike
a few edits to make more appropriate 

Revision 1.1.1.1  2005/03/11 11:07:20  kevin
Initial Files

Revision 1.1.1.1  2005/01/31 13:11:56  kevin
no message

Revision 1.20.2.1  2004/12/06 17:02:45  kevin
Initial Edits for Blog Integration

Revision 1.20  2004/12/03 12:26:12  kevin
Improve Keywords in meta tags

Revision 1.19  2004/11/15 17:11:20  mike
use #request.siteURL#

Revision 1.18  2004/11/12 09:44:08  mike
remove ForumDSN , add ClientVarStore

Revision 1.17  2004/11/11 17:29:54  kevin
Make request page settings cfparam

Revision 1.16  2004/11/09 18:17:03  kevin
Add fusedoc

Revision 1.15  2004/11/09 10:16:44  mike
define URLquery etc.

Revision 1.14  2004/11/08 12:07:20  kevin
Add lines for Polls and AdsTags DSNs

Revision 1.13  2004/11/08 10:47:01  kevin
Change keyword order

Revision 1.12  2004/11/08 10:12:29  mike
server-specific values split off into app_server.cfm

Revision 1.11  2004/11/04 18:54:46  mike
add place-holder for production request.lservers setting

Revision 1.10  2004/11/02 09:11:37  mike
remove <cfapplication> etc. - now done in index.cfm

Revision 1.9  2004/10/30 09:38:34  mike
commented out setting of request.URLtoken (? needed?), to try to get login to work

Revision 1.8  2004/10/29 14:51:51  mike
define request.siteEmail

Revision 1.7  2004/10/28 10:16:25  mike
set request.userid, etc.

Revision 1.6  2004/10/27 11:23:06  mike
define request.ForumDSN

Revision 1.5  2004/10/26 17:30:52  kevin
Clear Cache Facilty

Revision 1.4  2004/10/26 13:29:26  kevin
Add Skinker ID

Revision 1.3  2004/10/25 11:07:31  kevin
configure content in cms

Revision 1.2  2004/10/24 17:06:56  mike
removed some junk; added some more db mappings etc.

Revision 1.1  2004/10/21 16:36:04  mike
initial version

 --->
</cfsilent>
