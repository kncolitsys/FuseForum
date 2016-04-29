<circuit access="internal">
<!-- (c)2005 Objective Internet Limited. -->
<!-- $RCSfile: circuit.xml.cfm,v $ -->
<!-- $Revision: 1.1 $ -->
<!-- $Date: 2007/06/15 13:59:05 $ -->
<!-- $Author: kevin $ -->
	<prefuseaction callsuper="false">
		<include template="..\mForum\fbx_settings.cfm" /><!-- to ensure DAO and Gateway objects have been set up -->
		<include template="fbx_settings.cfm" />
	</prefuseaction>
	
	<postfuseaction callsuper="false">
	</postfuseaction>

	<!-- ======================================================================================= -->
    <!--  Sites & Forums                                                                         -->
	<!-- ======================================================================================= -->
	<fuseaction name="Sites">
	<!--@FuseAction: Sites: I get all the Sites -->
		<include template="qry_allsites.cfm"/>
	</fuseaction>
	
	<fuseaction name="SiteForums">
	<!--@FuseAction: SiteForums: I get all the Forums for all the Sites -->
		<include template="qry_allsitecategories.cfm"/>
	</fuseaction>
	
	<fuseaction name="Action_SiteCategories">
	<!--@FuseAction: Action_SiteCategories: I process the add/edit forum form -->
		<include template="act_updatesitecategories.cfm"/><!-- only place called -->
	</fuseaction>
	
	<!-- ======================================================================================= -->
    <!--  Forums (=categories)                                                                   -->
	<!-- ======================================================================================= -->
	<fuseaction name="Categories">
	<!--@FuseAction: Categories: I get all the Forums -->
		<include template="qry_categories.cfm"/>
	</fuseaction>
	
	<fuseaction name="CategoryDetails">
	<!--@FuseAction: CategoryDetails: I get details of the given forum -->
		<include template="qry_categoryform.cfm"/><!-- only place called -->
	</fuseaction>
	
	<fuseaction name="Action_Category">
	<!--@FuseAction: Action_Category: I process the add/edit forum form -->
		<include template="act_updatecategory.cfm"/><!-- only place called -->
	</fuseaction>
	
	<fuseaction name="OtherCategories">
	<!--@FuseAction: OtherCategories: I get all forums other than the given one -->
		<include template="qry_categorylist.cfm"/><!-- called here and for fuseaction MoveThisThread -->
	</fuseaction>
	
	<fuseaction name="Action_DeleteCategory">
	<!--@FuseAction: Action_DeleteCategory: I delete a forum -->
		<include template="act_deletecategory.cfm"/><!-- only place called -->
	</fuseaction>
	
	<fuseaction name="CatModerators">
	<!--@FuseAction: CatModerators: I get all the moderators for the given forum -->
		<include template="qry_categorymoderators.cfm"/><!-- only place called -->
	</fuseaction>
	
	<fuseaction name="Action_CategoryModerator">
	<!--@FuseAction: Action_CategoryModerator: I process the forum moderators form -->
		<include template="act_postcategorymoderator.cfm"/><!-- only place called -->
	</fuseaction>
	
	<fuseaction name="ChooseCategory">
	<!--@FuseAction: ChooseCategory: I find all forums of which the user is a moderator -->
		<include template="qry_moderatorcategories.cfm"/><!-- only place called -->
	</fuseaction>
	
	<!-- ======================================================================================= -->
	<!--  Settings                                                                               -->
	<!-- ======================================================================================= -->
	<fuseaction name="Settings">
	<!--@FuseAction: Settings: I get the current parameters for the Forums system -->
		<include template="qry_mainsettings.cfm"/><!-- called here and for fuseactions cache, etc. -->
	</fuseaction>

	<fuseaction name="Action_Settings">
	<!--@FuseAction: Action_Settings: I update the settings fields of the Forums system -->
		<include template="act_mainsettings.cfm"/><!-- only place called -->
	</fuseaction>

	<fuseaction name="Action_Archive">
	<!--@FuseAction: Action_Archive: I process the archive settings form -->
		<include template="act_postarchive.cfm"/><!-- only place called -->
	</fuseaction>
	
	<fuseaction name="Action_Cache">
	<!--@FuseAction: Action_Cache: I process the cache settings form -->
		<include template="act_postcache.cfm"/><!-- only place called -->
	</fuseaction>
	
	<fuseaction name="Censorship">
	<!--@FuseAction: Censorship: I get the censorship parameters for the Forums system -->
		<include template="qry_censorship.cfm"/><!-- only place called -->
	</fuseaction>
	
	<fuseaction name="Action_Censorship">
	<!--@FuseAction: Action_Censorship: I process the forbidden words form -->
		<include template="act_postcensorship.cfm"/><!-- only place called -->
	</fuseaction>
	
	<!-- ======================================================================================= -->
	<!--  Notices                                                                                -->
	<!-- ======================================================================================= -->
	<fuseaction name="AllToday">
	<!--@FuseAction: AllToday: I get the Today notices -->
		<include template="qry_today.cfm"/><!-- called here and for fuseaction edittoday -->
	</fuseaction>
	
	<fuseaction name="ThisToday">
	<!--@FuseAction: ThisToday: I get the given Today notice -->
		<include template="qry_edittoday.cfm"/><!-- only place called -->
	</fuseaction>
	
	<fuseaction name="Action_Today">
	<!--@FuseAction: Action_Today: I process the Today story form -->
		<include template="act_posttoday.cfm"/><!-- only place called -->
	</fuseaction>
	
	<fuseaction name="Action_DeleteToday">
	<!--@FuseAction: Action_DeleteToday: I delete the Today story -->
		<include template="act_deletetoday.cfm"/><!-- only place called -->
	</fuseaction>
	
	<!-- ======================================================================================= -->
	<!--  Messages                                                                               -->
	<!-- ======================================================================================= -->
	<fuseaction name="Approval">
	<!--@FuseAction: Approval: I get any threads and messages needing approval -->
		<include template="qry_moderatorapproval.cfm"/><!-- only place called -->
	</fuseaction>
	
	<fuseaction name="Approvethis">
	<!--@FuseAction: Approvethis: I get details of a thread or message -->
		<include template="qry_approvethis.cfm"/><!-- called for this fuseaction and for 2 others -->
	</fuseaction>
	
	<fuseaction name="Action_Approval">
	<!--@FuseAction: Action_Approval: I process the message approval form -->
		<!-- NB attributes.followon is defined at this point -->
		<include template="act_postapproval.cfm"/><!-- only place called -->
	</fuseaction>

	<fuseaction name="ChooseMessage">
	<!--@FuseAction: ChooseMessage: I display a form allowing a message to be selected -->
		<include template="qry_moderatormessages.cfm"/><!-- only place called -->
	</fuseaction>
	
	<!-- ======================================================================================= -->
	<!--  Threads                                                                                -->
	<!-- ======================================================================================= -->
	<fuseaction name="ChooseThread">
	<!--@FuseAction: ChooseThread: I display a form allowing a thread to be selected -->
		<include template="qry_moderatorthreads.cfm"/><!-- only place called -->
	</fuseaction>
	
	<fuseaction name="LockThisThread">
	<!--@FuseAction: LockThisThread: I lock or unlock a thread and display a message that this has been done -->
		<include template="act_lockthisthread.cfm"/><!-- only place called -->
	</fuseaction>
	
	<fuseaction name="AllThreads">
	<!--@FuseAction: AllThreads: I get details of all threads -->
		<include template="qry_allthread.cfm"/><!-- only place called -->
	</fuseaction>
	
	<fuseaction name="Action_DeleteThread">
	<!--@FuseAction: Action_DeleteThread: I delete a thread -->
		<include template="act_postdeletethread.cfm"/><!-- only place called -->
	</fuseaction>
	
	<fuseaction name="Action_MoveThread">
	<!--@FuseAction: Action_MoveThread: I move a thread -->
		<include template="act_movethread.cfm"/><!-- only place called -->
	</fuseaction>
	
	<fuseaction name="Action_ArchiveThreads">
	<!--@FuseAction: Action_ArchiveThreads: I archive all "dormant" threads in all Forums -->
		<include template="act_archivethreads.cfm"/><!-- only place called --><!-- ends with a <cfabort> -->
	</fuseaction>
	
	<!-- ======================================================================================= -->
	<!--  Banning                                                                                -->
	<!-- ======================================================================================= -->
	<fuseaction name="Ban">
	<!--@FuseAction: Ban: I display a form allowing a user to be banned -->
		<include template="qry_ban.cfm"/><!-- only place called -->
	</fuseaction>
	
	<fuseaction name="Action_Ban">
	<!--@FuseAction: Action_Ban: I ban a user -->
		<include template="act_postban.cfm"/><!-- only place called -->
	</fuseaction>
	
	<!-- ======================================================================================= -->
	<!--  Reports                                                                                -->
	<!-- ======================================================================================= -->
	<fuseaction name="ReportOptions">
	<!--@FuseAction: ReportOptions: I get info from the settings table -->
		<include template="qry_reportoptions.cfm"/><!-- only place called -->
	</fuseaction>
	
	<fuseaction name="AllStats">
	<!--@FuseAction: AllStats: I get various counts of threads and messages -->
		<include template="qry_forumstats.cfm"/><!-- only place called -->
	</fuseaction>
	
	<fuseaction name="MonthlyStats">
	<!--@FuseAction: MonthlyStats: I get various counts of threads and messages for the given month -->
		<include template="qry_monthlystats.cfm"/><!-- only place called -->
	</fuseaction>

</circuit>
<!-- 
$Log: circuit.xml.cfm,v $
Revision 1.1  2007/06/15 13:59:05  kevin
Add Admin Modules

Revision 1.8  2006/06/20 16:10:31  mike
delete obsolete fuseactions CatMembers etc.

Revision 1.7  2005/05/26 07:51:02  kevin
Add CVS Info to heading

Revision 1.6  2005/04/29 12:36:13  mike
new fuseaction Action_SiteCategories

Revision 1.5  2005/04/22 17:57:30  mike
include Sites & SiteForums fuseactions

Revision 1.4  2005/04/20 11:40:27  mike
new fuseaction Action_ArchiveThreads

Revision 1.3  2005/03/31 17:10:08  mike
include the mForum fbx_settings.cfm too

Revision 1.2  2005/03/31 14:36:42  mike
include fbx_settings.cfm

Revision 1.1  2005/03/29 13:28:26  mike
files moved from mForum

Revision 1.2  2005/03/15 12:27:25  mike
many edits, to make it tie in with controller/ForumAdmin

Revision 1.1  2005/03/10 17:40:01  mike
ongoing edits to make MVC version
-->
