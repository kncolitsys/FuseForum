<cfsetting enablecfoutputonly="Yes">
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="dsp_page.cfm">
	<responsibilities>
		I display the page.
	</responsibilities>

	<properties>
		<history author="Kevin Roche" email="kevin@objectiveinternet.com" 
				 date="date="10-May-2005"" role="Architect" type="Create" />
		<property name="copyright" value="(c)2004 Objective Internet Limited." />
		<property name="licence" value="Licensed under the Apache License, Version 2.0  See licence.txt" />
		<property name="version" value="$Revision: 1.3 $" />
		<property name="lastupdated" value="$Date: 2007/06/14 16:38:35 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<string name="page.template" scope="request"/>
		</in>
		<out>
			
		</out>
	</io>
</fusedoc>
--->
<cfif isDefined("attributes.suppressLayout") OR isDefined("attributes.popupLayout")>
	<cfparam name="request.page.template" default="lay_empty.cfm" />
<cfelse>
	<cfparam name="request.page.stylesheet" default="" />
	<cfparam name="request.page.template" default="lay_story.cfm" />
</cfif>

<cfinclude template="lay_XHTMLHeader.cfm">
<cfif NOT isDefined("attributes.suppressLayout") AND NOT isDefined("attributes.popupLayout")>
	<cfinclude template="lay_PageHeader.cfm" />
</cfif>

<cfinclude template="#request.page.template#" />

<cfif NOT isDefined("attributes.suppressLayout") AND NOT isDefined("attributes.popupLayout")>
	<cfinclude template="lay_PageFooter.cfm" />
</cfif>
<cfinclude template="lay_XHTMLFooter.cfm" />

<!--- 
$Log: dsp_page.cfm,v $
Revision 1.3  2007/06/14 16:38:35  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:47  kevin
Initial Open Source Version

Revision 1.1  2005/05/10 12:30:30  kevin
Initial File

Revision 1.8  2004/11/23 13:23:01  kevin
Support for Admin Menu

Revision 1.7  2004/11/08 15:25:26  kevin
Add whitespace control

Revision 1.6  2004/11/04 16:05:21  mike
remove include of css/layout.css

Revision 1.5  2004/11/04 09:58:51  mike
bug fix: equest => request

Revision 1.4  2004/10/27 09:00:32  kevin
Add header stylesheet

Revision 1.3  2004/10/23 13:37:49  kevin
Add Supresslayout and popup

Revision 1.2  2004/10/21 15:22:57  kevin
add page header and footer

Revision 1.1  2004/10/20 14:32:20  mike
initial version

--->
<cfsetting enablecfoutputonly="No">
