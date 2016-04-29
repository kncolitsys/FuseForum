<cfsilent>
<!--- -->
<?xml version="1.0"?>
<fusedoc fuse="dsp_categories.cfm">
	<responsibilities>
		I display all the Forums, with the ability to add a new one, and delete or edit existing ones
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
			<string name="XFA.Add" scope="request" />
			<string name="XFA.Edit" scope="request" />
			<string name="XFA.Delete" scope="request" />
			<string name="XFA.Moderators" scope="request" />
			<string name="XFA.Members" scope="request" />
			<recordset name="qCategories" scope="variables" format="CFML">
				<number name="categoryid" />
				<string name="categoryname" />
				<string name="description" />
				<string name="status" />
				<boolean name="allowattachments" />
				<number name="messagelimit" />
				<number name="archivedays" />
				<boolean name="approval" />
				<boolean name="readonly" />
				<number name="categoryowner" />
				<string name="visibleto" />
			</recordset>
		</in>
		<out>
			<string name="fuseaction" scope="formOrUrl" />
		</out>
	</io>
</fusedoc>
--->
</cfsilent>

<cfoutput>
<table align="center" border="0" width="100%" class="style1">
	<tr>
		<td>&nbsp;</td>
		<td align="right" width="100"><a href="#request.self#?fuseaction=#XFA.Add#">Add Forum</a></td>
	</tr>
</table>

<table align="center" border="0" width="85%" class="style1">
	<tr>
		<th align="center" class="headingtext">F O R U M S<br /><br /></th>
	</tr>
</table>

<cfloop query="qCategories">
	<table border="0" width="85%" cellspacing="0" align="center" class="style1">
	<tr>
		<td class="tableheader">
			<table align="center" border="0" cellspacing="0" width="100%">
			<tr>
				<td>&nbsp;<b>#qCategories.categoryname#</b></td>
				<td align="right" width="120">
				<b>Attachments: <span style="color:###request.textcolor2#"><cfif qCategories.allowattachments>Yes<cfelse>No</cfif></span></b>
				</td>
				<td align="right" width="120"><b>Status: <span style="color:###request.textcolor2#">#qCategories.status#</span></b>
				<cfif qCategories.readonly>
					<a title="Read only, no user posts allowed"><b> <span style="color:###request.textcolor2#">RO</span></b></a>
				<cfelse>
					<a title="Read Write, user posts allowed"><b> <span style="color:###request.textcolor2#">RW</span></b></a>
				</cfif></td>	
			</tr>
			</table>	
		</td>
	</tr>
	<tr>
		<td class="tableflat">&nbsp;#qCategories.description#</td>
	</tr>
	<tr>
		<td class="tableheader">
			<table align="center" border="0" cellspacing="0" width="100%">
			<tr>
				<td width="50">&nbsp;<a href="#request.self#?fuseaction=#XFA.Edit#&amp;categoryid=#qCategories.categoryid#">Edit</a></td>
				<td width="65">&nbsp;<a href="#request.self#?fuseaction=#XFA.Delete#&amp;categoryid=#qCategories.categoryid#">Delete</a></td>
				<td width="85">&nbsp;<a href="#request.self#?fuseaction=#XFA.Moderators#&amp;categoryid=#qCategories.categoryid#">Moderators</a></td>
				<cfif visibleto IS "Members"><!--- NB can never be activated because visible to Members not supported --->
				<td>&nbsp;<a href="#request.self#?fuseaction=#XFA.Members#&amp;categoryid=#qCategories.categoryid#">Members</a></td>
				</cfif>
				<td align="right">Visible to: <b><span style="color:###request.textcolor2#">#visibleto#</span></b></td>
			</tr>
			</table>		
		</td>
	</tr>
	</table>
	<br /><br />
</cfloop>
</cfoutput>

<cfsilent>
<!--- 
$Log: dsp_categories.cfm,v $
Revision 1.1  2007/06/15 13:59:14  kevin
Add Admin Modules

Revision 1.4  2005/05/25 14:10:49  andrew
XHTML Validation chages including removing encoding="UTF-16" to prevent double spacing

Revision 1.3  2005/05/03 12:57:19  kevin
Change XFA scope

Revision 1.2  2005/04/20 14:11:13  mike
change query name to qCategories

Revision 1.1  2005/03/09 13:51:27  mike
Moved to create MVC version

Revision 1.7  2005/02/24 13:57:32  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.6  2005/02/15 10:15:03  mike
replace & by &amp; for strict HTML compliance

Revision 1.5  2005/02/09 16:27:04  mike
changes for XHTML compliance, improve fusedoc, etc.

Revision 1.4  2005/02/08 17:12:07  mike
index.cfm => #request.self#

Revision 1.3  2005/02/08 14:50:34  mike
remove useless onfocus= clause

Revision 1.2  2005/02/07 18:16:20  mike
added <cfoutput> round the whole thing

Revision 1.1  2005/02/04 19:56:49  mike
FB3 version made from wireframe with fusebuilder, with contents pasted from FB2 version, fbx_switch fully commented, and XFA usage improved throughout
---> 
</cfsilent>