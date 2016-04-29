<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="dsp_postprivatemessage.cfm">
	<responsibilities>
		I display a form allowing the users to send a private message to a user who is a friend.
	</responsibilities>
	<properties>
		<history author="Mike Oakes" email="mike@objectiveinternet.com" date="01-Nov-2004" role="Architect" type="Create"
				comments="Split off from dsp_postnew.cfm by MSO on 15Oct04" />
		<property name="copyright" value="(c)2004 Objective Internet Limited." />
		<property name="licence" value="Licensed under the Apache License, Version 2.0  See licence.txt" />
		<property name="version" value="$Revision: 1.4 $" />
		<property name="lastupdated" value="$Date: 2007/06/14 16:52:20 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<string name="XFA.Save" scope="variables" />
			<number name="userid" scope="attributes" />
			<number name="threadid" scope="attributes" optional="Yes" />
		</in>
		<out>
			<string name="fuseaction" scope="formOrUrl" />
			<number name="userid" scope="formOrUrl" />
		</out>
	</io>
</fusedoc>
--->
</cfsilent>

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

<cfset attributes.message="">
<cfset attributes.attachment="">

<cfoutput>
    <div class="box_title forums_con_header">
      <h1>Private message To: #getuser.username#</h1>
    </div>
    <div class="main_tx forums_sub_con_info" >
	<form action="#request.self#" method="post" name="ForumsSendPrivateMessageForm" id="ForumsSendPrivateMessageForm">
		<input type="hidden" name="fuseaction" id="fuseaction" value="#XFA.Save#" />
		<input type="hidden" name="userid" id="userid" value="#attributes.userid#" />
		<cfif isDefined("attributes.threadid")>
			<input type="hidden" name="threadid" id="userid" value="#attributes.threadid#" />
		</cfif>
      <table width="100%" border="0" cellpadding="2" cellspacing="0" class="forumstable" summary="Report To Moderator Form">
            <tr>
            <th width="16%"  align="left" valign="top" class="forum_thread_text_left">
            	<label for="message">Your Message:</label>
           </th>
            <th width="2%"  align="left" valign="top">&nbsp;</th>
            <td width="82%" align="left"><textarea name="message" id="message" cols="82" rows="31" class="button" onfocus="if(this.value=='Type message here')this.value='';">Type message here</textarea></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td><input type="submit" class="button" onfocus="this.blur();" value="Send Message" /></td>
          </tr>       
      </table>
	  </form>
    </div>
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
$Log: dsp_postprivatemessage.cfm,v $
Revision 1.4  2007/06/14 16:52:20  kevin
Remove specific comments

Revision 1.3  2007/06/14 16:38:35  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:47  kevin
Initial Open Source Version

Revision 1.6  2005/06/21 09:46:56  mike
attributes.threadid is optional

Revision 1.5  2005/06/21 09:16:03  mike
pass threadid

Revision 1.4  2005/05/26 12:23:26  mike
use xfa's everywhere

Revision 1.3  2005/05/13 14:02:15  mike
final version

Revision 1.2  2005/05/11 09:07:55  mike
version which includes signed-off HTML as well

Revision 1.1  2005/05/05 12:15:09  mike
Initial FB4 Version

Revision 1.3  2004/11/10 10:48:06  kevin
Fix XHTML errors.

Revision 1.2  2004/11/03 19:56:04  mike
many changes => essentially final version

Revision 1.1  2004/10/18 10:13:21  mike
initial version
 --->
</cfsilent>

