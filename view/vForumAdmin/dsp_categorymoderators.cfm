<cfsilent>
<!--- -->
<?xml version="1.0"?>
<fusedoc fuse="dsp_categorymoderators.cfm">
	<responsibilities>
		I display a form with the existing moderators for the given forum, allowing them to be added or removed
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
			<number name="categoryid" scope="attributes" />
			<recordset name="categorymoderators" scope="variables" format="CFML">
				<number name="userid" />
				<string name="username"/>
			</recordset>
			<recordset name="allmoderators" scope="variables" format="CFML">
				<number name="name_id" />
				<string name="name_login_name"/>
			</recordset>
		</in>
		<out>
			<string name="fuseaction" scope="formOrUrl" />
			<number name="categoryid" scope="formOrUrl" />
			<string name="add" scope="formOrUrl" optional="Yes" />
			<string name="del" scope="formOrUrl" optional="Yes" />
			<number name="addmoderator" scope="formOrUrl" optional="Yes" />
			<number name="categorymoderator" scope="formOrUrl" optional="Yes" />
		</out>
	</io>
</fusedoc>
--->
</cfsilent>

<cfoutput>	
<table align="center" border="0" width="85%" class="style1">
	<tr>
		<th colspan="2" align="center" class="headingtext">F O R U M &nbsp;&nbsp;M O D E R A T O R S<br /></th>
	</tr>
	<tr>
		<th colspan="2" align="center" class="smallheader">For forum "<u>#categorytitle.categoryname#</u>"<br /><br /></th>
	</tr>
	
	<cfform name="categorymoderatorsform" action="#request.self#" method="post">
	<input type="hidden" name="fuseaction" id="fuseaction" value="#XFA.Save#" />
	<input type="hidden" name="categoryid" id="categoryid" value="#attributes.categoryid#" />
 	<tr>
		<th class="smallheader" width="50%">Add forum moderator:</th>
		<td width="50%">
		<cfif allmoderators.recordcount>
			<cfselect query="allmoderators" 
			  name="addmoderator" 
			  value="name_id" 
			  display="name_login_name">
			</cfselect>
		<cfelse>
			(none)
		</cfif>
		</td>
	</tr>	
	<cfif allmoderators.recordcount>	
		<tr>
			<td></td>
			<td>
				<input type="submit" name="add" id="add" value="Add moderator" /><br /><br />
			</td>
		</tr>
	</cfif>
	
	<tr>
		<th class="smallheader">Existing moderators:</th>
		<td>
		<cfif categorymoderators.recordcount>
			<cfselect query="categorymoderators" 
					  name="categorymoderator" 
					  value="userid" 
					  display="username">
			</cfselect>
		<cfelse>
			(none)
		</cfif>
		</td>
	</tr>
	<cfif categorymoderators.recordcount>
		<tr>
			<td></td>
			<td>
				<input type="submit" name="del" id="del" value="Remove this moderator" />
			</td>	
		</tr>
	</cfif>
	
	</cfform>

</table>
</cfoutput>

<cfsilent>
<!--- 
$Log: dsp_categorymoderators.cfm,v $
Revision 1.1  2007/06/15 13:59:14  kevin
Add Admin Modules

Revision 1.5  2005/05/25 14:09:25  andrew
XHTML Validation chages including removing encoding="UTF-16" to prevent double spacing

Revision 1.4  2005/05/10 11:13:39  mike
text change "category" => "forum"

Revision 1.3  2005/05/03 12:57:19  kevin
Change XFA scope

Revision 1.2  2005/04/11 12:22:59  mike
name="categorymoderators" => name="categorymoderator"

Revision 1.1  2005/03/09 13:51:27  mike
Moved to create MVC version

Revision 1.7  2005/02/24 13:57:33  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.6  2005/02/09 14:32:30  mike
bug fix: </cfoutput> need to be moved to after </cfform>

Revision 1.5  2005/02/09 13:51:04  mike
changes for XHTML compliance, improve fusedoc, etc.

Revision 1.4  2005/02/08 17:12:54  mike
index.cfm => #request.self#, etc.

Revision 1.3  2005/02/08 14:50:34  mike
remove useless onfocus= clause

Revision 1.2  2005/02/07 18:14:45  mike
improved fusedoc etc.

Revision 1.1  2005/02/04 19:56:49  mike
FB3 version made from wireframe with fusebuilder, with contents pasted from FB2 version, fbx_switch fully commented, and XFA usage improved throughout
---> 
</cfsilent>