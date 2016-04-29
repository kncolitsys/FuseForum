<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="qry_usermessages.cfm">
	<responsibilities>
		I get the user's messages
	</responsibilities>
	<properties>
		<history author="Mike Oakes" email="mike@objectiveinternet.com" date="01-Nov-2004" role="Architect" type="Create" />
		<property name="copyright" value="(c)2004 Objective Internet Limited." />
		<property name="licence" value="Licensed under the Apache License, Version 2.0  See licence.txt" />
		<property name="version" value="$Revision: 1.3 $" />
		<property name="lastupdated" value="$Date: 2007/06/14 16:38:34 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<string name="ForumDSN" scope="request" />
			<number name="userid" scope="attributes" />
		</in>
		<out>
			<recordset name="usermessages" scope="variables" format="CFML">
				<number name="threadid"/>
				<string name="threadname"/>
				<number name="messagecount"/>
				<datetime name="datelastpost"/>
				<string name="username" />
			</recordset>
		</out>
	</io>
</fusedoc>
--->

<cfinvoke component="#Application.ao__AppObj_mForumFacade_Forum_Facade#"
	method="findMessagesOfUser"
	userid="#attributes.userid#"
	orderby="threads.datelastpost DESC"
	returnvariable="usermessages">

<!--- 
$Log: qry_usermessages.cfm,v $
Revision 1.3  2007/06/14 16:38:34  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:12  kevin
Initial Open Source Version

--->
</cfsilent>
