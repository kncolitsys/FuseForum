<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="dsp_threadsincategory.cfm">
	<responsibilities>
		I display all the threads in the given forum
	</responsibilities>
	<properties>
		<history author="Mike Oakes" email="mike@objectiveinternet.com" date="01-Nov-2004" role="Architect" type="Create" />
		<property name="copyright" value="(c)2004 Objective Internet Limited." />
		<property name="licence" value="Licensed under the Apache License, Version 2.0  See licence.txt" />
		<property name="version" value="$Revision: 1.4 $" />
		<property name="lastupdated" value="$Date: 2007/06/14 16:52:20 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<string name="XFA.New_Thread" scope="variables" />
			<string name="XFA.Show_Thread" scope="variables" />
			<string name="XFA.Search" scope="variables" />
			<string name="XFA.Edit_Preferences" scope="variables" optional="Yes" />
			
			<number name="userid" scope="request" />
			<string name="fuseaction" scope="attributes" />
			<number name="categoryid" scope="attributes" />
			<number name="startat" scope="attributes" optional="Yes" />
			<string name="sortkey" scope="attributes" />
			<string name="sortasc" scope="attributes" />
			<recordset name="qCategoryVisible" scope="variables" format="CFML">
				<string name="CategoryName"/>
				<string name="Description"/>
				<boolean name="readonly"/>
				<string name="VisibleTo"/>
			</recordset>
			<recordset name="threadsincat" scope="variables" format="CFML">
				<string name="CategoryName"/>
				<string name="Description"/>
				<boolean name="readonly"/>
				<number name="ThreadID"/>
				<string name="ThreadName" />
				<datetime name="DateCreated" />
				<datetime name="DateLastPost" />
				<number name="MessageCount" />
			</recordset>
		</in>
		<out>
			<string name="fuseaction" scope="formOrUrl" />
			<boolean name="ForumSearch" scope="formOrUrl" optional="Yes" />
		</out>
	</io>
</fusedoc>
--->
</cfsilent>

<cfparam name="attributes.startat" default="1">
<cfset maxperpage=20>

<!---
<cfinclude template="include/header.cfm">

<!--- <cfinclude template="include/height_control.cfm"> --->
 <div id="col1">
		<cfinclude template="include/height_control_forums.cfm">
</div>

<div id="col2">
	<div class="v_spacer"><!--- comment to make spacer work ---></div>
	
<cfinclude template="include/breadcrumb.cfm">
 --->
<cfif qCategoryVisible.recordcount EQ 0>
    <div class="box_title forums_con_header"><h1>Forum</h1></div>
    <div class="main_tx forums_sub_con_info"> 
		<div align="center">
		<br />
		This forum does not exist!
		<br />
		<br />
		<a href="javascript:history.go(-1);" title="Back to previous page" class="redlink">Back to previous page</a>
		<br />
		<br />
		</div>
	</div>
<cfelseif qCategoryVisible.VisibleTo EQ "ERSC" AND NOT (isDefined("client.userisERSCmember") AND client.userisERSCmember)>
    <div class="box_title forums_con_header"><h1><cfoutput>#qCategoryVisible.CategoryName#</cfoutput></h1></div>
    <div class="main_tx forums_sub_con_info"> 
		<div align="center">
		<br />
		You must join the Club to access this forum!
		<br />
		<br />
		<a href="javascript:history.go(-1);" title="Back to previous page" class="redlink">Back to previous page</a>
		<br />
		<br />
	</div>
    </div>
<cfelse>
	<cfoutput>
    <div class="box_title forums_con_header">
    	<h1>#qCategoryVisible.CategoryName#</h1>
    </div>
    <div class="main_tx forums_sub_con_info">
		<div align="center">
		<br />
		<cfif qCategoryVisible.readonly>
			This forum is <b>read only</b>.
		<cfelse>
			<cfif request.userid NEQ 0>
				<a href="#request.self#?fuseaction=#XFA.New_Thread#&categoryid=#attributes.categoryid#" title="Start A New Thread" class="redlink">Start A New Thread</a>
			<cfelse>
				Please login to post to the forum.
			</cfif>
		</cfif>
		&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#request.self#?fuseaction=#XFA.Search#&ForumSearch=true" title="Search Forums" class="redlink">Forum Search</a>
		<br />
		<br />
		</div>
	
      <table width="100%" border="0" cellpadding="4" cellspacing="1" summary="Threads in the Forum">
        <tr class="grey_back_white_text">
	 	<cfset variables.thisurl="#request.self#?fuseaction=#attributes.fuseaction#&categoryid=#attributes.categoryid#">
          <td align="center">
			<cfset variables.url="#variables.thisurl#&startat=#attributes.startat#">
			<cfset variables.url="#variables.url#&sortkey=Uthreadname">
			<cfif attributes.sortkey IS "Uthreadname"><!--- need to toggle ASC/DESC --->
				<cfif attributes.sortasc IS "DESC">
				  <cfset variables.sortasc="ASC">
				<cfelse>
				  <cfset variables.sortasc="DESC">
				</cfif>
			<cfelse>
			  <cfset variables.sortasc="ASC">
			</cfif>
			<cfset variables.url="#variables.url#&sortasc=#variables.sortasc#">
			<a href="#variables.url#" class="forum_header_links" title="Click to sort by this column">Threads</a>
		  </td>
          <td align="center">
			<cfset variables.url="#variables.thisurl#&startat=#attributes.startat#">
			<cfset variables.url="#variables.url#&sortkey=messagecount">
			<cfif attributes.sortkey IS "messagecount"><!--- need to toggle ASC/DESC --->
				<cfif attributes.sortasc IS "DESC">
				  <cfset variables.sortasc="ASC">
				<cfelse>
				  <cfset variables.sortasc="DESC">
				</cfif>
			<cfelse>
			  <cfset variables.sortasc="ASC">
			</cfif>
			<cfset variables.url="#variables.url#&sortasc=#variables.sortasc#">
			<a href="#variables.url#" class="forum_header_links" title="Click to sort by this column">Msgs</a>
		  </td>
          <td align="center">
			<cfset variables.url="#variables.thisurl#&startat=#attributes.startat#">
			<cfset variables.url="#variables.url#&sortkey=Uusername">
			<cfif attributes.sortkey IS "Uusername"><!--- need to toggle ASC/DESC --->
				<cfif attributes.sortasc IS "DESC">
				  <cfset variables.sortasc="ASC">
				<cfelse>
				  <cfset variables.sortasc="DESC">
				</cfif>
			<cfelse>
			  <cfset variables.sortasc="ASC">
			</cfif>
			<cfset variables.url="#variables.url#&sortasc=#variables.sortasc#">
			<a href="#variables.url#" class="forum_header_links" title="Click to sort by this column">Author</a>
		  </td>
          <td align="center">
			<cfset variables.url="#variables.thisurl#&startat=#attributes.startat#">
			<cfset variables.url="#variables.url#&sortkey=juliandate">
			<cfif attributes.sortkey IS "juliandate"><!--- need to toggle ASC/DESC --->
				<cfif attributes.sortasc IS "DESC">
				  <cfset variables.sortasc="ASC">
				<cfelse>
				  <cfset variables.sortasc="DESC">
				</cfif>
			<cfelse>
			  <cfset variables.sortasc="#request.threadorder#">
			</cfif>
			<cfset variables.url="#variables.url#&sortasc=#variables.sortasc#">
			<a href="#variables.url#" class="forum_header_links" title="Click to sort by this column">Last Post</a>
		  </td>
        </tr>
	</cfoutput>

		<cfset variables.rowcount=0>
		<cfoutput query="threadsincat" startrow="#attributes.startat#" maxrows="#maxperpage#">
			<cfset variables.rowcount=variables.rowcount+1>
			<cfif (variables.rowcount MOD 2)>
				<tr valign="top">
			<cfelse>
				<tr valign="top" class="forum_thread_even">
			</cfif>
				<td><a href="#request.self#?fuseaction=#XFA.Show_Thread#&threadid=#threadid#" class="main_tx_b">#threadsincat.threadname#</a></td>
				<td align="center" class="main_tx"><cfif len(threadsincat.messagecount)>#threadsincat.messagecount#<cfelse>&nbsp;</cfif></td>
				<td align="center" class="main_tx"><cfif Len(username)>#threadsincat.username#<cfelse>&nbsp;</cfif></td>
				<td align="center" class="main_tx"><cfif Len(last_poster)>#threadsincat.last_poster#<cfelse>&nbsp;</cfif><br />#dateformat(threadsincat.datelastpost,"dd/mm/yyyy")#</td>
			</tr>
		</cfoutput>

	<cfoutput>
		<cfset variables.totalrows=threadsincat.recordcount>
        <tr>
          <td colspan="4">
			<div align="center">
			  <div  class="main_tx">
			 	<cfset variables.thisurl="#request.self#?fuseaction=#attributes.fuseaction#&categoryid=#attributes.categoryid#&sortkey=#attributes.sortkey#&sortasc=#attributes.sortasc#">
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
		<cfif request.userid NEQ 0><!--- user logged in --->
			<div align="center">
		 	<br />
			<br />
			<cfif isdefined("XFA.Edit_Preferences")>
			<a href="#request.self#?fuseaction=#XFA.Edit_Preferences#" title="Edit Preferences" class="redlink">Edit Preferences</a>
			</cfif>
			<br />
			<br />
			</div>    
		</cfif>
	</div>
	</cfoutput>
</cfif>
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
$Log: dsp_threadsincategory.cfm,v $
Revision 1.4  2007/06/14 16:52:20  kevin
Remove specific comments

Revision 1.3  2007/06/14 16:38:35  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:47  kevin
Initial Open Source Version

Revision 1.14  2006/06/07 09:45:05  mike
add "Edit forum preferences" link

Revision 1.13  2005/06/30 15:21:28  mike
make the "Forum Search" links work

Revision 1.12  2005/05/27 12:18:21  mike
point Forums Search at forums home (temp)

Revision 1.11  2005/05/26 12:23:26  mike
use xfa's everywhere

Revision 1.10  2005/05/24 13:27:09  mike
small edits

Revision 1.9  2005/05/23 16:40:19  mike
dd/mm/yy => dd/mm/yyyy

Revision 1.8  2005/05/20 17:58:54  mike
improve fusedoc

Revision 1.7  2005/05/17 07:56:39  mike
use Uthreadname and Uusername to get case-insensitive sorts

Revision 1.6  2005/05/16 18:26:36  mike
handle sortkey and sortasc properly, etc.

Revision 1.5  2005/05/13 18:37:23  mike
include the final version of page links

Revision 1.4  2005/05/12 17:38:01  mike
better HTML for warning situations (from forums_no_content.cfm), etc.

Revision 1.3  2005/05/12 11:34:55  mike
put old code into new HTML layout, then remove it

Revision 1.2  2005/05/11 09:07:55  mike
version which includes signed-off HTML as well

Revision 1.1  2005/05/05 12:15:09  mike
Initial FB4 Version

Revision 1.10  2004/11/17 13:59:49  mike
for ERSC forums, tell user must join ERSC

Revision 1.9  2004/11/10 11:37:37  mike
make some test on qCategoryVisible instead of threadincat in case the latter is empty

Revision 1.8  2004/11/10 10:54:47  kevin
Fix XHTML errors.

Revision 1.7  2004/11/09 10:40:13  mike
if nonexistent forum, give message to that effect (used to give CF error...)

Revision 1.6  2004/11/07 14:22:22  mike
small edits

Revision 1.5  2004/11/05 10:55:39  mike
changed Date / Last message by => Last post / Last post by, for clarity

Revision 1.4  2004/11/04 14:12:31  mike
re-do the bottom-of-page links with better HTML

Revision 1.3  2004/11/03 17:07:04  mike
use class="forumsLinks" for the [ NEXT] etc. links

Revision 1.2  2004/11/03 14:40:25  mike
fully working version

Revision 1.1  2004/10/18 10:13:21  mike
initial version
 --->
</cfsilent>
