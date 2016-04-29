<cfsetting enablecfoutputonly="Yes">
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="lay_empty.cfm">
	<responsibilities>
		I create an empty page layout.
	</responsibilities>

	<properties>
		<history author="Kevin Roche"
				 email="kevin@objectiveinternet.com"
				 date="10-May-2005"
				 role="Architect"
				 type="Create" />
		<property name="copyright" value="(c)2005 Objective Internet Limited." />
		<property name="licence" value="Licensed under the Apache License, Version 2.0  See licence.txt" />
		<property name="version" value="$Revision: 1.4 $" />
		<property name="lastupdated" value="$Date: 2007/06/15 14:00:08 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<string name="page.LHColumn" scope="request"/>
			<string name="page.Col1" scope="request"/>
			<string name="page.Col2" scope="request"/>
		</in>
		<out>
		</out>
	</io>
</fusedoc>
--->
<cfif isDefined("request.page.LHColumn") AND len(request.page.LHColumn NEQ 0)><cfoutput>
<div id="leftnav">
	<div class="floatbox_now">
		<div class="clearfix_now ktcssmenu menu"> 
			<div class="ktvertical">
			#request.page.LHColumn#
			</div><!-- End ktvertical -->
			<div class="bottom_shadow"></div>
		</div> <!-- End clearfix_now ktcssmenu menu -->
	</div><!-- End floatbox_now -->
	<div id="under_leftnav"></div>
</div><!-- End leftnav -->
</cfoutput></cfif>
<div id="content_wrapper">
	<!-- BEGIN HEIGHT CONTROL -->
	<div id="height_control">
		<img src="furniture/shim.gif" width="10" height="222" alt="" border="0" />
		<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
		<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
	</div>
	<!-- ENDS HEIGHT CONTROL -->
	<!-- BEGIN MAIN CONTENT -->
	<div id="content">
		<cfoutput>#request.page.content#</cfoutput>
	</div>
	<!-- END MAIN CONTENT -->
</div>
<!--- 
$Log: lay_home.cfm,v $
Revision 1.4  2007/06/15 14:00:08  kevin
Add Admin Modules

Revision 1.3  2007/06/14 16:38:35  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:47  kevin
Initial Open Source Version

Revision 1.3  2005/05/21 11:29:43  kevin
Move various elements to separate fuses

Revision 1.2  2005/05/13 16:57:03  kevin
Initial implementation for Home

Revision 1.1  2005/05/10 12:30:30  kevin
Initial File

--->
<cfsetting enablecfoutputonly="No">
