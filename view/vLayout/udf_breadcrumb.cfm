<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="$RCSfile: udf_breadcrumb.cfm,v $" language="ColdFusion" specification="2.0">
	<responsibilities>
		I create the data structure for the breadcrumb display.
	</responsibilities>
	<properties>
		<history author="Kevin Roche" email="kevin@objectiveinternet.com" type="Create" date="27/May/2005" role="FuseCoder"/>
		<property name="copyright" value="(c)2005 Objective Internet Limited." />
		<property name="licence" value="Licensed under the Apache License, Version 2.0  See licence.txt" />
		<property name="version" value="$Revision: 1.3 $" />
		<property name="lastupdated" value="$Date: 2007/06/14 16:38:35 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			
		</in>
		<out>
			
		</out>
	</io>
</fusedoc>
 --->
<cfscript>
	function addBreadcrumb(Title,URL)
		{
		if (NOT isDefined("variables.aBreadcrumb"))
			variables.aBreadcrumb = arrayNew(1);
		stTemp = StructNew();
		stTemp.Title = Title;
		stTemp.URL = URL;
		ArrayAppend(variables.aBreadcrumb,stTemp);
		return variables.aBreadcrumb;
		}
</cfscript>
<!--- 
$Log: udf_breadcrumb.cfm,v $
Revision 1.3  2007/06/14 16:38:35  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:47  kevin
Initial Open Source Version

Revision 1.1  2005/05/27 14:25:51  kevin
Fix Breadcrum ordering bug

 --->
</cfsilent>
