<cfsilent>
<!--- -->
<?xml version="1.0"?>
<fusedoc fuse="dsp_approvethis.cfm">
	<responsibilities>
		I display a thread or message for approval
	</responsibilities>
	<properties>
		<history author="Mike Oakes" email="mike@objectiveinternet.com" date="04-Feb-2005" role="Architect" type="Create" />
		<property name="copyright" value="(c)2005 Objective Internet Limited." />
		<property name="licence" value="See licence.txt" />
		<property name="version" value="$Revision: 1.1 $" />
		<property name="lastupdated" value="$Date: 2007/06/15 13:59:14 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<string name="XFA.Save" scope="request" />
			<string name="XFA.Followon" scope="request" />
			<string name="fuseaction" scope="attributes" />
			<number name="threadid" scope="attributes" optional="Yes" />
			<number name="messageid" scope="attributes" optional="Yes" />
			<recordset name="message" scope="variables" format="CFML">
				<string name="message" />
				<string name="moderatormessage" />
				<number name="messageid" optional="Yes" />
				<string name="threadname" optional="Yes" />
			</recordset>
		</in>
		<out>
			<string name="fuseaction" scope="formOrUrl" />
			<number name="messageid" scope="formOrUrl" />
			<string name="followon" scope="formOrUrl" />
		</out>
	</io>
</fusedoc>
--->
</cfsilent>

<cfoutput>
<table align="center" border="0" width="85%" cellspacing="0" class="style1">
	<tr>
		<th align="center" class="headingtext" colspan="2">#attributes.heading#<br /><br /></th>
	</tr>

<cfset variables.fuseaction=ListLast(attributes.fuseaction,".")>
<cfform name="approveform" action="#request.self#" method="post">
	<cfloop query="message">
		<input type="hidden" name="fuseaction" id="fuseaction" value="#XFA.Save#" />
		<input type="hidden" name="followon" id="followon" value="#XFA.Followon#" />
		<cfif isDefined("attributes.threadid")>
			<input type="hidden" name="threadid" id="threadid" value="#attributes.threadid#" />
			<input type="hidden" name="messageid" id="messageid" value="#message.messageid#" />
			<tr>
				<th class="smallheader" width="50%">Thread title:</th>
				<td width="50%"><cfinput type="text" name="threadname" value="#message.threadname#" size="35" required="yes" message="Please enter the thread title" maxlength="50"></td>
			</tr>		
		<cfelse>
			<input type="hidden" name="messageid" id="messageid" value="#attributes.messageid#" />
		</cfif>
		<tr>
			<th class="smallheader" valign="top">Message:</th>
			<td><textarea name="message" id="message" cols="40" rows="8">#message.message#</textarea></td>
		</tr>
		<cfif variables.fuseaction NEQ "DeleteThisMessage">
			<tr>
				<th class="smallheader">Moderator comment:</th>
				<td><input type="text" name="moderatormessage" id="moderatormessage" maxlength="100" size="35" value="#message.moderatormessage#" /></td>
			</tr>
		</cfif>
	</cfloop>		
	<tr>
		<td colspan="2" align="center">
		<!--- <cfif fusebox.fuseaction IS NOT "DeleteThisMessage"> --->
		<cfif variables.fuseaction IS NOT "DeleteThisMessage">
			<input type="submit" name="accept" id="accept" value="Accept Message" />&nbsp;&nbsp;
		</cfif>	
		<cfif variables.fuseaction IS "ApproveThis">
			<input type="submit" name="reject" id="reject" value="Reject Message" />
		<cfelseif variables.fuseaction IS "DeleteThisMessage">
			<input type="submit" name="reject" id="reject" value="Delete Message" />
		</cfif>
		</td>
	</tr>
</cfform>
</table>
</cfoutput>

<cfsilent>
<!--- 
$Log: dsp_approvethis.cfm,v $
Revision 1.1  2007/06/15 13:59:14  kevin
Add Admin Modules

Revision 1.5  2005/05/25 14:09:37  andrew
XHTML Validation chages including removing encoding="UTF-16" to prevent double spacing

Revision 1.4  2005/05/12 16:57:33  mike
don't put the "Moderator comment" line in for delete

Revision 1.3  2005/05/03 12:57:19  kevin
Change XFA scope

Revision 1.2  2005/03/15 12:23:31  mike
bug fix: fusebox.fuseaction => variables.fuseaction

Revision 1.1  2005/03/09 13:51:26  mike
Moved to create MVC version

Revision 1.6  2005/03/07 16:39:41  mike
recode references to fusebox.fuseaction

Revision 1.5  2005/02/24 13:57:29  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.4  2005/02/10 11:19:50  mike
changes for XHTML compliance, improve fusedoc, etc.

Revision 1.3  2005/02/08 17:10:33  mike
improved fusedoc etc.

Revision 1.2  2005/02/08 14:50:34  mike
remove useless onfocus= clause

Revision 1.1  2005/02/04 19:56:49  mike
FB3 version made from wireframe with fusebuilder, with contents pasted from FB2 version, fbx_switch fully commented, and XFA usage improved throughout
---> 
</cfsilent>
