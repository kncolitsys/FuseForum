<cfsilent>
<!--- -->
<?xml version="1.0"?>
<fusedoc fuse="dsp_moderatorapproval.cfm">
	<responsibilities>
		I show any threads and messages needing approval
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
			<string name="XFA.View" scope="request" />
			<recordset name="approvethreads" scope="variables" format="CFML">
				<number name="threadid" />
				<string name="threadname" />
				<datetime name="datecreated" />
			</recordset>
			<recordset name="approvemessages" scope="variables" format="CFML">
				<number name="messageid" />
				<string name="message" />
				<datetime name="messagedate" />
			</recordset>
		</in>
		<out>
			<string name="fuseaction" scope="formOrUrl" />
			<number name="messageid" scope="formOrUrl" />
		</out>
	</io>
</fusedoc>
--->
</cfsilent>

<cfoutput>
<table align="center" border="0" width="600" cellspacing="0" class="style1">
	<tr>
		<th align="center" class="headingtext">M E S S A G E &nbsp;&nbsp; A P P R O V A L<br /><br /></th>
	</tr>
	<tr>
		<td align="center">
			There are <b>#approvethreads.recordcount#</b> threads and
					  <b>#approvemessages.recordcount#</b> messages to approve
		</td>
	</tr>
</table>

<cfif approvethreads.recordcount>
	<table align="center" border="0" width="600" cellspacing="0" class="style1">
		<tr>
			<td class="smallheader">Threads:</td>
		</tr>
	<tr>
		<th class="tableheader" align="left" width="50"><b>ThreadID</b></th>
		<th class="tableheader" align="left" width="400"><b>Title</b></th>		
		<th class="tableheader" align="left" width="100"><b>Date Created</b></th>
		<th class="tableheader" align="left" width="50">&nbsp;</th>
	</tr>	
		<cfloop query="approvethreads">
		<tr>
			<td>#approvethreads.threadid#</td>
			<td>#approvethreads.threadname#</td>
			<td>#dateformat(approvethreads.datecreated,"dd/mm/yyyy")#</td>
			<td align="center"><a href="#request.self#?fuseaction=#XFA.View#&amp;threadid=#approvethreads.threadid#">view</a></td>
		</tr>
		</cfloop>
	</table>
</cfif>
<br />
<br />
<cfif approvemessages.recordcount>
	<table align="center" border="0" width="600" cellspacing="0" class="style1">
		<tr>
			<td class="smallheader">Messages:</td>
		</tr>
	<tr>
		<th class="tableheader" width="50"><b>MessageID</b></th>
		<th class="tableheader" width="450"><b>Message</b></th>		
		<th class="tableheader" width="100"><b>Date Created</b></th>
		<th class="tableheader" width="50">&nbsp;</th>
	</tr>	
		<cfloop query="approvemessages">
		<tr>
			<td>#approvemessages.messageid#</td>
			<td>#left(approvemessages.message,200)#</td>
			<td>#dateformat(approvemessages.messagedate,"dd/mm/yyyy")#</td>
			<td align="center"><a href="#request.self#?fuseaction=#XFA.View#&amp;messageid=#approvemessages.messageid#">view</a></td>
		</tr>
		</cfloop>
	</table>
</cfif>
<!---
<tr>
	<td class="smallheader" width="50%">Main background colour:</td>
	<td width="50%"><input type="text" name="backgroundcolor1" value="###ucase(backgroundcolor1)#" size="6" maxlength="7"> (hex)</td>
</tr>
--->
</cfoutput>

<cfsilent>
<!--- 
$Log: dsp_moderatorapproval.cfm,v $
Revision 1.1  2007/06/15 13:59:14  kevin
Add Admin Modules

Revision 1.3  2005/05/25 14:09:42  andrew
XHTML Validation chages including removing encoding="UTF-16" to prevent double spacing

Revision 1.2  2005/05/03 12:57:19  kevin
Change XFA scope

Revision 1.1  2005/03/09 13:51:29  mike
Moved to create MVC version

Revision 1.6  2005/02/24 13:57:39  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.5  2005/02/15 12:42:36  mike
replace & by &amp; for strict HTML compliance

Revision 1.4  2005/02/10 15:01:03  mike
changes for XHTML compliance, improve fusedoc, etc.

Revision 1.3  2005/02/08 17:18:54  mike
index.cfm => #request.self#

Revision 1.2  2005/02/08 14:50:35  mike
remove useless onfocus= clause

Revision 1.1  2005/02/04 19:56:50  mike
FB3 version made from wireframe with fusebuilder, with contents pasted from FB2 version, fbx_switch fully commented, and XFA usage improved throughout
---> 
</cfsilent>