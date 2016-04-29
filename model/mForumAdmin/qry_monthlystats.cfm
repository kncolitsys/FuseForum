<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="qry_monthlystats.cfm">
	<responsibilities>
		I get various counts of threads and messages for the given month
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
			<string name="day" scope="attributes" />
			<string name="month" scope="attributes" />
			<string name="year" scope="attributes" />
			<string name="for" scope="attributes" />
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

<cfset datestring="">

<cfif attributes.for is "Only">
	<cfif len(attributes.day) and len(attributes.month) and len(attributes.year)>
		<cfset datestring="= CONVERT(DATETIME,'#attributes.year#-#attributes.month#-#attributes.day#',102)">
	<cfelseif len(attributes.year) and len(attributes.month) and not len(attributes.day)>
	
		<cfset startdate_cf=createdate(attributes.year,attributes.month,1)>
		<cfset startdate="CONVERT(DATETIME,'#attributes.year#-#attributes.month#-1',102)">
		<cfset enddate="CONVERT(DATETIME,'#attributes.year#-#attributes.month#-#daysinmonth(startdate_cf)#',102)">
		<cfset datestring="BETWEEN #startdate# AND #enddate#">
	<cfelse>
		<cfset datestring="BETWEEN CONVERT(DATETIME,'#attributes.year#-1-1',102) AND CONVERT(DATETIME,'#attributes.year#-1-31',102)">
	</cfif>
<cfelseif attributes.for is "Since">
	<cfif len(attributes.day) and len(attributes.month) and len(attributes.year)>
		<cfset datestring=">= CONVERT(DATETIME,'#attributes.year#-#attributes.month#-#attributes.day#',102)">
	<cfelseif len(attributes.year) and len(attributes.month) and not len(attributes.day)>
		<cfset datestring=">= CONVERT(DATETIME,'#attributes.year#-#attributes.month#-1',102)">
	<cfelse>
		<cfset datestring=">= CONVERT(DATETIME,'#attributes.year#-1-1',102)">
	</cfif>
<cfelseif attributes.for is "UpTo">
	<cfif len(attributes.day) and len(attributes.month) and len(attributes.year)>
		<cfset datestring="<= CONVERT(DATETIME,'#attributes.year#-#attributes.month#-#attributes.day#',102)">
	<cfelseif len(attributes.year) and len(attributes.month) and not len(attributes.day)>
		<cfset datestring="<= CONVERT(DATETIME,'#attributes.year#-#attributes.month#-1',102)">
	<cfelse>
		<cfset datestring="<= CONVERT(DATETIME,'#attributes.year#-1-1',102)">
	</cfif>
</cfif>

<cfinvoke component="#Application.ao__AppObj_mForum_threads_Gateway#"
	method="countSelected"
	condition="0=0"
	datestring="#datestring#"
	returnvariable="totalthreads">

<cfinvoke component="#Application.ao__AppObj_mForum_threads_Gateway#"
	method="countSelected"
	condition="approved = 0"
	datestring="#datestring#"
	returnvariable="unapprovedthreads">

<cfinvoke component="#Application.ao__AppObj_mForum_messages_Gateway#"
	method="countSelected"
	condition="0=0"
	datestring="#datestring#"
	returnvariable="totalmessages">

<cfinvoke component="#Application.ao__AppObj_mForum_messages_Gateway#"
	method="countSelected"
	condition="approved = 0"
	datestring="#datestring#"
	returnvariable="unapprovedmessages">

<cfinvoke component="#Application.ao__AppObj_mForum_arch_threads_Gateway#"
	method="countSelected"
	condition="datecreated"
	datestring="#datestring#"
	returnvariable="archivedthreads">

<cfinvoke component="#Application.ao__AppObj_mForum_arch_messages_Gateway#"
	method="countSelected"
	condition="messagedate"
	datestring="#datestring#"
	returnvariable="archivedmessages">

<cfinvoke component="#Application.ao__AppObj_mForum_messages_Gateway#"
	method="countSelectedByDay"
	datestring="#datestring#"
	returnvariable="activitybyday">

<cfinvoke component="#Application.ao__AppObj_mForum_messages_Gateway#"
	method="countSelectedByTime"
	datestring="#datestring#"
	returnvariable="activitybytime">

<!--- 
$Log: qry_monthlystats.cfm,v $
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

Revision 1.1  2005/03/29 13:28:28  mike
files moved from mForum

Revision 1.1  2005/03/09 13:53:02  mike
Moved to create MVC version

Revision 1.4  2005/02/24 13:57:45  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.3  2005/02/23 17:20:14  mike
small edits to code layout

Revision 1.2  2005/02/07 12:16:26  mike
improve fusedoc

Revision 1.1  2005/02/04 19:56:52  mike
FB3 version made from wireframe with fusebuilder, with contents pasted from FB2 version, fbx_switch fully commented, and XFA usage improved throughout
--->
</cfsilent>
