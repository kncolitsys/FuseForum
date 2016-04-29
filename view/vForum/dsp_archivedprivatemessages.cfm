<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="dsp_archivedprivatemessages.cfm">
	<responsibilities>
		I display a list of the user's archived private messages
	</responsibilities>
	<properties>
		<history author="Mike Oakes" email="mike@objectiveinternet.com" date="01-Nov-2004" role="Architect" type="Create" />
		<property name="copyright" value="(c)2004 Objective Internet Limited." />
		<property name="licence" value="Licensed under the Apache License, Version 2.0  See licence.txt" />
		<property name="version" value="$Revision: 1.4 $" />
		<property name="lastupdated" value="$Date: 2007/06/14 16:52:19 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<string name="XFA.ShowPrivateMessage" scope="variables" />
			<string name="XFA.ArchivedPrivateMessages" scope="variables" />
			<number name="userid" scope="request" />
			<number name="startat" scope="attributes" optional="Yes" />
			<string name="sortkey" scope="attributes" />
			<string name="sortasc" scope="attributes" />
			<recordset name="arch_priv_summary" scope="variables" format="CFML">
				<number name="messageid"/>
				<number name="userid"/>
				<datetime name="messagedate"/>
				<string name="username" />
			</recordset>
		</in>
		<out>
			<string name="fuseaction" scope="formOrUrl" />
			<number name="messageid" scope="formOrUrl" />
			<boolean name="arch" scope="formOrUrl" />
			<number name="startat" scope="formOrUrl" />
			<string name="sortkey" scope="formOrUrl" />
			<string name="sortasc" scope="formOrUrl" />
		</out>
	</io>
</fusedoc>
--->
</cfsilent>

<cfparam name="attributes.startat" default="1">
<cfset maxperpage=20>

<!--- <cfinclude template="include/header.cfm">

<!--- <cfinclude template="include/height_control.cfm"> --->
 <div id="col1">
		<cfinclude template="include/height_control_forums.cfm">
</div>

<div id="col2">
	<div class="v_spacer"><!--- comment to make spacer work ---></div>
	
<cfinclude template="include/breadcrumb.cfm">
 --->
<div class="box_title forums_con_header"><h1>Archived Messages </h1></div>
<div class="main_tx forums_sub_con_info">

<cfif request.userid EQ 0>
	<br />
	<div align="center">You must be logged in to receive forums messages</div>
	<br />
<cfelseif arch_priv_summary.recordcount EQ 0>
	<br />
	<div align="center">You have no archived private messages</div>
	<br />
<cfelse>

	<cfoutput>
      <table width="100%" border="0" cellpadding="4" cellspacing="1" summary="My Messages">
        <tr class="grey_back_white_text">
	 	<cfset variables.thisurl="#request.self#?fuseaction=#attributes.fuseaction#">
          <td align="left">
			<cfset variables.url="#variables.thisurl#&startat=#attributes.startat#">
			<cfset variables.url="#variables.url#&sortkey=username">
			<cfif attributes.sortkey IS "username"><!--- need to toggle ASC/DESC --->
				<cfif attributes.sortasc IS "DESC">
				  <cfset variables.sortasc="ASC">
				<cfelse>
				  <cfset variables.sortasc="DESC">
				</cfif>
			<cfelse>
			  <cfset variables.sortasc="ASC">
			</cfif>
			<cfset variables.url="#variables.url#&sortasc=#variables.sortasc#">
		  <a href="#variables.url#" class="forum_header_links" title="Click to sort by this column">From</a></td>
          <td width="20%" align="left">
			<cfset variables.url="#variables.thisurl#&startat=#attributes.startat#">
			<cfset variables.url="#variables.url#&sortkey=messagedate">
			<cfif attributes.sortkey IS "messagedate"><!--- need to toggle ASC/DESC --->
				<cfif attributes.sortasc IS "DESC">
				  <cfset variables.sortasc="ASC">
				<cfelse>
				  <cfset variables.sortasc="DESC">
				</cfif>
			<cfelse>
			  <cfset variables.sortasc="ASC">
			</cfif>
			<cfset variables.url="#variables.url#&sortasc=#variables.sortasc#">
		  <a href="#variables.url#" class="forum_header_links" title="Click to sort by this column">Date</a></td>
        </tr>
	</cfoutput>

			<cfset variables.rowcount=0>
			<cfoutput query="arch_priv_summary" startrow="#attributes.startat#" maxrows="#maxperpage#">
				<cfset variables.rowcount=variables.rowcount+1>
				<cfif (variables.rowcount MOD 2)>
	    		    <tr valign="top">
				<cfelse>
			        <tr valign="top" class="forum_thread_even">
				</cfif>
			<td><a href="#request.self#?fuseaction=#XFA.ShowPrivateMessage#&arch=1&messageid=#arch_priv_summary.messageid#" class="main_tx_b">#arch_priv_summary.username#</a></td>
			<td align="left" class="main_tx">#dateformat(arch_priv_summary.messagedate,"dd/mm/yyyy")#</td>
			</tr>
			</cfoutput>

	<cfoutput>
		<cfset variables.totalrows=arch_priv_summary.recordcount>
          <td colspan="2">
			<div align="center">
			  <div  class="main_tx">
			 	<cfset variables.thisurl="#request.self#?fuseaction=#attributes.fuseaction#&sortkey=#attributes.sortkey#&sortasc=#attributes.sortasc#">
				<cfif variables.totalrows GT maxperpage>
					<cfset variables.pages=((variables.totalrows-1) \ maxperpage)+1>
					<cfif attributes.startat GTE (maxperpage+1)>
						<cfset variables.startat=attributes.startat-maxperpage>
						<a href="#variables.thisurl#&startat=#variables.startat#"
							class="main_tx">Previous</a>&nbsp;
					</cfif>
					<cfloop index="i" from="1" to="#variables.pages#">
						<cfset variables.startat=(i-1)*maxperpage+1>
						<cfif variables.startat EQ attributes.startat>
							<span class="main_tx_b">#i#</span>&nbsp;
						<cfelse>
							<a href="#variables.thisurl#&startat=#variables.startat#"
								class="main_tx">#i#</a>&nbsp;
						</cfif>
					</cfloop>
					<cfif variables.totalrows GTE attributes.startat+maxperpage>
						<cfset variables.startat=attributes.startat+maxperpage>
							<a href="#variables.thisurl#&startat=#variables.startat#"
								class="main_tx">Next</a>
					</cfif>
				<cfelse>
					&nbsp;
				</cfif>
			  </div>
			</div>
		  </td>
          </tr>
      </table>
	</cfoutput>

</cfif>
</div>
<!---
</div>
<!-- ENDS MAIN CONTENT -->
<!--- <cfinclude template="include/height_control_end.cfm"> --->
<cfinclude template="include/footer.cfm">
</body>
</html>
 --->

<cfsilent>
<!--- 
$Log: dsp_archivedprivatemessages.cfm,v $
Revision 1.4  2007/06/14 16:52:19  kevin
Remove specific comments

Revision 1.3  2007/06/14 16:38:35  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:47  kevin
Initial Open Source Version

Revision 1.5  2005/05/27 09:20:43  mike
correct error-message text

Revision 1.4  2005/05/26 12:23:25  mike
use xfa's everywhere

Revision 1.3  2005/05/23 16:41:29  mike
dd/mm/yy => dd/mm/yyyy

Revision 1.2  2005/05/23 10:56:37  mike
final working version with correct HTML

Revision 1.1  2005/05/05 12:15:07  mike
Initial FB4 Version

Revision 1.4  2004/11/07 14:26:58  mike
improve fusedoc

Revision 1.3  2004/11/07 14:24:12  mike
proper HTML

Revision 1.2  2004/11/05 19:55:12  mike
ok, but not final HTML yet
--->
</cfsilent>
