<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="qry_allowattachments.cfm">
	<responsibilities>
		I find whether attachments are allowed for this forum
	</responsibilities>
	<properties>
		<history author="Mike Oakes" email="mike@objectiveinternet.com" date="01-Nov-2004" role="Architect" type="Create" />
		<property name="copyright" value="(c)2004 Objective Internet Limited." />
		<property name="licence" value="Licensed under the Apache License, Version 2.0  See licence.txt" />
		<property name="version" value="$Revision: 1.4 $" />
		<property name="lastupdated" value="$Date: 2007/06/14 16:52:21 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<number name="categoryid" scope="attributes" optional="Yes" comments="Either categoryid or threadid is required."/>
			<number name="threadid" scope="attributes" optional="Yes" comments="Either categoryid or threadid is required."/>
		</in>
		<out>
			<number name="categoryid" scope="attributes" />
			<recordset name="allowattachments" scope="variables" format="CFML">
				<string name="categoryname"/>
				<boolean name="allowattachments"/>
			</recordset>
			<boolean name="allowattachments" scope="attributes" />
		</out>
	</io>
</fusedoc>
--->

<cfif NOT isdefined("attributes.categoryid")>
	<cfset variables.categoryid=0><!--- default --->
	<cfif isdefined("attributes.threadid")>
		<!--- find the thread's category --->
		<cfinvoke component="#Application.ao__AppObj_mForum_threads_Gateway#"
			method="fCategory"
			threadid="#attributes.threadid#"
			returnvariable="qCategory">
		<cfif qCategory.recordcount>
			<cfset variables.categoryid=qCategory.categoryid>
		</cfif>
	</cfif>
	<cfset attributes.categoryid=variables.categoryid>
</cfif>

<!--- Check if we should allow attachments --->
<cfinvoke component="#Application.ao__AppObj_mForum_categories_Gateway#"
	method="findSelected"
	categoryid="#attributes.categoryid#"
	returnvariable="allowattachments">
<cfset attributes.allowattachments="false"><!--- default --->
<cfif allowattachments.recordcount>
	<cfset attributes.allowattachments="true">
</cfif>

<!--- 
$Log: qry_allowattachments.cfm,v $
Revision 1.4  2007/06/14 16:52:21  kevin
Remove specific comments

Revision 1.3  2007/06/14 16:38:34  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:11  kevin
Initial Open Source Version

Revision 1.13  2006/08/11 12:50:07  mike
change cfc objects from Server to Application scope

Revision 1.12  2006/07/24 13:14:33  kevin
Remove unwanted SQL

Revision 1.11  2006/06/23 17:43:42  mike
new naming convention for cfc objects

Revision 1.10  2005/12/02 17:27:48  mike
DSN => ForumDSN

Revision 1.9  2005/05/27 12:46:02  mike
always set attributes.allowattachments to a boolean value

Revision 1.8  2005/05/23 08:53:02  mike
set attributes.categoryid

Revision 1.7  2005/05/20 12:40:56  kevin
New server cfc naming convention

Revision 1.6  2005/05/13 16:41:08  mike
DON'Tset attributes.categoryid if it is not already set

Revision 1.5  2005/05/13 16:19:50  mike
query returns categoryname too

Revision 1.4  2005/05/06 13:24:09  mike
simplify, by setting attributes.categoryid first

Revision 1.3  2005/05/06 13:04:58  mike
improve fusedoc

Revision 1.2  2005/05/06 12:48:32  mike
recode to call methods in Forum_Facade.cfc, etc.

Revision 1.1  2005/05/05 12:29:26  mike
Initial FB4 Version

Revision 1.4  2004/11/07 14:32:17  mike
remove special treatment of attributes.cat

Revision 1.3  2004/11/04 18:51:05  mike
small edits

Revision 1.2  2004/11/02 15:17:45  mike
added fusedoc, etc.
--->
</cfsilent>
