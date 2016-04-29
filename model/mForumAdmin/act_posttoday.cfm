<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="act_posttoday.cfm">
	<responsibilities>
		I insert or update a Today notice
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
			<number name="postid" scope="attributes" optional="Yes" />
			<string name="posttitle" scope="attributes" />
			<string name="post" scope="attributes" />
			<datetime name="postdate" scope="attributes" />
			<datetime name="dateexpires" scope="attributes" />
		</in>
		<out>
		</out>
	</io>
</fusedoc>
--->

<cfparam name="attributes.posttitle" default="">
<cfparam name="attributes.post" default="">
<cfparam name="attributes.postdate" default="">
<cfparam name="attributes.dateexpires" default="">
<!--- <cf_formatinput 
	input="#attributes.post#"
	r_output="attributes.post"
	function="in"
	replacetags="false"> --->
<cfmodule template="/FuseForum/tags/formatinput/formatinput.cfm"
	input="#attributes.post#"
	r_output="attributes.post"
	function="in"
	replacetags="false">

<cfif Len(attributes.postdate)>
	<cfset attributes.postdate=createdate(listlast(attributes.postdate,"/"),listgetat(attributes.postdate,2,"/"),listfirst(attributes.postdate,"/"))>
<cfelse>
	<cfset attributes.postdate=now()>
</cfif>

<cfif Len(attributes.dateexpires)>
	<cfset attributes.dateexpires=createdate(listlast(attributes.dateexpires,"/"),listgetat(attributes.dateexpires,2,"/"),listfirst(attributes.dateexpires,"/"))>	
</cfif>

<cfif isDefined("attributes.postid")>
	<cfset oToday=createObject("component","FuseForum.model.mForum.today").init()>
	<cfset temp=Application.ao__AppObj_mForum_today_DAO.read(oToday,attributes.postid)>
	<cfset temp=oToday.setPosttitle(PreserveSingleQuotes(attributes.posttitle))>
	<cfset temp=oToday.setPost(attributes.post)>
	<cfset temp=oToday.setPostdate(attributes.postdate)>
	<cfset temp=oToday.setDateexpires(attributes.dateexpires)>
	<cfset temp=Application.ao__AppObj_mForum_today_DAO.update(oToday)>
<cfelse>
	<cfset attributes.postid=Application.ao__AppObj_mForumAdmin_ForumAdmin_Facade.fInsertToday(
		attributes.posttitle,attributes.post,
		attributes.postdate,attributes.dateexpires
		)>
</cfif>

<!--- 
$Log: act_posttoday.cfm,v $
Revision 1.1  2007/06/15 13:59:05  kevin
Add Admin Modules

Revision 1.10  2006/08/11 12:52:26  mike
change cfc objects from Server to Application scope

Revision 1.9  2006/08/01 10:56:50  mike
correct the naming convention for the ForumAdmin_Facade.cfc object

Revision 1.8  2006/07/31 15:43:24  kevin
Remove old SQL

Revision 1.7  2006/06/23 17:19:56  mike
new naming convention for cfc objects

Revision 1.6  2005/09/05 15:47:31  kevin
Change DSN for forums.

Revision 1.5  2005/05/21 15:26:34  mike
correct path for ForumAdmin_Facade

Revision 1.4  2005/05/20 12:33:38  kevin
New server cfc naming convention

Revision 1.3  2005/05/11 10:41:17  kevin
Rename from MVC conversion

Revision 1.2  2005/04/07 14:31:09  mike
changed to call Facade/Gateway/DAO cfc's

Revision 1.1  2005/03/29 13:28:26  mike
files moved from mForum

Revision 1.2  2005/03/10 17:34:02  mike
change path to customtags

Revision 1.1  2005/03/09 13:49:09  mike
Moved to create MVC version

Revision 1.7  2005/02/24 13:57:28  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.6  2005/02/23 17:16:48  mike
small edits to code layout

Revision 1.5  2005/02/10 17:12:59  mike
replace <cflocation> by call of url_continue.cfm in fbx_switch.cfm

Revision 1.4  2005/02/10 13:33:21  mike
replace <cf_formatinput > by <cfmodule> call

Revision 1.3  2005/02/09 11:59:08  mike
replace <cfinsert> by <cfquery>INSERT; improve fusedoc

Revision 1.2  2005/02/07 15:54:34  mike
removed the test for isDefined("attributes.add")

Revision 1.1  2005/02/04 19:56:49  mike
FB3 version made from wireframe with fusebuilder, with contents pasted from FB2 version, fbx_switch fully commented, and XFA usage improved throughout
--->
</cfsilent>
