<circuit access="internal">

	<prefuseaction callsuper="false">
	</prefuseaction>
	
	<postfuseaction callsuper="false">
	</postfuseaction>

	<!-- ======================================================================================= -->
    <!--  Forums/categories                                                                      -->
	<!-- ======================================================================================= -->
	<fuseaction name="Categories">
	<!--@FuseAction: Categories: I display a page with all the forums -->
		<include template="dsp_categories.cfm"/><!-- only place called -->
	</fuseaction>
	
	<fuseaction name="AddCategory">
	<!--@FuseAction: AddCategory: I display a form for adding a new forum -->
		<include template="dsp_categoryform.cfm"/><!-- called here and for fuseaction editcategory -->
	</fuseaction>
	
	<fuseaction name="EditCategory">
	<!--@FuseAction: EditCategory: I display a form for editing an existing forum -->
		<include template="dsp_categoryform.cfm"/><!-- called here and for fuseaction addcategory -->
	</fuseaction>
	
	<fuseaction name="DeleteCategory">
	<!--@FuseAction: DeleteCategory: I display a form to alow a forum to be chosen for deletion -->
		<include template="dsp_deletecatoptions.cfm"/><!-- only place called -->
	</fuseaction>
	
	<fuseaction name="CatModerators">
	<!--@FuseAction: CatModerators: I display a form with the forum moderators -->
		<include template="dsp_categorymoderators.cfm"/><!-- only place called -->
	</fuseaction>
	
	<fuseaction name="ChooseCategory">
	<!--@FuseAction: ChooseCategory: I display a form allowing a forum to be selected -->
		<include template="dsp_choosecategory.cfm"/><!-- only place called -->
	</fuseaction>
	
	<!-- ======================================================================================= -->
	<!--  Settings                                                                               -->
	<!-- ======================================================================================= -->
	<fuseaction name="Settings">
	<!--@FuseAction: Settings: I show a form for the Admin-level user to alter the main Forum settings -->
		<include template="dsp_mainsettings.cfm"/><!-- only place called -->
	</fuseaction>

	<fuseaction name="Archive">
	<!--@FuseAction: Archive: I display a form with the archive settings -->
		<include template="dsp_archive.cfm"/><!-- only place called -->
	</fuseaction>
	
	<fuseaction name="Cache">
	<!--@FuseAction: Cache: I display a form with the cache settings -->
		<include template="dsp_caching.cfm"/><!-- only place called -->
	</fuseaction>
	
	<fuseaction name="Censorship">
	<!--@FuseAction: Censorship: I display a form with the forbidden words -->
		<include template="dsp_censorship.cfm"/><!-- only place called -->
	</fuseaction>
	
	<!-- ======================================================================================= -->
	<!--  Notices                                                                                -->
	<!-- ======================================================================================= -->
	<fuseaction name="Today">
	<!--@FuseAction: Today: I display a form to add a today story -->
		<include template="dsp_addtoday.cfm"/><!-- only place called -->
	</fuseaction>
	
	<fuseaction name="EditToday">
	<!--@FuseAction: EditToday: I display a form to edit a today story -->
		<include template="dsp_edittoday.cfm"/><!-- only place called -->
	</fuseaction>
	
	<fuseaction name="ListToday">
	<!--@FuseAction: ListToday: I display today stories -->
		<include template="dsp_listtoday.cfm"/><!-- called here and for fuseaction today -->
	</fuseaction>
	
	<!-- ======================================================================================= -->
	<!--  Messages                                                                               -->
	<!-- ======================================================================================= -->
	<fuseaction name="Approval">
	<!--@FuseAction: Approval: I display a page of messages needing approval -->
		<include template="dsp_moderatorapproval.cfm"/><!-- only place called -->
	</fuseaction>
	
	<fuseaction name="Approvethis">
	<!--@FuseAction: Approvethis: I display a form for message approval -->
		<include template="dsp_approvethis.cfm"/><!-- called for this fuseaction and for 2 others -->
	</fuseaction>
	
	<fuseaction name="ChooseMessage">
	<!--@FuseAction: ChooseMessage: I display a form allowing a message to be selected -->
		<include template="dsp_choosemessage.cfm"/><!-- only place called -->
	</fuseaction>
	
	<fuseaction name="EditThisMessage">
	<!--@FuseAction: EditThisMessage: I display a form allowing a message to be edited -->
		<include template="dsp_approvethis.cfm"/><!-- called for this fuseaction and for 2 others -->
	</fuseaction>
	
	<fuseaction name="DeleteThisMessage">
	<!--@FuseAction: DeleteThisMessage: I display a form identifying a message and allowing it to be deleted -->
		<include template="dsp_approvethis.cfm"/><!-- called for this fuseaction and for 2 others -->
	</fuseaction>
	
	<!-- ======================================================================================= -->
	<!--  Threads                                                                                -->
	<!-- ======================================================================================= -->
	<fuseaction name="ChooseThread">
	<!--@FuseAction: ChooseThread: I display a form allowing a thread to be selected -->
		<include template="dsp_choosethread.cfm"/><!-- only place called -->
	</fuseaction>
	
	<fuseaction name="LockThisThread">
	<!--@FuseAction: LockThisThread: I lock or unlock a thread and display a message that this has been done -->
		<include template="dsp_threadlocked.cfm"/><!-- only place called -->
	</fuseaction>
	
	<fuseaction name="DeleteThisThread">
	<!--@FuseAction: DeleteThisThread: I display a form identifying a thread and allowing it to be deleted -->
		<include template="dsp_deletethisthread.cfm"/><!-- only place called -->
	</fuseaction>
	
	<fuseaction name="MoveThisThread">
	<!--@FuseAction: MoveThisThread: I display a form identifying a thread and allowing it to be moved -->
		<include template="dsp_movethread.cfm"/><!-- only place called -->
	</fuseaction>
	
	<!-- ======================================================================================= -->
	<!--  Banning                                                                                -->
	<!-- ======================================================================================= -->
	<fuseaction name="Ban">
	<!--@FuseAction: Ban: I display a form allowing a user to be banned -->
		<include template="dsp_ban.cfm"/><!-- only place called -->
	</fuseaction>
	
	<!-- ======================================================================================= -->
	<!--  Reports                                                                                -->
	<!-- ======================================================================================= -->
	<fuseaction name="ReportOptions">
	<!--@FuseAction: ReportOptions: I display a page allow a choice of report options -->
		<include template="dsp_reportoptions.cfm"/><!-- only place called -->
	</fuseaction>
	
	<fuseaction name="Stats">
	<!--@FuseAction: Stats: I display a page of statistics for the Forum -->
		<include template="dsp_forumstats.cfm"/><!-- called here and for MonthlyStats -->
	</fuseaction>
	
	<!-- ======================================================================================= -->
	<!-- NB the following 2 fuseactions can never be activated because visible to Members not supported -->
	<!-- ======================================================================================= -->
	<fuseaction name="CatMembers">
	<!--@FuseAction: CatMembers: I display a form allowing members to be added to/removed from a forum -->
		<include template="dsp_catmembers.cfm"/><!-- only place called -->
	</fuseaction>
	
</circuit>
<!-- 
$Log: circuit.xml.cfm,v $
Revision 1.1  2007/06/15 13:59:14  kevin
Add Admin Modules

Revision 1.2  2005/03/10 17:40:01  mike
ongoing edits to make MVC version

Revision 1.1  2005/03/10 12:40:27  mike
initial version
-->
