<cfsilent>
<!--- -->
<fusedoc fuse="fbx_settings.cfm">
	<responsibilities>
		I set up the environment settings for this circuit. 
		If this settings file is being inherited, then you can use CFSET to override a value 
		set in a parent circuit or CFPARAM to accept a value set by a parent circuit.
	</responsibilities>
	<properties>
		<history 
			author="Mike Oakes" 
			email="mike@objectiveinternet.com" 
			date="13-Oct-2004"
			role="architect"
			type="create"/>
		<property name="copyright" value="(c)2004 Objective Internet Limited."/>
		<property name="licence" value="See licence.txt"/>
		<property name="version" value="1.00"/>
	</properties>
	<io>
		<in>
			<string name="ForumDSN" scope="request" />
			<number name="userid" scope="request" />
			<string name="username" scope="client" optional="Yes" />
		</in>
		<out>
			<string name="fuseaction" scope="formOrUrl" />
			<string name="username" scope="client" />
			<boolean name="userisadmin" scope="client" />
			<boolean name="userismod" scope="client" />
			<boolean name="userisReferee" scope="client" />
			<string name="forumsname" scope="request" />
			<string name="forumspath" scope="request" />
			<string name="forumsurl" scope="request" />
			<string name="adminEmail" scope="request" />
			<string name="subscriptionEmail" scope="request" />
			<number name="attachmentmaxsize" scope="request" />
			<boolean name="censorship" scope="request" />
			<number name="maxnumberofmessages" scope="request" />
			<number name="maxnumberofthreads" scope="request" />
			<string name="threadorder" scope="request" />
			<string name="messageorder" scope="request" />
			<number name="numberofthreads" scope="request" />
			<number name="numberofmessages" scope="request" />
			<string name="username" scope="request" />
			<boolean name="showemail" scope="request" />
			<string name="emailaddress" scope="request" />
		</out>
	</io>
</fusedoc>
--->

<cfset request.page.title = "Forums">
<cfset request.defaultfuseaction="For.home">
<!--- In case no fuseaction was given, I'll set up one to use by default. --->
<cfparam name="attributes.fuseaction" default="#request.defaultfuseaction#">

<cfscript>
	// use non-SS URLs
	URLquery = "?";
	URLequals = "=";
	URLand = "&";
	URLend = "";

	request.forumsname = "FuseForum";
	request.adminEmail = "someone@somewhere.com";
	request.subscriptionEmail = "someone@somewhere.com";
	request.attachmentmaxsize = 10;  //Mb
	request.censorship = 1;
	request.maxnumberofmessages = 150;
	request.maxnumberofthreads = 150;
</cfscript>

</cfsilent>

<cfif request.userid EQ 0><!--- Not logged-in --->
	<cfscript>
		session.userismod = 0;
		session.userisadmin = 0;
		request.username = "";
		request.threadorder = "ASC";
		request.messageorder = "DESC";
		request.numberofmessages = "10";
		request.showemail = 0;
		request.emailaddress = "";
	</cfscript>
<cfelse><!--- Logged In --->
	<!--- 
	TODO: 	The code below should be replaced by somthing that gets the user permissions 
			and preferences from a database or XML file.
	 --->
	<cfscript>
		session.userismod = 1;
		session.userisadmin = 1;
		request.username = "";
		request.threadorder = "ASC";
		request.messageorder = "DESC";
		request.numberofmessages = "10";
		request.showemail = 0;
		request.emailaddress = "";
	</cfscript>
</cfif>

<cfsilent>
<!--- 
$Log: fbx_settings.cfm,v $
Revision 1.3  2007/06/14 16:52:20  kevin
Remove specific comments

Revision 1.2  2007/06/14 14:00:59  kevin
Initial Open Source Version

Revision 1.22  2006/10/05 12:14:17  mike
add AND status='Full' clause

Revision 1.21  2006/09/01 10:40:15  mike
take appropriate action if usersettings is empty query, etc.

Revision 1.20  2006/08/24 14:55:47  mike
don't set client.userisERSCmember if user is not logged in

Revision 1.19  2006/08/15 09:18:46  mike
don't set client.numberofthreads (not needed), etc.

Revision 1.18  2006/08/11 12:50:08  mike
change cfc objects from Server to Application scope

Revision 1.17  2006/08/02 09:11:08  mike
recode using users3; recode using Trafalgar db the test for referee soc.

Revision 1.16  2006/07/26 15:49:22  mike
small edit

Revision 1.15  2006/07/04 09:59:13  mike
remove obsolete UserServices.cfm check

Revision 1.14  2006/06/23 17:46:44  mike
new naming convention for cfc objects

Revision 1.13  2006/06/20 16:12:42  mike
correct capitalization for "moderate" etc.

Revision 1.12  2006/01/12 10:51:37  mike
default message order to Descending By Date

Revision 1.11  2005/12/02 17:24:03  mike
DSN => ForumDSN

Revision 1.10  2005/07/29 17:18:35  mike
max attachment size = 10Mb now

Revision 1.9  2005/06/27 18:10:22  mike
delete commented-out code

Revision 1.8  2005/06/16 18:59:07  mike
set client.userisreferee, etc.

Revision 1.7  2005/05/26 12:21:30  mike
capitalise the circuit name

Revision 1.6  2005/05/25 15:44:47  mike
set request.page.title (instead of request.page.subtitle)

Revision 1.5  2005/05/24 08:38:57  mike
default request.numberofmessages to 10

Revision 1.4  2005/05/20 18:52:37  mike
ongoing edits

Revision 1.3  2005/05/20 15:35:27  mike
comment out the code requiring user to be logged in to see the forums

Revision 1.2  2005/05/17 07:54:32  mike
XFA.redicrect was not defined; send user to login

Revision 1.1  2005/05/05 12:26:10  mike
Initial FB4 Version

Revision 1.18  2004/12/22 14:49:31  mike
alter request.forumsname

Revision 1.17  2004/11/22 11:50:10  mike
added <cfabort>

Revision 1.16  2004/11/17 17:29:20  mike
add #request.baseHREF# to window.location call

Revision 1.15  2004/11/15 17:15:45  mike
removed request.forumsurl

Revision 1.14  2004/11/15 16:23:45  mike
remove request.forumspath

Revision 1.13  2004/11/09 10:17:08  mike
define URLquery etc.

Revision 1.12  2004/11/07 14:34:51  mike
greatly simplified, removed a lot of junk, etc.

Revision 1.11  2004/11/07 10:18:31  mike
improve fusedoc etc.

Revision 1.10  2004/11/04 10:54:49  mike
bug fix: supply missing resultvar param

Revision 1.9  2004/11/04 10:27:23  mike
call UserServices.cfm and CheckUser.cfm by <cfmodule> not customtag

Revision 1.8  2004/11/04 09:55:34  mike
stop request.defaultfuseaction being user-dependent

Revision 1.7  2004/11/02 09:30:02  mike
removed more junk, etc.

Revision 1.6  2004/10/29 14:17:46  mike
removed some junk

Revision 1.5  2004/10/28 10:17:03  mike
don't set request.userid, etc.

Revision 1.4  2004/10/27 13:24:12  mike
delete setting of DSN

Revision 1.3  2004/10/26 17:50:30  mike
FB4

Revision 1.2  2004/10/22 19:17:29  mike
deleted a massive amount of dead stuff

Revision 1.1  2004/10/21 17:23:14  mike
renamed from act_settings_1.cfm

Revision 1.3  2004/10/21 16:43:11  mike
remove stuff into top-level fbx_settings.cfm

Revision 1.2  2004/10/18 10:47:26  kevin
Moved some from images to furniture

Revision 1.1  2004/10/18 10:10:20  mike
initial version
 --->
</cfsilent>
