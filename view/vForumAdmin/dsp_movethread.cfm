<cfsilent>
<!--- -->
<?xml version="1.0"?>
<fusedoc fuse="dsp_movethread.cfm">
	<responsibilities>
		I display a form allowing the user to move the thread to another forum
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
			<number name="threadid" scope="attributes" />
			<recordset name="categorylist" scope="variables" format="CFML">
				<number name="categoryid"/>
				<string name="categoryname"/>
			</recordset>
		</in>
		<out>
			<string name="fuseaction" scope="formOrUrl" />
			<number name="threadid" scope="formOrUrl" />
			<number name="newcategory" scope="formOrUrl" />
		</out>
	</io>
</fusedoc>
--->
</cfsilent>

<cfoutput>
<table align="center" border="0" width="85%" class="style1">
	<tr>
		<th colspan="2" align="center" class="headingtext">M O V E &nbsp;&nbsp;T H R E A D<br /><br /></th>
	</tr>
<form name="movethreadform" action="#request.self#" method="post">
<input type="hidden" name="fuseaction" id="fuseaction" value="#XFA.Save#" />
<input type="hidden" name="threadid" id="threadid" value="#attributes.threadid#" />
<tr>
	<th class="smallheader" width="50%">Move thread to another forum:</th>
	<td width="50%">
	<cfif categorylist.recordcount GT 0>		
		<select name="newcategory">
		<cfloop query="categorylist">
			<option value="#categorylist.categoryid#">#categorylist.categoryname#</option>
		</cfloop>
		</select>
	<cfelse>
		There are no other forums
	</cfif>
	</td>
</tr>
<tr>
	<td colspan="2" align="center"><br /><br />
	<cfif categorylist.recordcount GT 0>
	<input type="submit" name="move" id="move" value="Move Thread" />
	</cfif>
	</td>
</tr>
</form>
</table>
</cfoutput>

<cfsilent>
<!--- 
$Log: dsp_movethread.cfm,v $
Revision 1.1  2007/06/15 13:59:14  kevin
Add Admin Modules

Revision 1.3  2005/05/25 14:09:42  andrew
XHTML Validation chages including removing encoding="UTF-16" to prevent double spacing

Revision 1.2  2005/05/03 12:57:19  kevin
Change XFA scope

Revision 1.1  2005/03/09 13:51:29  mike
Moved to create MVC version

Revision 1.5  2005/02/24 13:57:39  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.4  2005/02/10 15:22:38  mike
changes for XHTML compliance, improve fusedoc, etc.

Revision 1.3  2005/02/08 17:19:13  mike
index.cfm => #request.self#, etc.

Revision 1.2  2005/02/08 14:50:36  mike
remove useless onfocus= clause

Revision 1.1  2005/02/04 19:56:50  mike
FB3 version made from wireframe with fusebuilder, with contents pasted from FB2 version, fbx_switch fully commented, and XFA usage improved throughout
---> 
</cfsilent>