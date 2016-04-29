<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="$RCSfile: qry_checkapproval.cfm,v $" language="ColdFusion 5" version="2.0">
	<responsibilities>
		I check if the category or thread needs approval for posting.
	</responsibilities>
	<properties>
		<history author="Kevin Roche" email="kevin@objectiveinternet.com" date="13-Oct-2004" role="Architect" type="Create" />
		<property name="copyright" value="(c)2004 Objective Internet Limited." />
		<property name="licence" value="Licensed under the Apache License, Version 2.0  See licence.txt" />
		<property name="version" value="$Revision: 1.5 $" />
		<property name="lastupdated" value="$Date: 2007/06/14 16:52:21 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<number name="categoryid" scope="attributes" optional="Yes" comments="Either categoryid or threadid is required."/>
			<number name="threadid" scope="attributes" optional="Yes" comments="Either categoryid or threadid is required."/>
		</in>
		<out>
			<recordset name="needapproval" scope="variables" format="CFML">
				<boolean name="approval" comments="True if the message requirs approval"/>
			</recordset>
			<recordset name="getapproved"
					   scope="variables" 
					   format="CFML" 
					   optional="Yes"
					   comments="Email address of the forum admininistrators. Only present when message needs approval">
				<string name="emailaddress"/>
			</recordset>
			<number name="categoryid" scope="variables"/>
		</out>
	</io>
</fusedoc>
--->
<!--- NB it is essential that attributes.category remains undefined by this file if it was undefined on entry! --->
<cfparam name="variables.categoryid" default="0">
<cfif isdefined("attributes.categoryid")>
	<cfset variables.categoryid=attributes.categoryid>
<cfelseif isdefined("attributes.threadid")>
	<!--- find the thread's category --->
	<cfinvoke component="#Application.ao__AppObj_mForum_threads_Gateway#"
		method="fCategory"
		threadid="#attributes.threadid#"
		returnvariable="qCategory">
	<cfif qCategory.recordcount>
		<cfset variables.categoryid=qCategory.categoryid>
	</cfif>
</cfif>

<!--- find out if this category requires its threads to be approved --->
<cfinvoke component="#Application.ao__AppObj_mForum_categories_Gateway#"
	method="findSelected"
	categoryid="#variables.categoryid#"
	returnvariable="needapproval">

<cfif needapproval.approval>
	<!--- get the moderators' email addresses --->
	<cfinvoke component="#Application.ao__AppObj_mForumFacade_Forum_Facade#"
		method="fForumModerators"
		categoryid="#variables.categoryid#"
		returnvariable="getapproved">
</cfif>

<!---
$Log: qry_checkapproval.cfm,v $
Revision 1.5  2007/06/14 16:52:21  kevin
Remove specific comments

Revision 1.4  2007/06/14 16:38:33  kevin
Copyright statement

Revision 1.3  2007/06/14 15:07:14  kevin
single email address

Revision 1.2  2007/06/14 14:01:11  kevin
Initial Open Source Version

Revision 1.9  2006/08/11 12:50:07  mike
change cfc objects from Server to Application scope

Revision 1.8  2006/07/24 13:14:33  kevin
Remove unwanted SQL

Revision 1.7  2006/06/23 17:43:42  mike
new naming convention for cfc objects

Revision 1.6  2005/12/02 17:27:48  mike
DSN => ForumDSN

Revision 1.5  2005/05/21 10:17:52  mike
correct path for Forum_Facade.cfc

Revision 1.4  2005/05/20 12:40:56  kevin
New server cfc naming convention

Revision 1.3  2005/05/13 15:48:24  mike
DON'Tset attributes.categoryid if it is not already set

Revision 1.2  2005/05/06 13:41:31  mike
recode to call methods in Forum_Facade.cfc, etc.

Revision 1.1  2005/05/05 12:29:26  mike
Initial FB4 Version

Revision 1.1  2004/11/09 13:33:34  kevin
Break out post new thread process into separate fuses.
 --->
</cfsilent>
 