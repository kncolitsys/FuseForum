<cfsilent>
<!--- -->
<?xml version="1.0"?>
<fusedoc fuse="dsp_choosemessage.cfm">
	<responsibilities>
		I display a form to allow a message to be selected
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
			<string name="XFA.Continue" scope="request" />
			<string name="nextfuseaction" scope="attributes" />
			<recordset name="mod_messages" scope="variables" format="CFML">
				<number name="messageid" />
				<string name="message" />
				<datetime name="messagedate" />
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
<table align="center" border="0" width="85%" class="style1">
	<tr>
		<th align="center" class="headingtext">C H O O S E &nbsp;&nbsp;A &nbsp;&nbsp;M E S S A G E<br /><br /></th>
	</tr>
</table>
	
<table align="center" border="0" width="600" cellspacing="0" class="style1">
	<tr>
		<th class="tableheader" align="left" width="150"><b>Message Date</b></th>
		<th class="tableheader" align="left"><b>Message</b></th>
		<th class="tableheader" align="left" width="50">&nbsp;</th>
	</tr>
<cfloop query="mod_messages">
	<tr>
		<td>#dateformat(mod_messages.messagedate,"dd/mm/yyyy")#</td>
		<td>#left(mod_messages.message,500)#</td>
		<td align="center">
			<cfset followon_query_string="fuseaction=#attributes.nextfuseaction#&amp;messageid=#mod_messages.messageid#">	
			<cfif isdefined("attributes.action")>
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
$Log: dsp_choosemessage.cfm,v $
Revision 1.1  2007/06/15 13:59:14  kevin
Add Admin Modules

Revision 1.3  2005/05/25 14:09:25  andrew
XHTML Validation chages including removing encoding="UTF-16" to prevent double spacing

Revision 1.2  2005/03/15 12:26:09  mike
replace use of "XFA" as a url param by "nextfuseaction"

Revision 1.1  2005/03/09 13:51:27  mike
Moved to create MVC version

Revision 1.6  2005/02/24 13:57:35  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.5  2005/02/15 10:16:54  mike
replace & by &amp; for strict HTML compliance

Revision 1.4  2005/02/10 11:28:00  mike
changes for XHTML compliance, improve fusedoc, etc.

Revision 1.3  2005/02/08 17:15:29  mike
index.cfm => #request.self#, etc.

Revision 1.2  2005/02/08 14:50:35  mike
remove useless onfocus= clause

Revision 1.1  2005/02/04 19:56:50  mike
FB3 version made from wireframe with fusebuilder, with contents pasted from FB2 version, fbx_switch fully commented, and XFA usage improved throughout
---> 
</cfsilent>