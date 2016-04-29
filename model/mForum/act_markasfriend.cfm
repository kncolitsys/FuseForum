<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="act_markasfriend.cfm">
	<responsibilities>
		I [un]mark the given person as a friend
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
			<number name="userid" scope="request" />
			<number name="userid" scope="attributes" />
			<number name="threadid" scope="attributes" />
			<string name="act" scope="attributes" />
		</in>
		<out>
		</out>
	</io>
</fusedoc>
--->

<cfif attributes.act EQ "s">
	<!--- check existing friends --->
	<cfinvoke component="#Application.ao__AppObj_mForum_friends_Gateway#"
		method="findSelected"
		userid="#request.userid#"
		friendid="#attributes.userid#"
		returnvariable="checkexisting">

	<cfif NOT checkexisting.recordcount>
		<!--- add this person as a friend --->
		<cfinvoke component="#Application.ao__AppObj_mForumFacade_Forum_Facade#"
			method="fAddFriend"
			userid="#request.userid#"
			friendid="#attributes.userid#"
			returnvariable="variables.temp">
	</cfif>
<cfelse>
	<!--- remove this friend --->
	<cfset variables.temp=Application.ao__AppObj_mForum_friends_Gateway.deleteSelected(request.userid,attributes.userid)>
</cfif>

<!--- 
$Log: act_markasfriend.cfm,v $
Revision 1.4  2007/06/14 16:52:21  kevin
Remove specific comments

Revision 1.3  2007/06/14 16:38:34  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:10  kevin
Initial Open Source Version

Revision 1.10  2006/08/11 12:50:07  mike
change cfc objects from Server to Application scope

Revision 1.9  2006/07/24 13:14:33  kevin
Remove unwanted SQL

Revision 1.8  2006/06/23 17:43:41  mike
new naming convention for cfc objects

Revision 1.7  2005/12/02 17:27:47  mike
DSN => ForumDSN

Revision 1.6  2005/05/21 10:17:51  mike
correct path for Forum_Facade.cfc

Revision 1.5  2005/05/20 12:40:56  kevin
New server cfc naming convention

Revision 1.4  2005/05/12 11:10:59  mike
bug fix: attributes.friendid => attributes.userid

Revision 1.3  2005/05/09 10:19:31  mike
ForumAdmin_Facade => Forum_Facade

Revision 1.2  2005/05/05 12:54:48  mike
recode to call methods in Forum_Facade.cfc etc.; improve fusedoc

Revision 1.1  2005/05/05 12:29:24  mike
Initial FB4 Version

Revision 1.4  2004/11/17 14:50:13  mike
simplify the remove-friend code

Revision 1.3  2004/11/07 14:33:29  mike
small edits

Revision 1.2  2004/11/02 15:13:24  mike
added fusedoc, etc.

Revision 1.1  2004/10/18 10:11:53  mike
initial version
--->
</cfsilent>

