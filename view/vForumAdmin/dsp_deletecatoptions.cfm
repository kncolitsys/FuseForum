<cfsilent>
<!--- -->
<?xml version="1.0"?>
<fusedoc fuse="dsp_deletecatoptions.cfm">
	<responsibilities>
		I display a form allowing a forum to be deleted, with choice of options as to what happens to its threads etc.
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
			<recordset name="categorylist" scope="variables" format="CFML">
				<number name="CategoryID"/>
				<string name="CategoryName"/>
			</recordset>
		</in>
		<out>
			<string name="fuseaction" scope="formOrUrl" />
			<number name="categoryid" scope="formOrUrl" />
			<string name="deleteaction" scope="formOrUrl" />
		</out>
	</io>
</fusedoc>
--->
</cfsilent>

<script language="JavaScript" type="text/javascript">
<!--
function showlist(action)
  {
	//if (action==1)
		//deleteform.newcategory.disabled=false;
	//else
		//deleteform.newcategory.disabled=true;
  }
//-->
</script>

<cfoutput>
<table align="center" border="0" width="85%" class="style1">
	<tr>
		<th colspan="2" align="center" class="headingtext">D E L E T E &nbsp;&nbsp;F O R U M<br /><br /></th>
	</tr>
	<tr>
		<td colspan="2" align="center">What would you like to do with the threads and messages in this forum?</td>
	</tr>	
	<form name="deleteform" action="#request.self#" method="post">
	<input type="hidden" name="fuseaction" id="fuseaction" value="#XFA.Save#" />	
	<input type="hidden" name="categoryid" id="categoryid" value="#attributes.categoryid#" />	
	<tr>
		<th class="smallheader" width="50%">Archive threads &amp; messages</th>
		<td width="50%"><input type="radio" name="deleteaction" id="deleteaction_archive" value="archive" class="normalinput"<cfif categorylist.recordcount GT 0> onclick="showlist('0');"</cfif> checked="checked" /></td>
	</tr>	
	<!---
	<tr>
		<th class="smallheader" width="50%">Move to another forum</th>
		<td width="50%">
		<cfif categorylist.recordcount GT 0>
			<input type="radio" name="deleteaction" id="deleteaction_move" value="move" class="normalinput" onclick="showlist('1');">
			
			<select name="newcategory" disabled="disabled">
			<cfloop query="categorylist">
				<option value="#categorylist.categoryid#">#categorylist.categoryname#</option>
			</cfloop>
			</select>
		<cfelse>
			<input type="radio" name="deleteaction" name="deleteaction_move" value="move" class="normalinput" disabled="disabled">
			There are no other forums
		</cfif>
		</td>
	</tr>
	--->
	<tr>
		<th class="smallheader" width="50%">Delete from database</th>
		<td width="50%"><input type="radio" name="deleteaction" id="deleteaction_delete" value="delete" class="normalinput"<cfif categorylist.recordcount GT 0> onclick="showlist('0');"</cfif> /></td>
	</tr>
	<tr>
		<td align="center" colspan="2"><input type="submit" name="perform" id="perform" value="Perform action" /></td>
	</tr>
	</form>						
</table>
</cfoutput>

<cfsilent>
<!--- 
$Log: dsp_deletecatoptions.cfm,v $
Revision 1.1  2007/06/15 13:59:14  kevin
Add Admin Modules

Revision 1.3  2005/05/25 14:09:25  andrew
XHTML Validation chages including removing encoding="UTF-16" to prevent double spacing

Revision 1.2  2005/05/03 12:57:19  kevin
Change XFA scope

Revision 1.1  2005/03/09 13:51:28  mike
Moved to create MVC version

Revision 1.8  2005/02/24 13:57:35  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.7  2005/02/15 10:17:22  mike
replace & by &amp; for strict HTML compliance

Revision 1.6  2005/02/11 11:34:49  mike
small edits for XHTML compliance

Revision 1.5  2005/02/10 13:32:00  mike
add type="text/javascript"

Revision 1.4  2005/02/10 11:50:16  mike
changes for XHTML compliance, improve fusedoc, etc.

Revision 1.3  2005/02/08 17:16:29  mike
disable the "move to another forum" option, etc.

Revision 1.2  2005/02/08 14:50:35  mike
remove useless onfocus= clause

Revision 1.1  2005/02/04 19:56:50  mike
FB3 version made from wireframe with fusebuilder, with contents pasted from FB2 version, fbx_switch fully commented, and XFA usage improved throughout
---> 
</cfsilent>