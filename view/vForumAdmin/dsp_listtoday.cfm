<cfsilent>
<!--- -->
<?xml version="1.0"?>
<fusedoc fuse="dsp_listtoday.cfm">
	<responsibilities>
		I display the Today notices
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
			<string name="XFA.Edit" scope="request" />
			<string name="XFA.Delete" scope="request" />
			<recordset name="qToday" scope="variables" format="CFML">
				<number name="postid" />
				<string name="posttitle" />
				<string name="post" />
				<datetime name="postdate" />
				<datetime name="dateexpires" />
			</recordset>
		</in>
		<out>
			<string name="fuseaction" scope="formOrUrl" />
			<number name="postid" scope="formOrUrl" />
		</out>
	</io>
</fusedoc>
--->
</cfsilent>

<cfoutput>
<br /><br />
<table align="center" border="0" cellspacing="0">
  <tr>
	<th class="tableheader" align="left" width="200"><b>Title</b></th>
	<th class="tableheader" align="left" width="100"><b>Date posted</b></th>
	<th class="tableheader" align="left" width="100"><b>Date expires</b></th>		
	<th class="tableheader" align="left" width="100"><b>Update</b></th>
	<th class="tableheader" align="left" width="100"><b>Delete</b></th>	
  </tr>
<cfloop query="qToday">
  <tr>
	<td class="tableheader" valign="top"><cfif Len(qToday.posttitle)>#qToday.posttitle#<cfelse>&nbsp;</cfif></td>
	<td class="tableheader" valign="top">#dateformat(qToday.postdate,"dd/mm/yyyy")#</td>
	<td class="tableheader" valign="top"><cfif Len(qToday.dateexpires)>#dateformat(qToday.dateexpires,"dd/mm/yyyy")#<cfelse>&nbsp;</cfif></td>		
	<td class="tableheader" valign="top"><a href="#request.self#?fuseaction=#XFA.Edit#&amp;postid=#qToday.postid#">Update</a></td>
	<td class="tableheader" valign="top">
	<!--- <a href="#request.self#?fuseaction=#XFA.Delete#&amp;postid=#qToday.postid#">Delete</a> --->
	<a href="javascript:if (confirm('Are you sure you want to delete this notice?')) location = '#request.self#?fuseaction=#XFA.Delete#&amp;postid=#qToday.postid#'">Delete</a>
	</td>	
  </tr>
</cfloop>
</table>
</cfoutput>

<cfsilent>
<!--- 
$Log: dsp_listtoday.cfm,v $
Revision 1.1  2007/06/15 13:59:14  kevin
Add Admin Modules

Revision 1.4  2005/05/25 14:10:09  andrew
XHTML Validation chages including removing encoding="UTF-16" to prevent double spacing

Revision 1.3  2005/05/12 16:55:38  mike
add "are you sure?" on delete

Revision 1.2  2005/05/03 12:57:19  kevin
Change XFA scope

Revision 1.1  2005/03/09 13:51:28  mike
Moved to create MVC version

Revision 1.6  2005/02/24 13:57:37  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.5  2005/02/15 12:24:57  mike
replace & by &amp; for strict HTML compliance

Revision 1.4  2005/02/10 10:47:56  mike
changes for XHTML compliance, improve fusedoc, etc.

Revision 1.3  2005/02/08 17:18:15  mike
index.cfm => #request.self#

Revision 1.2  2005/02/08 14:50:35  mike
remove useless onfocus= clause

Revision 1.1  2005/02/07 15:53:15  mike
new file, split off from dsp_today.cfm
--->
</cfsilent>