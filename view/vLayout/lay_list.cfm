<cfsilent>
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
			<string name="page.breadcrumb" scope="request"/>
			<string name="page.pageContent" scope="request"/>
			<string name="page.RHColumn" scope="request"/>
		</in>
		<out>
		</out>
	</io>
</fusedoc>
--->
</cfsilent>
<cfoutput>
<cfif isDefined("request.page.LHColumn") AND len(request.page.LHColumn NEQ 0)>
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
</cfif>
<div id="content_wrapper">
	<!-- BEGIN HEIGHT CONTROL -->
	<div id="height_control">
		<img src="furniture/shim.gif" width="10" height="222" alt="" border="0" />
		<br />
	</div>
	<!-- ENDS HEIGHT CONTROL -->
	<!-- BEGIN MAIN CONTENT -->
	<div id="content">
		<cfif isDefined("request.page.breadcrumb") AND len(request.page.breadcrumb NEQ 0)>#request.page.breadcrumb#<br /></cfif>
		<div id="content_col_main">
		<cfif isDefined("request.page.content") AND len(request.page.content NEQ 0)>#request.page.content#</cfif>
		</div><!-- Closes content_col_main -->
		<div id="content_col_rel">
		<cfif isDefined("request.page.RHColumn") AND len(request.page.RHColumn NEQ 0)>#request.page.RHColumn#</cfif>
		</div><!-- Closes content_col_rel -->
	</div><!-- Closes content -->
	<!-- END MAIN CONTENT -->
	<!-- BEGIN HEIGHT CONTROL -->
	<div id="height_control">
		<img src="furniture/shim.gif" width="1" height="222" alt="" border="0" />
		<br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
		<br /><br /><br /><br /><br /><br /><br /><br /><br />
	</div>
	<!-- ENDS HEIGHT CONTROL -->
</div><!-- Closes content_wrapper -->
</cfoutput>
<cfsilent>
<!--- 
$Log: lay_list.cfm,v $
Revision 1.4  2007/06/15 14:00:08  kevin
Add Admin Modules

Revision 1.3  2007/06/14 16:38:35  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:47  kevin
Initial Open Source Version

Revision 1.8  2005/06/24 11:07:23  kevin
improve height control

Revision 1.7  2005/05/21 11:29:43  kevin
Move various elements to separate fuses

Revision 1.6  2005/05/20 19:03:29  kevin
Add break at end of breadcrumb

Revision 1.5  2005/05/20 11:07:17  kevin
add cfsilent

Revision 1.4  2005/05/19 09:10:09  kevin
Move content_col_rel to layout

Revision 1.3  2005/05/16 12:08:19  kevin
add comment to div tags

Revision 1.2  2005/05/13 16:57:16  kevin
Initial implementation for Major

Revision 1.1  2005/05/10 12:30:30  kevin
Initial File

--->
</cfsilent>
