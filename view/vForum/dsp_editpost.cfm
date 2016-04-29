<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="dsp_editpost.cfm">
	<responsibilities>
		I display an existing message and allow the user to change or update it
	</responsibilities>
	<properties>
		<history author="Mike Oakes" email="mike@objectiveinternet.com" date="01-Nov-2004" role="Architect" type="Create"
				comments="Split off from dsp_postnew.cfm by MSO on 15Oct04" />
		<property name="copyright" value="(c)2004 Objective Internet Limited." />
		<property name="licence" value="Licensed under the Apache License, Version 2.0  See licence.txt" />
		<property name="version" value="$Revision: 1.4 $" />
		<property name="lastupdated" value="$Date: 2007/06/14 16:52:19 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<string name="XFA.Save" scope="variables" />
			<string name="userid" scope="request" />
			<number name="threadid" scope="attributes" />
			<number name="messageid" scope="attributes" />
			<boolean name="allowattachments" scope="attributes" />
			<string name="message" scope="attributes" />
			<string name="attachment" scope="attributes" />
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
			<number name="threadid" scope="formOrUrl" />
			<number name="messageid" scope="formOrUrl" />
			<string name="message" scope="formOrUrl" />
			<boolean name="deleteattach" scope="formOrUrl" />
			<string name="attachment_old" scope="formOrUrl" />
			<file name="attachment" scope="formOrUrl" />
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

<cfoutput>

<!---
<cf_formatinput 
	input="#attributes.message#"
	r_output="attributes.message"
	function="out"
	replacetags="false">
	--->
<cfmodule template="../../tags/formatinput/formatinput.cfm"
	input="#attributes.message#"
	r_output="attributes.message"
	function="out"
	replacetags="false">

    <div class="box_title forums_con_header">#threaddetails.categoryname#</div>
    <div class="main_tx forums_sub_con_info" > 
          <div align="center"><span class="main_story_sub_title">Edit Message </span><span class="main_story_title"></span><br />
         <div class="hr_beaker"></div>
		  </div> 
		  <form name="ForumsEditMessageForm" id="ForumsEditMessageForm" action="#request.self#" method="post" enctype="multipart/form-data">
		<input type="hidden" name="fuseaction" value="#XFA.Save#" />
		<input type="hidden" name="threadid" value="#attributes.threadid#" />
		<input type="hidden" name="messageid" value="#attributes.messageid#" />
		<input type="hidden" name="action" value="query" />
          <table width="100%"  border="0" cellpadding="2" cellspacing="1"  summary="Post message form">           
              <tr>
                <th width="25%" align="left" class="forum_thread_text_left">Thread Title:</th>
                <td width="75%" class="main_tx_b"><input type="hidden" name="threadname" value="#threaddetails.threadname#" />#threaddetails.threadname#</td>
              </tr>
              <tr>
                <th align="left" valign="top" class="forum_thread_text_left"><label for="message">Your Message:</label></th>
                <td><textarea name="message" id="message" cols="80" rows="25" class="button">#attributes.message#</textarea></td>
              </tr>
<cfif attributes.allowattachments>
		<tr>
          	<th align="left" class="forum_thread_text_left">Attachment:</th>
			<td>
			<input type="hidden" name="attachment_old" id="attachment_old" value="#attributes.attachment#" />
			<cfif len(attributes.attachment)>
			#attributes.attachment# &nbsp;&nbsp;&nbsp;Delete?
			<input type="Checkbox" name="deleteattach" id="deleteattach" class="normalinput" onfocus="this.blur();" />
			<cfelse>(none)</cfif>
			</td>
		</tr>
		<tr>
          	<th align="left" class="forum_thread_text_left"><label for="attachment">New Attachment:</label></th>
          	<td><input name="attachment" type="file" class="button" id="attachment" value="Upload Attachment" /></td>
		</tr>	
	<cfif len(request.attachmentmaxsize)>
		<tr>
          	<th align="left" class="forum_thread_text_left">Note:</th>
			<td>Attachment size is limited to #request.attachmentmaxsize#Mb.
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
                <td><input type="button" class="button" value="Post Message" onfocus="this.blur();" onclick="javascript:VerifyForm(document.ForumsEditMessageForm)" onkeypress="javascript:VerifyForm(document.ForumsEditMessageForm)" />
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
$Log: dsp_editpost.cfm,v $
Revision 1.4  2007/06/14 16:52:19  kevin
Remove specific comments

Revision 1.3  2007/06/14 16:38:35  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:47  kevin
Initial Open Source Version

Revision 1.6  2005/07/29 17:20:50  mike
max attachment size = 10Mb now

Revision 1.5  2005/05/26 12:23:25  mike
use xfa's everywhere

Revision 1.4  2005/05/23 09:04:38  mike
don't pre-check the "subscribe" checkbox

Revision 1.3  2005/05/13 17:45:49  mike
final working version

Revision 1.2  2005/05/11 12:54:53  mike
version which includes signed-off HTML as well

Revision 1.1  2005/05/05 12:15:07  mike
Initial FB4 Version

Revision 1.5  2004/11/15 16:09:58  mike
bug fix: add enctype="multipart/form-data"

Revision 1.4  2004/11/10 10:21:05  kevin
Fix XHTML errors.

Revision 1.3  2004/11/05 15:46:09  mike
split off queries into qry_editpost.cfm

Revision 1.2  2004/11/03 19:20:04  mike
fully working version

Revision 1.1  2004/10/18 10:13:21  mike
initial version

Revision 1.5  2001/11/28 11:41:37  fiona
added formatinput custom tag instead of act_formatmsg and act_reformatmsg templates
 --->
</cfsilent>
