<cfsilent>
<!--- -->
<?xml version="1.0"?>
<fusedoc fuse="dsp_choosecategory.cfm">
	<responsibilities>
		I display a form to allow the user to select a Forum
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
			<string name="XFA.ChooseThread" scope="request" />
			<string name="nextfuseaction" scope="attributes" />
			<string name="goto" scope="attributes" />
			<string name="action" scope="attributes" optional="Yes" />
			<recordset name="mod_categories" scope="variables" format="CFML">
				<number name="categoryid" />
				<string name="categoryname"/>
				<string name="description"/>
				<string name="visibleto"/>
			</recordset>
		</in>
		<out>
			<string name="fuseaction" scope="formOrUrl" />
			<number name="categoryid" scope="formOrUrl" />
			<string name="goto" scope="formOrUrl" optional="Yes" />
			<string name="nextfuseaction" scope="formOrUrl" optional="Yes" />
			<string name="action" scope="formOrUrl" optional="Yes" />
		</out>
	</io>
</fusedoc>
--->
</cfsilent>

<cfoutput>
<table align="center" border="0" width="85%" class="style1">
	<tr>
		<th align="center" class="headingtext">C H O O S E &nbsp;&nbsp;A &nbsp;&nbsp;F O R U M<br /><br /></th>
	</tr>
</table>
	
<table align="center" border="0" width="600" cellspacing="0" class="style1">
	<tr>
		<th class="tableheader" align="left" width="150"><b>Name</b></th>
		<th class="tableheader" align="left"><b>Description</b></th>
		<th class="tableheader" align="left" width="60"><b>Visible to</b></th>
		<td class="tableheader" width="50">&nbsp;</td>
	</tr>
<cfloop query="mod_categories">
	<tr>
		<td>#mod_categories.categoryname#</td>
		<td>#mod_categories.description#</td>
		<td>#mod_categories.visibleto#</td>
		<td align="center">
			<cfif attributes.goto IS "c">
				<cfset followon_query_string="fuseaction=#attributes.nextfuseaction#&amp;categoryid=#mod_categories.categoryid#">
			<cfelse>
				<cfset followon_query_string="fuseaction=#XFA.ChooseThread#&amp;categoryid=#mod_categories.categoryid#&amp;goto=#attributes.goto#&amp;nextfuseaction=#attributes.nextfuseaction#">
			</cfif>				
			<cfif isDefined("attributes.action")>
				<cfset followon_query_string=followon_query_string&"&amp;action=#attributes.action#">
			</cfif>
			<a href="#request.self#?#followon_query_string#">choose</a>
		</td>
	</tr>
</cfloop>
</table>
</cfoutput>

<cfsilent>
<!--- 
$Log: dsp_choosecategory.cfm,v $
Revision 1.1  2007/06/15 13:59:14  kevin
Add Admin Modules

Revision 1.4  2005/05/25 14:09:25  andrew
XHTML Validation chages including removing encoding="UTF-16" to prevent double spacing

Revision 1.3  2005/05/03 12:57:19  kevin
Change XFA scope

Revision 1.2  2005/03/15 12:22:48  mike
replace use of "XFA" as a url param by "nextfuseaction"

Revision 1.1  2005/03/09 13:51:27  mike
Moved to create MVC version

Revision 1.6  2005/02/24 13:57:34  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.5  2005/02/15 10:16:37  mike
replace & by &amp; for strict HTML compliance

Revision 1.4  2005/02/09 17:24:59  mike
changes for XHTML compliance, improve fusedoc, etc.

Revision 1.3  2005/02/08 17:15:08  mike
index.cfm => #request.self#,, improved fusedoc, etc.

Revision 1.2  2005/02/08 14:50:35  mike
remove useless onfocus= clause

Revision 1.1  2005/02/04 19:56:49  mike
FB3 version made from wireframe with fusebuilder, with contents pasted from FB2 version, fbx_switch fully commented, and XFA usage improved throughout
---> 
</cfsilent>