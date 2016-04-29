<circuit access="public">
<!-- (c)2005 Objective Internet Limited. -->
<!-- $RCSfile: circuit.xml.cfm,v $ -->
<!-- $Revision: 1.1 $ -->
<!-- $Date: 2007/06/15 13:58:56 $ -->
<!-- $Author: kevin $ -->
	<prefuseaction callsuper="true">
		<include template="fbx_settings.cfm"/>
	</prefuseaction>

	<postfuseaction callsuper="false">
        <do action="vLayout.Page_Layout"/>
	</postfuseaction>

	<!-- ======================================================================================= -->
    <!--  Forums/categories                                                                      -->
	<!-- ======================================================================================= -->
	<fuseaction name="Categories">
	<!--@FuseAction: Categories: I display a page with all the forums -->
		<set name="request.page.subtitle" value="Forums"/>
		<set name="request.page.description" value="I display a page with all the forums"/>

		<!-- <include template="qry_categories.cfm"/> -->
		<do action="mForumAdmin.Categories"/>

		<xfa name="Add" value="ForumAdmin.addcategory"/>
		<xfa name="Edit" value="ForumAdmin.editcategory"/>
		<xfa name="Delete" value="ForumAdmin.deletecategory"/>
		<xfa name="Moderators" value="ForumAdmin.catmoderators"/>
		<xfa name="Members" value="ForumAdmin.CatMembers"/><!-- NB can never be activated because visible to Members not supported -->
		<!-- <include template="dsp_categories.cfm" append="true" contentvariable="request.page.content"/> --><!-- only place called -->
		<do action="vForumAdmin.Categories" contentvariable="request.page.content" append="true"/>
	</fuseaction>
	
	<fuseaction name="AddCategory">
	<!--@FuseAction: AddCategory: I display a form for adding a new forum -->
		<set name="request.page.subtitle" value="Add Forum"/>
		<set name="request.page.description" value="I display a form for adding a new forum"/>

		<!-- <include template="qry_allsites.cfm"/> -->
		<do action="mForumAdmin.Sites"/>
		<!-- <include template="qry_allsitecategories.cfm"/> -->
		<do action="mForumAdmin.SiteForums"/>

		<set name="attributes.action" value="blank"/>
		<xfa name="Save" value="ForumAdmin.Action_Category"/>
		<!-- <include template="dsp_categoryform.cfm" append="true" contentvariable="request.page.content"/> --><!-- called here and for fuseaction editcategory -->
		<do action="vForumAdmin.AddCategory" contentvariable="request.page.content" append="true"/>
	</fuseaction>
	
	<fuseaction name="EditCategory">
	<!--@FuseAction: EditCategory: I display a form for editing an existing forum -->
		<set name="request.page.subtitle" value="Edit Forum"/>
		<set name="request.page.description" value="I display a form for editing an existing forum"/>

		<!-- <include template="qry_allsites.cfm"/> -->
		<do action="mForumAdmin.Sites"/>
		<!-- <include template="qry_allsitecategories.cfm"/> -->
		<do action="mForumAdmin.SiteForums"/>
		<!-- <include template="qry_categoryform.cfm"/> --><!-- only place called -->
		<do action="mForumAdmin.CategoryDetails"/>

		<set name="attributes.action" value="query"/>
		<xfa name="Save" value="ForumAdmin.Action_Category"/>
		<!-- <include template="dsp_categoryform.cfm" append="true" contentvariable="request.page.content"/> --><!-- called here and for fuseaction addcategory -->
		<do action="vForumAdmin.EditCategory" contentvariable="request.page.content" append="true"/>
	</fuseaction>
	
	<fuseaction name="Action_Category">
	<!--@FuseAction: Action_Category: I process the add/edit forum form -->
		<set name="request.page.subtitle" value="Action Forum"/>
		<set name="request.page.description" value="I process the add/edit forum form"/>

		<!-- <include template="qry_allsites.cfm"/> -->
		<do action="mForumAdmin.Sites"/>
		<!-- <include template="qry_allsitecategories.cfm"/> -->
		<do action="mForumAdmin.SiteForums"/>
		<!-- <include template="act_updatecategory.cfm"/> --><!-- only place called -->
		<do action="mForumAdmin.Action_Category"/>
		<!-- <include template="act_updatesitecategories.cfm"/> --><!-- only place called -->
		<do action="mForumAdmin.Action_SiteCategories"/>

		<xfa name="Continue" value="ForumAdmin.categories"/>
		<include template="url_continue.cfm"/>
	</fuseaction>
	
	<fuseaction name="DeleteCategory">
	<!--@FuseAction: DeleteCategory: I display a form to alow a forum to be chosen for deletion -->
		<set name="request.page.subtitle" value="Delete Forum"/>
		<set name="request.page.description" value="I display a form to alow a forum to be chosen for deletion"/>

		<!-- <include template="qry_categorylist.cfm"/> --><!-- called here and for fuseaction MoveThisThread -->
		<do action="mForumAdmin.OtherCategories"/>

		<xfa name="Save" value="ForumAdmin.Action_DeleteCategory"/>
		<!-- <include template="dsp_deletecatoptions.cfm" append="true" contentvariable="request.page.content"/> --><!-- only place called -->
		<do action="vForumAdmin.DeleteCategory" contentvariable="request.page.content" append="true"/>
	</fuseaction>
	
	<fuseaction name="Action_DeleteCategory">
	<!--@FuseAction: Action_DeleteCategory: I delete a forum -->
		<set name="request.page.subtitle" value="Action Delete Forum"/>
		<set name="request.page.description" value="I delete a forum"/>

		<!-- <include template="act_deletecategory.cfm"/> --><!-- only place called -->
		<do action="mForumAdmin.Action_DeleteCategory"/>

		<xfa name="Continue" value="ForumAdmin.Categories"/>
		<include template="url_continue.cfm"/>
	</fuseaction>
	
	<fuseaction name="CatModerators">
	<!--@FuseAction: CatModerators: I display a form with the forum moderators -->
		<set name="request.page.subtitle" value="Forum Moderators"/>
		<set name="request.page.description" value="I display a form with the forum moderators"/>

		<!-- <include template="qry_categorymoderators.cfm"/> --><!-- only place called -->
		<do action="mForumAdmin.CatModerators"/>

		<xfa name="Save" value="ForumAdmin.Action_CategoryModerator"/>
		<!-- <include template="dsp_categorymoderators.cfm" append="true" contentvariable="request.page.content"/> --><!-- only place called -->
		<do action="vForumAdmin.CatModerators" contentvariable="request.page.content" append="true"/>
	</fuseaction>
	
	<fuseaction name="Action_CategoryModerator">
	<!--@FuseAction: Action_CategoryModerator: I process the forum moderators form -->
		<set name="request.page.subtitle" value="Action Forum Moderator"/>
		<set name="request.page.description" value="I process the forum moderators form"/>

		<!-- <include template="act_postcategorymoderator.cfm"/> --><!-- only place called -->
		<do action="mForumAdmin.Action_CategoryModerator"/>

		<xfa name="Continue" value="ForumAdmin.CatModerators"/>
		<include template="url_continue.cfm"/>
	</fuseaction>
	
	<fuseaction name="ChooseCategory">
	<!--@FuseAction: ChooseCategory: I display a form allowing a forum to be selected -->
		<set name="request.page.subtitle" value="Choose Forum"/>
		<set name="request.page.description" value="I display a form allowing a forum to be selected"/>

		<!-- <include template="qry_moderatorcategories.cfm"/> --><!-- only place called -->
		<do action="mForumAdmin.ChooseCategory"/>

		<xfa name="ChooseThread" value="ForumAdmin.ChooseThread"/>
		<!-- <include template="dsp_choosecategory.cfm" append="true" contentvariable="request.page.content"/> --><!-- only place called -->
		<do action="vForumAdmin.ChooseCategory" contentvariable="request.page.content" append="true"/>
	</fuseaction>
	
	<!-- ======================================================================================= -->
	<!--  Settings                                                                               -->
	<!-- ======================================================================================= -->
	<fuseaction name="Settings">
	<!--@FuseAction: Settings: I show a form for the Admin-level user to alter the main Forum settings -->
		<set name="request.page.subtitle" value="Settings"/>
		<set name="request.page.description" value="I show a form for the Admin-level user to alter the main Forum settings"/>
		
		<!-- <include template="qry_mainsettings.cfm"/> --><!-- called here and for fuseactions cache, etc. -->
		<do action="mForumAdmin.Settings"/>

		<xfa name="Save" value="ForumAdmin.Action_Settings"/>
		<!-- <include template="dsp_mainsettings.cfm" append="true" contentvariable="request.page.content"/> --><!-- only place called -->
		<do action="vForumAdmin.Settings" contentvariable="request.page.content" append="true"/>
	</fuseaction>

	<fuseaction name="Action_Settings">
	<!--@FuseAction: Action_Settings: I make the changes -->
		<set name="request.page.subtitle" value="Action Settings"/>
		<set name="request.page.description" value="I make the changes"/>
		
		<!-- <include template="act_mainsettings.cfm"/> --><!-- only place called -->
		<do action="mForumAdmin.Action_Settings"/>

		<xfa name="Continue" value="ForumAdmin.Settings"/>
		<include template="url_continue.cfm"/>
	</fuseaction>

	<fuseaction name="Archive">
	<!--@FuseAction: Archive: I display a form with the archive settings -->
		<set name="request.page.subtitle" value="Archive"/>
		<set name="request.page.description" value="I display a form with the archive settings"/>

		<!-- <include template="qry_mainsettings.cfm"/> --><!-- called here and for fuseactions cache, etc. -->
		<do action="mForumAdmin.Settings"/>

		<xfa name="Save" value="ForumAdmin.Action_Archive"/>
		<!-- <include template="dsp_archive.cfm" append="true" contentvariable="request.page.content"/> --><!-- only place called -->
		<do action="vForumAdmin.Archive" contentvariable="request.page.content" append="true"/>
	</fuseaction>
	
	<fuseaction name="Action_Archive">
	<!--@FuseAction: Action_Archive: I process the archive settings form -->
		<set name="request.page.subtitle" value="Action Archive"/>
		<set name="request.page.description" value="I process the archive settings form"/>

		<!-- <include template="act_postarchive.cfm"/> --><!-- only place called -->
		<do action="mForumAdmin.Action_Archive"/>

		<xfa name="Continue" value="ForumAdmin.archive"/>
		<include template="url_continue.cfm"/>
	</fuseaction>
	
	<fuseaction name="Cache">
	<!--@FuseAction: Cache: I display a form with the cache settings -->
		<set name="request.page.subtitle" value="Cache"/>
		<set name="request.page.description" value="I display a form with the cache settings"/>

		<!-- <include template="qry_mainsettings.cfm"/> --><!-- called here and for fuseactions archive, etc. -->
		<do action="mForumAdmin.Settings"/>

		<xfa name="Save" value="ForumAdmin.Action_Cache"/>
		<!-- <include template="dsp_caching.cfm" append="true" contentvariable="request.page.content"/> --><!-- only place called -->
		<do action="vForumAdmin.Cache" contentvariable="request.page.content" append="true"/>
	</fuseaction>
	
	<fuseaction name="Action_Cache">
	<!--@FuseAction: Action_Cache: I process the cache settings form -->
		<set name="request.page.subtitle" value="Action Cache"/>
		<set name="request.page.description" value="I process the cache settings form"/>

		<!-- <include template="act_postcache.cfm"/> --><!-- only place called -->
		<do action="mForumAdmin.Action_Cache"/>

		<xfa name="Continue" value="ForumAdmin.cache"/>
		<include template="url_continue.cfm"/>
	</fuseaction>
	
	<fuseaction name="Censorship">
	<!--@FuseAction: Censorship: I display a form with the forbidden words -->
		<set name="request.page.subtitle" value="Censorship"/>
		<set name="request.page.description" value="I display a form with the forbidden words"/>

		<!-- <include template="qry_censorship.cfm"/> --><!-- only place called -->
		<do action="mForumAdmin.Censorship"/>

		<xfa name="Save" value="ForumAdmin.Action_Censorship"/>
		<!-- <include template="dsp_censorship.cfm" append="true" contentvariable="request.page.content"/> --><!-- only place called -->
		<do action="vForumAdmin.Censorship" contentvariable="request.page.content" append="true"/>
	</fuseaction>
	
	<fuseaction name="Action_Censorship">
	<!--@FuseAction: Action_Censorship: I process the forbidden words form -->
		<set name="request.page.subtitle" value="Action Censorship"/>
		<set name="request.page.description" value="I process the forbidden words form"/>

		<!-- <include template="act_postcensorship.cfm"/> --><!-- only place called -->
		<do action="mForumAdmin.Action_Censorship"/>

		<xfa name="Continue" value="ForumAdmin.censorship"/>
		<include template="url_continue.cfm"/>
	</fuseaction>
	
	<!-- ======================================================================================= -->
	<!--  Notices                                                                                -->
	<!-- ======================================================================================= -->
	<fuseaction name="Today">
	<!--@FuseAction: Today: I display today stories with option to edit a story -->
		<set name="request.page.subtitle" value="Today"/>
		<set name="request.page.description" value="I display today stories with option to edit a story"/>

		<xfa name="Save" value="ForumAdmin.Action_Today"/>
		<!-- <include template="dsp_addtoday.cfm" append="true" contentvariable="request.page.content"/> --><!-- only place called -->
		<do action="vForumAdmin.Today" contentvariable="request.page.content" append="true"/>

		<xfa name="Edit" value="ForumAdmin.EditToday"/>
		<xfa name="Delete" value="ForumAdmin.Action_DeleteToday"/>
		<!-- <include template="qry_today.cfm"/> --><!-- called here and for fuseaction edittoday -->
		<do action="mForumAdmin.AllToday"/>

		<!-- <include template="dsp_listtoday.cfm" append="true" contentvariable="request.page.content"/> --><!-- called here and for fuseaction edittoday -->
		<do action="vForumAdmin.ListToday" contentvariable="request.page.content" append="true"/>
	</fuseaction>
	
	<fuseaction name="EditToday">
	<!--@FuseAction: EditToday: I display a form to edit a today story -->
		<set name="request.page.subtitle" value="Edit Today"/>
		<set name="request.page.description" value="I display a form to edit a today story"/>

		<!-- <include template="qry_edittoday.cfm"/> --><!-- only place called -->
		<do action="mForumAdmin.ThisToday"/>

		<xfa name="Save" value="ForumAdmin.Action_Today"/>
		<!-- <include template="dsp_edittoday.cfm" append="true" contentvariable="request.page.content"/> --><!-- only place called -->
		<do action="vForumAdmin.EditToday" contentvariable="request.page.content" append="true"/>

		<!-- <include template="qry_today.cfm"/> --><!-- called here and for fuseaction today -->
		<do action="mForumAdmin.AllToday"/>

		<xfa name="Edit" value="ForumAdmin.EditToday"/>
		<xfa name="Delete" value="ForumAdmin.Action_DeleteToday"/>
		<!-- <include template="dsp_listtoday.cfm" append="true" contentvariable="request.page.content"/> --><!-- called here and for fuseaction today -->
		<do action="vForumAdmin.ListToday" contentvariable="request.page.content" append="true"/>
	</fuseaction>
	
	<fuseaction name="Action_Today">
	<!--@FuseAction: Action_Today: I process the Today story form -->
		<set name="request.page.subtitle" value="Action Today"/>
		<set name="request.page.description" value="I process the today story form"/>

		<!-- <include template="act_posttoday.cfm"/> --><!-- only place called -->
		<do action="mForumAdmin.Action_Today"/>

		<xfa name="Continue" value="ForumAdmin.today"/>
		<include template="url_continue.cfm"/>
	</fuseaction>
	
	<fuseaction name="Action_DeleteToday">
	<!--@FuseAction: Action_DeleteToday: I delete the Today story -->
		<set name="request.page.subtitle" value="Action Delete Today"/>
		<set name="request.page.description" value="I delete the today story"/>

		<!-- <include template="act_deletetoday.cfm"/> --><!-- only place called -->
		<do action="mForumAdmin.Action_DeleteToday"/>

		<xfa name="Continue" value="ForumAdmin.today"/>
		<include template="url_continue.cfm"/>
	</fuseaction>
	
	<!-- ======================================================================================= -->
	<!--  Messages                                                                               -->
	<!-- ======================================================================================= -->
	<!-- <fuseaction name="Approval,Home,default"> -->
	<fuseaction name="Approval">
	<!--@FuseAction: Approval: I display a page of messages needing approval -->
		<set name="request.page.subtitle" value="Message Approval"/>
		<set name="request.page.description" value="I display a page of messages needing approval"/>

		<!-- <include template="qry_moderatorapproval.cfm"/> -->
		<do action="mForumAdmin.Approval"/>

		<xfa name="View" value="ForumAdmin.approvethis"/>
		<!-- <include template="dsp_moderatorapproval.cfm" append="true" contentvariable="request.page.content"/> --><!-- only place called -->
		<do action="vForumAdmin.Approval" contentvariable="request.page.content" append="true"/>
	</fuseaction>
	
	<fuseaction name="Home">
	<!--@FuseAction: Approval: I display a page of messages needing approval -->
		<set name="request.page.subtitle" value="Message Approval"/>
		<set name="request.page.description" value="I display a page of messages needing approval"/>

		<!-- <include template="qry_moderatorapproval.cfm"/> -->
		<do action="mForumAdmin.Approval"/>

		<xfa name="View" value="ForumAdmin.approvethis"/>
		<!-- <include template="dsp_moderatorapproval.cfm" append="true" contentvariable="request.page.content"/> --><!-- only place called -->
		<do action="vForumAdmin.Approval" contentvariable="request.page.content" append="true"/>
	</fuseaction>
	
	<fuseaction name="Approvethis">
	<!--@FuseAction: Approvethis: I display a form for message approval -->
		<set name="request.page.subtitle" value="Approvethis"/>
		<set name="request.page.description" value="I display a form for message approval"/>

		<!-- <include template="qry_approvethis.cfm"/> --><!-- called for this fuseaction and for 2 others -->
		<do action="mForumAdmin.Approvethis"/>

		<set name="attributes.heading" value="m e s s a g e #chr(38)#nbsp;#chr(38)#nbsp;a p p r o v a l"/>
		<xfa name="Save" value="ForumAdmin.Action_Approval"/>
		<xfa name="Followon" value="ForumAdmin.Approval"/>
		<!-- <include template="dsp_approvethis.cfm" append="true" contentvariable="request.page.content"/> --><!-- called for this fuseaction and for 2 others -->
		<do action="vForumAdmin.Approvethis" contentvariable="request.page.content" append="true"/>
	</fuseaction>
	
	<fuseaction name="Action_Approval">
	<!--@FuseAction: Action_Approval: I process the message approval form -->
		<set name="request.page.subtitle" value="Action Approval"/>
		<set name="request.page.description" value="I process the message approval form"/>

		<!-- NB attributes.followon is defined at this point -->
		<!-- <include template="act_postapproval.cfm"/> --><!-- only place called -->
		<do action="mForumAdmin.Action_Approval"/>
	</fuseaction>

	<fuseaction name="ChooseMessage">
	<!--@FuseAction: ChooseMessage: I display a form allowing a message to be selected -->
		<set name="request.page.subtitle" value="Choose Message"/>
		<set name="request.page.description" value="I display a form allowing a message to be selected"/>

		<!-- <include template="qry_moderatormessages.cfm"/> --><!-- only place called -->
		<do action="mForumAdmin.ChooseMessage"/>

		<xfa name="Continue" value="ForumAdmin.DeleteThisMessage"/>
		<!-- <include template="dsp_choosemessage.cfm" append="true" contentvariable="request.page.content"/> --><!-- only place called -->
		<do action="vForumAdmin.ChooseMessage" contentvariable="request.page.content" append="true"/>
	</fuseaction>
	
	<fuseaction name="EditMessage">
	<!--@FuseAction: EditMessage: I display a form allowing a message to be edited -->
		<set name="request.page.subtitle" value="Edit Message"/>
		<set name="request.page.description" value="I display a form allowing a message to be edited"/>

		<xfa name="Continue" value="ForumAdmin.ChooseCategory"/>
		<relocate url="#request.baseHREF##request.self#?fuseaction=#XFA.Continue#&amp;goto=m&amp;nextfuseaction=ForumAdmin.EditThisMessage" addtoken="no"/>
	</fuseaction>
	
	<fuseaction name="EditThisMessage">
	<!--@FuseAction: EditThisMessage: I display a form allowing a message to be edited -->
		<set name="request.page.subtitle" value="Edit Message"/>
		<set name="request.page.description" value="I display a form allowing a message to be edited"/>

		<!-- <include template="qry_approvethis.cfm"/> --><!-- called for this fuseaction and for 2 others -->
		<do action="mForumAdmin.Approvethis"/>

		<set name="attributes.heading" value="e d i t #chr(38)#nbsp;#chr(38)#nbsp;m e s s a g e"/>
		<xfa name="Save" value="ForumAdmin.Action_Approval"/>
		<xfa name="Followon" value="ForumAdmin.EditMessage"/>
		<!-- <include template="dsp_approvethis.cfm" append="true" contentvariable="request.page.content"/> --><!-- called for this fuseaction and for 2 others -->
		<do action="vForumAdmin.EditThisMessage" contentvariable="request.page.content" append="true"/>
	</fuseaction>
	
	<fuseaction name="DeleteMessage">
	<!--@FuseAction: DeleteMessage: I take the user to a page where he can choose which forum -->
		<set name="request.page.subtitle" value="Delete Message"/>
		<set name="request.page.description" value="I take the user to a page where he can choose which forum"/>

		<xfa name="Continue" value="ForumAdmin.ChooseCategory"/>
		<relocate url="#request.baseHREF##request.self#?fuseaction=#XFA.Continue#&amp;goto=m&amp;nextfuseaction=ForumAdmin.DeleteThisMessage" addtoken="no"/>
	</fuseaction>
	
	<fuseaction name="DeleteThisMessage">
	<!--@FuseAction: DeleteThisMessage: I display a form identifying a message and allowing it to be deleted -->
		<set name="request.page.subtitle" value="Delete Message"/>
		<set name="request.page.description" value="I display a form identifying a message and allowing it to be deleted"/>

		<!-- <include template="qry_approvethis.cfm"/> --><!-- called for this fuseaction and for 2 others -->
		<do action="mForumAdmin.Approvethis"/>

		<set name="attributes.heading" value="d e l e t e #chr(38)#nbsp;#chr(38)#nbsp;m e s s a g e"/>
		<xfa name="Save" value="ForumAdmin.Action_Approval"/>
		<xfa name="Followon" value="ForumAdmin.deletemessage"/>
		<!-- <include template="dsp_approvethis.cfm" append="true" contentvariable="request.page.content"/> --><!-- called for this fuseaction and for 2 others -->
		<do action="vForumAdmin.DeleteThisMessage" contentvariable="request.page.content" append="true"/>
	</fuseaction>
	
	<!-- ======================================================================================= -->
	<!--  Threads                                                                                -->
	<!-- ======================================================================================= -->
	<fuseaction name="ChooseThread">
	<!--@FuseAction: ChooseThread: I display a form allowing a thread to be selected -->
		<set name="request.page.subtitle" value="Choose Thread"/>
		<set name="request.page.description" value="I display a form allowing a thread to be selected"/>

		<!-- <include template="qry_moderatorthreads.cfm"/> --><!-- only place called -->
		<do action="mForumAdmin.ChooseThread"/>

		<xfa name="ChooseMessage" value="ForumAdmin.ChooseMessage"/>
		<!-- <include template="dsp_choosethread.cfm" append="true" contentvariable="request.page.content"/> --><!-- only place called -->
		<do action="vForumAdmin.ChooseThread" contentvariable="request.page.content" append="true"/>
	</fuseaction>
	
	<fuseaction name="LockThread">
	<!--@FuseAction: LockThread: I set a parameter then go to do the action -->
		<set name="request.page.subtitle" value="Lock Thread"/>
		<set name="request.page.description" value="I set a parameter then go to do the action"/>

		<xfa name="Continue" value="ForumAdmin.ChooseCategory"/>
		<relocate url="#request.baseHREF##request.self#?fuseaction=#XFA.Continue#&amp;goto=t&amp;nextfuseaction=ForumAdmin.LockThisThread&amp;action=1" addtoken="no"/>
	</fuseaction>
	
	<fuseaction name="UnlockThread">
	<!--@FuseAction: UnlockThread: I set a parameter then go to do the action -->
		<set name="request.page.subtitle" value="Unlock Thread"/>
		<set name="request.page.description" value="I set a parameter then go to do the action"/>

		<xfa name="Continue" value="ForumAdmin.ChooseCategory"/>
		<relocate url="#request.baseHREF##request.self#?fuseaction=#XFA.Continue#&amp;goto=t&amp;nextfuseaction=ForumAdmin.LockThisThread&amp;action=0" addtoken="no"/>
	</fuseaction>
	
	<fuseaction name="LockThisThread">
	<!--@FuseAction: LockThisThread: I lock or unlock a thread and display a message that this has been done -->
		<set name="request.page.subtitle" value="Lock Thread"/>
		<set name="request.page.description" value="I lock or unlock a thread and display a message that this has been done"/>

		<!-- <include template="act_lockthisthread.cfm"/> --><!-- only place called -->
		<do action="mForumAdmin.LockThisThread"/>

		<!-- <include template="dsp_threadlocked.cfm" append="true" contentvariable="request.page.content"/> --><!-- only place called -->
		<do action="vForumAdmin.LockThisThread" contentvariable="request.page.content" append="true"/>
	</fuseaction>
	
	<fuseaction name="DeleteThread">
	<!--@FuseAction: DeleteThread: I take the user to a page where he can choose which forum -->
		<set name="request.page.subtitle" value="Delete Thread"/>
		<set name="request.page.description" value="I take the user to a page where he can choose which forum"/>

		<xfa name="Continue" value="ForumAdmin.ChooseCategory"/>
		<relocate url="#request.baseHREF##request.self#?fuseaction=#XFA.Continue#&amp;goto=t&amp;nextfuseaction=ForumAdmin.DeleteThisThread" addtoken="no"/>
	</fuseaction>
	
	<fuseaction name="DeleteThisThread">
	<!--@FuseAction: DeleteThisThread: I display a form identifying a thread and allowing it to be deleted -->
		<set name="request.page.subtitle" value="Delete Thread"/>
		<set name="request.page.description" value="I display a form identifying a thread and allowing it to be deleted"/>

		<!-- <include template="qry_allthread.cfm"/> --><!-- only place called -->
		<do action="mForumAdmin.AllThreads"/>

		<xfa name="Save" value="ForumAdmin.Action_DeleteThread"/>
		<!-- <include template="dsp_deletethisthread.cfm" append="true" contentvariable="request.page.content"/> --><!-- only place called -->
		<do action="vForumAdmin.DeleteThisThread" contentvariable="request.page.content" append="true"/>
	</fuseaction>
	
	<fuseaction name="Action_DeleteThread">
	<!--@FuseAction: Action_DeleteThread: I delete a thread -->
		<set name="request.page.subtitle" value="Action Delete Thread"/>
		<set name="request.page.description" value="I delete a thread"/>

		<!-- <include template="act_postdeletethread.cfm"/> --><!-- only place called -->
		<do action="mForumAdmin.Action_DeleteThread"/>

		<xfa name="Continue" value="ForumAdmin.DeleteThread"/>
		<include template="url_continue.cfm"/>
	</fuseaction>
	
	<fuseaction name="MoveThread">
	<!--@FuseAction: MoveThread: I take the user to a page where he can choose which forum -->
		<set name="request.page.subtitle" value="Move Thread"/>
		<set name="request.page.description" value="I take the user to a page where he can choose which forum"/>

		<xfa name="Continue" value="ForumAdmin.ChooseCategory"/>
		<relocate url="#request.baseHREF##request.self#?fuseaction=#XFA.Continue#&amp;goto=t&amp;nextfuseaction=ForumAdmin.MoveThisThread" addtoken="no"/>
	</fuseaction>
	
	<fuseaction name="MoveThisThread">
	<!--@FuseAction: MoveThisThread: I display a form identifying a thread and allowing it to be moved -->
		<set name="request.page.subtitle" value="Move Thread"/>
		<set name="request.page.description" value="I display a form identifying a thread and allowing it to be moved"/>

		<!-- <include template="qry_categorylist.cfm"/> --><!-- called here and for fuseaction DeleteCategory -->
		<do action="mForumAdmin.OtherCategories"/>

		<xfa name="Save" value="ForumAdmin.Action_MoveThread"/>
		<!-- <include template="dsp_movethread.cfm" append="true" contentvariable="request.page.content"/> --><!-- only place called -->
		<do action="vForumAdmin.MoveThisThread" contentvariable="request.page.content" append="true"/>
	</fuseaction>
	
	<fuseaction name="Action_MoveThread">
	<!--@FuseAction: Action_MoveThread: I move a thread -->
		<set name="request.page.subtitle" value="Action Move Thread"/>
		<set name="request.page.description" value="I move a thread"/>

		<!-- <include template="act_movethread.cfm"/> --><!-- only place called -->
		<do action="mForumAdmin.Action_MoveThread"/>

		<xfa name="Continue" value="ForumAdmin.movethread"/>
		<include template="url_continue.cfm"/>
	</fuseaction>
	
	<fuseaction name="Action_ArchiveThreads">
	<!--@FuseAction: Action_ArchiveThreads: I archive all "dormant" threads in all Forums -->
		<set name="request.page.subtitle" value="Action Archive Threads"/>
		<set name="request.page.description" value="I archive dormant threads"/>

		<!-- <include template="qry_categories.cfm"/> --><!-- returns the query qCategories -->
		<do action="mForumAdmin.Categories"/>
		<!-- <include template="act_archivethreads.cfm"/> --><!-- only place called -->
		<do action="mForumAdmin.Action_ArchiveThreads"/><!-- ends with a <cfabort> -->
	</fuseaction>
	
	<!-- ======================================================================================= -->
	<!--  Banning                                                                                -->
	<!-- ======================================================================================= -->
	<fuseaction name="Ban">
	<!--@FuseAction: Ban: I display a form allowing a user to be banned -->
		<if condition="isDefined('attributes.bantype') AND attributes.bantype IS 'Email'">
			<true>
				<set name="request.page.subtitle" value="Ban by Email"/>
			</true>
			<false>
				<set name="request.page.subtitle" value="Ban by User"/>
			</false>
		</if>
		<set name="request.page.description" value="I display a form allowing a user to be banned"/>

		<!-- <include template="qry_ban.cfm"/> --><!-- only place called -->
		<do action="mForumAdmin.Ban"/>

		<xfa name="Save" value="ForumAdmin.Action_Ban"/>
		<!-- <include template="dsp_ban.cfm" append="true" contentvariable="request.page.content"/> --><!-- only place called -->
		<do action="vForumAdmin.Ban" contentvariable="request.page.content" append="true"/>
	</fuseaction>
	
	<fuseaction name="Action_Ban">
	<!--@FuseAction: Action_Ban: I ban a user -->
		<set name="request.page.subtitle" value="Action Ban"/>
		<set name="request.page.description" value="I ban a user"/>

		<!-- <include template="act_postban.cfm"/> --><!-- only place called -->
		<do action="mForumAdmin.Action_Ban"/>

		<xfa name="Continue" value="ForumAdmin.ban"/>
		<include template="url_continue.cfm"/>
	</fuseaction>
	
	<!-- ======================================================================================= -->
	<!--  Reports                                                                                -->
	<!-- ======================================================================================= -->
	<fuseaction name="ReportOptions">
	<!--@FuseAction: ReportOptions: I display a page allow a choice of report options -->
		<set name="request.page.subtitle" value="Report Options"/>
		<set name="request.page.description" value="I display a page allow a choice of report options"/>

		<!-- <include template="qry_reportoptions.cfm"/> --><!-- only place called -->
		<do action="mForumAdmin.ReportOptions"/>

		<xfa name="All" value="ForumAdmin.AllStats"/>
		<xfa name="Monthly" value="ForumAdmin.MonthlyStats"/>
		<!-- <include template="dsp_reportoptions.cfm" append="true" contentvariable="request.page.content"/> --><!-- only place called -->
		<do action="vForumAdmin.ReportOptions" contentvariable="request.page.content" append="true"/>
	</fuseaction>
	
	<fuseaction name="AllStats">
	<!--@FuseAction: AllStats: I display a page of statistics for the Forum -->
		<set name="request.page.subtitle" value="Forum Stats"/>
		<set name="request.page.description" value="I display a page of statistics for the Forum"/>

		<!-- <include template="qry_forumstats.cfm"/> --><!-- only place called -->
		<do action="mForumAdmin.AllStats"/>

		<!-- <include template="dsp_forumstats.cfm" append="true" contentvariable="request.page.content"/> --><!-- called here and for MonthlyStats -->
		<do action="vForumAdmin.Stats" contentvariable="request.page.content" append="true"/>
	</fuseaction>
	
	<fuseaction name="MonthlyStats">
	<!--@FuseAction: MonthlyStats: I display a page of statistics for the Forum -->
		<set name="request.page.subtitle" value="Monthly Stats"/>
		<set name="request.page.description" value="I display a page of statistics for the Forum"/>

		<!-- <include template="qry_monthlystats.cfm"/> --><!-- only place called -->
		<do action="mForumAdmin.MonthlyStats"/>

		<!-- <include template="dsp_forumstats.cfm" append="true" contentvariable="request.page.content"/> --><!-- called here and for AllStats -->
		<do action="vForumAdmin.Stats" contentvariable="request.page.content" append="true"/>
	</fuseaction>

</circuit>
<!-- 
$Log: circuit.xml.cfm,v $
Revision 1.1  2007/06/15 13:58:56  kevin
Add Admin Modules

Revision 1.12  2006/06/20 16:10:58  mike
delete obsolete fuseactions CatMembers etc.

Revision 1.11  2005/05/26 07:50:54  kevin
Add CVS Info to heading

Revision 1.10  2005/05/12 16:58:20  mike
improve some of the request.page.subtitle values

Revision 1.9  2005/05/03 12:59:04  kevin
Change XFA scope

Revision 1.8  2005/04/29 12:35:52  mike
new fuseaction Action_SiteCategories

Revision 1.7  2005/04/22 17:56:50  mike
include mForumAdmin.Sites & mForumAdmin.SiteForums fuseactions

Revision 1.6  2005/04/20 14:15:58  mike
different interface for Action_ArchiveThreads

Revision 1.5  2005/04/20 11:41:21  mike
new fuseaction Action_ArchiveThreads

Revision 1.4  2005/03/29 15:41:19  mike
call fuseactions in mForumAdmin (not mForum)

Revision 1.3  2005/03/15 12:28:04  mike
many edits, to make it tie in with model/mForum

Revision 1.2  2005/03/10 17:40:27  mike
ongoing edits to make MVC version

Revision 1.1  2005/03/09 13:49:11  mike
Moved to create MVC version

Revision 1.2  2005/03/07 16:46:54  mike
add <postfuseaction callsuper="false"> to call fbx_layouts.cfm, etc.

Revision 1.1  2005/03/04 10:59:03  mike
new file for FB4 version

Revision 1.10  2005/02/25 11:26:44  mike
added <cfsilent/>s

Revision 1.9  2005/02/10 17:13:22  mike
replace <cflocation/> in act_xxx.cfm files by call of url_continue.cfm

Revision 1.8  2005/02/10 12:35:12  mike
reorder fuseactions, etc.

Revision 1.7  2005/02/09 17:26:16  mike
bug fix: add #chr(38)#action=1; add comments

Revision 1.6  2005/02/08 17:22:01  mike
removed fuseaction LHNav, corrected the <cflocation/>s for fuseactions EditMessage etc.

Revision 1.5  2005/02/08 15:04:04  mike
add call of qry_categoryform.cfm

Revision 1.4  2005/02/08 13:50:24  mike
new fuseactions Settings and Action_Settings

Revision 1.3  2005/02/07 18:18:58  mike
set attributes.action for dsp_categoryform.cfm

Revision 1.2  2005/02/07 15:56:06  mike
new fuseaction Action_DeleteToday, etc. etc.

Revision 1.1  2005/02/04 19:56:50  mike
FB3 version made from wireframe with fusebuilder, with contents pasted from FB2 version, fbx_switch fully commented, and XFA usage improved throughout
-->
