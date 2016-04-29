<cfsilent>
<!--- -->
<?xml version="1.0"?>
<fusedoc fuse="dsp_reportoptions.cfm">
	<responsibilities>
		I display a form to allow a report to be requested
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
			<string name="XFA.All" scope="request" />
			<string name="XFA.Monthly" scope="request" />
			<recordset name="getfirstyear" scope="variables" format="CFML">
				<datetime name="dateinstalled"/>
			</recordset>
		</in>
		<out>
			<string name="fuseaction" scope="formOrUrl" />
			<boolean name="popuplayout" scope="formOrUrl" />
			<string name="for" scope="formOrUrl" optional="Yes" />
			<string name="day" scope="formOrUrl" optional="Yes" />
			<string name="month" scope="formOrUrl" optional="Yes" />
			<string name="year" scope="formOrUrl" optional="Yes" />
		</out>
	</io>
</fusedoc>
--->
</cfsilent>

<cfoutput>
<script language="JavaScript" type="text/javascript">
<!--
function WinOpen(url,winname,x,y)
  {
	var options = "toolbar=no,scrollbars=yes,resizable=yes,width=" + x + ",height=" + y;
	msgWindow=window.open(url,winname,options);
  }
function submittheform()
  {
	window.open('','Statistics','toolbar=no,scrollbars=yes,resizable=yes,width=600,height=500');
	document.all.myform.submit();
  }
//-->
</script>	
<table align="center" border="0" width="85%" class="style1">
	<tr>
		<th align="center" colspan="2" class="headingtext">R E P O R T &nbsp;&nbsp;O P T I O N S<br /><br /></th>
	</tr>
	<!---
	<tr>
		<td class="smallheader">
		<a href="#request.self#?fuseaction=adm.userlists"><b>User Lists</b></a></td>
		<td>Export a list of users of the forum. You may get an entire list, or restrict by user name or user level.</td>
	</tr>
	--->
	<tr>
		<td class="smallheader">
		<a href="javascript:WinOpen('#request.self#?fuseaction=#XFA.All#&amp;popuplayout=1','Statistics','600','500');"><b>Forum statistics</b></a></td>
		<td>Create a report of general statistics for the entire forum.</td>
	</tr>	
	<tr>
		<td align="center" colspan="2" class="headingtext">&nbsp;<br /></td>
	</tr>
	<form name="myform" action="#request.self#" method="post" target="Statistics">
	<input type="hidden" name="fuseaction" id="fuseaction" value="#XFA.Monthly#" />
	<input type="hidden" name="popuplayout" id="popuplayout" value="1" />
	<tr>
		<td class="smallheader"><a href="javascript:submittheform();"><b>Restricted statistics</b></a></td>
		<td>Create a report of general statistics for<br />
		<select name="for" id="for">
		<option value="Only">Only</option>
		<option value="UpTo">Up To</option>
		<option value="Since">Since</option>
		</select>
		
		<select name="day" id="day">
		<option value="">All</option>
		<cfloop index="day" from="1" to="31">
			<option value="#day#"<cfif day EQ day(now())> selected="selected"</cfif>>#day#</option>
		</cfloop>
		</select> 
		
		<select name="month" id="month">
		<option value="">All</option>
		<cfloop index="month" from="1" to="12">
			<option value="#month#"<cfif month EQ month(now())> selected="selected"</cfif>>#monthasstring(month)#</option>
		</cfloop>
		</select> 
		
		<select name="year" id="year">
		<cfloop index="year" from="#year(getfirstyear.dateinstalled)#" to="#year(now())#">
			<option value="#year#"<cfif year EQ year(now())> selected="selected"</cfif>>#year#</option>
		</cfloop>
		</select>
		
		</td>
	</tr>		
	</form>
</table>
</cfoutput>

<cfsilent>
<!--- 
$Log: dsp_reportoptions.cfm,v $
Revision 1.1  2007/06/15 13:59:14  kevin
Add Admin Modules

Revision 1.3  2005/05/25 14:08:35  andrew
XHTML Validation chages including removing encoding="UTF-16" to prevent double spacing

Revision 1.2  2005/05/03 12:57:29  kevin
Change XFA scope

Revision 1.1  2005/03/09 13:51:29  mike
Moved to create MVC version

Revision 1.8  2005/02/24 13:57:39  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.7  2005/02/15 12:42:51  mike
replace & by &amp; for strict HTML compliance

Revision 1.6  2005/02/10 14:51:00  mike
changes for XHTML compliance, improve fusedoc, add popuplayout=1, etc.

Revision 1.5  2005/02/08 17:19:37  mike
index.cfm => #request.self#

Revision 1.4  2005/02/08 14:50:36  mike
remove useless onfocus= clause

Revision 1.3  2005/02/08 10:01:37  mike
<cfquery> split off into qry_reportoptions.cfm

Revision 1.2  2005/02/07 18:16:43  mike
added <cfoutput> round the whole thing

Revision 1.1  2005/02/04 19:56:50  mike
FB3 version made from wireframe with fusebuilder, with contents pasted from FB2 version, fbx_switch fully commented, and XFA usage improved throughout
---> 
</cfsilent>