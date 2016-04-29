<circuit access="internal">
<!-- (c)2005 Objective Internet Limited. -->
<!-- $RCSfile: circuit.xml.cfm,v $ -->
<!-- $Revision: 1.3 $ -->
<!-- $Date: 2007/06/14 16:52:21 $ -->
<!-- $Author: kevin $ -->
	<prefuseaction callsuper="false">
		<!-- <include template="fbx_settings.cfm" circuit="mForum"/>DOESN'T WORK! -->
		<include template="../../model/mForum/fbx_settings.cfm"/><!-- ensure the db models initialised -->
		<include template="fbx_settings.cfm" />
	</prefuseaction>

	<postfuseaction callsuper="false">
	</postfuseaction>

	<fuseaction name="AllForums">
		<include template="qry_forum.cfm"/>
	</fuseaction>

	<fuseaction name="allcategorythreads">
		<!-- List Threads: I display the list of Threads for a given Forum. -->
		<include template="qry_threadsincategory.cfm"/>
	</fuseaction>

	<fuseaction name="showthread">
		<!-- List Messages: I get the list of Messages for a given Thread. -->
		<include template="qry_thread.cfm"/><!-- only place called -->
		<include template="qry_friends.cfm"/><!-- only place called -->
	</fuseaction>

	<fuseaction name="threaddetails">
		<!-- threaddetails: I get the name of the Forum and Thread for a given Thread. -->
		<include template="qry_threaddetails.cfm"/>
	</fuseaction>

	<fuseaction name="ForumSubscribed">
		<!-- ForumSubscribed: I find whether the user subscribes to the given Forum. -->
		<include template="qry_forumsubscribe.cfm"/>
	</fuseaction>

	<fuseaction name="Action_ForumSubscribe">
		<!-- Action_ForumSubscribe: I toggle the user's subscription to this Forum. -->
		<if condition="attributes.act IS 's'">
			<true>
				<include template="qry_forumsubscribe.cfm" />
				<include template="act_forumsubscribe.cfm" /><!-- only place called -->
			</true>
			<false>
				<include template="act_forumunsubscribe.cfm" /><!-- only place called -->
			</false>
		</if>
	</fuseaction>

	<fuseaction name="threadsubscribed">
		<!-- threadsubscribed: I find whether the user subscribes to the given Thread. -->
		<include template="qry_threadsubscribe.cfm"/>
	</fuseaction>

	<fuseaction name="Action_ThreadSubscribe"><!-- was subscribe -->
		<!-- Action Subscribe To Thread: I toggle the user's subscription to this Thread. -->
		<if condition="attributes.act IS 's'">
			<true>
				<include template="qry_threadsubscribe.cfm" />
				<include template="act_threadsubscribe.cfm" />
			</true>
			<false>
				<include template="act_threadunsubscribe.cfm" />
			</false>
		</if>
	</fuseaction>

	<fuseaction name="reply">
		<!-- Send Message: I display a form to allow the user to create a message. -->
		<include template="qry_allowattachments.cfm"/>
		<include template="qry_catmaxlimit.cfm"/>
	</fuseaction>

	<fuseaction name="postnew">
		<!-- Start_Thread: I display a form to allow the user to create a new thread. -->
		<include template="qry_allowattachments.cfm"/>
		<include template="qry_catmaxlimit.cfm"/>
	</fuseaction>

	<fuseaction name="postnewthread">
		<!-- Action Send Message: I add the [poss. new thread plus] message to the Forum. -->
		<include template="act_formatposting.cfm"/>
		<include template="act_censormessage.cfm"/>
		<if condition="block">
			<true>
				<include template="dsp_mesageblocked.cfm" />
			</true>
		</if>
		<if condition="NOT block">
			<true>
				<include template="act_uploadattachment.cfm" />
				<include template="qry_checkapproval.cfm" />
				<include template="act_postnewthread.cfm" />
			</true>
		</if>
		<if condition="NOT block AND isDefined('attributes.subscribe')">
			<true>
				<include template="qry_threadsubscribe.cfm" />
				<include template="act_threadsubscribe.cfm" />
			</true>
		</if>
		<if condition="NOT block AND needapproval.approval">
			<true>
				<include template="act_emailmoderator.cfm"/>
			</true>
		</if>
		<if condition="NOT block AND NOT needapproval.approval">
			<true>
				<include template="qry_threaddetails.cfm"/>
				<include template="act_emailsubs.cfm"/>
			</true>
		</if>
	</fuseaction>

	<fuseaction name="markasfriend">
		<!-- Action Friend: I mark this person as a friend. -->
		<include template="act_markasfriend.cfm"/>
	</fuseaction>

	<fuseaction name="sendmoderatoremail">
		<!-- Action Report to Moderator: I send an email containing the comment to the forum moderators to report the thread. -->
		<include template="act_sendmoderatoremail.cfm"/>
	</fuseaction>

	<fuseaction name="editmessage">
		<!-- Edit Message: I display an existing message and allow the user to change or update it. -->
		<include template="qry_allowattachments.cfm"/>
		<include template="qry_editpost.cfm"/>
	</fuseaction>

	<fuseaction name="postedit">
		<!-- Action Edit Message: I update the existing message. -->
		<include template="act_postedit.cfm"/>
	</fuseaction>

	<fuseaction name="privatemessage">
		<!-- Private Message: I get the name of a user and whether he accepts private messages. -->
		<include template="qry_postprivatemessage.cfm"/>
	</fuseaction>

	<fuseaction name="postprivatemessage">
		<!-- Action Send Private Message: I send the private message to the selected person. -->
		<include template="act_postprivatemessage.cfm"/>
	</fuseaction>

	<fuseaction name="Subscriptions">
		<!-- Subscriptions: I get the user's subscriptions. -->
		<include template="qry_subscriptions.cfm"/>
	</fuseaction>

	<fuseaction name="Action_Subscriptions">
		<!-- Action_ubscriptions: I process the Subscriptions form. -->
		<include template="act_subscriptions.cfm"/>
	</fuseaction>

	<fuseaction name="today">
		<!-- today: I get the user's private messages. -->
		<include template="qry_today.cfm"/>
	</fuseaction>

	<fuseaction name="showprivatemessage">
		<!-- showprivatemessage: I display a private message. -->
		<include template="qry_thisprivatemessage.cfm"/>
	</fuseaction>

	<fuseaction name="archiveprivatemessage">
		<!-- archiveprivatemessage: I archive a private message. -->
		<include template="act_archiveprivatemessage.cfm"/>
	</fuseaction>

	<fuseaction name="archivedprivatemessages">
		<!-- archivedprivatemessages: I list the archived private messages. -->
		<include template="qry_archivedprivatemessages.cfm"/>
	</fuseaction>

	<fuseaction name="search"><!-- (should be used when search is implemented) -->
		<include template="qry_usercategories.cfm"/>
	</fuseaction>
	
	<fuseaction name="LatestChats">
		<!-- LatestChats: I get a list of the latest Forums Postings. -->
		<include template="qry_LatestChats.cfm" />
	</fuseaction>

	<fuseaction name="MyBuddiesOnline">
		<!-- MyBuddiesOnline: I display a list of buddies who are currently online. -->
		<include template="qry_MyBuddiesOnline.cfm" />
	</fuseaction>

	<!-- ======================================================================================== -->
	
	<!-- <fuseaction name="showfriend"> (not currently used) -->
	<!-- showfriend: I display the list of Messages by a Friend. -->
		<!-- <include template="qry_usermessages.cfm"/> -->
	<!-- </fuseaction> -->

	<!-- <fuseaction name="showtoday"> --><!-- (not currently used) -->
	<!-- showtoday: I display a Notice. -->
		<!-- <include template="qry_showtoday.cfm"/> -->
	<!-- </fuseaction> -->

	<!-- <fuseaction name="postsearch"> (not used, as SQL search not implemented)
		<include template="act_searchresults.cfm"/>
	</fuseaction> -->

	<!-- <fuseaction name="customise"> (never used)
		<include template="qry_usersettings.cfm"/>
	</fuseaction> -->

	<!-- <fuseaction name="customise2"> (never used)
		<include template="act_checkfieldlength.cfm"/>
	</fuseaction> -->

	<!-- <fuseaction name="postcustomise"> (never used)
		<include template="act_postcustomise.cfm"/>
	</fuseaction> -->

	<!-- <fuseaction name="profile"> (never used)
		<include template="qry_userprofile.cfm"/>
	</fuseaction> -->

	<!-- <fuseaction name="postprofile"> (never used)
		<include template="act_postprofile.cfm"/>
	</fuseaction> -->

	<!-- <fuseaction name="displayprofile"> (never used)
		<include template="qry_userprofile.cfm"/>
	</fuseaction> -->

<!-- 
$Log: circuit.xml.cfm,v $
Revision 1.3  2007/06/14 16:52:21  kevin
Remove specific comments

Revision 1.2  2007/06/14 14:01:11  kevin
Initial Open Source Version

Revision 1.16  2006/07/25 11:48:24  kevin
Additional fuseactions to support FB4

Revision 1.15  2005/05/26 12:23:25  mike
use xfa's everywhere

Revision 1.14  2005/05/26 07:42:54  kevin
Add CVS Info to heading

Revision 1.13  2005/05/24 13:28:43  mike
small edits

Revision 1.12  2005/05/23 16:24:43  mike
remove unused fuseactions LatestChats and MyBuddiesOnLine

Revision 1.11  2005/05/21 14:10:31  mike
scrap url_followonfromsubscription.cfm

Revision 1.10  2005/05/20 18:52:37  mike
ongoing edits

Revision 1.9  2005/05/20 11:38:57  mike
new fuseactions ForumSubscribed, etc.

Revision 1.8  2005/05/13 16:41:43  mike
new fuseaction threadsubscribe, etc.

Revision 1.7  2005/05/13 14:03:05  mike
ongoing edits

Revision 1.6  2005/05/11 10:47:28  kevin
Rename Serendipity from MVC conversion

Revision 1.5  2005/05/11 09:09:37  mike
call qry_catmaxlimit second, to ensure attributes.categoryid has been set

Revision 1.4  2005/05/10 10:53:32  mike
don't use the circuit="" undocumented addition to <include> - it doesn't work inside a <prefuseaction>!

Revision 1.3  2005/05/09 10:54:06  mike
comment out the unused fuseactions showtoday and showfriend

Revision 1.2  2005/05/06 15:26:31  mike
modify the <prefuseaction> code; reinstate the "search" fuseaction

Revision 1.1  2005/05/05 12:13:54  mike
Initial FB4 Version

Revision 1.13  2004/11/17 14:01:02  mike
put Forum_List in dead fuseaction area

Revision 1.12  2004/11/15 14:58:48  kevin
Move relocation to controller

Revision 1.11  2004/11/12 17:51:12  mike
stuff for whosonline

Revision 1.10  2004/11/11 20:04:38  mike
stuff for LatestChats

Revision 1.9  2004/11/09 13:34:21  kevin
Update story with link to thread.

Revision 1.8  2004/11/09 13:03:02  mike
callsuper="false" on pre (and post)fuseaction

Revision 1.7  2004/11/09 12:55:11  kevin
Break out post new thread process into separate fuses.

Revision 1.6  2004/11/05 15:46:47  mike
include qry_editpost.cfm

Revision 1.5  2004/11/05 13:40:34  mike
added <prefuseaction callsuper="true">

Revision 1.4  2004/11/03 19:54:15  mike
many changes => essentially final version

Revision 1.3  2004/10/21 14:01:46  mike
add My_Messages

Revision 1.2  2004/10/19 11:31:49  kevin
Add CVS Log
 -->
</circuit>

