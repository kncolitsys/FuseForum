<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="act_emailsubs.cfm">
	<responsibilities>
		I send emails to subscribers
	</responsibilities>
	<properties>
		<history author="Mike Oakes" email="mike@objectiveinternet.com" date="04-Feb-2005" role="Architect" type="Create" />
		<property name="copyright" value="(c)2005 Objective Internet Limited." />
		<property name="licence" value="See licence.txt" />
		<property name="version" value="$Revision: 1.1 $" />
		<property name="lastupdated" value="$Date: 2007/06/15 13:59:05 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<string name="subscriptionEmail" scope="request" />
			<string name="forumsname" scope="request" />
			<string name="forumsurl" scope="request" />
			<number name="threadid" scope="attributes" optional="Yes" />
			<number name="messageid" scope="attributes" />
		</in>
		<out>
			<string name="fuseaction" scope="formOrUrl" />
			<number name="threadid" scope="formOrUrl" />
		</out>
	</io>
</fusedoc>
--->

<cfif isDefined("attributes.threadid")>
	
	<cfset emailsubs=Application.ao__AppObj_mForumAdmin_ForumAdmin_Facade.fEmailSubscribersByThread(attributes.threadid)>
	
	<cfset user_owner=Application.ao__AppObj_mForumAdmin_ForumAdmin_Facade.fThreadSubscribers(attributes.threadid)>
<cfelse>
	
	<cfset emailsubs=Application.ao__AppObj_mForumAdmin_ForumAdmin_Facade.fEmailSubscribersByMessage(attributes.messageid)>
	
	<cfset user_owner=Application.ao__AppObj_mForumAdmin_ForumAdmin_Facade.fMessageAuthor(attributes.messageid)>
</cfif>

<cfset getemailfooter=Application.ao__AppObj_mForum_settings_Gateway.findAllEmailmessage()>

<cfloop query="emailsubs">
	<cfif emailsubs.emailpref eq "H">
		<cfset variables.emailTo = emailsubs.hEmailAddress>
	<cfelse>
		<cfset variables.emailTo = emailsubs.wEmailAddress>
	</cfif>

	<cfmail to="#variables.emailTo#"
			from="#request.subscriptionEmail#"
			subject="#request.forumsname#: update to thread '#emailsubs.threadname#'">

Forum: #emailsubs.categoryname#
Thread: #emailsubs.threadname#
User Name: #user_owner.username#

Message:
#emailsubs.message#

You can view the thread at: #request.forumsurl#/#request.self#?fuseaction=for.showthread&amp;threadid=<cfif isdefined("attributes.threadid")>#attributes.threadid#<cfelse>#emailsubs.threadid#</cfif>

Please do not respond to this message.  Post any correspondence in the #request.forumsname#.
<cfif len(getemailfooter.emailmessage)>
-------------
#getemailfooter.emailmessage#
</cfif>
	</cfmail>
</cfloop>

<!--- 
$Log: act_emailsubs.cfm,v $
Revision 1.1  2007/06/15 13:59:05  kevin
Add Admin Modules

Revision 1.10  2006/08/11 12:52:26  mike
change cfc objects from Server to Application scope

Revision 1.9  2006/08/01 10:56:50  mike
correct the naming convention for the ForumAdmin_Facade.cfc object

Revision 1.8  2006/07/31 15:43:24  kevin
Remove old SQL

Revision 1.7  2006/06/23 17:19:55  mike
new naming convention for cfc objects

Revision 1.6  2005/09/05 15:47:31  kevin
Change DSN for forums.

Revision 1.5  2005/05/21 15:26:34  mike
correct path for ForumAdmin_Facade

Revision 1.4  2005/05/20 12:33:38  kevin
New server cfc naming convention

Revision 1.3  2005/04/08 11:46:39  mike
changed to call Facade/Gateway/DAO cfc's

Revision 1.2  2005/04/01 12:15:58  mike
modify to call Facade &/or Gateway methods

Revision 1.1  2005/03/29 13:28:25  mike
files moved from mForum

Revision 1.1  2005/03/09 13:49:08  mike
Moved to create MVC version

Revision 1.5  2005/02/24 13:57:21  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.4  2005/02/15 10:13:41  mike
explicitly qualify fields inside a <cfloop> by the query name

Revision 1.3  2005/02/09 12:13:43  mike
improve code layout

Revision 1.2  2005/02/08 17:08:15  mike
index.cfm => #request.self#

Revision 1.1  2005/02/04 19:56:48  mike
FB3 version made from wireframe with fusebuilder, with contents pasted from FB2 version, fbx_switch fully commented, and XFA usage improved throughout
--->
</cfsilent>
