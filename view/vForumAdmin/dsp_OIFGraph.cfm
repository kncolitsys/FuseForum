<!--- -->
<?xml version="1.0"?>
<fusedoc fuse="dsp_OIFGraph.cfm">
	<responsibilities>
		I display an element of a report in graphical form
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
			<string name="type" scope="attributes" />
			<string name="key" scope="attributes" />
			<string name="subtitles" scope="attributes" />
			<string name="graphname" scope="attributes" />
			<string name="totalname" scope="attributes" />
			<number name="total" scope="attributes" />
			<number name="rows" scope="attributes" />
			<string name="subnames" scope="attributes" />
			<number name="subvalues" scope="attributes" />
			<string name="backgroundcolour" scope="attributes" />
			<string name="totalcolour" scope="attributes" />
			<string name="subcolours" scope="attributes" />
		</in>
		<out>
		</out>
	</io>
</fusedoc>
--->

<cfparam name="attributes.type" default="separate">
<cfparam name="attributes.key" default="yes">
<cfparam name="attributes.subtitles" default="no">
<cfparam name="attributes.graphname" default="">
<cfparam name="attributes.totalname" default="Total">
<cfparam name="attributes.total" default="1">
<cfparam name="attributes.rows" default="1">
<cfparam name="attributes.subnames" default="">
<cfparam name="attributes.subvalues" default="1">
<cfparam name="attributes.backgroundcolour" default="white">
<cfparam name="attributes.totalcolour" default="silver">
<cfparam name="attributes.subcolours" default="red,blue">

<cfoutput>
<table border="1" bgcolor="#attributes.backgroundcolour#" width="350" height="100" cellspacing="0">
<tr>
	<td width="100%" height="100%" align="center">
	<b>#attributes.graphname#</b>
	<cfloop index="i" from="1" to="#attributes.rows#">
		<cfset "pc#i#"=(listgetat(attributes.subvalues,i)/attributes.total)*100>
	</cfloop>
	
	<cfif attributes.type IS "combined">
		<table width="200" height="20" cellpadding="0" cellspacing="0">
		<tr>
			<cfloop index="i" from="1" to="#attributes.rows#">
				<cfset variables.width=evaluate("pc"&i)*2>
				<td width="#variables.width#" bgcolor="#listgetat(attributes.subcolours,i)#" height="100%"></td>
			</cfloop>
		</tr>
		</table>
	<cfelseif attributes.type IS "separate">
		<cfif attributes.subtitles is "yes">
			<cfset tablewidth=300>
		<cfelse>
			<cfset tablewidth=250>
		</cfif>
		<table width="#tablewidth#" height="#evaluate(attributes.rows*20)#" cellpadding="0" cellspacing="0">
		<cfloop index="i" from="1" to="#attributes.rows#">
		<tr>
			<td>
				<table width="100%" height="20" cellpadding="0" cellspacing="0">
				<tr>
					<cfif attributes.subtitles IS "yes">
					<td width="100" align="right">#listgetat(attributes.subnames,i)#&nbsp;&nbsp;</td>
					</cfif>
					<cfset variables.width=evaluate("pc"&i)*2>
					<cfset variables.percent=evaluate("pc"&i)>
					<cfset variables.percent=NumberFormat(variables.percent,"99.99")>
					<td width="#variables.width#" bgcolor="#listgetat(attributes.subcolours,i)#" height="100%"></td>
					<td width="#evaluate(200-variables.width)#" bgcolor="#attributes.totalcolour#">&nbsp;#variables.percent#%</td>
				</tr>
				</table>
			</td>
		</tr>
		</cfloop>
	
		</table>
	</cfif>
	<cfif attributes.key IS "yes">
		<table>
		<cfloop index="i" from="1" to="#attributes.rows#">
		<tr>
			<td width="10" bgcolor="#listgetat(attributes.subcolours,i)#"></td>
			<cfset variables.percent=evaluate("pc"&i)>
			<cfset variables.percent=NumberFormat(variables.percent,"99.99")>
			<td>#listgetat(attributes.subnames,i)#</td><td> - #variables.percent#%</td>
		</tr>
		</cfloop>	
		<tr>
			<td width="10" bgcolor="#attributes.totalcolour#"></td>
			<td>#attributes.totalname#</td><td></td>
		</tr>		
		</table>
	</cfif>
	</td>
</tr>
</table>
</cfoutput>

<!--- 
$Log: dsp_OIFGraph.cfm,v $
Revision 1.1  2007/06/15 13:59:14  kevin
Add Admin Modules

Revision 1.2  2005/05/25 14:08:42  andrew
XHTML Validation chages including removing encoding="UTF-16" to prevent double spacing

Revision 1.1  2005/03/09 13:51:29  mike
Moved to create MVC version

Revision 1.4  2005/02/10 14:44:35  mike
print percentages to only 2 decimal places, etc.

Revision 1.3  2005/02/10 13:28:14  mike
removed the <cfsetting> tags - ESSENTIAL

Revision 1.2  2005/02/07 12:04:14  mike
improve fusedoc and <cfparam>s

Revision 1.1  2005/02/07 11:35:39  mike
initial version as per FB2 file act_OIFGraph.cfm
---> 