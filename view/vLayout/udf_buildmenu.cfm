<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="udf_buildmenu.cfm">
	<responsibilities>
		I build the HTML to display the full menu tree or a selected part of the menu tree.
		
		Syntax for a full menu:
			<cfset newMenuHTML = buildmenu(qTree)> 
		Or for a selected part with hidden stories expaned:
			 <cfset subMenuHTML = buildmenu(qTree,qTree.aTreePosition,True)>
	
	</responsibilities>

	<properties>
		<history author="Kevin Roche" email="kevin@objectiveinternet.com" date="02-May-2005" role="Architect" type="Create" />
		<property name="copyright" value="(c)2005 Objective Internet Limited." />
		<property name="licence" value="Licensed under the Apache License, Version 2.0  See licence.txt" />
		<property name="version" value="$Revision: 1.3 $" />
		<property name="lastupdated" value="$Date: 2007/06/14 16:38:35 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<recordset name="qMenuTree" required="Yes" scope="arguments">
				<string name="ATreePosition" />
				<string name="AParentTtreePosition" />
				<number name="SectionID" precision="Integer" />
				<string name="Section" />
				<number name="StoryTypeID" precision="Integer" />
				<number name="SectionSeq" precision="Integer" />
				<Boolean name="SectionNewWindow" />
				<string name="SectionJumpFuseaction" />
				<number name="SectionJumpStoryTypeId" precision="Integer" />
				<number name="SectionJumpSectionId" precision="Integer" />
				<string name="SectionJumpURL" />
				<string name="SectionListingFuseaction" />
				<string name="SectionDisplayFuseaction" />
				<number name="ParentSectionId" precision="Integer" />
				<number name="IntroStoryId" precision="Integer" />
				<string name="MenuDescription" />
				<string name="SectionType" />
			</recordset>
			<string name="selector" required="No" default="" scope="arguments" comments="selector for the chosen part of the menu. Leaving Blank will cause the complete menu to be generated." />
			<boolean name="useHidden" required="No" default="False" scope="arguments" comments="Indicates that stories below sections shoula always be expanded."/>
		</in>
		<out>
			<string name="menuHTML" comments="HTML for the menu."/>
		</out>
	</io>
</fusedoc>
--->
</cfsilent>
<cffunction name="buildmenu" returntype="string" hint="I build a menu based on the query and starting point provided.">
	<cfargument name="qMenuTree" required="Yes">
	<cfargument name="selector" required="No" default="">
	<cfargument name="useHidden" required="No" default="False">
	<cfset var menuHTML = "">
	<cfset var thisLevel = "">
	<cfset var lastLevel = 0>
	<cfset var target = "">
	<cfset var theFuseaction = "">
	
	<cfif application.applicationname IS "Serendipity">
		<cfloop query="qSites">
			<cfif request.persist.siteId IS qSites.SiteId>
				<cfset request.applicationname = qSites.CFAppName>
			</cfif>
		</cfloop>
	<cfelse>
		<cfset request.applicationname = application.applicationname>
	</cfif>
	
	<!--- Create the menu HTML --->
	<cfsavecontent variable="menuHTML">
	<cfloop query="qMenuTree">
	  <cfif (Len(arguments.selector) EQ 0 OR Left(qMenuTree.aTreePosition,Len(arguments.selector)) EQ arguments.selector)
	    AND (qMenuTree.aTreePosition IS NOT arguments.selector)
		AND (qMenuTree.SectionType IS NOT "Hidden" OR arguments.useHidden)>
		<cfset thisLevel = listLen(qMenuTree.aTreePosition,".") - Listlen(arguments.selector,".")>
		<cfif thisLevel GE 1>
			<cfif thisLevel EQ lastLevel><cfoutput></li></cfoutput>
			<cfelseif thisLevel EQ lastLevel + 1><cfoutput><ul></cfoutput>
			<cfelseif thisLevel LT lastLevel><cfoutput></li><cfloop from="1" to="#val(lastLevel - thisLevel)#" index="j"></ul></li></cfloop></cfoutput>
			
			</cfif>
			<cfif qMenuTree.sectionNewWindow >
				<cfset target="_blank">
			<cfelse>
				<cfset target="_self">
			</cfif>
			
			<cfif qMenuTree.SectionType IS "Special">
				<cfoutput><li><a href="#self#?Fuseaction=#qMenuTree.SectionJumpFuseaction#&amp;StoryTypeId=#qMenuTree.StoryTypeId#&amp;SectionId=#qMenuTree.SectionId#" target="#target#" title="#qMenuTree.Section#">#qMenuTree.Section#</a></cfoutput>
			<cfelseif qMenuTree.SectionType IS "Story" OR qMenuTree.SectionType IS "Hidden">
				<cfoutput><li><a href="#self#?Fuseaction=#qMenuTree.SectionDisplayFuseaction#&amp;StoryTypeId=#qMenuTree.StoryTypeId#&amp;SectionId=#qMenuTree.SectionId#&amp;StoryId=#qMenuTree.IntroStoryId#" target="#target#" title="#qMenuTree.Section#">#qMenuTree.Section#</a></cfoutput>
			<cfelseif qMenuTree.SectionType IS "Publication">
				<cfoutput><li><a href="#self#?Fuseaction=#qMenuTree.SectionListingFuseaction#&amp;StoryTypeId=#qMenuTree.SectionJumpStoryTypeId#" target="#target#" title="#qMenuTree.Section#">#qMenuTree.Section#</a></cfoutput>
			<cfelseif qMenuTree.SectionType IS "URL">
				<cfset URLString = trim(qMenuTree.SectionJumpURL)><!--- Had to do this because of a CF bug --->
				<cfloop query="qSites">
					<cfif FindNoCase(trim(qSites.SiteURL),URLString,1)>
						<cfif URLString CONTAINS "?">
							<cfset URLString = URLString & "&amp;id=#client.cfid#&amp;token=#client.cftoken#&amp;app=#request.applicationname#">
						<cfelse>
							<cfset URLString = URLString & "?id=#client.cfid#&amp;token=#client.cftoken#&amp;app=#request.applicationname#">
						</cfif>
						<cfbreak>
					</cfif>
				</cfloop>
				<cfoutput><li><a href="#URLString#" target="#target#" title="#qMenuTree.Section#">#qMenuTree.Section#</a></cfoutput>
			<cfelse>
				<cfoutput><li><a href="#self#?Fuseaction=#qMenuTree.SectionListingFuseaction#&amp;StoryTypeId=#qMenuTree.StoryTypeId#&amp;SectionId=#qMenuTree.SectionId#" target="#target#" title="#qMenuTree.Section#">#qMenuTree.Section#</a></cfoutput>
			</cfif>
			
			<cfset lastLevel = thisLevel>
		</cfif>
	  </cfif>
	</cfloop>
	
	<cfoutput></li>
	<cfloop from="1" to="#lastLevel#" index="j"></ul></cfloop></cfoutput>
	</cfsavecontent>
	
	<!--- Clean up the generated content --->
	<!--- Remove tabs --->
	<cfset menuHTML = Replace(menuHTML,Chr(9),"","all")>
	<!--- Remove two consecutive spaces --->
	<cfset menuHTML = Replace(menuHTML,"  "," ","all")>
	<!--- Remove spaces when followed by CRLF --->
	<cfset menuHTML = Replace(menuHTML," "&Chr(13)&Chr(10),Chr(13)&Chr(10),"all")>
	<!--- Remove Two consecutive CRLFs --->
	<cfset menuHTML = Replace(menuHTML,Chr(13)&Chr(10)&Chr(13)&Chr(10),Chr(13)&Chr(10),"all")>
	<cfset menuHTML = Replace(menuHTML,Chr(13)&Chr(10)&Chr(13)&Chr(10),Chr(13)&Chr(10),"all")>
	
	<!--- Suround it with <cfoutput></cfoutput> --->
	<cfset menuHTML = Chr(60) & "cfoutput" & Chr(62) & menuHTML & Chr(60) &"/cfoutput" & Chr(62) >

	<cfreturn menuHTML>
	
</cffunction>
<cfsilent>
<!--- 
$Log: udf_buildmenu.cfm,v $
Revision 1.3  2007/06/14 16:38:35  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:47  kevin
Initial Open Source Version

Revision 1.7  2005/07/06 13:02:04  kevin
Add parameters for cross site login

Revision 1.6  2005/07/06 08:27:20  kevin
Remove XFA facility

Revision 1.5  2005/06/09 12:52:59  kevin
Fix bug in menu with stories that are hidden.

Revision 1.4  2005/06/02 09:51:11  mike
bug fix: add output="No"

Revision 1.3  2005/05/27 11:13:16  kevin
Check for valid XFA

Revision 1.2  2005/05/23 15:43:39  kevin
Improve code

Revision 1.1  2005/05/17 11:13:34  kevin
Initial implementation

 --->
</cfsilent>
