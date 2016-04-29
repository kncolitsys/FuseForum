<cfsetting enablecfoutputonly="Yes">
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="qry_LatestChats.cfm">
	<responsibilities>
		I get a list of the latest Forums Postings.
	</responsibilities>
	<properties>
		<history author="Mike Oakes" email="mike@objectiveinternet.com" date="11-Nov-2004" role="Architect" type="Create" />
		<property name="copyright" value="(c)2004 Objective Internet Limited." />
		<property name="licence" value="Licensed under the Apache License, Version 2.0  See licence.txt" />
		<property name="version" value="$Revision: 1.4 $" />
		<property name="lastupdated" value="$Date: 2007/06/14 16:52:21 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<string name="forumDSN" scope="request"/>
			<number name="Forums.England" scope="request"/>
			<number name="Forums.IRB6N" scope="request"/>
			<number name="Forums.Premiership" scope="request"/>
			<number name="Forums.Clubhouse" scope="request"/>
			<number name="Forums.TheSite" scope="request"/>
			<number name="Forums.ERSC" scope="request"/>
		</in>
		<out>
			<recordset name="qLatestThreads" scope="variables" format="CFML">
				<number name="ThreadID" />
				<string name="ThreadName"/>
				<number name="MessageCount"/>
			</recordset>
		</out>
	</io>
</fusedoc>
--->

<cfset variables.lForums="#request.Forums.England#,#request.Forums.IRB6N#,#request.Forums.Premiership#,#request.Forums.Clubhouse#,#request.Forums.TheSite#,#request.Forums.ERSC#">

<cfinvoke component="#Application.ao__AppObj_mForumFacade_Forum_Facade#"
	method="fLatestThreads"
	lForums="#variables.lForums#"
	returnvariable="qLatestThreads" />


<!--- 
$Log: qry_LatestChats.cfm,v $
Revision 1.4  2007/06/14 16:52:21  kevin
Remove specific comments

Revision 1.3  2007/06/14 16:38:33  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:12  kevin
Initial Open Source Version

Revision 1.6  2006/08/11 12:50:07  mike
change cfc objects from Server to Application scope

Revision 1.5  2006/07/25 11:52:18  kevin
Additional fuses to support FB4

Revision 1.2  2004/11/12 09:55:12  mike
cache the query

Revision 1.1  2004/11/11 20:06:08  mike
stuff for LatestChats

--->
<cfsetting enablecfoutputonly="No"> 