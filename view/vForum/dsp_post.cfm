<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="dsp_post.cfm">
	<responsibilities>
		I display a form for the user to post a reply to the given thread
	</responsibilities>
	<properties>
		<history author="Mike Oakes" email="mike@objectiveinternet.com" date="07-Nov-2004" role="Architect" type="Create"
				comments="split off from dsp_postnew.cfm" />
		<property name="copyright" value="(c)2004 Objective Internet Limited." />
		<property name="licence" value="Licensed under the Apache License, Version 2.0  See licence.txt" />
		<property name="version" value="$Revision: 1.4 $" />
		<property name="lastupdated" value="$Date: 2007/06/14 16:52:19 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<string name="XFA.Save" scope="request" />
			<string name="userid" scope="request" />
			<number name="threadid" scope="attributes" />
			<string name="message" scope="attributes" />
			<string name="attachment" scope="attributes" />
			<boolean name="allowattachments" scope="attributes" />
			<recordset name="checkexisting" scope="variables" format="CFML">
				<number name="recordid"/>
			</recordset>
			<recordset name="threaddetails" scope="variables" format="CFML">
				<string name="threadname"/>
				<number name="categoryid"/>
				<string name="categoryname"/>
			</recordset>
		</in>
		<out>
			<string name="fuseaction" scope="formOrUrl" />
			<string name="action" scope="formOrUrl"" />
			<number name="threadid" scope="formOrUrl"  />
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

<script language="JavaScript" type="text/JavaScript">
<!-- Hide 
function VerifyForm(myform)
  {
	var SubmitForm = 1;
	var themessage = "Please enter a thread title";
	if (SubmitForm == 1)
	  {
		myform.submit();
		return true;
	  }
	else
	  {
		alert(themessage);
		return false;
	  }
  }
// End Hiding-->
</script>

<cfset attributes.message="">
<cfset attributes.attachment="">

<cfoutput>

    <div class="box_title forums_con_header">#threaddetails.categoryname#</div>
    <div class="main_tx forums_sub_con_info" > 
          <div align="center"><span class="main_story_sub_title">Post Reply </span><span class="main_story_title"></span><br />
         <div class="hr_beaker"></div>
		  </div> 
		  <form name="ForumsSendMessageForm" id="ForumsSendMessageForm" action="#request.self#" method="post" enctype="multipart/form-data">
			<input type="hidden" name="fuseaction" value="#XFA.Save#" />
			<input type="hidden" name="threadid" value="#attributes.threadid#" />
          <table width="100%"  border="0" cellpadding="2" cellspacing="1"  summary="Post message form">           
              <tr>
                <th width="25%" align="left" class="forum_thread_text_left">Thread Title:</th>
                <td width="75%" class="main_tx_b">
				<input type="hidden" name="threadname" value="#threaddetails.threadname#" />#threaddetails.threadname#</td>
              </tr>
              <tr>
                <th align="left" valign="top" class="forum_thread_text_left"><label for="message">Your Message:</label></th>
                <td><textarea name="message" cols="80" rows="25" class="button" id="message" onfocus="if(this.value=='Type your message here')this.value='';"><cfif len(attributes.message)>#attributes.message#<cfelse>Type your message here</cfif></textarea></td>
              </tr>
<cfif attributes.allowattachments>
	<tr>
		<th align="left" class="forum_thread_text_left">Attachment:</th>
		<td>
		<input type="hidden" name="attachment_old" value="#attributes.attachment#" />
		<cfif len(attributes.attachment)>
		#attributes.attachment# &nbsp;&nbsp;&nbsp;Delete? <input type="Checkbox" name="deleteattach" id="deleteattach" class="normalinput" onfocus="this.blur();" />
		<cfelse>(none)</cfif>
		</td>
	</tr>
	<tr>
       	<th align="left" class="forum_thread_text_left"><label for="attachment">New Attachment:</label></th>
       	<td><input type="file" name="attachment" id="attachment" class="button" value="Upload Attachment" /></td>
	</tr>	
	<cfif len(request.attachmentmaxsize)>
	<tr>
       	<th align="left" class="forum_thread_text_left">Note:</th>
		<td> Attachment size is limited to #request.attachmentmaxsize#Mb.
		Files larger than this will be deleted from the server!</td>
	</tr>
	</cfif>
</cfif>
<cfif checkexisting.recordcount EQ 0><!--- reply, and not subscribed already --->
            <tr>
              <th align="left" class="forum_thread_text_left"><label for="subscribe">Subscribe to this thread:</label></th>
              <td><input name="subscribe" id="subscribe" type="checkbox" class="normalinput" /></td>
            </tr>
</cfif>
              <tr>
                <td class="forum_thread_text_left">&nbsp;</td>
                <td><input type="button" class="button" value="Post Message" onfocus="this.blur();" onclick="javascript:VerifyForm(document.ForumsSendMessageForm)" onkeypress="javascript:VerifyForm(document.ForumsSendMessageForm)" />
                </td>
              </tr>            
        </table>
		</form>
          <br />
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
$Log: dsp_post.cfm,v $
Revision 1.4  2007/06/14 16:52:19  kevin
Remove specific comments

Revision 1.3  2007/06/14 16:38:35  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:47  kevin
Initial Open Source Version

Revision 1.9  2005/10/10 09:44:11  mike
remove extra " from form tag

Revision 1.8  2005/09/15 11:00:45  bob
Add missing quote to form tag

Revision 1.7  2005/07/29 17:20:50  mike
max attachment size = 10Mb now

Revision 1.6  2005/05/26 12:23:25  mike
use xfa's everywhere

Revision 1.5  2005/05/23 09:04:53  mike
don't pre-check the "subscribe" checkbox

Revision 1.4  2005/05/13 16:26:49  mike
small edits

Revision 1.3  2005/05/13 15:47:45  mike
final working version

Revision 1.2  2005/05/11 09:07:54  mike
version which includes signed-off HTML as well

Revision 1.1  2005/05/05 12:15:08  mike
Initial FB4 Version

Revision 1.5  2005/04/28 14:46:57  mike
add "document." to JS (essential for Firefox)

Revision 1.4  2005/02/03 16:11:32  kevin
Fix for XHTML validation

Revision 1.3  2004/11/15 16:10:12  mike
bug fix: add enctype="multipart/form-data"

Revision 1.2  2004/11/10 10:44:16  kevin
Fix XHTML errors.

Revision 1.1  2004/11/07 14:01:02  mike
split off from dsp_postnew.cfm
 --->
</cfsilent>
