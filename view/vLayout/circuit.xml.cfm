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
	
	<fuseaction name="Page_Layout">
		<!-- The following are only for when the user is not logged in -->
		<xfa name="Register" value="CRLogin.Register1" />
		<xfa name="Login" value="CRLogin.Login" />
		<!-- <xfa name="Resend_Password" value="Login.ForgotPassword" /> -->
		<!-- The following are only for when the user is logged in -->
		<xfa name="ForumsMyMessages" value="For.today" />
		<xfa name="Edit_Details" value="CRLogin.Details_Edit1" />
		<xfa name="ForumsMySubscriptions" value="For.Subscriptions" />
		<xfa name="Logout" value="CRLogin.Action_Logout" />
		<!-- The following are for all users -->
		<xfa name="Home" value="Home.Home" />
		<xfa name="SearchResults" value="Search.SearchResults" />
		<xfa name="AdvancedSearch" value="Search.AdvancedSearch" />
		<xfa name="Advertising_and_Business" value="Home.Advertising_and_Business" />
		<xfa name="Privacy_Policy" value="Home.Privacy_Policy" />
		<xfa name="About_this_Site" value="Home.About_this_Site" />
		<xfa name="Contact_Us" value="Home.Contact_Us" />
		<set name="request.tagPosition" value="0" />
  		
		<!-- <include template="dsp_LoginForm_JS.cfm" /> -->
		<!-- <include template="dsp_AdminMenu_JS.cfm" /> -->
		<include template="udf_evaluateVariables.cfm" />
		<include template="dsp_page.cfm" />
	</fuseaction>
<!-- 
$Log: circuit.xml.cfm,v $
Revision 1.2  2007/06/14 14:01:47  kevin
Initial Open Source Version

 -->
</circuit>

