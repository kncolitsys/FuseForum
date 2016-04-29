<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="act_emailsubs.cfm">
	<responsibilities>
		I send an email to subscribers to the given thread
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
			<string name="username" scope="request" />
			<string name="subscriptionEmail" scope="request" />
			<string name="forumsname" scope="request" />
			<number name="threadid" scope="attributes" />
			<string name="message" scope="attributes" />
			<recordset name="threaddetails" scope="variables" format="CFML">
				<string name="threadname"/>
				<number name="categoryid"/>
				<string name="categoryname"/>
			</recordset>
		</in>
		<out>
			<string name="userEmailAddress" scope="attributes" comments="?needed" />
		</out>
	</io>
</fusedoc>
--->
</cfsilent>

<cfset getemailfooter=Application.ao__AppObj_mForum_settings_Gateway.findAllEmailmessage()>

<cfinvoke component="#Application.ao__AppObj_mForumFacade_Forum_Facade#"
	method="fThreadSubscribers"
	threadid="#attributes.threadid#"
	returnvariable="qThreadSubscribers">
<cfset variables.lThreadSubscribers = ValueList(qThreadSubscribers.userid)>

<cfloop query="qThreadSubscribers">
	<cfset variables.userEmailAddress = qThreadSubscribers.emailAddress>
	<cfif Len(variables.userEmailAddress)><!--- else <cfmail> will abort --->
<cfmail to="#variables.userEmailAddress#"
		from="#request.subscriptionEmail#"
		subject="#request.forumsname#: update to thread '#threaddetails.threadname#'">

Category: #threaddetails.categoryname#
Thread:	  #threaddetails.threadname#
User Name: #request.username#

Message:
#attributes.message#

You can view the thread at: #request.baseHREF##request.self#?fuseaction=For.showthread&threadid=#attributes.threadid#

Please do not respond to this message.  Post any correspondence in the #request.forumsname#.
<cfif len(getemailfooter.emailmessage)>
-------------
#getemailfooter.emailmessage#
</cfif>
</cfmail>
</cfif>
</cfloop>


<cfinvoke component="#Application.ao__AppObj_mForumFacade_Forum_Facade#"
	method="fForumSubscribers"
	categoryid="#threaddetails.categoryid#"
	lThreadSubscribers="#variables.lThreadSubscribers#"
	returnvariable="qForumSubscribers">

<cfloop query="qForumSubscribers">
	<cfset variables.userEmailAddress = qForumSubscribers.emailAddress>
	
	<cfif Len(variables.userEmailAddress)><!--- else <cfmail> will abort --->
<cfmail to="#variables.userEmailAddress#"
		from="#request.subscriptionEmail#"
		subject="#request.forumsname#: update to thread '#threaddetails.threadname#'">

Category: #threaddetails.categoryname#
Thread:	  #threaddetails.threadname#
User Name: #request.username#

Message:
#attributes.message#

You can view the thread at: #request.baseHREF##request.self#?fuseaction=For.showthread&threadid=#attributes.threadid#

Please do not respond to this message.  Post any correspondence in the #request.forumsname#.
<cfif len(getemailfooter.emailmessage)>
-------------
#getemailfooter.emailmessage#
</cfif>
</cfmail>
</cfif>
</cfloop>

<cfsilent>
<!--- 
$Log: act_emailsubs.cfm,v $
Revision 1.5  2007/06/14 16:52:21  kevin
Remove specific comments

Revision 1.4  2007/06/14 16:38:33  kevin
Copyright statement

Revision 1.3  2007/06/14 15:07:14  kevin
single email address

Revision 1.2  2007/06/14 14:01:10  kevin
Initial Open Source Version

Revision 1.11  2006/08/11 12:50:07  mike
change cfc objects from Server to Application scope

Revision 1.10  2006/07/21 09:53:49  kevin
Trafalgar Conversion, Remove Old SQL.

Revision 1.9  2006/06/23 17:43:41  mike
new naming convention for cfc objects

Revision 1.8  2005/12/02 17:27:47  mike
DSN => ForumDSN

Revision 1.7  2005/05/26 12:20:29  mike
capitalise the circuit name

Revision 1.6  2005/05/24 13:26:27  mike
email forum subscribers too

Revision 1.5  2005/05/21 10:17:51  mike
correct path for Forum_Facade.cfc

Revision 1.4  2005/05/20 12:40:56  kevin
New server cfc naming convention

Revision 1.3  2005/05/09 10:19:20  mike
ForumAdmin_Facade => Forum_Facade

Revision 1.2  2005/05/05 12:51:56  mike
recode to call methods in Forum_Facade.cfc

Revision 1.1  2005/05/05 12:29:24  mike
Initial FB4 Version

Revision 1.5  2004/12/22 14:57:11  mike
replace request.siteURL by request.baseHREF

Revision 1.4  2004/11/15 17:10:51  mike
use #request.siteURL#

Revision 1.3  2004/11/11 13:25:39  mike
change the URL

Revision 1.2  2004/11/03 18:19:29  mike
added fusedoc; check of Len(attributes.userEmailAddress) to stop errors, etc.

Revision 1.1  2004/10/18 10:11:53  mike
initial version

Revision 1.6.6.1  2004/03/03 18:41:51  mike
ensure email addresses are not empty
 --->
</cfsilent>

