<cfsilent>
<!--- -->
<?xml version="1.0"?>
<fusedoc fuse="dsp_censorship.cfm">
	<responsibilities>
		I display a form allowing forbidden words to be added or removed
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
			<recordset name="forbiddenwords" scope="variables" format="CFML">
				<number name="vulgarityid" />
				<string name="vulgarity" />
			</recordset>
		</in>
		<out>
			<string name="fuseaction" scope="formOrUrl" />
			<string name="add" scope="formOrUrl" optional="Yes" />
			<string name="del" scope="formOrUrl" optional="Yes" />
			<string name="vulgarity" scope="formOrUrl" optional="Yes" />
			<number name="delvulgarityid" scope="formOrUrl" optional="Yes" />
		</out>
	</io>
</fusedoc>
--->
</cfsilent>

<cfoutput>	
<table align="center" border="0" width="85%" class="style1">
	<tr>
		<th colspan="2" align="center" class="headingtext">C E N S O R S H I P<br /><br /></th>
	</tr>

	<cfform name="censorshipform" action="#request.self#" method="post">
	<input type="hidden" name="fuseaction" id="fuseaction" value="#XFA.Save#" />
 	<tr>
		<th class="smallheader" width="50%">Add forbidden word:</th>
		<td width="50%"><input type="text" name="vulgarity" id="vulgarity" maxlength="30" /></td>
	</tr>		
	<tr>
		<td></td>
		<td>
			<input type="submit" name="add" id="add" value="Add new word" /><br /><br />
		</td>
	</tr>
	<cfif forbiddenwords.recordcount>
		<tr>
			<th class="smallheader">Existing forbidden words:</th>
			<td>
				<cfselect query="forbiddenwords" 
						  name="delvulgarityid" 
						  value="vulgarityid" 
						  display="vulgarity">
				</cfselect>
			</td>
		</tr>
		<tr>
			<td></td>
			<td>
				<input type="submit" name="del" id="del" value="Remove this word" />
			</td>	
		</tr>
	</cfif>
	</cfform>
</table>
</cfoutput>

<cfsilent>
<!--- 
$Log: dsp_censorship.cfm,v $
Revision 1.1  2007/06/15 13:59:14  kevin
Add Admin Modules

Revision 1.3  2005/05/25 14:09:25  andrew
XHTML Validation chages including removing encoding="UTF-16" to prevent double spacing

Revision 1.2  2005/05/03 12:57:19  kevin
Change XFA scope

Revision 1.1  2005/03/09 13:51:27  mike
Moved to create MVC version

Revision 1.6  2005/02/24 13:57:34  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.5  2005/02/09 11:49:09  mike
changes for XHTML compliance

Revision 1.4  2005/02/08 17:13:34  mike
index.cfm => #request.self#, etc.

Revision 1.3  2005/02/08 14:50:34  mike
remove useless onfocus= clause

Revision 1.2  2005/02/07 18:15:14  mike
improved fusedoc etc.

Revision 1.1  2005/02/04 19:56:49  mike
FB3 version made from wireframe with fusebuilder, with contents pasted from FB2 version, fbx_switch fully commented, and XFA usage improved throughout
---> 
</cfsilent>