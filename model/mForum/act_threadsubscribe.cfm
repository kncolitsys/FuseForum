<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="act_threadsubscribe.cfm">
	<responsibilities>
		I subscribe the user to the thread.
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
			<number name="userid" scope="request" />
			<number name="threadid" scope="attributes" />
			<recordset name="checkexisting" scope="variables" format="CFML">
				<number name="recordid"/>
			</recordset>
		</in>
		<out>
			<string name="fuseaction" scope="formOrUrl" />
		</out>
	</io>
</fusedoc>
--->

<cfif checkexisting.recordcount EQ 0>
	
	<cfinvoke component="#Application.ao__AppObj_mForumFacade_Forum_Facade#"
		method="fCreateSubscription"
		userid="#request.userid#"
		threadid="#attributes.threadid#"
		returnvariable="variables.temp">
</cfif>

<!--- 
$Log: act_threadsubscribe.cfm,v $
Revision 1.4  2007/06/14 16:52:21  kevin
Remove specific comments

Revision 1.3  2007/06/14 16:38:34  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:10  kevin
Initial Open Source Version

Revision 1.10  2006/08/11 12:50:07  mike
change cfc objects from Server to Application scope

Revision 1.9  2006/07/24 13:14:33  kevin
Remove unwanted SQL

Revision 1.8  2006/06/23 17:43:42  mike
new naming convention for cfc objects

Revision 1.7  2005/12/02 17:27:48  mike
DSN => ForumDSN

Revision 1.6  2005/05/21 10:17:52  mike
correct path for Forum_Facade.cfc

Revision 1.5  2005/05/20 12:40:56  kevin
New server cfc naming convention

Revision 1.4  2005/05/20 11:49:05  mike
improve fusedoc

Revision 1.3  2005/05/13 15:46:47  mike
the checkexisting query split off into a separate file

Revision 1.2  2005/05/06 10:18:43  mike
recode to call methods in Forum_Facade.cfc, etc.

Revision 1.1  2005/05/05 12:29:25  mike
Initial FB4 Version

Revision 1.5  2004/11/09 13:33:34  kevin
Break out post new thread process into separate fuses.

Revision 1.4  2004/11/07 14:32:44  mike
small edits

Revision 1.3  2004/11/04 18:53:32  mike
small correction to fusedoc

Revision 1.2  2004/11/02 14:41:10  mike
added fusedoc, etc.
--->
</cfsilent>
