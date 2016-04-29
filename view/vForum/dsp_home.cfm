<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="dsp_home.cfm">
	<responsibilities>
		I display the list of Forums.
	</responsibilities>
	<properties>
		<history author="Mike Oakes" email="mike@objectiveinternet.com" date="29-Apr-2005" role="Architect" type="Create" />
		<property name="copyright" value="(c)2004 Objective Internet Limited." />
		<property name="licence" value="Licensed under the Apache License, Version 2.0  See licence.txt" />
		<property name="version" value="$Revision: 1.4 $" />
		<property name="lastupdated" value="$Date: 2007/06/14 16:52:19 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<string name="XFA.ForumsThreads" scope="variables" />
			<string name="XFA.Subscribe" scope="variables" />
			<string name="XFA.ForumsSearch" scope="variables" />
			<string name="XFA.EditPreferences" scope="variables" />
			<number name="userid" scope="request" />
			<string name="fuseaction" scope="attributes" />
			<number name="startat" scope="attributes" optional="Yes" />
			<string name="sortkey" scope="attributes" />
			<string name="sortasc" scope="attributes" />
			<recordset name="category_threads" scope="variables" format="CFML">
				<number name="categoryid"/>
				<string name="categoryname"/>
				<number name="threadcount" />
				<number name="messagecount" />
				<string name="lastposter"/>
				<string name="datelastpost" />
				<boolean name="isSubscribed" />
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

<cfif category_threads.recordcount EQ 0>
    <div class="box_title forums_con_header"><h1>Forum</h1></div>
    <div class="main_tx forums_sub_con_info"> 
		<div align="center">
		<br />
		There are currently no forums defined. Please refer to the site administrator.
		<br />
		<br />
		<a href="javascript:history.go(-1);" title="Back to previous page" class="redlink">Back to previous page</a>
		<br />
		<br />
		</div>
	</div>
<cfelse>
	<cfoutput>

    <div class="box_title forums_con_header"><h1>Forums</h1></div>
    <div class="main_tx forums_sub_con_info"> 
		<div align="center">
		<br />
		<a href="#request.self#?fuseaction=#XFA.Search#&ForumSearch=true" title="Search Forums" class="redlink">Forum Search</a>&nbsp;&nbsp;
		<br />
		<br />
		</div>

      <table width="100%" border="0" cellpadding="4" cellspacing="1" summary="List of forums">
        <tr class="grey_back_white_text">		
	 	<cfset variables.thisurl="#request.self#?fuseaction=#attributes.fuseaction#">
          <td align="center">
			<cfset variables.url="#variables.thisurl#&startat=#attributes.startat#">
			<cfset variables.url="#variables.url#&sortkey=Ucategoryname">
			<cfif attributes.sortkey IS "Ucategoryname"><!--- need to toggle ASC/DESC --->
				<cfif attributes.sortasc IS "DESC">
				  <cfset variables.sortasc="ASC">
				<cfelse>
				  <cfset variables.sortasc="DESC">
				</cfif>
			<cfelse>
			  <cfset variables.sortasc="ASC">
			</cfif>
			<cfset variables.url="#variables.url#&sortasc=#variables.sortasc#">
			<a href="#variables.url#" class="forum_header_links" title="Click to sort by this column">Forum</a>
		  </td>
          <td align="center">
			<cfset variables.url="#variables.thisurl#&startat=#attributes.startat#">
			<cfset variables.url="#variables.url#&sortkey=threadcount">
			<cfif attributes.sortkey IS "threadcount"><!--- need to toggle ASC/DESC --->
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
			<a href="#variables.url#" class="forum_header_links" title="Click to sort by this column">Posts</a>
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

		<cfset variables.forumcount=0>
		<cfoutput query="category_threads" startrow="#attributes.startat#" maxrows="#maxperpage#">
			<cfset variables.forumcount=variables.forumcount+1>
			<cfset maxdate="#category_threads.datelastpost#">
			<cfif (variables.forumcount MOD 2)>
				<tr valign="top">
			<cfelse>
				<tr valign="top" class="forum_thread_even">
			</cfif>
	         <td><a href="index.cfm?fuseaction=#XFA.Threads#&categoryid=#category_threads.categoryid#"
			  	class="main_tx_b">#category_threads.categoryname#</a></td>
	         <td align="center" class="main_tx">#category_threads.threadcount#</td>
	         <td align="center" class="main_tx">#category_threads.messagecount#</td>
	         <td align="center" class="main_tx">
			 	<table width="100%"  border="0" cellspacing="0" cellpadding="0" summary="layout table">
	         	  <tr>
	         		<td align="center">
					<cfif len(category_threads.lastposter)>#category_threads.lastposter#<cfelse>&nbsp;</cfif><br />
	         			#category_threads.datelastpost#</td>
					<cfif request.userid NEQ 0><!--- so logged-in --->
		         		<td width="30%" align="center">
							<cfif category_threads.isSubscribed>
								<a href="#request.self#?fuseaction=#XFA.Subscribe#&categoryid=#category_threads.categoryid#&act=u" class="redlink" title="Unsubscribe from this forum">Unsubscribe</a>
							<cfelse>
								<a href="#request.self#?fuseaction=#XFA.Subscribe#&categoryid=#category_threads.categoryid#&act=s" class="redlink" title="Subscribe to this forum">Subscribe</a>
							</cfif>
						</td>
					</cfif>
	         	  </tr>
	         	</table>
	         </td>
	       </tr>
		</cfoutput>

	<cfoutput>
		<cfset variables.totalrows=category_threads.recordcount>
        <tr>
          <td colspan="4">
			<div align="center">
			  <div  class="main_tx">
			  <!--- see dsp_threadsincategory for sim. code to this --->
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
		<cfif request.userid NEQ 0 AND isDefined("XFA.Edit_Preferences")><!--- user logged in --->
			<div align="center">
		 	<br />
			<br />
			<a href="#request.self#?fuseaction=#XFA.Edit_Preferences#" title="Edit Preferences" class="redlink">Edit Preferences</a>
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
<cfinclude template="../../include/footer.cfm">
</body>
</html>
--->

<cfsilent>
<!--- 
$Log: dsp_home.cfm,v $
Revision 1.4  2007/06/14 16:52:19  kevin
Remove specific comments

Revision 1.3  2007/06/14 16:38:35  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:47  kevin
Initial Open Source Version

Revision 1.12  2006/06/07 09:45:05  mike
add "Edit forum preferences" link

Revision 1.11  2005/06/30 15:20:49  mike
make the "Forum Search" links work

Revision 1.10  2005/05/27 12:19:13  mike
point Forums Search at forums home (temp)

Revision 1.9  2005/05/26 12:23:25  mike
use xfa's everywhere

Revision 1.8  2005/05/24 13:29:20  mike
small edits

Revision 1.7  2005/05/20 17:59:49  mike
improve fusedoc

Revision 1.6  2005/05/20 15:34:48  mike
only show the "Subscribe" links if user is logged in

Revision 1.5  2005/05/20 11:40:02  mike
handle new variable isSubscribed, etc.

Revision 1.4  2005/05/17 07:46:50  mike
use Ucategoryname , to ensure case-insensitive sort

Revision 1.3  2005/05/16 17:31:11  mike
final working version

Revision 1.2  2005/05/11 09:07:54  mike
version which includes signed-off HTML as well

Revision 1.1  2005/05/05 12:15:08  mike
Initial FB4 Version

---> 
</cfsilent>
