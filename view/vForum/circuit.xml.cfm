<circuit access="internal">
<!-- (c)2005 Objective Internet Limited. -->
<!-- $RCSfile: circuit.xml.cfm,v $ -->
<!-- $Revision: 1.2 $ -->
<!-- $Date: 2007/06/14 14:01:47 $ -->
<!-- $Author: kevin $ -->
	<prefuseaction callsuper="false">
	</prefuseaction>
	
	<postfuseaction callsuper="false">
	</postfuseaction>

	<fuseaction name="Home">
		<!-- Forums Home: I display the terms and conditions for the Forum." -->
		<include template="dsp_home.cfm"/>
	</fuseaction>

	<fuseaction name="List_Threads">
		<!-- List_Threads: I display the list of Threads for a given Forum." -->
		<include template="dsp_threadsincategory.cfm"/>
	</fuseaction>

	<fuseaction name="List_Messages">
		<!-- List_Messages: I display the list of Messages for a given Thread." -->
		<include template="dsp_showthread.cfm"/>
	</fuseaction>

	<fuseaction name="Send_Message">
		<!-- Send_Message: I display a form to allow the user to create a message." -->
		<include template="dsp_post.cfm"/>
	</fuseaction>

	<fuseaction name="Start_Thread">
		<!-- Start_Thread: I display a form to allow the user to create a new thread." -->
		<include template="dsp_postnew.cfm"/>
	</fuseaction>

	<fuseaction name="Message_Limit">
		<!-- Message_Limit: I display a warning message that the maximum number of threads for this forum has been reached." -->
		<include template="dsp_messagelimit.cfm"/>
	</fuseaction>

	<fuseaction name="Report_To_Moderator">
		<!-- Report to Moderator: I display a form to enable the user to send a comment to the forum moderators to report the thread." -->
		<include template="dsp_reporttomoderator.cfm"/>
	</fuseaction>

	<fuseaction name="Action_Report_to_Moderator">
		<!-- Action Report to Moderator: I send an email containing the comment to the forum moderators to report the thread." -->
		<include template="dsp_reporttomoderatorend.cfm"/>
	</fuseaction>

	<fuseaction name="Edit_Message">
		<!-- Edit Message: I display an existing message and allow the user to change or update it." -->
		<include template="dsp_editpost.cfm"/>
	</fuseaction>

	<fuseaction name="Send_Private_Message">
		<!-- Send Private Message: I display a form allowing the users to send a private message to a user who is a friend." -->
		<include template="dsp_postprivatemessage.cfm"/>
	</fuseaction>

	<fuseaction name="Subscriptions">
		<!-- Subscriptions: I display the user's subscriptions." -->
		<include template="dsp_subscriptions.cfm"/>
	</fuseaction>

	<fuseaction name="Today">
		<!-- Today: I display the user's private messages." -->
		<include template="dsp_today.cfm"/>
	</fuseaction>

	<fuseaction name="showprivatemessage">
		<!-- showprivatemessage: "I display a private message." -->
		<include template="dsp_showprivatemessage.cfm"/>
	</fuseaction>

	<fuseaction name="archivedprivatemessages">
		<!-- archivedprivatemessages: "I list the archived private messages." -->
		<include template="dsp_archivedprivatemessages.cfm"/>
	</fuseaction>
	
	<fuseaction name="showblockedmessage">
		<!-- showerrormessage: "I show the error message." -->
		<include template="dsp_messageblocked.cfm"/>
	</fuseaction>

	<!-- ======================================================================================== -->
	
	<!-- <fuseaction name="showfriend"> (not currently used) -->
	<!-- showfriend: I display the list of Messages by a Friend. HTML=ForumsDisplayFriendMessages.cfm. -->
		<!-- <include template="dsp_usermessages.cfm"/> -->
		<!-- <include template="dsp_sectionend.cfm"/> -->
	<!-- </fuseaction> -->

	<!-- <fuseaction name="showtoday"> (not currently used) -->
	<!-- showtoday: I display a Notice. HTML=ForumsDisplayNotice.cfm. -->
		<!-- <include template="dsp_showtoday.cfm"/> -->
		<!-- <include template="dsp_sectionend.cfm"/> -->
	<!-- </fuseaction> -->

	<!-- ======================================================================================== -->
	
	<!-- <fuseaction name="customise"> (never used)
		<include template="dsp_usersettings.cfm"/>
		<include template="dsp_sectionend.cfm"/>
	</fuseaction> -->

	<!-- <fuseaction name="profile"> (never used)
		<include template="dsp_userprofile.cfm"/>
		<include template="dsp_sectionend.cfm"/>
	</fuseaction> -->

	<!-- <fuseaction name="displayprofile"> (never used)
		<include template="dsp_showprofile.cfm"/>
	</fuseaction> -->

	<!-- <fuseaction name="search"> (never used)
		<include template="dsp_searchpage.cfm"/>
		<include template="dsp_sectionend.cfm"/>
	</fuseaction> -->

	<!-- <fuseaction name="postsearch"> (never used)
		<include template="dsp_searchresults.cfm"/>
		<include template="dsp_sectionend.cfm"/>
	</fuseaction> -->

<!-- 
$Log: circuit.xml.cfm,v $
Revision 1.2  2007/06/14 14:01:47  kevin
Initial Open Source Version

 -->
</circuit>

