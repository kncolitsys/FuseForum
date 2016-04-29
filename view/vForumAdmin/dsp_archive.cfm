<cfsilent>
<!--- -->
<?xml version="1.0"?>
<fusedoc fuse="dsp_archive.cfm">
	<responsibilities>
		I display a form allowing the forum archiving parameters to be altered
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
				<boolean name="archive" />
				<number name="archivetimespan" />
				<datetime name="archivetimeofday" />
			</recordset>
		</in>
		<out>
			<string name="fuseaction" scope="formOrUrl" />
			<number name="settingid" scope="formOrUrl" />
			<boolean name="archive" scope="formOrUrl" />
			<string name="archivetimespan" scope="formOrUrl" />
			<string name="archivetimeofday" scope="formOrUrl" />
		</out>
	</io>
</fusedoc>
--->
</cfsilent>

<cfoutput>
<table align="center" border="0" width="85%" class="style1">
  <tr>
	<th colspan="2" align="center" class="headingtext">A R C H I V I N G<br /><br /></th>
  </tr>
	
  <cfloop query="mainsettings">
	
	<cfform name="archiveform" action="#request.self#" method="post">
	
	<input type="hidden" name="fuseaction" id="fuseaction" value="#XFA.Save#" />
	<input type="hidden" name="settingid" id="settingid" value="#mainsettings.settingid#" />
 	<tr>
		<th class="smallheader" width="50%">Archive:</th>
		<td width="50%">
		<select name="archive"id="archive">
		<option value="1"<cfif mainsettings.archive> selected="selected"</cfif> />Yes</option>
		<option value="0"<cfif NOT mainsettings.archive> selected="selected"</cfif> />No</option>
		</select>
		</td>
	</tr>		
	<tr>
		<th class="smallheader">Archive at age:</th>
		<td><cfinput type="text" name="archivetimespan" value="#mainsettings.archivetimespan#" size="2" required="yes" message="Please enter the age at which to archive messages"> months</td>
	</tr>
	<tr>
		<th class="smallheader">Time of day to archive:</th>
		<td><cfinput type="text" name="archivetimeofday" value="#timeformat(mainsettings.archivetimeofday,'HH:mm:ss')#" validate="time" size="6" message="Please enter a valid time of day (HH:mm:ss 24 hr clock)"> HH:mm:ss (24 hr clock)</td>
	</tr>	
		<td colspan="2" align="center">
			<input type="submit" name="update" id="update" value="Update archive settings" />
		</td>
	</tr>				
	</cfform>
	
  </cfloop>

</table>
</cfoutput>

<cfsilent>
<!--- 
$Log: dsp_archive.cfm,v $
Revision 1.1  2007/06/15 13:59:14  kevin
Add Admin Modules

Revision 1.3  2005/05/25 14:09:37  andrew
XHTML Validation chages including removing encoding="UTF-16" to prevent double spacing

Revision 1.2  2005/05/03 12:57:19  kevin
Change XFA scope

Revision 1.1  2005/03/09 13:51:26  mike
Moved to create MVC version

Revision 1.7  2005/02/24 13:57:30  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.6  2005/02/15 10:14:04  mike
give the form a name

Revision 1.5  2005/02/09 12:53:00  mike
changes for XHTML compliance, etc.

Revision 1.4  2005/02/08 17:10:50  mike
index.cfm => #request.self#

Revision 1.3  2005/02/08 14:50:34  mike
remove useless onfocus= clause

Revision 1.2  2005/02/08 13:47:24  mike
improve fusedoc, etc.

Revision 1.1  2005/02/04 19:56:49  mike
FB3 version made from wireframe with fusebuilder, with contents pasted from FB2 version, fbx_switch fully commented, and XFA usage improved throughout
---> 
</cfsilent>