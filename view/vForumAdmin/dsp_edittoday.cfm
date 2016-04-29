<cfsilent>
<!--- -->
<?xml version="1.0"?>
<fusedoc fuse="dsp_edittoday.cfm">
	<responsibilities>
		I display a form allowing the given Today notice to be edited
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
			<number name="postid" scope="attributes" />
			<recordset name="qThisToday" scope="variables" format="CFML">
				<string name="posttitle" />
				<string name="post" />
				<datetime name="postdate" />
				<datetime name="dateexpires" />
			</recordset>
		</in>
		<out>
			<string name="fuseaction" scope="formOrUrl" />
			<number name="postid" scope="formOrUrl" />
			<string name="posttitle" scope="formOrUrl" />
			<string name="post" scope="formOrUrl" />
			<datetime name="postdate" scope="formOrUrl" />
			<datetime name="dateexpires" scope="formOrUrl" />
		</out>
	</io>
</fusedoc>
--->
</cfsilent>

<cfoutput>	
<!--- <cfinclude template="../../act_checkfieldlength.cfm"> --->
<script language="JavaScript" type="text/javascript">
<!--
// this function is called from a field which needs a maximum length checked.
// attributes - formname - the name of the form
//				field - the form field
// 				themax - int, the allowable length of the field
//				showalert - bool, whether to show an alert when the maximum is exceeded
//
//	 onkeyup="checkchange('resetpasswordform','UserName',2,true)"

function checkchange(formname,thefield,themax,showalert)
  {
	var a = eval('document.' + formname + '.' + thefield);

	if (a.value.length > themax)
	  {
		a.value=a.value.slice(0,themax);
		if(showalert)
		  {
			alert("The maximum field length is "+themax);
		  }
	  }
  }
//-->
</script>

<!---
<cf_formatinput 
	input="#post#"
	r_output="post"
	function="out"
	replacetags="false">
--->
<cfmodule template="/FuseForum/tags/formatinput/formatinput.cfm"
	input="#qThisToday.post#"
	r_output="post"
	function="out"
	replacetags="false">

<cfform name="todayform" action="#request.self#" method="post">
<input type="hidden" name="fuseaction" id="fuseaction" value="#XFA.Save#" />
<input type="hidden" name="postid" id="postid" value="#attributes.postid#" />
<table align="center" border="0" width="85%" class="style1">
	<tr>
		<td colspan="2" align="center" class="headingtext">N O T I C E S<br /><br /></td>
	</tr>	
	<tr>
		<th class="smallheader" width="50%">Title:</th>
		<td width="50%"><cfinput type="text" name="posttitle" value="#qThisToday.posttitle#" maxlength="50" required="Yes" message="Please enter a title"></td>
	</tr>	
	<tr>
		<th class="smallheader">Text:</th>
		<td><textarea name="post" id="post" cols="40" rows="8" onkeyup="checkchange('todayform','post',400,true)">#post#</textarea></td>
	</tr>		
	<tr>
		<th class="smallheader" width="50%">Post Date:</th>
		<td width="50%"><cfinput type="text" name="postdate" value="#dateformat(qThisToday.postdate,'dd/mm/yyyy')#" validate="eurodate" message="Please enter a valid post date (dd/mm/yyyy)"></td>
	</tr>	
	<tr>
		<th class="smallheader" width="50%">Expiry Date:</th>
		<td width="50%"><cfinput type="text" name="dateexpires" value="#dateformat(qThisToday.dateexpires,'dd/mm/yyyy')#" validate="eurodate" message="Please enter a valid expiry date (dd/mm/yyyy)"></td>
	</tr>	
	<tr>
		<td colspan="2" align="center">
			<input type="submit" name="Add" id="Add" value="Save" />
		</td>
	</tr>
</table>	
</cfform>	
</cfoutput>			

<cfsilent>
<!--- 
$Log: dsp_edittoday.cfm,v $
Revision 1.1  2007/06/15 13:59:14  kevin
Add Admin Modules

Revision 1.5  2005/05/25 14:09:10  andrew
XHTML Validation chages including removing encoding="UTF-16" to prevent double spacing

Revision 1.4  2005/05/12 16:56:21  mike
label the button as "Save"

Revision 1.3  2005/05/03 12:57:19  kevin
Change XFA scope

Revision 1.2  2005/03/10 17:33:17  mike
change path to customtags

Revision 1.1  2005/03/09 13:51:28  mike
Moved to create MVC version

Revision 1.6  2005/02/24 13:57:36  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.5  2005/02/10 10:48:46  mike
use format dd/mm/yyyy

Revision 1.4  2005/02/10 10:31:05  mike
changes for XHTML compliance, improve fusedoc, etc.

Revision 1.3  2005/02/08 17:17:51  mike
index.cfm => #request.self#, etc.

Revision 1.2  2005/02/08 14:50:35  mike
remove useless onfocus= clause

Revision 1.1  2005/02/07 15:52:21  mike
new file, split off from dsp_today.cfm
--->
</cfsilent>