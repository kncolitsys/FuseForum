<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="dsp_showthread.cfm">
	<responsibilities>
		I display the list of Messages for a given Thread
	</responsibilities>
	<properties>
		<history author="Mike Oakes" email="mike@objectiveinternet.com" date="01-Nov-2004" role="Architect" type="Create" />
		<property name="copyright" value="(c)2004 Objective Internet Limited." />
		<property name="licence" value="Licensed under the Apache License, Version 2.0  See licence.txt" />
		<property name="version" value="$Revision: 1.5 $" />
		<property name="lastupdated" value="$Date: 2007/06/14 16:52:20 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<string name="XFA.PrivateMessage" scope="variables" />
			<string name="XFA.Edit" scope="variables" />
			<string name="XFA.Reply" scope="variables" />
			<string name="XFA.Subscribe" scope="variables" />
			<string name="XFA.Friend" scope="variables" />
			<string name="XFA.Report" scope="variables" />
			<string name="XFA.EditPreferences" scope="variables" />
			<number name="numberofmessages" scope="request" />
			<string name="fuseaction" scope="attributes" />
			<number name="userid" scope="request" />
			<number name="threadid" scope="attributes" />
			<list name="friendlist" scope="variables" />
			<number name="startat" scope="attributes" optional="Yes" />
			<recordset name="qCategoryVisible" scope="variables" format="CFML">
				<string name="categoryname"/>
			</recordset>
			<recordset name="forum_subscribe_check" scope="variables" format="CFML">
				<number name="fs_id"/>
			</recordset>
			<recordset name="thread_messages" scope="variables" format="CFML">
				<number name="threadid"/>
				<string name="threadname"/>
				<boolean name="locked"/>
				<number name="messageid"/>
				<string name="message"/>
				<datetime name="messagedate" />
				<number name="userid" />
				<string name="editmessage" />
				<string name="attachment"/>
				<string name="moderatormessage"/>
				<string name="username"/>
				<string name="emailaddress"/>
				<boolean name="showemail"/>
				<boolean name="showprofile"/>
				<string name="privatemessages"/>
				<string name="signature"/>
				<number name="recordID"/>
				<string name="categoryname"/>
				<boolean name="readonly"/>
			</recordset>
		</in>
		<out>
			<string name="fuseaction" scope="formOrUrl" />
		</out>
	</io>
</fusedoc>
--->
</cfsilent>

<cfparam name="attributes.startat" default="1">
<cfset maxperpage=request.numberofmessages><!--- user-specific --->

<script language="javascript" type="text/javascript">
function WinOpen(url,winname,x,y)
{
	var options = "toolbar=no,scrollbars=yes,resizable=yes,width=" + x + ",height=" + y;
	msgWindow=window.open(url,winname,options);
}
</script>

<a name="top"></a>

<cfif qCategoryVisible.recordcount EQ 0>
    <div class="box_title forums_con_header"><h1>Forums</h1></div>
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
<cfelseif thread_messages.recordcount EQ 0>
    <div class="box_title forums_con_header"><h1>Forums</h1></div>
    <div class="main_tx forums_sub_con_info"> 
		<div align="center">
		<br />
		There are currently no approved posts in this thread
		<br />
		<br />
		<a href="javascript:history.go(-1);" title="Back to previous page" class="redlink">Back to previous page</a>
		<br />
		<br />
		</div>
      </div>
<cfelse>
    <div class="box_title forums_con_header"><cfoutput>#qCategoryVisible.CategoryName#</cfoutput></div>
    <div class="main_tx forums_sub_con_info" >

          <div align="center"><span class="main_story_title"><cfoutput>#thread_category.threadname#</cfoutput></span><br />
			  <div class="hr_beaker"></div>
          </div>

	<cfset variables.messagecount=0>
	<cfoutput query="thread_messages" startrow="#attributes.startat#" maxrows="#maxperpage#">
		<cfset variables.messagecount=variables.messagecount+1>
		<cfif variables.messagecount MOD 2>
          <table width="100%"  border="0" cellpadding="2" cellspacing="1" class="forum_thread_odd" summary="Reply message">
		<cfelse>
          <table width="100%"  border="0" cellpadding="2" cellspacing="1"  class="forum_thread_even" summary="Reply message">
		</cfif>

            <tr>
              <th width="8%" align="left" class="forum_thread_text_left" scope="row">Author:</th>
              <td width="72%" class="main_tx">
			<cfif request.userid NEQ 0 AND listFind(variables.friendlist,thread_messages.userid)>
				<img src="furniture/friend.gif"
					 alt="This person is a friend"
					 onmouseover="status='This person is a friend';return true;"
					 onmouseout="status='';return true;" />
			</cfif>
			  <cfif len(thread_messages.username)>#thread_messages.username#<cfelse>&nbsp;</cfif></td>
              <td width="20%" align="right">
			  <cfif request.userid NEQ 0 AND val(thread_messages.privatemessages)>
				<a href="#request.self#?fuseaction=#XFA.Private_Message#&userid=#thread_messages.userid#&threadid=#attributes.threadid#" 
					class="redlink" title="Send this person a private message">Send Message</a>
			  <cfelse>&nbsp;
			  </cfif>
			  </td>
            </tr>
            <tr>
              <th align="left" class="forum_thread_text_left" scope="row">Date:</th>
              <td colspan="2" class="main_tx">#timeformat(thread_messages.messagedate)# - #dateformat(thread_messages.messagedate,"dd/mm/yyyy")#</td>
            </tr>
            <tr>
              <th colspan="1" align="left" valign="top" class="forum_thread_text_left">Message:</th>
              <td colspan="2" class="main_tx">
	<cfif len(thread_messages.message)>#thread_messages.message#<cfelse>&nbsp;</cfif>
	<cfif len(thread_messages.editmessage)><br /><br /><i>#thread_messages.editmessage#</i><br /></cfif>
	<cfif len(thread_messages.moderatormessage)><br /><br /><i>Moderator's comment: <b>#thread_messages.moderatormessage#</b></i></cfif>
	<cfif len(thread_messages.attachment)><br /><b>xAttachment:</b> <a href="#request.viewattachmentpath##URLEncodedFormat(thread_messages.attachment)#" onfocus="this.blur();" target="attachment">#thread_messages.attachment#</a></cfif>
	<cfif len(thread_messages.signature)>
		<br /><br />-------------------------<br />#thread_messages.signature#
	</cfif>
			  </td>
            </tr>
            <tr>
              <th colspan="1" align="left" class="forum_thread_text_left">&nbsp;</th>
              <td colspan="2"><table width="100%" cellpadding="0" cellspacing="2" summary="Reply to post and other functions">
                  <tr>
                    <td colspan="2" class="main_tx">
					[&nbsp;
		<cfset toplink="#request.self#?fuseaction=#attributes.fuseaction#&threadid=#attributes.threadid#">
		<cfif isdefined("attributes.startat")>
			<cfset toplink="#toplink#&startat=#attributes.startat#">
		</cfif>

					<a href="#toplink#" class="redlink" title="Return to top of thread">TOP</a>
		<cfif userid EQ request.userid>
			&nbsp;|&nbsp;
			<a 	href="#request.self#?fuseaction=#XFA.Edit#&messageid=#messageid#&threadid=#threadid#" 
				title="Edit this message" class="redlink">EDIT</a>
		</cfif>
		&nbsp;|&nbsp;
		<a href="##" onkeypress, onclick="window.print();return false"
			title="Print this page" class="redlink">PRINT</a>
		<cfif request.userid NEQ 0 AND readonly EQ 0 AND NOT val(locked)>
			&nbsp;|&nbsp;
			<a 	href="#request.self#?fuseaction=#XFA.Reply#&threadid=#threadid#" 
				title="Reply to this message" class="redlink">REPLY</a>
		</cfif>
		<cfif request.userid NEQ 0 AND forum_subscribe_check.recordcount EQ 0>
			<cfif len(recordid)>
				&nbsp;|&nbsp;
				<a 	href="#request.self#?fuseaction=#XFA.Subscribe#&act=ur&threadid=#threadid#&unsubscribe=#recordid#" 
					title="Unsubscribe from this thread" class="redlink">UNSUBSCRIBE</a>				
			<cfelse>
				&nbsp;|&nbsp;
				<a 	href="#request.self#?fuseaction=#XFA.Subscribe#&act=s&threadid=#threadid#" 
					title="Subscribe to this thread" class="redlink">SUBSCRIBE</a>	
			</cfif>
		</cfif>
		<cfif request.userid NEQ 0>
			<cfif thread_messages.userid NEQ request.userid>
				<cfif listFind(variables.friendlist,userid)>
				&nbsp;|&nbsp;	
				<a href="#request.self#?fuseaction=#XFA.Friend#&act=r&threadid=#threadid#&userid=#userid#" 
					title="Remove this person as a friend" class="redlink">REMOVE FRIEND</a>
				<cfelse>
				&nbsp;|&nbsp;	
				<a href="#request.self#?fuseaction=#XFA.Friend#&act=s&threadid=#threadid#&userid=#userid#" 
					title="Mark this person as a friend" class="redlink">FRIEND</a>
				</cfif>
			</cfif>
		</cfif>
		<cfif request.userid NEQ 0 AND thread_messages.recordcount GT 0>
		&nbsp;|&nbsp;
		<a  href="#request.self#?fuseaction=#XFA.Report#&threadid=#attributes.threadid#" 
			title="Report this thread to the moderator" class="redlink">REPORT</a>
		</cfif>
					&nbsp;]
					</td>
                  </tr>
              </table></td>
            </tr>
        </table>
          <br />
	</cfoutput>

	<cfoutput>
		<cfset variables.totalrows=thread_messages.recordcount>
			<div align="center">
			  <div  class="main_tx">
			 	<cfset variables.thisurl="#request.self#?fuseaction=#attributes.fuseaction#&threadid=#attributes.threadid#">
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
		<cfif request.userid NEQ 0 AND isDefined("XFA.Edit_Preferences")><!--- user logged in --->
			<div align="center">
		 	<br />
			<br />
			<a href="#request.self#?fuseaction=#XFA.Edit_Preferences#" title="Edit Preferences" class="redlink">Edit Preferences</a>
			<br />
			<br />
			</div>    
		</cfif>
		</cfoutput>
		<br />
    </div>
</cfif>

<cfsilent>
<!--- 
$Log: dsp_showthread.cfm,v $
Revision 1.5  2007/06/14 16:52:20  kevin
Remove specific comments

Revision 1.4  2007/06/14 16:38:34  kevin
Copyright statement

Revision 1.3  2007/06/14 15:06:52  kevin
single email address

Revision 1.2  2007/06/14 14:01:47  kevin
Initial Open Source Version

Revision 1.17  2006/06/07 09:45:05  mike
add "Edit forum preferences" link

Revision 1.16  2005/12/16 15:54:00  mike
request.attachmentpath => request.viewattachmentpath, check for empty author name, etc.

Revision 1.15  2005/06/21 09:50:11  mike
pass threadid to fuseaction XFA.PrivateMessage

Revision 1.14  2005/05/26 12:23:26  mike
use xfa's everywhere

Revision 1.13  2005/05/24 10:35:01  mike
include forum_subscribe_check, etc.

Revision 1.12  2005/05/24 08:35:21  mike
change text on PRINT rollover

Revision 1.11  2005/05/23 16:40:38  mike
dd/mm/yy => dd/mm/yyyy

Revision 1.10  2005/05/23 16:15:48  mike
improve fusedoc, etc.

Revision 1.9  2005/05/21 10:27:33  mike
don't show frien icon if not logged on

Revision 1.8  2005/05/20 17:58:34  mike
do the page links at the bottom properly; don't show links to FRIEND etc. if user not logged on

Revision 1.7  2005/05/17 16:45:00  mike
make "send message" aligned right

Revision 1.6  2005/05/13 18:36:29  mike
test that client.userisERSCmember exists

Revision 1.5  2005/05/12 17:37:52  mike
better HTML for warning situations (from forums_no_content.cfm), etc.

Revision 1.4  2005/05/12 11:34:48  mike
put old code into new HTML layout, then remove it

Revision 1.3  2005/05/11 09:07:55  mike
version which includes signed-off HTML as well

Revision 1.2  2005/05/09 17:59:33  mike
improve fusedoc, etc.

Revision 1.1  2005/05/05 12:15:09  mike
Initial FB4 Version

Revision 1.12  2005/04/25 14:48:10  mike
display attachment and signature if any

Revision 1.11  2005/02/03 16:25:50  mike
include new query qCategoryVisible, so check can be made for ERSC-only forums

Revision 1.10  2005/02/03 15:54:12  kevin
Fix for XHTML validation

Revision 1.9  2004/11/17 14:49:36  mike
correct link for REMOVE FRIEND

Revision 1.8  2004/11/17 14:08:51  andrew
remove friend

Revision 1.7  2004/11/10 10:53:44  kevin
Fix XHTML errors.

Revision 1.6  2004/11/07 14:20:36  mike
improve display HTML if no messages, etc.

Revision 1.5  2004/11/04 14:22:41  mike
re-do the bottom-of-page links with better HTML

Revision 1.4  2004/11/03 19:53:25  mike
correction to fusedoc

Revision 1.3  2004/11/03 14:39:34  mike
fully working version
---> 
</cfsilent>
