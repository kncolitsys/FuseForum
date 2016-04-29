<cfsilent>
<!--- -->
<?xml version="1.0"?>
<fusedoc fuse="dsp_categoryform.cfm">
	<responsibilities>
		I show a form allowing a Forum to be added or edited
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
			<string name="action" scope="attributes" />
			<number name="categoryid" scope="attributes" optional="Yes" />
			<recordset name="thiscategory" scope="variables" format="CFML" optional="Yes">
				<string name="categoryname" />
				<string name="description" />
				<string name="status" />
				<boolean name="allowattachments" />
				<number name="messagelimit" />
				<number name="archivedays" />
				<boolean name="approval" />
				<boolean name="readonly" />
				<string name="visibleto" />
			</recordset>
			<recordset name="qSites" scope="variables" format="CFML">
				<number name="SiteId" />
				<string name="SiteName" />
				<string name="SiteURL" />
			</recordset>
			<recordset name="qSiteCategories" scope="variables" format="CFML">
				<number name="SiteCategoriesId" />
				<number name="SiteId" />
				<number name="CategoryId" />
				<number name="Sequence" />
				<string name="categoryname" />
			</recordset>
		</in>
		<out>
			<string name="fuseaction" scope="formOrUrl" />
			<number name="categoryid" scope="formOrUrl" optional="Yes" />
			<string name="categoryname" scope="formOrUrl" />
			<string name="description" scope="formOrUrl" />
			<string name="status" scope="formOrUrl" />
			<boolean name="allowattachments" scope="formOrUrl" />
			<number name="messagelimit" scope="formOrUrl" />
			<number name="archivedays" scope="formOrUrl" />
			<boolean name="approval" scope="formOrUrl" />
			<boolean name="readonly" scope="formOrUrl" />
			<string name="visibleto" scope="formOrUrl" />
			<boolean name="Selected_#SiteId#" scope="formOrUrl" optional="Yes" />
			<number name="Sequence_#SiteId#" scope="formOrUrl" optional="Yes" />
		</out>
	</io>
</fusedoc>
--->
</cfsilent>

<cfoutput>	

<!--- Javascript Validation --->
<script language="javascript" src="view\validation.js"></script>

<script language="JavaScript" type="text/JavaScript">
<!--
function IsChecked(SiteId)
  {
	var temp = "document.categoryform.Sequence_" + SiteId + ".disabled = ! document.categoryform.Selected_" + SiteId + ".checked";
	var temp = eval(temp);
  }

function checkform(form)
  {
	var numfieldDisplayArray = new Array("messagelimit","archivedays");
	var numfieldArray = new Array("messagelimit","archivedays");

	if(form.categoryname.value == "")
		{	alert("Please enter a forum name");
			return false;
		}
	if(form.messagelimit.value == "")
		{	alert("Please enter a valid number for the message limit");
			return false;
		}
	if(form.archivedays.value == "")
		{	alert("Please enter a valid number of days");
			return false;
		}
	if (!checknum(numfieldArray,numfieldDisplayArray,form)){return false;};
	<cfif attributes.action IS 'blank'>
		document.getElementById("add").disabled=true;
	<cfelse>
		document.getElementById("update").disabled=true;
	</cfif>
	form.submit();
  }
// -->
</script>

<cfset attributes.fieldlist="categoryname,description,status,allowattachments,messagelimit,archivedays,approval,readonly,visibleto">
<cfif attributes.action is "blank">
	<cfloop list="#attributes.fieldlist#" index="counter">
		<cfset setvariable("#counter#","")>
	</cfloop>
<cfelseif attributes.action is "query">
	<cfloop list="#attributes.fieldlist#" index="counter">
		<cfset setvariable("#counter#", "#evaluate('thiscategory.'&'#counter#')#")>
	</cfloop>
</cfif>

<form name="categoryform" onsubmit="return checkform(this);" action="#request.self#" method="post">
<input type="hidden" name="fuseaction" id="fuseaction" value="#XFA.Save#" />
<cfif attributes.action is "query">
	<input type="hidden" name="categoryid" id="categoryid" value="#attributes.categoryid#" />
</cfif>
<table align="center" border="0" width="85%" class="style1">
<tr>
	<th colspan="2" align="center" class="headingtext">
	<cfif attributes.action is "blank">A D D<cfelse>E D I T</cfif> &nbsp;&nbsp; F O R U M<br /><br />
	</th>
</tr>	
<tr>
	<th valign="top" class="smallheader" width="40%">Forum Name:</th>
	<td width="60%"><input type="text" name="categoryname" id="categoryname" value="#categoryname#" maxlength="50" /></td>
</tr>	
<tr>
	<th valign="top" class="smallheader">Description:</th>
	<td><textarea name="description" id="description" cols="40" rows="8">#description#</textarea> (max 100 characters)</td>
</tr>		
<tr>
	<th valign="top" class="smallheader">Status:</th>
	<td>
	<select name="status" id="status">
	<option value="Active"<cfif status IS "active"> selected="selected"</cfif>>Active</option>
	<option value="Inactive"<cfif status IS "inactive"> selected="selected"</cfif>>Inactive</option>
	</select>
	</td>
</tr>	
<tr>
	<th valign="top" class="smallheader">Allow Attachments:</th>
	<td>
	<select name="allowattachments" id="allowattachments">
	<option value="1"<cfif allowattachments EQ 1> selected="selected"</cfif>>Yes</option>
	<option value="0"<cfif allowattachments EQ 0> selected="selected"</cfif>>No</option>
	</select>
	</td>
</tr>	
<tr>
	<th valign="top" class="smallheader">Message Limit:</th>
	<td><input type="text" name="messagelimit" id="messagelimit" value="#messagelimit#" /></td>
</tr>
<tr>
	<th valign="top" class="smallheader">Archive Inactive Threads after (days):</th>
	<td><input type="text" name="archivedays" id="archivedays" value="#archivedays#" /></td>
</tr>
<tr>
	<th valign="top" class="smallheader">Approval required:</th>
	<td>
	<select name="approval" id="approval">
	<option value="0"<cfif approval EQ 0> selected="selected"</cfif>>No</option>
	<option value="1"<cfif approval EQ 1> selected="selected"</cfif>>Yes</option>
	</select>
	</td>
</tr>	
<tr>
	<th valign="top" class="smallheader">Read only:</th>
	<td>
	<select name="readonly" id="readonly">
	<option value="0"<cfif readonly EQ 0> selected="selected"</cfif>>No</option>
	<option value="1"<cfif readonly EQ 1> selected="selected"</cfif>>Yes</option>
	</select>
	</td>
</tr>	
<tr>
	<th valign="top" class="smallheader">Visible to:</th>
	<td>
	<select name="visibleto" id="visibleto">
		<option value="Public"<cfif visibleto IS "Public"> selected="selected"</cfif>>Public</option>
		<option value="ERSC"<cfif visibleto IS "ERSC"> selected="selected"</cfif>>ERSC</option>
		<option value="ER"<cfif visibleto IS "ER"> selected="selected"</cfif>>ER</option>
		<option value="Referees"<cfif visibleto IS "Referees"> selected="selected"</cfif>>Referees</option>
		<option value="Moderators"<cfif visibleto IS "Moderators"> selected="selected"</cfif>>Moderators</option>
		<option value="Administrators"<cfif visibleto IS "Administrators"> selected="selected"</cfif>>Administrators</option>
	</select>
	</td>
</tr>
<tr>
	<th valign="top" class="smallheader">Visible on Sites:</th>
	<td>
		<table>
		<cfloop query="qSites">
			<cfquery name="qCategories" dbtype="query">
				SELECT	CategoryId,
						categoryname,
						Sequence
				FROM	qSiteCategories
				WHERE	SiteId = #qSites.SiteId#
				ORDER BY	Sequence ASC
			</cfquery>
			<tr>
			<td width="30%">#qSites.SiteName#
			</td>
			<cfif attributes.action IS "query"><!--- so we are editing an existing Forum --->
				<cfquery name="qCategory" dbtype="query">
					SELECT	CategoryId,
							categoryname,
							Sequence
					FROM	qSiteCategories
					WHERE	SiteId = #qSites.SiteId#
						AND CategoryId = #attributes.categoryid#
				</cfquery>
				<td width="15%">
				<input type="checkbox" name="Selected_#qSites.SiteId#" id="Selected_#qSites.SiteId#"
					value="True" onclick="IsChecked('#qSites.SiteId#');"
					<cfif qCategory.recordcount>checked="checked"</cfif>
				>
				</td>
				<td width="55%">
				<select name="Sequence_#qSites.SiteId#" id="Sequence_#qSites.SiteId#">
					<option value="0"
					<cfif qCategory.recordcount AND qCategory.Sequence EQ 1>selected="selected"</cfif>
					>(At Start)</option>
					<cfloop query="qCategories">
						<cfif qCategories.CategoryId NEQ attributes.categoryid>
							<option value="#qCategories.Sequence#"
							<cfif qCategory.recordcount AND qCategories.Sequence EQ val(qCategory.Sequence-1)>selected="selected"</cfif>
							>After #qCategories.categoryname#</option>
						</cfif>
					</cfloop>
				</select>
				</td>
			<cfelse><!--- so we are creating a new Forum --->
				<td>
				<input type="checkbox" name="Selected_#qSites.SiteId#" id="Selected_#qSites.SiteId#"
					value="True" onclick="IsChecked('#qSites.SiteId#');"
					checked="checked">
				</td>
				<td>
				<select name="Sequence_#qSites.SiteId#" id="Sequence_#qSites.SiteId#">
					<option value="0" selected="selected">(At Start)</option>
					<cfloop query="qCategories">
						<option value="#qCategories.Sequence#">After #qCategories.categoryname#</option>
					</cfloop>
				</select>
				</td>
			</cfif>
			</tr>
		</cfloop>
		</table>
	</td>
</tr>	
<cfloop query="qSites">
	<script language="JavaScript" type="text/JavaScript">
	<!--
	IsChecked(#qSites.SiteId#);
	// -->
	</script>
</cfloop>
<tr>
	<td colspan="2" align="center">
	<cfif attributes.action IS 'blank'>
		<input type="submit" name="add" id="add" value="Add forum" />
	<cfelse>
		<input type="submit" name="update" id="update" value="Save Changes" />
	</cfif>
	</td>
</tr>
</table>	
</form>	
</cfoutput>			
	
<cfsilent>
<!--- 
$Log: dsp_categoryform.cfm,v $
Revision 1.1  2007/06/15 13:59:14  kevin
Add Admin Modules

Revision 1.9  2006/09/05 09:30:38  mike
disable Save button to prevent it being hit more than once

Revision 1.8  2005/05/25 14:11:22  andrew
XHTML Validation chages including removing encoding="UTF-16" to prevent double spacing

Revision 1.7  2005/05/24 10:32:14  mike
add the Referees option

Revision 1.6  2005/05/10 11:13:00  mike
change page title, etc.

Revision 1.5  2005/05/03 12:57:19  kevin
Change XFA scope

Revision 1.4  2005/04/29 12:36:53  mike
set value="True" on checkboxes

Revision 1.3  2005/04/22 17:58:05  mike
add stuff for assigning to multiple sites

Revision 1.2  2005/04/20 11:44:21  mike
handle the new field archivedays

Revision 1.1  2005/03/09 13:51:27  mike
Moved to create MVC version

Revision 1.7  2005/02/24 13:57:32  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.6  2005/02/09 14:17:33  mike
changes for XHTML compliance, improve fusedoc, etc.

Revision 1.5  2005/02/08 17:12:37  mike
index.cfm => #request.self#, etc.

Revision 1.4  2005/02/08 15:03:40  mike
<cfquery> has been hived off into qry_categoryform.cfm

Revision 1.3  2005/02/08 14:50:34  mike
remove useless onfocus= clause

Revision 1.2  2005/02/07 15:55:33  mike
replaced attributes.submitForm by XFA.Save, etc.

Revision 1.1  2005/02/04 19:56:49  mike
FB3 version made from wireframe with fusebuilder, with contents pasted from FB2 version, fbx_switch fully commented, and XFA usage improved throughout
---> 
</cfsilent>