<circuit access="public">
<!-- (c)2005 Objective Internet Limited. -->
<!-- $RCSfile: circuit.xml.cfm,v $ -->
<!-- $Revision: 1.2 $ -->
<!-- $Date: 2007/06/14 14:00:59 $ -->
<!-- $Author: kevin $ -->
	<prefuseaction callsuper="true">
		<include template="../../model/mForum/fbx_settings.cfm"/><!-- ensure the db models initialised -->
		<include template="fbx_settings.cfm"/>
	</prefuseaction> 

	<postfuseaction callsuper="false">
        <do action="vLayout.Page_Layout"/>
	</postfuseaction>

	<fuseaction name="Forum_Home">
		<!-- Forums Home: I display the list of Forums." -->
		<set name="request.page.subtitle" value="Forum Home"/>
		<set name="request.page.description" value="I display the list of Forums."/>
		
		<xfa name="Threads" value="List_Threads" />
		<xfa name="Subscribe" value="Action_Subscribe_To_Forum" />
		<xfa name="Search" value="Search" />
		
		<set name="request.page.template" value="lay_forum.cfm"/>
		
		<do action="mForum.AllForums"/>
		<do action="vForum.Home" contentvariable="request.page.content"/>
	</fuseaction>

	<fuseaction name="List_Threads">
		<!-- List Threads: I display the list of Threads for a given Forum." -->
		<set name="request.page.subtitle" value="List Threads" />
		<set name="request.page.description" value="I display the list of Threads for a given Forum." />

		<xfa name="New_Thread" value="Start_Thread" />
		<xfa name="Show_Thread" value="List_Messages" />
		<xfa name="Search" value="Search" />
		
        <set name="request.page.template" value="lay_forum.cfm"/>
		
		<do action="mForum.allcategorythreads"/>
		<do action="vForum.List_Threads" contentvariable="request.page.content"/>
	</fuseaction>

	<fuseaction name="List_Messages">
		<!-- List Messages: I display the list of Messages for a given Thread." -->
		<set name="request.page.subtitle" value="Show Thread" />
		<set name="request.page.description" value="I display the list of Messages for a given Thread." />
		
		<do action="mForum.showthread"/>

		<xfa name="Top" value="List_Messages" />
		<xfa name="Subscribe" value="Action_Subscribe_To_Thread" />
		<xfa name="Private_Message" value="Send_Private_Message" />
		<xfa name="Edit" value="Edit_Message" />
		<xfa name="Reply" value="Send_Message" />
		<xfa name="Friend" value="Action_Friend" />
		<xfa name="Report" value="Report_to_Moderator" />
		
        <set name="request.page.template" value="lay_forum.cfm"/>
		<do action="vForum.List_Messages" contentvariable="request.page.content"/>
	</fuseaction>

	<fuseaction name="Action_Subscribe_To_Forum">
		<!-- Action_Subscribe_To_Forum: I toggle the user's subscription to this Forum." -->
		<set name="request.page.subtitle" value="Subscribe to Forum" />
		<set name="request.page.description" value="I toggle the user's subscription to this Forum." />
		
		<xfa name="Continue" value="Forum_Home"/>
		
		<do action="mForum.Action_ForumSubscribe"/>
		<include template="url_continue.cfm"/>
	</fuseaction>

	<fuseaction name="Action_Subscribe_To_Thread">
		<!-- Action Subscribe To Thread: I toggle the user's subscription to this Thread." -->
		<set name="request.page.subtitle" value="Subscribe to Thread" />
		<set name="request.page.description" value="I toggle the user's subscription to this Thread." />
		
		<xfa name="ForumsMyMessages" value="Today"/>
		<xfa name="ForumsShowThread" value="List_Messages"/>
		
		<do action="mForum.Action_ThreadSubscribe"/>
		<include template="url_followonfromsubscription.cfm"/>
	</fuseaction>

	<fuseaction name="Send_Message">
		<!-- Send Message: I display a form to allow the user to create a new message in an existing thread." -->
		<set name="request.page.subtitle" value="Send Message" />
		<set name="request.page.description" value="I display a form to allow the user to create a message in an existing thread." />

		<xfa name="Save" value="Action_Send_Message"/>
        <set name="request.page.template" value="lay_forum.cfm"/>
		
		<do action="mForum.threadsubscribed"/>
		<do action="mForum.threaddetails"/>
		<do action="mForum.reply"/>
		
		<do action="vForum.Send_Message" contentvariable="request.page.content"/>
	</fuseaction>
	
	<fuseaction name="Action_Send_Message">
		<!-- Action Send Message: I add the message to the Forum." -->
		<set name="request.page.subtitle" value="Action Send Message" />
		<set name="request.page.description" value="I add the message to the Forum." />
		
		<xfa name="Show_Thread" value="List_Messages"/>
		<xfa name="Threads" value="List_Threads"/>
		<xfa name="Forum_Home" value="Forum_Home"/>
		
		<do action="mForum.postnewthread"/>
		
		<if condition="NOT block">
			<true>
				<include template="url_followonfromposting.cfm" />
			</true>
			<false>
				<do action="vForum.showblockedmessage" />
			</false>
		</if>
	</fuseaction>

	<fuseaction name="Start_Thread">
		<!-- Start_Thread: I display a form to allow the user to create a new thread." -->
		<set name="request.page.subtitle" value="Start Thread" />
		<set name="request.page.description" value="I display a form to allow the user to create a new thread." />

		<xfa name="Save" value="Action_Start_Thread"/>
		<xfa name="Abort" value="Maxlimit"/>
		
		<set name="request.page.template" value="lay_forum.cfm"/>
		
		<do action="mForum.postnew"/>
		<do action="vForum.postnew" contentvariable="request.page.content"/>
	</fuseaction>

	<fuseaction name="Action_Start_Thread">
		<!-- Action Send Message: I add the new thread plus message to the Forum." -->
		<set name="request.page.subtitle" value="Start Thread" />
		<set name="request.page.description" value="I add the new thread plus message to the Forum." />
		
		<xfa name="ShowThread" value="List_Messages"/>
		<xfa name="Threads" value="List_Threads"/>
		<xfa name="Home" value="Forum_Home"/>
		
		<do action="mForum.postnewthread"/>
		
		<if condition="NOT block">
			<true>
				<include template="url_followonfromposting.cfm" />
			</true>
			<false>
				<do action="vForum.showblockedmessage" />
			</false>
		</if>
	</fuseaction>

	<fuseaction name="Maxlimit">
		<!-- Message_Limit: I display a warning message that the maximum number of threads for this forum has been reached. HTML=???." -->
		<set name="request.page.subtitle" value="Message Limit" />
		<set name="request.page.description" value="I display a warning message that the maximum number of threads for this forum has been reached." />

        <set name="request.page.template" value="lay_forum.cfm"/>
		<do action="vForum.maxlimit" contentvariable="request.page.content"/>
	</fuseaction>

	<fuseaction name="Action_Friend">
		<!-- Action Friend: I mark this person as a friend." -->
		<set name="request.page.subtitle" value="Action Friend" />
		<set name="request.page.description" value="I mark this person as a friend." />
		<do action="mForum.markasfriend"/>

		<xfa name="Continue" value="List_Messages"/>
		<include template="url_continue.cfm"/>
	</fuseaction>

	<fuseaction name="Report_To_Moderator">
		<!-- Report to Moderator: I display a form to enable the user to send a comment to the forum moderators to report the thread. HTML=forum_report_breach.cfm." -->
		<set name="request.page.subtitle" value="Report to Moderator" />
		<set name="request.page.description" value="I display a form to enable the user to send a comment to the forum moderators to report the thread." />

        <set name="request.page.template" value="lay_forum.cfm"/>
		<xfa name="Save" value="Action_Report_To_Moderator"/>
		
		<do action="mForum.threaddetails"/>
		<do action="vForum.Report_To_Moderator" contentvariable="request.page.content"/>
	</fuseaction>

	<fuseaction name="Action_Report_To_Moderator">
		<!-- Action Report to Moderator: I send an email containing the comment to the forum moderators to report the thread. HTML=???." -->
		<set name="request.page.subtitle" value="Action Report to Moderator" />
		<set name="request.page.description" value="I send an email containing the comment to the forum moderators to report the thread." />

        <set name="request.page.template" value="lay_forum.cfm"/>
		
		<do action="mForum.threaddetails"/>
		<do action="mForum.sendmoderatoremail"/>
		<do action="vForum.Action_Report_to_Moderator" contentvariable="request.page.content"/>
	</fuseaction>
	
	<fuseaction name="Edit_Message">
		<!-- Edit Message: I display an existing message and allow the user to change or update it. HTML=posts_edit.cfm." -->
		<set name="request.page.subtitle" value="Edit Message" />
		<set name="request.page.description" value="I display an existing message and allow the user to change or update it." />

		<xfa name="Save" value="Action_Edit_Message"/>
		
        <set name="request.page.template" value="lay_forum.cfm"/>
		<do action="mForum.threadsubscribed"/>
		<do action="mForum.threaddetails"/>
		<do action="mForum.editmessage"/>
		<do action="vForum.editmessage" contentvariable="request.page.content"/>
	</fuseaction>
	
	<fuseaction name="Action_Edit_Message">
		<!-- Action Edit Message: I update the existing message." -->
		<do action="mForum.postedit"/>

		<xfa name="Continue" value="List_Messages"/>
		<include template="url_continue.cfm"/>
	</fuseaction>
	
	<fuseaction name="Send_Private_Message">
		<!-- Send Private Message: I display a form allowing the users to send a private message to a user who is a friend. HTML=forum_private_message.cfm." -->
		<set name="request.page.subtitle" value="Send Private Message" />
		<set name="request.page.description" value="I display a form allowing the users to send a private message to a user who is a friend." />

		<xfa name="Save" value="Action_Send_Private_Message"/>
		<xfa name="Continue" value="Forum_Home"/>
		
        <set name="request.page.template" value="lay_forum.cfm"/>
		<do action="mForum.privatemessage"/>
		<if condition="isDefined('attributes.threadid')">
			<true>
				<do action="mForum.threaddetails"/>
			</true>
		</if>
		<if condition="getuser.recordcount NEQ 0">
			<true>
				<do action="vForum.Send_Private_Message" contentvariable="request.page.content"/>
			</true>
			<false>
				<include template="url_continue.cfm" />
			</false>
		</if>
	</fuseaction>

	<fuseaction name="Action_Send_Private_Message">
		<!-- Action Send Private Message: I send the private message to the selected person." -->
		<do action="mForum.postprivatemessage"/>

		<if condition="isDefined('attributes.threadid')">
			<true>
				<xfa name="Continue" value="List_Messages"/>
			</true>
			<false>
				<xfa name="Continue" value="Forum_Home"/>
			</false>
		</if>
		<include template="url_continue.cfm"/>
	</fuseaction>

	<fuseaction name="Subscriptions">
		<!-- Subscriptions: I display the user's subscriptions." -->
		<set name="request.page.subtitle" value="Subscriptions" />
		<set name="request.page.description" value="I display the user's subscriptions." />

		<xfa name="ForumLink" value="List_Threads" />
		<xfa name="ThreadLink" value="List_Messages" />
		<xfa name="Save" value="Action_Subscriptions" />
        
		<set name="request.page.template" value="lay_forum.cfm"/>
		
		<do action="mForum.Subscriptions"/>
		
		<do action="vForum.Subscriptions" contentvariable="request.page.content"/>
	</fuseaction>

	<fuseaction name="Action_Subscriptions">
		<!-- Action_Subscriptions: I process the Subscriptions form." -->
		<xfa name="Continue" value="Subscriptions"/>
		
		<do action="mForum.Action_Subscriptions"/>
		
		<include template="url_continue.cfm"/>
	</fuseaction>

	<fuseaction name="Today">
		<!-- today: I display the user's private messages. HTML=forum_my_messages.cfm." -->
		<set name="request.page.subtitle" value="My Messages" />
		<set name="request.page.description" value="I display the user's private messages." />

		<xfa name="ShowPrivateMessage" value="Show_Private_Message" />
		<xfa name="ArchivedPrivateMessages" value="Archived_Private_Messages" />
		
        <set name="request.page.template" value="lay_forum.cfm"/>
		<do action="mForum.today"/>
		<do action="vForum.today" contentvariable="request.page.content"/>
	</fuseaction>

	<fuseaction name="Show_Private_Message">
		<!-- showprivatemessage: "I display a private message. HTML=ForumsDisplayPrivateMessage.cfm." -->
		<set name="requestt.page.description" value="I display a private message." />

		<xfa name="PrivateMessage" value="For.privatemessage" />
		
        <set name="request.page.template" value="lay_forum.cfm"/>
		<do action="mForum.showprivatemessage"/>
		<if condition="NOT isdefined('attributes.arch')">
			<true>
				<do action="mForum.archiveprivatemessage"/>
			</true>
		</if>
		
		<do action="vForum.showprivatemessage" contentvariable="request.page.content"/>
	</fuseaction>

	<fuseaction name="Archived_Private_Messages">
		<!-- archivedprivatemessages: "I list the user's archived private messages. HTML=ForumsListArchivedPrivateMessages.cfm." -->
		<set name="request.page.subtitle" value="List Archived Private Messages" />
		<set name="request.page.description" value="I list the archived private messages." />

		<xfa name="ShowPrivateMessage" value="Show_Private_Message" />
		<xfa name="ArchivedPrivateMessages" value="Archived_Private_Messages" />
		
        <set name="request.page.template" value="lay_forum.cfm"/>
		<do action="mForum.archivedprivatemessages"/>
		<do action="vForum.archivedprivatemessages" contentvariable="request.page.content"/>
	</fuseaction>

	<fuseaction name="Show_Friends_Messages">
	<!-- showfriend: I display the list of Messages by a Friend. HTML=ForumsDisplayFriendMessages.cfm. -->
		<set name="request.page.subtitle" value="List Messages Of Friend" />
		<set name="request.page.description" value="I list the messages posted by friends." />

        <set name="request.page.template" value="lay_forum.cfm"/>
		<do action="mForum.showfriend"/>
		<do action="vForum.showfriend" contentvariable="request.page.content"/>
	</fuseaction>

	<fuseaction name="Search">
        <set name="request.page.template" value="lay_forum.cfm"/>
		<set name="attributes.XFA.submitform" value="For.postsearch"/>
		<do action="mForum.search"/>
		<do action="vForum.search" contentvariable="request.page.content"/>
	</fuseaction>

<!-- 
$Log: circuit.xml.cfm,v $
Revision 1.2  2007/06/14 14:00:59  kevin
Initial Open Source Version

 -->
</circuit>

