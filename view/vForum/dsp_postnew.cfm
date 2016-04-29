<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="dsp_postnew.cfm">
	<responsibilities>
		I display a form for the user to post a message to start a new thread in the given forum
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
			<string name="XFA.Save" scope="request" />
			<string name="userid" scope="request" />
			<number name="categoryid" scope="attributes" />
			<string name="message" scope="attributes" />
			<string name="attachment" scope="attributes" />
			<boolean name="allowattachments" scope="attributes" />
			<recordset name="allowattachments" scope="variables" format="CFML">
				<string name="categoryname"/>
				<boolean name="allowattachments"/>
			</recordset>
		</in>
		<out>
			<string name="fuseaction" scope="formOrUrl" />
			<string name="action" scope="formOrUrl"" />
			<number name="categoryid" scope="formOrUrl" />
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
	if (myform.threadname.value=="")
	  {
		if (SubmitForm == 1)
		  {
			myform.threadname.focus();
			SubmitForm = 0;
		  }
	  }
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

    <div class="box_title forums_con_header">#allowattachments.categoryname#</div>
    <div class="main_tx forums_sub_con_info" > 
          <div align="center"><span class="main_story_sub_title">Start A Thread </span><span class="main_story_title"></span><br />
         <div class="hr_beaker"></div>
		  </div> 
		  <form name="ForumsStartThreadForm" id="ForumsStartThreadForm" action="#request.self#" method="post" enctype="multipart/form-data">
			<input type="hidden" name="fuseaction" value="#XFA.Save#" />
			<input type="hidden" name="categoryid" value="#attributes.categoryid#" />
			<!--- <input type="hidden" name="action" value="blank" /> ---><!--- ?? needed --->
			<cfif isDefined("attributes.storyId")>
				<input type="hidden" name="storyId" value="#attributes.storyId#" />
			</cfif>
          <table width="100%"  border="0" cellpadding="2" cellspacing="1" summary="Post message form">           
              <tr>
                <th width="25%" align="left" class="forum_thread_text_left"><label for="threadname">Thread Title:</label></th>
                <td width="75%" class="main_tx_b"><input type="text" name="threadname" id="threadname" class="button" <cfif isDefined("qStory.Title")>value="Re: #Left(qStory.Title,46)#"<cfelse>value="Thread Title"</cfif> onfocus="if(this.value=='Thread Title')this.value='';" /></td>
              </tr>
              <tr>
                <th align="left" valign="top" class="forum_thread_text_left"><label for="message">Your Message:</label></th>
                <td><textarea name="message" cols="80" rows="25" class="button" id="message"  onfocus="if(this.value=='Type your message here')this.value='';">Type your message here</textarea></td>
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
		<td>Attachment size is limited to #request.attachmentmaxsize#Mb.
		Files larger than this will be deleted from the server!	</td>
	</tr>
	</cfif>
</cfif>
              <tr>
                <th align="left" class="forum_thread_text_left"><label for="subscribe">Subscribe to this thread:</label></th>
                <td><input name="subscribe" id="subscribe" type="checkbox" class="normalinput" /></td>
              </tr>
              <tr>
                <td class="forum_thread_text_left">&nbsp;</td>
                <td><input type="button" class="button" onfocus="this.blur();" onclick="javascript:VerifyForm(document.ForumsStartThreadForm)" onkeypress="javascript:VerifyForm(document.ForumsStartThreadForm)" value="Post Message" />
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
$Log: dsp_postnew.cfm,v $
Revision 1.4  2007/06/14 16:52:20  kevin
Remove specific comments

Revision 1.3  2007/06/14 16:38:35  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:47  kevin
Initial Open Source Version

Revision 1.6  2005/07/29 17:20:50  mike
max attachment size = 10Mb now

Revision 1.5  2005/05/26 12:23:26  mike
use xfa's everywhere

Revision 1.4  2005/05/23 09:05:21  mike
don't pre-check the "subscribe" checkbox

Revision 1.3  2005/05/13 16:40:39  mike
final working version

Revision 1.2  2005/05/11 09:07:55  mike
version which includes signed-off HTML as well

Revision 1.1  2005/05/05 12:15:08  mike
Initial FB4 Version

Revision 1.10  2005/04/28 14:47:36  mike
add "document." to JS (essential for Firefox)

Revision 1.9  2005/02/03 16:11:22  kevin
Fix for XHTML validation

Revision 1.8  2004/11/15 16:10:31  mike
bug fix: add enctype="multipart/form-data"

Revision 1.7  2004/11/10 10:46:24  kevin
Fix XHTML errors.

Revision 1.6  2004/11/09 16:16:45  kevin
Remove debug

Revision 1.5  2004/11/08 19:34:00  kevin
Link Content to Forums

Revision 1.4  2004/11/07 14:23:50  mike
dsp_post.cfm split off, to make code simpler

Revision 1.3  2004/11/04 18:53:58  mike
small edits

Revision 1.2  2004/11/03 18:38:45  mike
fully working version

Revision 1.1  2004/10/18 10:13:21  mike
initial version
 --->
</cfsilent>
