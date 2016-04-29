<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="dsp_reporttomoderator.cfm">
	<responsibilities>
		I display a form to enable the user to send a comment to the forum moderators to report the thread
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
			<string name="XFA.Save" scope="variables" />
			<number name="threadid" scope="attributes" />
		</in>
		<out>
			<string name="fuseaction" scope="formOrUrl" />
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

<cfoutput>

    <div class="box_title forums_con_header">
      <h1>#threaddetails.categoryname#</h1>
    </div>
    <div class="main_tx forums_sub_con_info" >
	<form name="ForumsReportThreadToModeratorForm" id="ForumsReportThreadToModeratorForm" action="#request.self#" method="post">
		<input type="hidden" name="fuseaction" value="#XFA.Save#" />
		<input type="hidden" name="threadid" value="#attributes.threadid#" />
		<table width="100%" border="0" cellpadding="2" cellspacing="0" class="forumstable" summary="Report To Moderator Form">        
           <tr align="left">
            <td colspan="2"><h2><span class="main_story_title">Report Breach</span></h2><br />
                  <span class="main_tx">Report this thread to the moderator if it causes a breach of the regulations of use of this forum. Your user details will be sent to the moderator to allow him/her to follow up the issue.</span><br />
                  <br />
            </td>
          </tr>
          <tr>
            <th width="38%"  align="left" valign="top"><span class="main_tx_b">
            	<label for="complaint">Reasons for complaint:</label>
            </span></th>
            <td width="62%" align="left"><textarea name="complaint" id="complaint" cols="80" rows="26" class="button" onfocus="if(this.value=='Reason for your complaint')this.value='';">Reason for your complaint</textarea></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td><input type="submit" class="button" onfocus="this.blur();" value="Submit complaint" /></td>
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
$Log: dsp_reporttomoderator.cfm,v $
Revision 1.4  2007/06/14 16:52:20  kevin
Remove specific comments

Revision 1.3  2007/06/14 16:38:35  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:47  kevin
Initial Open Source Version

Revision 1.4  2005/05/26 12:23:26  mike
use xfa's everywhere

Revision 1.3  2005/05/13 14:02:36  mike
final working version

Revision 1.2  2005/05/11 09:07:55  mike
version which includes signed-off HTML as well

Revision 1.1  2005/05/05 12:15:09  mike
Initial FB4 Version

Revision 1.3  2004/11/10 10:51:05  kevin
Fix XHTML errors.

Revision 1.2  2004/11/03 17:22:07  mike
fully working version
--->
</cfsilent>

