<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="qry_thisprivatemessage.cfm">
	<responsibilities>
		I get the private message
	</responsibilities>
	<properties>
		<history author="Mike Oakes" email="mike@objectiveinternet.com" date="01-Nov-2004" role="Architect" type="Create" />
		<property name="copyright" value="(c)2004 Objective Internet Limited." />
		<property name="licence" value="Licensed under the Apache License, Version 2.0  See licence.txt" />
		<property name="version" value="$Revision: 1.4 $" />
		<property name="lastupdated" value="$Date: 2007/06/14 16:52:21 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<number name="messageid" scope="attributes" />
			<boolean name="arch" scope="attributes" />
		</in>
		<out>
			<recordset name="thisprivatemessage" scope="variables" format="CFML">
				<number name="messageid"/>
				<number name="userid"/>
				<string name="message"/>
				<number name="senderid"/>
				<datetime name="messagedate"/>
				<string name="username" />
				<boolean name="privatemessages" />
				<string name="signature" />
			</recordset>
		</out>
	</io>
</fusedoc>
--->

<cfif isDefined("attributes.arch")>
	
	<cfinvoke component="#Application.ao__AppObj_mForumFacade_Forum_Facade#"
		method="fArchivedPrivateMessage"
		messageid="#attributes.messageid#"
		returnvariable="thisprivatemessage">
<cfelse>
	
	<cfinvoke component="#Application.ao__AppObj_mForumFacade_Forum_Facade#"
		method="fPrivateMessage"
		messageid="#attributes.messageid#"
		returnvariable="thisprivatemessage">
</cfif>		
<!--- <cfdump var="#thisprivatemessage#"> --->

<!--- 
$Log: qry_thisprivatemessage.cfm,v $
Revision 1.4  2007/06/14 16:52:21  kevin
Remove specific comments

Revision 1.3  2007/06/14 16:38:33  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:12  kevin
Initial Open Source Version

Revision 1.8  2006/08/11 12:50:07  mike
change cfc objects from Server to Application scope

Revision 1.7  2006/07/24 13:14:33  kevin
Remove unwanted SQL

Revision 1.6  2006/06/23 17:43:42  mike
new naming convention for cfc objects

Revision 1.5  2005/12/02 17:27:48  mike
DSN => ForumDSN

Revision 1.4  2005/05/21 10:17:53  mike
correct path for Forum_Facade.cfc

Revision 1.3  2005/05/20 12:40:56  kevin
New server cfc naming convention

Revision 1.2  2005/05/09 08:51:31  mike
recode to call methods in Forum_Facade.cfc, etc.

Revision 1.1  2005/05/05 12:29:27  mike
Initial FB4 Version

Revision 1.4  2004/11/05 13:39:58  mike
include pv.userid

Revision 1.3  2004/11/05 13:33:08  mike
added fusedoc etc.
--->
</cfsilent>

