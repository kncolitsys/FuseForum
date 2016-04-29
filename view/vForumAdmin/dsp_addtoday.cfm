<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="dsp_addtoday.cfm">
	<responsibilities>
		I display a form allowing a new Today notice to be added
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
		</in>
		<out>
			<string name="fuseaction" scope="formOrUrl" />
			<string name="posttitle" scope="formOrUrl" />
			<string name="post" scope="attributes" />
			<datetime name="postdate" scope="attributes" />
			<datetime name="dateexpires" scope="attributes" />
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
//	 onkeyup="checkchange('todayform','post',400,true)"

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

<cfform name="todayform" action="#request.self#" method="post">
<input type="hidden" name="fuseaction" id="fuseaction" value="#XFA.Save#" />
<table align="center" border="0" width="85%" class="style1">
<tr>
	<th colspan="2" align="center" class="headingtext">N O T I C E S<br /><br /></th>
</tr>	
<tr>
	<th class="smallheader" width="50%">Title:</th>
	<td width="50%"><cfinput type="text" name="posttitle" value="" maxlength="50" required="Yes" message="Please enter a title"></td>
</tr>	
<tr>
	<th class="smallheader">Text:</th>
	<td><textarea name="post" id="post" cols="40" rows="8" onkeyup="checkchange('todayform','post',400,true)"></textarea></td>
</tr>		
<tr>
	<th class="smallheader" width="50%">Post Date:</th>
	<td width="50%"><cfinput type="text" name="postdate" value="" validate="eurodate" message="Please enter a valid post date (dd/mm/yyyy)"></td>
</tr>	
<tr>
	<th class="smallheader" width="50%">Expiry Date:</th>
	<td width="50%"><cfinput type="text" name="dateexpires" value="" validate="eurodate" message="Please enter a valid expiry date (dd/mm/yyyy)"></td>
</tr>	
<tr>
	<td colspan="2" align="center">
		<input type="submit" name="Add" id="Add" value="Add entry" />
	</td>
</tr>
</table>	
</cfform>	
</cfoutput>			

<cfsilent>
<!--- 
$Log: dsp_addtoday.cfm,v $
Revision 1.1  2007/06/15 13:59:14  kevin
Add Admin Modules

Revision 1.4  2005/06/03 15:06:17  mike
convert file back from incorrect 16-bit double-spaced format

Revision 1.2  2005/05/03 12:57:19  kevin
Change XFA scope

Revision 1.1  2005/03/09 13:51:26  mike
Moved to create MVC version

Revision 1.6  2005/02/24 13:57:29  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.5  2005/02/10 10:49:47  mike
use format dd/mm/yyyy

Revision 1.4  2005/02/10 10:29:29  mike
changes for XHTML compliance, improve fusedoc, etc.

Revision 1.3  2005/02/08 17:10:01  mike
index.cfm => #request.self#

Revision 1.2  2005/02/08 14:50:34  mike
remove useless onfocus= clause

Revision 1.1  2005/02/07 15:51:24  mike
new file, split off from dsp_today.cfm
--->
</cfsilent>
