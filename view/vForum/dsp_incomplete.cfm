<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="dsp_incomplete.cfm">
	<responsibilities>
		I display a dummy page when the fusaction has not yet been defined.
	</responsibilities>
	<properties>
		<history 
			author="Mike Oakes"
			email="mike@objectiveinternet.com"
			date="01-Nov-2004"
			role="architect"
			type="create" />
		<property name="copyright" value="(c)2004 Objective Internet Limited."/>
		<property name="licence" value="Licensed under the Apache License, Version 2.0  See licence.txt" />
		<property name="version" value="1.00" />
	</properties>
	<io>
		<in>
			<string name="page.subtitle" scope="request" />
			<string name="fuseaction" scope="fusebox" />
		</in>
		<out>
		</out>
	</io>
</fusedoc>
--->
</cfsilent>

<cfoutput>
	<h3>#request.page.subtitle#</h3>
	<h4>#Evaluate(pagecontent)#</h4>
</cfoutput>

<cfsilent>
<!--- 
$Log: dsp_incomplete.cfm,v $
Revision 1.4  2007/06/14 16:52:19  kevin
Remove specific comments

Revision 1.3  2007/06/14 16:38:35  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:47  kevin
Initial Open Source Version

Revision 1.1  2005/05/05 12:15:08  mike
Initial FB4 Version

Revision 1.1  2004/11/02 16:48:32  mike
initial version
 --->
</cfsilent>
