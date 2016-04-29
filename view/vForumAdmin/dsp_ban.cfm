<cfsilent>
<!--- -->
<?xml version="1.0"?>
<fusedoc fuse="dsp_ban.cfm">
	<responsibilities>
		I display a Banning form to allow individuals to be banned or unbanned by name or email address
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
			<string name="bantype" scope="attributes" />
			<recordset name="bans" scope="variables" format="CFML">
				<number name="banid" />
				<string name="bantype"/>
				<string name="banstring"/>
			</recordset>
		</in>
		<out>
			<string name="fuseaction" scope="formOrUrl" />
			<string name="addban" scope="formOrUrl" />
			<string name="delbans" scope="formOrUrl" />
			<string name="bantype" scope="formOrUrl" />
			<string name="ban" scope="formOrUrl" optional="Yes" />
			<list name="banlist" scope="formOrUrl" optional="Yes" />
		</out>
	</io>
</fusedoc>
--->
</cfsilent>

<cfoutput>
<table align="center" border="0" width="85%" class="style1">
	<tr>
		<th colspan="2" align="center" class="headingtext">B A N N I N G<br /></th>
	</tr>

<form name="banform" action="#request.self#" method="post">
<input type="hidden" name="fuseaction" id="fuseaction" value="#XFA.Save#" />
<input type="hidden" name="bantype" id="bantype" value="#attributes.bantype#" />

<cfswitch expression="#attributes.bantype#">

	<cfcase value="IP"><!--- this value is never used, in fact --->
		<tr>
			<td colspan="2" align="center" class="smallheader">Ban by IP address<br /><br /></td>
		</tr>
		<tr>
			<td colspan="2">
			You can ban individual IP addresses or an IP range:<br />
			xxx will ban xxx.*.*.*<br />
			xxx.xxx will ban xxx.xxx.*.*<br />
			xxx.xxx.xxx will ban xxx.xxx.xxx.*<br />
			xxx.xxx.xxx.xxx will ban xxx.xxx.xxx.xxx<br />
			</td>
		</tr>
		<tr>
			<th class="smallheader">IP to ban:</th>
			<td><input type="text" name="ban" id="ban" />
			<input type="submit" name="addban" id="addban" value="Ban IP" /></td>
		</tr>
		<tr>
			<td class="smallheader" colspan="2">Existing IP bans:</td>
		</tr>
		<cfif bans.recordcount>
			<cfloop query="bans">
				<tr>
					<th>#bans.banstring#</th>
					<td><input type="checkbox" name="banlist" id="banlist_#bans.banid#" value="#bans.banid#" class="normalinput" /></td>
				</tr>
			</cfloop>
			<tr>
				<td></td>
				<td><input type="submit" name="delbans" id="delbans" value="Remove IP Bans" /></td>
			</tr>
		<cfelse>
			<tr>
				<td colspan="2">There are currently no IP bans</td>
			</tr>		
		</cfif>
	</cfcase>

	<cfcase value="email">
		<tr>
			<td colspan="2" align="center" class="smallheader">Ban by email address<br /><br /></td>
		</tr>
		<tr>
			<td colspan="2">
			You can ban individual email addresses or an email domain:<br />
			user@email.com will ban user@email.com<br />
			email.com will ban everyone with a @email.com email address<br />
			.com will ban everyone with a .com email address<br />
			</td>
		</tr>
		<tr>
			<th class="smallheader">Email to ban:</th>
			<td><input type="text" name="ban" id="ban" />
			<input type="submit" name="addban" id="addban" value="Ban email" /></td>
		</tr>
		<tr>
			<td class="smallheader" colspan="2">Existing email bans:</td>
		</tr>
		<cfif bans.recordcount>
			<cfloop query="bans">
				<tr>
					<th>#bans.banstring#</th>
					<td><input type="checkbox" name="banlist" id="banlist_#bans.banid#" value="#bans.banid#" class="normalinput" /></td>
				</tr>
			</cfloop>
			<tr>
				<td></td>
				<td><input type="submit" name="delbans" id="delbans" value="Remove email bans" /></td>
			</tr>
		<cfelse>
			<tr>
				<td colspan="2">There are currently no email bans</td>
			</tr>		
		</cfif>
	</cfcase>
	
	<cfdefaultcase>
		<tr>
			<td colspan="2" align="center" class="smallheader">Ban by user<br /><br /></td>
		</tr>
		<tr>
			<td colspan="2">
			You can ban individual users by adding their username<br />
			</td>
		</tr>
		<tr>
			<th class="smallheader">Username to ban:</th>
			<td><input type="text" name="ban" id="ban" />
			<input type="submit" name="addban" id="addban" value="Ban user" /></td>
		</tr>
		<tr>
			<td class="smallheader" colspan="2">Existing user bans:</td>
		</tr>
		<cfif bans.recordcount>
			<cfloop query="bans">
				<tr>
					<th>#bans.banstring#</th>
					<td><input type="checkbox" name="banlist" id="banlist_#bans.banid#" value="#bans.banid#" class="normalinput" /></td>
				</tr>
			</cfloop>
			<tr>
				<td></td>
				<td><input type="submit" name="delbans" id="delbans" value="Remove user bans" /></td>
			</tr>
		<cfelse>
			<tr>
				<td colspan="2">There are currently no user bans</td>
			</tr>		
		</cfif>
	</cfdefaultcase>
	
</cfswitch>
</form>	
</table>
</cfoutput>

<cfsilent>
<!--- 
$Log: dsp_ban.cfm,v $
Revision 1.1  2007/06/15 13:59:14  kevin
Add Admin Modules

Revision 1.4  2005/05/25 14:11:02  andrew
XHTML Validation chages including removing encoding="UTF-16" to prevent double spacing

Revision 1.3  2005/05/12 16:56:45  mike
add comment

Revision 1.2  2005/05/03 12:57:19  kevin
Change XFA scope

Revision 1.1  2005/03/09 13:51:26  mike
Moved to create MVC version

Revision 1.6  2005/02/24 13:57:30  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.5  2005/02/09 16:10:41  mike
made alterations to where <th> was used

Revision 1.4  2005/02/09 13:29:11  mike
changes for XHTML compliance, etc.

Revision 1.3  2005/02/08 17:11:22  mike
index.cfm => #request.self#, etc.

Revision 1.2  2005/02/08 14:50:34  mike
remove useless onfocus= clause

Revision 1.1  2005/02/04 19:56:49  mike
FB3 version made from wireframe with fusebuilder, with contents pasted from FB2 version, fbx_switch fully commented, and XFA usage improved throughout
---> 
</cfsilent>