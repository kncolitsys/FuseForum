<cfsilent>
<!--- -->
<?xml version="1.0"?>
<fusedoc fuse="dsp_threadlocked.cfm">
	<responsibilities>
		I display a confirmation message that the given thread has been locked/unlocked
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
			<boolean name="action" scope="attributes" />
		</in>
		<out>
		</out>
	</io>
</fusedoc>
--->
</cfsilent>

<cfoutput>
<table align="center" border="0" width="85%" class="style1">
	<cfif attributes.action>
	<cfelse>
	</cfif>
	<tr>
		<th align="center" class="headingtext">
		<cfif attributes.action>
			T H R E A D &nbsp;&nbsp;L O C K E D
		<cfelse>
			T H R E A D &nbsp;&nbsp;U N L O C K E D
		</cfif>
		<br /><br />
		</th>
	</tr>
	<tr>
		<td align="center"><br /><br />
		<cfif attributes.action>
			This thread has now been locked and will not allow any new messages to be posted to it.
		<cfelse>
			This thread has now been unlocked and will allow new messages to be posted to it.
		</cfif>
		</td>
	</tr>
</table>
</cfoutput>

<cfsilent>
<!--- 
$Log: dsp_threadlocked.cfm,v $
Revision 1.1  2007/06/15 13:59:14  kevin
Add Admin Modules

Revision 1.3  2005/05/25 14:08:22  andrew
XHTML Validation chages including removing encoding="UTF-16" to prevent double spacing

Revision 1.2  2005/04/11 12:20:11  mike
bug fix: page title should say U N L O C K E D if that is what it is about

Revision 1.1  2005/03/09 13:51:29  mike
Moved to create MVC version

Revision 1.3  2005/02/24 13:57:40  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.2  2005/02/09 17:16:50  mike
changes for XHTML compliance, improve fusedoc, etc.

Revision 1.1  2005/02/04 19:56:50  mike
FB3 version made from wireframe with fusebuilder, with contents pasted from FB2 version, fbx_switch fully commented, and XFA usage improved throughout
---> 
</cfsilent>