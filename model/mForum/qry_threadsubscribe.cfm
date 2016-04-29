<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="qry_threadsubscribe.cfm">
	<responsibilities>
		I check whether the user is subscribed to the thread.
	</responsibilities>
	<properties>
		<history author="Mike Oakes" email="mike@objectiveinternet.com" date="13-May-2005" role="Architect" type="Create" />
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
		</in>
		<out>
			<recordset name="checkexisting" scope="variables" format="CFML">
				<number name="recordid"/>
			</recordset>
		</out>
	</io>
</fusedoc>
--->
<cfparam name="attributes.threadid" default="0"><!--- for robustness --->

<cfinvoke component="#Application.ao__AppObj_mForum_subscriptions_Gateway#"
	method="findSelected"
	userid="#request.userid#"
	threadid="#attributes.threadid#"
	returnvariable="checkexisting">

<!--- 
$Log: qry_threadsubscribe.cfm,v $
Revision 1.4  2007/06/14 16:52:21  kevin
Remove specific comments

Revision 1.3  2007/06/14 16:38:34  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:12  kevin
Initial Open Source Version

Revision 1.8  2006/08/11 12:50:08  mike
change cfc objects from Server to Application scope

Revision 1.7  2006/07/24 13:14:33  kevin
Remove unwanted SQL

Revision 1.6  2006/06/23 17:43:42  mike
new naming convention for cfc objects

Revision 1.5  2005/12/02 17:27:48  mike
DSN => ForumDSN

Revision 1.4  2005/05/27 12:46:30  mike
give attributes.threadid a default value

Revision 1.3  2005/05/20 12:40:57  kevin
New server cfc naming convention

Revision 1.2  2005/05/19 17:04:27  mike
improve fusedoc

Revision 1.1  2005/05/13 15:46:07  mike
new file: code commoned up between act_threadsubscribe.cfm and dsp_post.cfm
--->
</cfsilent>
