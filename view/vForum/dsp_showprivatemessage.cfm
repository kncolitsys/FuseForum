<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="dsp_showprivatemessage.cfm">
	<responsibilities>
		I display a private message
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
			<string name="XFA.PrivateMessage" scope="variables" />
			<number name="threadid" scope="attributes" />
			<recordset name="thisprivatemessage" scope="variables" format="CFML">
				<number name="messageid"/>
				<number name="userid"/>
				<string name="message"/>
				<number name="senderid"/>
				<datetime name="messagedate"/>
				<string name="username"/>
				<boolean name="privatemessages"/>
				<string name="signature"/>
			</recordset>
		</in>
		<out>
			<string name="fuseaction" scope="formOrUrl" />
			<number name="userid" scope="formOrUrl" />
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
    <div class="box_title forums_con_header">Private Message</div>
    <div class="main_tx forums_sub_con_info" > 
		<cfif thisprivatemessage.recordcount EQ 0>
			<br />
			<div align="center">Message not found</div>
			<br />
		<cfelse>
		<cfoutput query="thisprivatemessage">
          <table width="100%" border="0" cellpadding="2" cellspacing="1"  class="forum_thread_odd" summary="Reply message">
            <tr>
              <th width="8%" align="left" class="forum_thread_text_left" scope="row">Author:</th>
              <td width="73%" class="main_tx">#thisprivatemessage.username#</td>
              <td width="19%" align="right"><a href="#request.self#?fuseaction=#XFA.PrivateMessage#&userid=#thisprivatemessage.senderid#" class="redlink" title="Send this person a private message">Reply</a></td>
            </tr>
            <tr>
              <th align="left" class="forum_thread_text_left" scope="row">Date:</th>
              <td colspan="2" class="main_tx">#timeformat(thisprivatemessage.messagedate,"HH:mm")# - #dateformat(thisprivatemessage.messagedate,"dd/mm/yyyy")#</td>
            </tr>
            <tr>
              <th colspan="1" align="left" valign="top" class="forum_thread_text_left">Message:</th>
              <td colspan="2" class="main_tx">#thisprivatemessage.message#</td>
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
$Log: dsp_showprivatemessage.cfm,v $
Revision 1.4  2007/06/14 16:52:20  kevin
Remove specific comments

Revision 1.3  2007/06/14 16:38:35  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:47  kevin
Initial Open Source Version

Revision 1.4  2005/05/26 12:23:26  mike
use xfa's everywhere

Revision 1.3  2005/05/23 16:41:07  mike
dd/mm/yy => dd/mm/yyyy

Revision 1.2  2005/05/23 10:22:24  mike
final working version with correct HTML

Revision 1.1  2005/05/05 12:15:09  mike
Initial FB4 Version

Revision 1.3  2004/11/07 14:22:48  mike
proper HTML

Revision 1.2  2004/11/05 19:54:20  mike
ok not final HTML yet
--->
</cfsilent>
