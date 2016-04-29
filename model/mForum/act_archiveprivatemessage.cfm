<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="act_archiveprivatemessage.cfm">
	<responsibilities>
		I archive the given private message
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
		</in>
		<out>
		</out>
	</io>
</fusedoc>
--->

<cfif thisprivatemessage.recordcount EQ 1>
	<cfloop query="thisprivatemessage">
		<cfset variables.userid=thisprivatemessage.userid>
		<cfset variables.message=thisprivatemessage.message>
		<cfset variables.senderid=thisprivatemessage.senderid>
		<cfset variables.messagedate=CreateDateTime(year(thisprivatemessage.messagedate),month(thisprivatemessage.messagedate),day(thisprivatemessage.messagedate),hour(thisprivatemessage.messagedate),minute(thisprivatemessage.messagedate),second(thisprivatemessage.messagedate))>
		<cfset variables.arch_date=now()>
	</cfloop>
	<cfinvoke component="#Application.ao__AppObj_mForumFacade_Forum_Facade#"
		method="fArchivePrivateMessage"
		messageid="#attributes.messageid#"
		userid="#variables.userid#"
		message="#variables.message#"
		senderid="#variables.senderid#"
		messagedate="#variables.messagedate#"
		arch_date="#variables.arch_date#"
		returnvariable="variables.temp">
</cfif>

<!--- 
$Log: act_archiveprivatemessage.cfm,v $
Revision 1.4  2007/06/14 16:52:21  kevin
Remove specific comments

Revision 1.3  2007/06/14 16:38:34  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:10  kevin
Initial Open Source Version

Revision 1.9  2006/08/11 12:50:07  mike
change cfc objects from Server to Application scope

Revision 1.8  2006/07/21 09:53:49  kevin
Trafalgar Conversion, Remove Old SQL.

Revision 1.7  2006/06/23 17:43:41  mike
new naming convention for cfc objects

Revision 1.6  2005/12/02 17:27:47  mike
DSN => ForumDSN

Revision 1.5  2005/05/23 10:22:11  mike
don't do anything if there is no such message

Revision 1.4  2005/05/21 10:17:51  mike
correct path for Forum_Facade.cfc

Revision 1.3  2005/05/20 12:40:56  kevin
New server cfc naming convention

Revision 1.2  2005/05/05 12:48:26  mike
recode to call methods in Forum_Facade.cfc

Revision 1.1  2005/05/05 12:29:24  mike
Initial FB4 Version

Revision 1.3  2004/11/05 13:39:32  mike
added fusedoc etc.
--->
</cfsilent>
