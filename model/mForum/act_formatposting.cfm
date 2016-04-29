<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="$RCSfile: act_formatposting.cfm,v $" language="ColdFusion 5" version="2.0">
	<responsibilities>
		I reformat the message so that it is suitable for posting to the forum.
	</responsibilities>
	<properties>
		<history author="Kevin Roche" email="kevin@objectiveinternet.com" date="13-Oct-2004" role="Architect" type="Create" />
		<property name="copyright" value="(c)2004 Objective Internet Limited." />
		<property name="licence" value="Licensed under the Apache License, Version 2.0  See licence.txt" />
		<property name="version" value="$Revision: 1.4 $" />
		<property name="lastupdated" value="$Date: 2007/06/14 16:52:21 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<string name="message" scope="attributes" />
		</in>
		<out>
			<string name="message" scope="attributes" />
		</out>
	</io>
</fusedoc>
--->

<!--- Strip any HTML tags from message --->
<cfmodule template="../../tags/formatinput/formatinput.cfm"
	input="#attributes.message#"
	r_output="attributes.message"
	function="in"
	replacetags="true">

<!--- NB the following added 9Nov05 --->
<!--- Check that message doesn't have any VERY long substrings (which can corrupt page layouts) --->
<cfmodule template="../../tags/splitmessage/splitmessage.cfm"
	message="#attributes.message#"
	maxwordlen="80"
	r_output="attributes.message">

<!---
$Log: act_formatposting.cfm,v $
Revision 1.4  2007/06/14 16:52:21  kevin
Remove specific comments

Revision 1.3  2007/06/14 16:38:34  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:10  kevin
Initial Open Source Version

Revision 1.2  2005/11/09 18:04:29  mike
call splitmessage custom tag

Revision 1.1  2005/05/05 12:29:24  mike
Initial FB4 Version

Revision 1.1  2004/11/09 13:33:34  kevin
Break out post new thread process into separate fuses.
 --->
</cfsilent>
