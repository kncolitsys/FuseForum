<cfsilent>
<!--- -->
<?xml version="1.0"?>
<fusedoc fuse="dsp_mainsettings.cfm">
	<responsibilities>
		I display a form allowing the forum settings parameters to be altered
	</responsibilities>
	<properties>
		<history author="Mike Oakes" email="mike@objectiveinternet.com" date="04-Feb-2005" role="Architect" type="Create" />
		<property name="copyright" value="(c)2005 Objective Internet Limited." />
		<property name="licence" value="See licence.txt" />
		<property name="version" value="$Revision: 1.1 $" />
		<property name="lastupdated" value="$Date: 2007/06/15 13:59:14 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<string name="XFA.Save" scope="request" />
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
		</in>
		<out>
			<string name="fuseaction" scope="formOrUrl" />
			<number name="settingid" scope="attributes" />
			<string name="adminemail" scope="attributes" />
			<string name="moderatoremail" scope="attributes" />
			<string name="forumsname" scope="attributes" />
			<string name="forumsurl" scope="attributes" />
			<string name="smtpserver" scope="attributes" />
			<boolean name="censorship" scope="attributes" />
			<number name="privatemessages" scope="attributes" />
		</out>
	</io>
</fusedoc>
--->
</cfsilent>

<cfoutput>
<!--- The following is based on the code in /v3.00/Forum/Admin/dsp_mainsettings.cfm --->
<!--- NB could also include companyurl,logourl --->

<table align="center" border="0" width="85%" class="style1">
  <tr>
	<th colspan="2" align="center" class="headingtext">M A I N &nbsp;&nbsp; S E T T I N G S<br /><br /></th>
  </tr>
	
  <cfloop query="mainsettings">
	
	<cfset cachingdays=int(mainsettings.cachingduration/1440)>
		<cfset remainder=mainsettings.cachingduration-(cachingdays*1440)>
	<cfset cachinghours=int(remainder/60)>
		<cfset remainder=remainder-(cachinghours*60)>
	<cfset cachingminutes=int(remainder)>

	<cfform name="mainsettingsform" action="#request.self#" method="post">
	<input type="hidden" name="fuseaction" id="fuseaction" value="#XFA.Save#" />
	<input type="hidden" name="settingid" id="settingid" value="#mainsettings.settingid#" />

	<tr>
		<th class="smallheader" width="50%">Administrator's Email:</th>
		<td><cfinput type="text" name="adminemail" value="#mainsettings.adminemail#" maxlength="150" size="45" required="yes" message="Please enter the administrator's email address"></td>
	</tr>
	<tr>
		<th class="smallheader">Moderator's Email:</th>
		<td><cfinput type="text" name="moderatoremail" value="#mainsettings.moderatoremail#" maxlength="150" size="45" required="yes" message="Please enter the moderator's email address"></td>
	</tr>	
	<tr>
		<th class="smallheader">Forum Name:</th>
		<td><cfinput type="text" name="forumsname" value="#mainsettings.forumsname#" maxlength="50" size="45" required="yes" message="Please enter the name for the forum"></td>
	</tr>	
	<!---
	<tr>
		<th class="smallheader">Forum Path:</th>
		<td><cfinput type="text" name="forumspath" value="#mainsettings.forumspath#" maxlength="150" size="45" required="yes" message="Please enter the path for the forum"></td>
	</tr>	
	--->	
 	<tr>
		<th class="smallheader">Forum URL:</th>
		<td><cfinput type="text" name="forumsurl" value="#mainsettings.forumsurl#" maxlength="150" size="45" required="yes" message="Please enter the URL for the forum"></td>
	</tr>			
	<!---
	<tr>
		<th class="smallheader">Company URL:</th>
		<td><cfinput type="text" name="companyurl" value="#mainsettings.companyurl#" size="45" required="yes" message="Please enter the URL for the company"></td>
	</tr>
	--->	
	<!---
	<tr>
		<th class="smallheader">Logo URL:</th>
		<td><cfinput type="text" name="logourl" value="#mainsettings.logourl#" size="45" required="yes" message="Please enter the URL for the logo"></td>
	</tr>
	--->
	<tr>
		<th class="smallheader">SMTP Server</th>
		<td><cfinput type="text" name="smtpserver" value="#mainsettings.smtpserver#" maxlength="50" size="45" required="yes" message="Please enter the SMTP Server"></td>
	</tr>		
	<tr>
		<th class="smallheader">Censorship:</th>
		<td>
		<select name="censorship" id="censorship">
		<option value="1"<cfif val(mainsettings.censorship)> selected="selected"</cfif>>Yes</option>
		<option value="0"<cfif NOT val(mainsettings.censorship)> selected="selected"</cfif>>No</option>
		</select>
		</td>
	</tr>		
	<tr>
		<th class="smallheader">Allow Private Messages:</th>
		<td>
		<select name="privatemessages" id="privatemessages">
		<option value="1"<cfif val(mainsettings.privatemessages)> selected="selected"</cfif>>Yes</option>
		<option value="0"<cfif NOT val(mainsettings.privatemessages)> selected="selected"</cfif>>No</option>
		</select>		
		</td>
	</tr>		
	<tr>
		<td colspan="2">
			<input type="submit" name="update" id="update" value="Update main settings" />
		</td>
	</tr>				
	</cfform>

  </cfloop>

</table>
</cfoutput>

<cfsilent>
<!--- 
$Log: dsp_mainsettings.cfm,v $
Revision 1.1  2007/06/15 13:59:14  kevin
Add Admin Modules

Revision 1.4  2005/05/25 14:10:09  andrew
XHTML Validation chages including removing encoding="UTF-16" to prevent double spacing

Revision 1.3  2005/05/03 12:57:19  kevin
Change XFA scope

Revision 1.2  2005/03/14 17:53:37  mike
correct name on save button

Revision 1.1  2005/03/09 13:51:28  mike
Moved to create MVC version

Revision 1.6  2005/02/24 13:57:38  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.5  2005/02/15 12:25:33  mike
explicitly qualify fields inside a <cfloop> by the query name, etc.

Revision 1.4  2005/02/09 12:49:13  mike
changes for XHTML compliance, etc.

Revision 1.3  2005/02/08 17:18:27  mike
index.cfm => #request.self#

Revision 1.2  2005/02/08 14:50:35  mike
remove useless onfocus= clause

Revision 1.1  2005/02/08 13:42:24  mike
new file
--->
</cfsilent>