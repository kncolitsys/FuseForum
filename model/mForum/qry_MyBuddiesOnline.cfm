<cfsetting enablecfoutputonly="Yes">
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="qry_MyBuddiesOnline.cfm">
	<responsibilities>
		I display a list of buddies who are currently online.
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
			<number name="userid" scope="request" />
			<recordset name="qClientVarCheck" scope="variables" format="CFML">
				<string name="LoginTime" />
				<string name="LoginDate" />
				<number name="NameId" />
				<string name="LoginName" />
			</recordset>
		</in>
		<out>
			<recordset name="qBuddies" scope="variables" format="CFML">
				<string name="LoginTime" />
				<string name="LoginDate" />
				<number name="NameId" />
				<string name="LoginName" />
			</recordset>
		</out>
	</io>
</fusedoc>
--->
<cfparam name="qClientVarCheck">
<!--- Set time in Minutes that we are interested in --->
<cfset variables.timeout = 240>
<!--- Set the maximun number of entries that we are interested in --->
<cfset variables.maxentries = 20>

<cfinvoke component="#Application.ao__AppObj_mForumFacade_Forum_Facade#"
	method="fFriendsOnline"
	qClientVarCheck="#qClientVarCheck#"
	userid="#request.userid#"
	returnvariable="qBuddies" />

<!--- <cfdump var="#qBuddies#"> --->

<!--- 
$Log: qry_MyBuddiesOnline.cfm,v $
Revision 1.4  2007/06/14 16:52:21  kevin
Remove specific comments

Revision 1.3  2007/06/14 16:38:33  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:12  kevin
Initial Open Source Version

Revision 1.5  2006/08/11 12:50:07  mike
change cfc objects from Server to Application scope

Revision 1.4  2006/07/26 13:35:30  mike
bug fix: call fFriendsOnline() with correct arguments

Revision 1.3  2006/07/25 11:52:18  kevin
Additional fuses to support FB4

Revision 1.3  2004/11/25 14:42:35  kevin
Improve the selection of entries in the table.

Revision 1.2  2004/11/24 13:30:43  mike
bug fix: ListContains => ListFind

Revision 1.1  2004/11/12 17:50:59  mike
stuff for whosonline

--->
<cfsetting enablecfoutputonly="No"> 