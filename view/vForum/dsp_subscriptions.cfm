<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="dsp_subscriptions.cfm">
	<responsibilities>
		I list the user's Forum and Thread subscriptions
	</responsibilities>
	<properties>
		<history author="Mike Oakes" email="mike@objectiveinternet.com" date="01-Nov-2004" role="Architect" type="Create" />
		<property name="copyright" value="(c)2004 Objective Internet Limited." />
		<property name="licence" value="Licensed under the Apache License, Version 2.0  See licence.txt" />
		<property name="version" value="$Revision: 1.3 $" />
		<property name="lastupdated" value="$Date: 2007/06/14 16:38:35 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<string name="XFA.Save" scope="variables" />
			<string name="fuseaction" scope="attributes" />
			<string name="sortkey" scope="attributes" />
			<string name="sortasc" scope="attributes" />
			<number name="categoryid" scope="attributes" />
			<recordset name="forum_subs_summary" scope="variables" format="CFML" optional="Yes">
				<number name="fs_id"/>
				<number name="fs_forum_id"/>
				<string name="categoryname"/>
			</recordset>
			<recordset name="subs_summary" scope="variables" format="CFML" optional="Yes">
				<number name="threadid"/>
				<number name="recordid"/>
				<string name="categoryname"/>
				<string name="threadname"/>
				<datetime name="datelastpost"/>
				<number name="messagecount"/>
			</recordset>
		</in>
		<out>
			<string name="fuseaction" scope="formOrUrl" />
			<list name="ForumUnsubscribe" scope="formOrUrl" optional="Yes" >
				<number precision="Integer" comments="Id of a forum_subscriptions record."/>
			</list>
			<list name="ThreadUnsubscribe" scope="formOrUrl" optional="Yes" >
				<number precision="Integer" comments="Id of a subscriptions record."/>
			</list>
		</out>
	</io>
</fusedoc>
--->
</cfsilent>


<!--- <cfinclude template="include/header.cfm">

<!--- <cfinclude template="include/height_control.cfm"> --->
 <div id="col1">
	<cfinclude template="include/height_control_forums.cfm">
</div>

<div id="col2">
	<div class="v_spacer"><!--- comment to make spacer work ---></div>
	
<cfinclude template="include/breadcrumb.cfm">
 --->
<cfoutput>
<cfset variables.thisurl="#request.self#?fuseaction=#attributes.fuseaction#">

<form name="thisform" id="thisform" action="#request.baseHREF##request.self#" method="post" >
<input type="hidden" name="fuseaction" value="#variables.XFA.Save#">

    <div class="box_title forums_con_header">
    	<h1>My Forum Subscriptions</h1>
    </div>
    <div class="main_tx forums_sub_con_info">

<cfif request.userid EQ 0>
	<br />
	<div align="center">You must be logged in to subscribe to forums</div>
	<br />
<cfelseif forum_subs_summary.recordcount EQ 0>
	<br />
	<div align="center">You are not currently subscribed to any forums</div>
	<br />
<cfelse> 
	<table width="100%" border="0" cellpadding="4" cellspacing="1" summary="List of forums">
        <tr class="grey_back_white_text">
          <td align="left">
			<cfset variables.url=variables.thisurl>
			<cfif attributes.forumsortasc IS "DESC">
			  <cfset variables.forumsortasc="ASC">
			<cfelse>
			  <cfset variables.forumsortasc="DESC">
			</cfif>
			<cfset variables.url="#variables.url#&forumsortasc=#variables.forumsortasc#">
			<cfset variables.url="#variables.url#&sortkey=#attributes.sortkey#">
			<cfset variables.url="#variables.url#&threadsortasc=#attributes.threadsortasc#">
		  <a href="#variables.url#" class="forum_header_links" title="Click to sort by this column">Forum Name</a></td>
          <td class="grey_back_white_text" width="15%" align="center">
		  Unsubscribe</td>
        </tr>
	<cfset i=0>
	<cfloop query="forum_subs_summary">
		<cfset i=i+1>
		<cfif i MOD 2>
	        <tr valign="top">
		<cfelse>
			<tr valign="top" class="forum_thread_even">
		</cfif>
          <td class="main_tx_b">
		  <label for="ForumUnsubscribe#i#">#forum_subs_summary.categoryname#</label>
		  </td>
          <td align="center" valign="top" class="main_tx">	
          	<input type="checkbox" name="ForumUnsubscribe" id="ForumUnsubscribe#i#" value="#forum_subs_summary.fs_id#" />
          	</td>
        </tr>
		</cfloop>
      </table>
</cfif>
      </div>

	 <br />
	  <div class="box_title forums_con_header">
    	<h1>My Thread Subscriptions </h1>
    </div>
    <div class="main_tx forums_sub_con_info">
<cfif request.userid EQ 0>
	<br />
	<div align="center">You must be logged in to subscribe to threads</div>
	<br />
<cfelseif subs_summary.recordcount EQ 0>
	<br />
	<div align="center">You are not currently subscribed to any threads</div>
	<br />
<cfelse>
	<table width="100%" border="0" cellpadding="4" cellspacing="1" summary="List of forums">
	<tr class="grey_back_white_text">		
	  <td align="left">
		<cfset variables.url="#variables.thisurl#&sortkey=threadname">
		<cfif attributes.sortkey IS "threadname"><!--- need to toggle ASC/DESC --->
			<cfif attributes.threadsortasc IS "DESC">
			  <cfset variables.threadsortasc="ASC">
			<cfelse>
			  <cfset variables.threadsortasc="DESC">
			</cfif>
		<cfelse>
		  <cfset variables.threadsortasc="ASC">
		</cfif>
		<cfset variables.url="#variables.url#&threadsortasc=#variables.threadsortasc#">
		<cfset variables.url="#variables.url#&forumsortasc=#attributes.forumsortasc#">
	  <a href="#variables.url#" class="forum_header_links" title="Click to sort by this column">Thread Name</a>
	  </td>
	  <td width="40%" align="left">
		<cfset variables.url="#variables.thisurl#&sortkey=categoryname">
		<cfif attributes.sortkey IS "categoryname"><!--- need to toggle ASC/DESC --->
			<cfif attributes.threadsortasc IS "DESC">
			  <cfset variables.threadsortasc="ASC">
			<cfelse>
			  <cfset variables.threadsortasc="DESC">
			</cfif>
		<cfelse>
		  <cfset variables.threadsortasc="ASC">
		</cfif>
		<cfset variables.url="#variables.url#&threadsortasc=#variables.threadsortasc#">
		<cfset variables.url="#variables.url#&forumsortasc=#attributes.forumsortasc#">
	  <a href="#variables.url#" class="forum_header_links" title="Click to sort by this column">In Forum</a>
	  </td>
	  <td class="grey_back_white_text" width="15%" align="center">Unsubscribe</td>
	</tr>
	<cfset i=0>
	<cfloop query="subs_summary">
		<cfset i=i+1>
		<cfif i MOD 2>
			<tr>
		<cfelse>
			<tr valign="top" class="forum_thread_even">
		</cfif>
		  <td class="main_tx_b">
		  <label for="ThreadUnsubscribe#i#">#subs_summary.threadname#</label>
		  </td>
		  <td align="left" class="main_tx">#subs_summary.categoryname#
		  </td>
		  <td align="center" class="main_tx">
			<input type="checkbox" name="ThreadUnsubscribe" id="ThreadUnsubscribe#i#" value="#recordid#" />
		  </td>
		</tr>
	</cfloop>

  </table>
 </cfif>
      </div>
	  <br />
	  <input type="submit" class="button" onfocus="this.blur();" value="Save" />
	  </form>
</cfoutput>

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
$Log: dsp_subscriptions.cfm,v $
Revision 1.3  2007/06/14 16:38:35  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:47  kevin
Initial Open Source Version

Revision 1.3  2006/01/17 12:12:51  mike
add class="grey_back_white_text" to Unsubscribe header to make it visible

Revision 1.2  2005/05/21 11:39:06  mike
sort-by-column behaviour now ok

Revision 1.1  2005/05/20 18:52:39  mike
ongoing edits

---> 
</cfsilent>

