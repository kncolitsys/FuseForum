<cfsilent>
<!--- -->
<?xml version="1.0"?>
<fusedoc fuse="dsp_caching.cfm">
	<responsibilities>
		I display a form allowing the Cacheing settings of the Forums system to be altered
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
				<boolean name="querycaching" />
				<number name="cachingduration" />
			</recordset>
		</in>
		<out>
			<string name="fuseaction" scope="formOrUrl" />
			<number name="settingid" scope="formOrUrl" />
			<boolean name="querycaching" scope="formOrUrl" />
			<number name="cachingdays" scope="formOrUrl" />
			<number name="cachinghours" scope="formOrUrl" />
			<number name="cachingmins" scope="formOrUrl" />
		</out>
	</io>
</fusedoc>
--->
</cfsilent>

<cfoutput>
<table align="center" border="0" width="85%" class="style1">
  <tr>
	<th colspan="2" align="center" class="headingtext">Q U E R Y &nbsp;&nbsp;C A C H I N G<br /><br /></th>
  </tr>
	
  <cfloop query="mainsettings">
	
	<cfset varables.cachingdays=int(mainsettings.cachingduration/1440)>
		<cfset varables.remainder=cachingduration-(varables.cachingdays*1440)>
	<cfset varables.cachinghours=int(varables.remainder/60)>
		<cfset varables.remainder=varables.remainder-(varables.cachinghours*60)>
	<cfset varables.cachingminutes=int(varables.remainder)>
	
	<cfform name="cachingform" action="#request.self#" method="post">
	
	<input type="hidden" name="fuseaction" id="fuseaction" value="#XFA.Save#" />
	<input type="hidden" name="settingid" id="settingid" value="#mainsettings.settingid#" />
 	<tr>
		<th class="smallheader" width="50%">Query Caching:</th>
		<td width="50%">
		<select name="querycaching" id="querycaching">
		<option value="1"<cfif mainsettings.querycaching> selected="selected"</cfif>>Yes</option>
		<option value="0"<cfif NOT mainsettings.querycaching> selected="selected"</cfif>>No</option>
		</select>
		</td>
	</tr>		
	<tr>
		<th class="smallheader">Caching Duration:</th>
		<td>
		<input type="text" name="cachingdays" id="cachingdays" value="#varables.cachingdays#" size="2" /> days
		<input type="text" name="cachinghours" id="cachinghours" value="#varables.cachinghours#" size="2" /> hours
		<input type="text" name="cachingmins" id="cachingmins" value="#varables.cachingminutes#" size="2" /> mins
		</td>
	</tr>
	<tr>
		<td colspan="2" align="center">
			<input type="submit" name="update" id="update" value="Update caching settings" />
		</td>
	</tr>				
	</cfform>
	
  </cfloop>

</table>
</cfoutput>

<cfsilent>
<!--- 
$Log: dsp_caching.cfm,v $
Revision 1.1  2007/06/15 13:59:14  kevin
Add Admin Modules

Revision 1.3  2005/05/25 14:10:54  andrew
XHTML Validation chages including removing encoding="UTF-16" to prevent double spacing

Revision 1.2  2005/05/03 12:57:19  kevin
Change XFA scope

Revision 1.1  2005/03/09 13:51:27  mike
Moved to create MVC version

Revision 1.7  2005/02/24 13:57:31  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.6  2005/02/10 10:14:26  mike
made alterations to where <th> was used

Revision 1.5  2005/02/09 13:40:52  mike
changes for XHTML compliance, improve fusedoc, etc.

Revision 1.4  2005/02/08 17:11:38  mike
index.cfm => #request.self#

Revision 1.3  2005/02/08 14:50:34  mike
remove useless onfocus= clause

Revision 1.2  2005/02/08 13:49:09  mike
improve fusedoc, etc.

Revision 1.1  2005/02/04 19:56:49  mike
FB3 version made from wireframe with fusebuilder, with contents pasted from FB2 version, fbx_switch fully commented, and XFA usage improved throughout
---> 
</cfsilent>