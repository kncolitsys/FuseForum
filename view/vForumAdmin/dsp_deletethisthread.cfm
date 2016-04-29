<cfsilent>
<!--- -->
<?xml version="1.0"?>
<fusedoc fuse="dsp_deletethisthread.cfm">
	<responsibilities>
		I display a form allowing a thread to be deleted
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
			<recordset name="all_threads" scope="variables" format="CFML">
				<number name="threadid" />
				<string name="threadname" />
				<datetime name="datecreated" />
				<number name="messageid" />
				<string name="message" />
				<datetime name="messagedate" />
				<string name="attachment" />
			</recordset>
		</in>
		<out>
			<string name="fuseaction" scope="formOrUrl" />
			<number name="threadid" scope="formOrUrl" />
		</out>
	</io>
</fusedoc>
--->
</cfsilent>

<cfoutput>
<table align="center" border="0" width="85%" cellspacing="0" class="style1">
	<tr>
		<th align="center" class="headingtext" colspan="2">d e l e t e &nbsp;&nbsp;t h r e a d<br /><br /></th>
	</tr>
</table>
<table border="0" cellspacing="0" align="center" width="600" class="style1">
</cfoutput>
<cfoutput query="all_threads" group="threadid">
	<tr>
		<td class="tableheader" width="120"><b>Created: #dateformat(all_threads.datecreated,"dd/mm/yyyy")#</b></td>
		<td class="tableheader" valign="top" width="480"><b>#all_threads.threadname#</b></td>
	</tr>
	<tr>
		<td class="tableheader" colspan="2">&nbsp;</td>
	</tr>
	<tr>
		<th class="tableheader" align="left"><b>Message Date</b></td>
		<th class="tableheader" align="left"><b>Message</b></td>
	</tr>
	<cfoutput>
		<tr>
			<td valign="top">#dateformat(all_threads.messagedate,"dd/mm/yyyy")#</td>
			<td valign="top">#replacenocase(all_threads.message,"<br>"," ","all")#</td>
		</tr>
	</cfoutput>
	<tr>
		<td colspan="2" align="center">
		<input type="button" name="delete" id="delete" value="Delete Thread" onclick="javascript:location.href='#request.self#?fuseaction=#XFA.Save#&amp;threadid=#all_threads.threadid#';" /></td>
	</tr>
</cfoutput>
<cfoutput>
</table>
</cfoutput>

<cfsilent>
<!--- 
$Log: dsp_deletethisthread.cfm,v $
Revision 1.1  2007/06/15 13:59:14  kevin
Add Admin Modules

Revision 1.3  2005/05/25 14:09:25  andrew
XHTML Validation chages including removing encoding="UTF-16" to prevent double spacing

Revision 1.2  2005/05/03 12:57:19  kevin
Change XFA scope

Revision 1.1  2005/03/09 13:51:28  mike
Moved to create MVC version

Revision 1.9  2005/02/24 13:57:35  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.8  2005/02/15 12:24:06  mike
replace & by &amp; for strict HTML compliance

Revision 1.7  2005/02/10 11:12:38  mike
improved layout a bit

Revision 1.6  2005/02/10 10:49:19  mike
use format dd/mm/yyyy

Revision 1.5  2005/02/09 16:59:37  mike
improved fusedoc

Revision 1.4  2005/02/09 16:56:13  mike
changes for XHTML compliance, improve fusedoc, etc.

Revision 1.3  2005/02/08 17:17:37  mike
index.cfm => #request.self#, etc.

Revision 1.2  2005/02/08 14:50:35  mike
remove useless onfocus= clause

Revision 1.1  2005/02/04 19:56:50  mike
FB3 version made from wireframe with fusebuilder, with contents pasted from FB2 version, fbx_switch fully commented, and XFA usage improved throughout
---> 
</cfsilent>