<!--- -->
<fusedoc fuse="FBX_Settings.cfm">
	<responsibilities>
		I set up the environment settings for this circuit. 
		If this settings file is being inherited, then you can use CFSET to override a value 
		set in a parent circuit or CFPARAM to accept a value set by a parent circuit.
	</responsibilities>
	<properties>
		<history 
			author="Mike Oakes" 
			email="Mike@objectiveinternet.com" 
			date="3-Feb-2005" 
			role="architect"
			type="create"/>
		<property name="copyright" value="(c)2000-2005 Objective Internet Limited."/>
		<property name="licence" value="See licence.txt"/>
		<property name="version" value="3.00"/>
	</properties>
	<io>
		<in>
			<string name="ForumDSN" scope="request" />
			<number name="userid" scope="request" />
		</in>
		<out>
			<boolean name="userismod" scope="client or session" comments="not currently used" />
			<boolean name="userisadmin" scope="client or session" />
		</out>
	</io>
</fusedoc>
--->

<cfscript>
	request.textcolor2 = "000000";
	
	request.forumsname = "RFU Forum";
	request.forumsurl = "www.RFU.com";
	request.subscriptionEmail = "Forums@RFU.com";
</cfscript>

<!--- 
	TODO: The following lines are temporary and set the current user as both admin and moderator
		  later I will add login and permission handling using CF Security features.
 --->

<cfset request.persist.userismod = 1>
<cfset request.persist.userisadmin = 1>

<!--- 
$Log: fbx_Settings.cfm,v $
Revision 1.1  2007/06/15 13:58:56  kevin
Add Admin Modules

Revision 1.2  2006/06/20 16:09:01  mike
set persistent variables userisadmin and userismod

Revision 1.1  2005/03/09 13:51:46  mike
Moved to create MVC version

Revision 1.2  2005/02/07 15:49:50  mike
add a few more request variable settings

Revision 1.1  2005/02/04 19:56:50  mike
FB3 version made from wireframe with fusebuilder, with contents pasted from FB2 version, fbx_switch fully commented, and XFA usage improved throughout

Revision 1.1  2005/02/04 11:07:49  mike
FB3 version made from wireframe with fusebuilder, with contents pasted from FB2 version, then fusedocs improved, fuseaction names rationalised and XFA usage improved throughout

 --->
