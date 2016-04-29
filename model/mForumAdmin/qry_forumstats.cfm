<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="qry_forumstats.cfm">
	<responsibilities>
		I get various counts of threads and messages
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
		</in>
		<out>
			<recordset name="totalthreads" scope="variables" format="CFML">
				<number name="threadcount"/>
			</recordset>
			<recordset name="unapprovedthreads" scope="variables" format="CFML">
				<number name="threadcount"/>
			</recordset>
			<recordset name="totalmessages" scope="variables" format="CFML">
				<number name="messagecount"/>
			</recordset>
			<recordset name="unapprovedmessages" scope="variables" format="CFML">
				<number name="messagecount"/>
			</recordset>
			<recordset name="archivedthreads" scope="variables" format="CFML">
				<number name="threadcount"/>
			</recordset>
			<recordset name="archivedmessages" scope="variables" format="CFML">
				<number name="messagecount"/>
			</recordset>
			<recordset name="activitybyday" scope="variables" format="CFML">
				<string name="Dayofweek"/>
				<number name="NumberOfDups"/>
			</recordset>
			<recordset name="activitybytime" scope="variables" format="CFML">
				<string name="hourofday"/>
				<number name="NumberOfDups"/>
			</recordset>
		</out>
	</io>
</fusedoc>
--->

<cfinvoke component="#Application.ao__AppObj_mForum_threads_Gateway#"
	method="countAll"
	returnvariable="totalthreads">


<cfinvoke component="#Application.ao__AppObj_mForum_threads_Gateway#"
	method="countSelected"
	condition="approved = 0"
	returnvariable="unapprovedthreads">

<cfinvoke component="#Application.ao__AppObj_mForum_messages_Gateway#"
	method="countAll"
	returnvariable="totalmessages">

<cfinvoke component="#Application.ao__AppObj_mForum_messages_Gateway#"
	method="countSelected"
	condition="approved = 0"
	returnvariable="unapprovedmessages">

<cfinvoke component="#Application.ao__AppObj_mForum_arch_threads_Gateway#"
	method="countAll"
	returnvariable="archivedthreads">

<cfinvoke component="#Application.ao__AppObj_mForum_arch_messages_Gateway#"
	method="countAll"
	returnvariable="archivedmessages">

<cfinvoke component="#Application.ao__AppObj_mForum_messages_Gateway#"
	method="countSelectedByDay"
	returnvariable="activitybyday">

<cfinvoke component="#Application.ao__AppObj_mForum_messages_Gateway#"
	method="countSelectedByTime"
	returnvariable="activitybytime">

<!--- 
$Log: qry_forumstats.cfm,v $
Revision 1.1  2007/06/15 13:59:05  kevin
Add Admin Modules

Revision 1.8  2006/08/11 12:54:47  mike
change cfc objects from Server to Application scope

Revision 1.7  2006/07/31 15:43:24  kevin
Remove old SQL

Revision 1.6  2006/06/23 17:19:56  mike
new naming convention for cfc objects

Revision 1.5  2006/06/20 15:04:41  mike
deleted commented-out stuff

Revision 1.4  2005/09/05 15:47:31  kevin
Change DSN for forums.

Revision 1.3  2005/05/20 12:33:38  kevin
New server cfc naming convention

Revision 1.2  2005/04/11 11:01:01  mike
changed to call Facade/Gateway/DAO cfc's

Revision 1.1  2005/03/29 13:28:27  mike
files moved from mForum

Revision 1.1  2005/03/09 13:53:01  mike
Moved to create MVC version

Revision 1.4  2005/02/24 13:57:43  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.3  2005/02/23 17:19:43  mike
small edits to code layout

Revision 1.2  2005/02/07 12:16:25  mike
improve fusedoc

Revision 1.1  2005/02/04 19:56:51  mike
FB3 version made from wireframe with fusebuilder, with contents pasted from FB2 version, fbx_switch fully commented, and XFA usage improved throughout
--->
</cfsilent>
