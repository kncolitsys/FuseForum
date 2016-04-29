<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="act_sendmoderatoremail.cfm">
	<responsibilities>
		I send an email to the forum moderator
	</responsibilities>
	<properties>
		<history author="Mike Oakes" email="mike@objectiveinternet.com" date="01-Nov-2004" role="Architect" type="Create" />
		<property name="copyright" value="(c)2004 Objective Internet Limited." />
		<property name="licence" value="Licensed under the Apache License, Version 2.0  See licence.txt" />
		<property name="version" value="$Revision: 1.5 $" />
		<property name="lastupdated" value="$Date: 2007/06/14 16:52:21 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<number name="userid" scope="request" />
			<number name="threadid" scope="attributes" />
		</in>
		<out>
		</out>
	</io>
</fusedoc>
--->

<cfinvoke component="#Application.ao__AppObj_mForum_users_Gateway#"
	method="findSelected"
	userid="#request.userid#"
	returnvariable="userdetails">

	<cfset attributes.userEmailAddress = userdetails.emailAddress>

<!--- get email address of moderators --->
<cfinvoke component="#Application.ao__AppObj_mForumFacade_Forum_Facade#"
	method="fForumModerators"
	categoryid="#threaddetails.categoryid#"
	returnvariable="getapproved">

<cfif Len(attributes.userEmailAddress)><!--- else <cfmail> will abort --->
	<cfif getapproved.recordcount><!--- so there are moderators --->
		<cfloop query="getapproved">
		<cfset AdminEmailAddress = emailAddress>
		
		<cfmail to="#variables.AdminEmailAddress#"
			from="#attributes.userEmailAddress#"
			subject="Thread report">
	
	<cfmailparam name="Reply-To" value="#attributes.userEmailAddress#">
	User #Trim(userdetails.username)#	has reported the thread titled "#threaddetails.threadname#" in category "#threaddetails.categoryname#".
	Please check this thread and take any appropriate action.
	
	User's Comments:
	#attributes.complaint#
	</cfmail>
	
		</cfloop>
	
	<cfelse><!--- No admins, so use default --->
	
		<cfmail to="#request.adminEmail#"
			from="#attributes.userEmailAddress#"
			subject="Thread report">
	
	<cfmailparam name="Reply-To" value="#attributes.userEmailAddress#">
	User #Trim(userdetails.username)# has reported the thread titled "#threaddetails.threadname#" in category "#threaddetails.categoryname#".
	Please check this thread and take any appropriate action.
	
	User's Comments:
	#attributes.complaint#
	</cfmail>
	
	</cfif>
</cfif>

<!--- 
$Log: act_sendmoderatoremail.cfm,v $
Revision 1.5  2007/06/14 16:52:21  kevin
Remove specific comments

Revision 1.4  2007/06/14 16:38:33  kevin
Copyright statement

Revision 1.3  2007/06/14 15:07:14  kevin
single email address

Revision 1.2  2007/06/14 14:01:10  kevin
Initial Open Source Version

Revision 1.10  2006/08/11 12:50:07  mike
change cfc objects from Server to Application scope

Revision 1.9  2006/07/24 13:14:33  kevin
Remove unwanted SQL

Revision 1.8  2006/06/23 17:43:42  mike
new naming convention for cfc objects

Revision 1.7  2005/12/02 17:27:48  mike
DSN => ForumDSN

Revision 1.6  2005/05/24 13:29:20  mike
small edits

Revision 1.5  2005/05/21 10:17:52  mike
correct path for Forum_Facade.cfc

Revision 1.4  2005/05/20 12:40:56  kevin
New server cfc naming convention

Revision 1.3  2005/05/13 13:59:39  mike
split off some code into new file qry_threaddetails.cfm

Revision 1.2  2005/05/06 09:25:08  mike
recode to call methods in Forum_Facade.cfc etc.; improve fusedoc

Revision 1.1  2005/05/05 12:29:25  mike
Initial FB4 Version

Revision 1.5  2005/04/25 12:57:21  mike
bug fix: csimplified/improved the getapproved query, so it can't return no email address

Revision 1.4  2004/11/07 14:32:53  mike
small edits

Revision 1.3  2004/11/03 18:08:09  mike
Lass check of en(attributes.userEmailAddress) to stop errors, etc.

Revision 1.2  2004/11/02 15:33:40  mike
added fusedoc, etc.
--->
</cfsilent>
