<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="act_updatecategory.cfm">
	<responsibilities>
		I update the SiteCategories table
	</responsibilities>
	<properties>
		<history author="Mike Oakes" email="mike@objectiveinternet.com" date="29-Apr-2005" role="Architect" type="Create" />
		<property name="copyright" value="(c)2005 Objective Internet Limited." />
		<property name="licence" value="See licence.txt" />
		<property name="version" value="$Revision: 1.1 $" />
		<property name="lastupdated" value="$Date: 2007/06/15 13:59:05 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<string name="forumDSN" scope="request" />
			<number name="categoryid" scope="attributes" />
			<boolean name="Selected_#SiteId#" scope="attributes" optional="Yes" />
			<number name="Sequence_#SiteId#" scope="attributes" optional="Yes" />
			<recordset name="qSites" scope="variables" format="CFML">
				<number name="SiteId" />
				<string name="SiteName" />
				<string name="SiteURL" />
			</recordset>
			<recordset name="qSiteCategories" scope="variables" format="CFML">
				<number name="SiteCategoriesId" />
				<number name="SiteId" />
				<number name="CategoryId" />
				<number name="Sequence" />
				<string name="categoryname" />
			</recordset>
		</in>
		<out>
		</out>
	</io>
</fusedoc>
--->

<!--- Update the SiteCategories table --->
<cfloop query="qSites">
	<cfset variables.isSelected="False"><!--- default --->
	<cfset variables.selector="Selected_#qSites.SiteId#">
	<cfif ListFindNoCase(attributes.fieldnames,variables.selector)>
		<cfset variables.isSelected=Evaluate("attributes.Selected_#qSites.SiteId#")>
		<cfif variables.isSelected><!--- will always be true in fact --->
			<cfset variables.newSequence=Evaluate("attributes.Sequence_#qSites.SiteId#")>
		</cfif>
	</cfif>
	<cfquery name="qSiteCategory" dbtype="query">
		SELECT	SiteCategoriesId,
				CategoryId,
				Sequence
		FROM	qSiteCategories
		WHERE	SiteId = #qSites.SiteId#
			AND	CategoryId = #attributes.categoryid#
	</cfquery>
	<cfif qSiteCategory.recordcount><!--- so it was on this site --->
		<!--- Is it still to be on this site? --->
		<cfif variables.isSelected>
			<!--- Is its sequence position being changed? --->
			<cfif variables.newSequence NEQ qSiteCategory.Sequence>
				<cfif variables.newSequence LT qSiteCategory.Sequence><!--- so being shifted down --->
					<cfset variables.newSequence=variables.newSequence+1><!--- the value it will have in the database --->
				</cfif>
				
				<cfinvoke component="#Application.ao__AppObj_mForumAdmin_ForumAdmin_Facade#"
					method="fDeleteAndShuffle"
					SiteCategoriesId="#qSiteCategory.SiteCategoriesId#"
					SiteId="#qSites.SiteId#"
					Sequence="#qSiteCategory.Sequence#"
					returnvariable="variables.temp">
				
				<cfinvoke component="#Application.ao__AppObj_mForumAdmin_ForumAdmin_Facade#"
					method="fShuffleAndInsert"
					CategoryId="#attributes.categoryid#"
					SiteId="#qSites.SiteId#"
					Sequence="#variables.newSequence#"
					returnvariable="variables.temp">
			</cfif>
		<cfelse>
			
			<cfinvoke component="#Application.ao__AppObj_mForumAdmin_ForumAdmin_Facade#"
				method="fDeleteAndShuffle"
				SiteCategoriesId="#qSiteCategory.SiteCategoriesId#"
				SiteId="#qSites.SiteId#"
				Sequence="#qSiteCategory.Sequence#"
				returnvariable="variables.temp">
		</cfif>
	<cfelse><!--- so it wasn't on this site --->
		<!--- Is it to be on this site? --->
		<cfif variables.isSelected>
			<cfset variables.newSequence=variables.newSequence+1><!--- the value it will have in the database --->
			
			<cfinvoke component="#Application.ao__AppObj_mForumAdmin_ForumAdmin_Facade#"
				method="fShuffleAndInsert"
				CategoryId="#attributes.categoryid#"
				SiteId="#qSites.SiteId#"
				Sequence="#variables.newSequence#"
				returnvariable="variables.temp">
		</cfif>
	</cfif>
</cfloop>

<!--- 
$Log: act_updatesitecategories.cfm,v $
Revision 1.1  2007/06/15 13:59:05  kevin
Add Admin Modules

Revision 1.9  2006/08/11 12:52:27  mike
change cfc objects from Server to Application scope

Revision 1.8  2006/08/01 10:56:50  mike
correct the naming convention for the ForumAdmin_Facade.cfc object

Revision 1.7  2006/07/31 15:43:24  kevin
Remove old SQL

Revision 1.6  2006/06/23 17:19:56  mike
new naming convention for cfc objects

Revision 1.5  2005/09/05 15:47:31  kevin
Change DSN for forums.

Revision 1.4  2005/05/21 15:26:34  mike
correct path for ForumAdmin_Facade

Revision 1.3  2005/05/20 12:33:38  kevin
New server cfc naming convention

Revision 1.2  2005/04/29 13:14:39  mike
recode to call methods in ForumAdmin_Facade.cfc

Revision 1.1  2005/04/29 12:32:40  mike
new file
--->
</cfsilent>
