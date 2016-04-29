<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="qry_mainsettings.cfm">
	<responsibilities>
		I get the current parameters for the Forums system
	</responsibilities>
	<properties>
		<history author="Mike Oakes" email="mike@objectiveinternet.com" date="04-Feb-2005" role="Architect" type="Create" />
		<property name="copyright" value="(c)2005 Objective Internet Limited." />
		<property name="licence" value="See licence.txt" />
		<property name="version" value="$Revision: 1.1 $" />
		<property name="lastupdated" value="$Date: 2007/06/15 13:59:05 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
		</in>
		<out>
			<recordset name="mainsettings" scope="variables" format="CFML">
				<number name="settingid" />
				<datetime name="dateinstalled" />
				<string name="adminemail" />
				<string name="forumsname" />
				<string name="forumspath" />
				<string name="forumsurl" />
				<string name="emailmessage" />
				<string name="moderatoremail" />
				<string name="companyurl" />
				<boolean name="censorship" />
				<boolean name="querycaching" />
				<number name="cachingduration" />
				<boolean name="archive" />
				<number name="archivetimespan" />
				<string name="backgroundcolor1" />
				<string name="backgroundimage1" />
				<string name="textcolor1" />
				<string name="hyperlinkcolor1" />
				<string name="backgroundcolor2" />
				<string name="backgroundimage2" />
				<string name="textcolor2" />
				<string name="hyperlinkcolor2" />
				<string name="attachmentpath" />
				<string name="attachmentname" />
				<number name="attachmentmaxsize" />
				<number name="topiclistnumber" />
				<number name="messagelistnumber" />
				<string name="messageorder" />
				<string name="threadorder" />
				<string name="smtpserver" />
				<boolean name="privatemessages" />
				<string name="mailfooter" />
				<string name="logourl" />
				<datetime name="archivetimeofday" />
			</recordset>
		</out>
	</io>
</fusedoc>
--->

<cfset mainsettings=Application.ao__AppObj_mForum_settings_Gateway.findAll()>

<!--- 
$Log: qry_mainsettings.cfm,v $
Revision 1.1  2007/06/15 13:59:05  kevin
Add Admin Modules

Revision 1.7  2006/08/11 12:54:47  mike
change cfc objects from Server to Application scope

Revision 1.6  2006/07/31 15:43:24  kevin
Remove old SQL

Revision 1.5  2006/06/23 17:19:56  mike
new naming convention for cfc objects

Revision 1.4  2005/09/05 15:47:31  kevin
Change DSN for forums.

Revision 1.3  2005/05/20 12:33:38  kevin
New server cfc naming convention

Revision 1.2  2005/04/08 11:34:31  mike
changed to call Facade/Gateway/DAO cfc's

Revision 1.1  2005/03/29 13:28:27  mike
files moved from mForum

Revision 1.1  2005/03/09 13:53:01  mike
Moved to create MVC version

Revision 1.4  2005/02/24 13:57:43  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.3  2005/02/23 17:19:43  mike
small edits to code layout

Revision 1.2  2005/02/08 13:49:29  mike
improve fusedoc, etc.

Revision 1.1  2005/02/04 19:56:51  mike
FB3 version made from wireframe with fusebuilder, with contents pasted from FB2 version, fbx_switch fully commented, and XFA usage improved throughout
--->
</cfsilent>
