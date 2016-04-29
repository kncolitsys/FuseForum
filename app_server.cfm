<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="$RCSfile: app_server.cfm,v $" language="ColdFusion" specification="2.0">
	<responsibilities>
		I set up server-specific variables
	</responsibilities>
	<properties>
		<history author="Kevin Roche" email="kevin@objectiveinternet.com" type="Create" date="" role="FuseCoder"/>
		<property name="copyright" value="(c)2004 Objective Internet Limited." />
		<property name="licence" value="Licensed under the Apache License, Version 2.0  See licence.txt" />
		<property name="version" value="$Revision: 1.6 $" />
		<property name="lastupdated" value="$Date: 2007/06/15 14:00:01 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
		</in>
		<out>
			<string name="thisserver" scope="request" comments="Root directory of the server. Eg: D:\inetpub\wwwroot\"/>
			<list name="lservers" scope="request" comments="List of UNC paths of servers not including this one. Eg: \\OBJECTIVEWEB01\D-Drive\inetpub\wwwroot\"/>
			
			<string name="attachmentpath" scope="request" comments="Addition path to the attachments directory. Eg: \FuseForum\Attachments\" />
			<string name="viewattachmentpath" scope="request"/>
			<string name="Veritypath" scope="request"/>
		</out>
	</io>
</fusedoc>
 --->
 
<!--- This file contains server specific variables that you will most likely have to change. --->
<!--- TODO: Eliminate the need for some of these where the file paths for example can be determined by ColdFusion. --->

<cfscript>
	request.forumDSN="FuseForum";	// Datasource name
	request.userView="users1";		// Name of the view to be used to support user database
									// This is provided to support easy integration with 
									// other systems which already contain a database of users.

	request.basehref = "http://#cgi.SERVER_NAME##GetDirectoryFromPath(cgi.PATH_INFO)#";
	
	// Initialise the list of servers and drives to copy things to.
	request.thisserver = "D:\inetpub\wwwroot\";	
	request.lservers = "";

	request.attachmentpath = "FuseForum\Attachments\";
	//	Copies are done as follows:
	//		#request.thisserver##request.attachmentpath# to #eachServer##request.attachmentpath#
	request.viewattachmentpath = "http://127.0.0.1/FuseForum/Attachments/";

	//Path to Verity Index Directories
	request.Veritypath="D:\Verity\Collections\";
	
	request.siteId = 1;
	request.siteKeywords="";
	request.siteEmail="";
	request.siteURL="";
</cfscript>

<!--- 
$Log: app_server.cfm,v $
Revision 1.6  2007/06/15 14:00:01  kevin
Add Admin Modules

Revision 1.5  2007/06/14 16:52:19  kevin
Remove specific comments

Revision 1.4  2007/06/14 16:38:41  kevin
Copyright statement

Revision 1.3  2007/06/14 15:06:24  kevin
Move DSN to app_server

Revision 1.2  2007/06/14 14:01:58  kevin
Initial Open Source Version

 --->
