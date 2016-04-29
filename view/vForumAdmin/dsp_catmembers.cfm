<cfsilent>
<!--- -->
<?xml version="1.0"?>
<fusedoc fuse="dsp_catmembers.cfm">
	<responsibilities>
		I display a form with the existing and potential members of a Forum
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
			<number name="categoryid" scope="attributes" />
			<list name="hiddenmembers" scope="attributes" />
			<recordset name="categorydetails" scope="variables" format="CFML">
				<number name="categoryname" />
				<string name="description" />
			</recordset>
			<recordset name="currentmembers" scope="variables" format="CFML">
				<number name="userid" />
				<string name="username" />
			</recordset>
			<recordset name="nonmembers" scope="variables" format="CFML">
				<number name="userid" />
				<string name="username" />
			</recordset>
		</in>
		<out>
			<string name="fuseaction" scope="formOrUrl" />
		</out>
	</io>
</fusedoc>
--->
</cfsilent>

<cfoutput>
<cfloop query="categorydetails">
<table align="center" border="0" width="85%" class="style1">
	<tr>
		<th align="center" class="headingtext">A D D / R E M O V E &nbsp;&nbsp;M E M B E R S</th>
	</tr>
	<tr>
		<th align="center" class="smallheader">Add/remove members from forum '#categorydetails.categoryname#'.</th>
	</tr>
	<tr>
		<th align="center">#categorydetails.description#</th>
	</tr>
	
</table>
</cfloop>

<cfset hiddenlist="">
<form name="myForm" action="#request.self#" method="post">
	<input type="hidden" name="fuseaction" id="fuseaction" value="#XFA.Save#" />
	<input type="hidden" name="categoryid" id="categoryid" value="#attributes.categoryid#" />
<table width="85%" class="style1" align="center" border="0">
<tr>
	<td align="center" width="45%">
		Current Members<br />
		<select name="currentmembers" id="currentmembers" size="5" multiple="multiple">
		<cfloop query="currentmembers">
			<cfset hiddenlist=listappend(hiddenlist,currentmembers.userid)>
			<option value="#userid#">#currentmembers.username#</option>
		</cfloop>
		</select>
	</td>
	<td valign="middle" align="center" width="10%">
		<input type="button" name="delactmkt" id="delactmkt" value="<=" onclick="switchselects('nonmembers','currentmembers','hiddenmembers','add');" style="font-weight:bold;" />
		<input type="button" name="addactmkt" id="addactmkt" value="=>" onclick="switchselects('currentmembers','nonmembers','hiddenmembers','del');" style="font-weight:bold;" />	
	</td>
	<td width="45%" align="center">
		Non-members<br />
		<select name="nonmembers" id="nonmembers" size="5" multiple="multiple">
		<cfloop query="nonmembers">
			<option value="#nonmembers.userid#">#nonmembers.username#</option>
		</cfloop>
		</select>
	</td>
</tr>
<tr>
	<td align="center" colspan="3"><input type="submit" name="submit" id="submit" value="Submit" /></td>
</tr>
</table>
<input type="hidden" name="hiddenmembers" id="hiddenmembers" value="#hiddenlist#" />
</form>
</cfoutput>

<cfsilent>
<!--- 
$Log: dsp_catmembers.cfm,v $
Revision 1.1  2007/06/15 13:59:14  kevin
Add Admin Modules

Revision 1.3  2005/05/25 14:09:25  andrew
XHTML Validation chages including removing encoding="UTF-16" to prevent double spacing

Revision 1.2  2005/05/03 12:57:19  kevin
Change XFA scope

Revision 1.1  2005/03/09 13:51:27  mike
Moved to create MVC version

Revision 1.7  2005/02/24 13:57:34  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.6  2005/02/15 10:15:42  mike
explicitly qualify fields inside a <cfloop> by the query name; improve fusedoc

Revision 1.5  2005/02/09 14:43:25  mike
changes for XHTML compliance, improve fusedoc, etc.

Revision 1.4  2005/02/08 17:13:18  mike
index.cfm => #request.self#, etc.

Revision 1.3  2005/02/08 14:50:34  mike
remove useless onfocus= clause

Revision 1.2  2005/02/07 18:15:46  mike
removed redundant <cfsetting>

Revision 1.1  2005/02/04 19:56:49  mike
FB3 version made from wireframe with fusebuilder, with contents pasted from FB2 version, fbx_switch fully commented, and XFA usage improved throughout
---> 
</cfsilent>