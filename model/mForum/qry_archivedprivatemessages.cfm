<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="qry_archivedrivatemessages.cfm">
	<responsibilities>
		I get the archived private messages for the current logged-in user
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
			<string name="sortkey" scope="attributes" optional="Yes" />
			<string name="sortasc" scope="attributes" optional="Yes" />
		</in>
		<out>
			<string name="sortkey" scope="attributes" />
			<string name="sortasc" scope="attributes" />
			<recordset name="arch_priv_summary" scope="variables" format="CFML">
				<number name="messageid"/>
				<number name="userid"/>
				<datetime name="messagedate"/>
				<string name="username" />
			</recordset>
		</out>
	</io>
</fusedoc>
--->

<cfparam name="attributes.sortkey" default="messagedate">
<cfparam name="attributes.sortasc" default="DESC">

<cfif request.userid NEQ 0><!--- the user is logged in --->
	
	<cfinvoke component="#Application.ao__AppObj_mForumFacade_Forum_Facade#"
		method="fArchivedPrivateMessages"
		userid="#request.userid#"
		orderby="#attributes.sortkey# #attributes.sortasc#"
		returnvariable="arch_priv_summary">
<cfelse>
	<cfset arch_priv_summary=QueryNew("messageid,userid,messagedate,username")>
</cfif>

<!--- 
$Log: qry_archivedprivatemessages.cfm,v $
Revision 1.4  2007/06/14 16:52:21  kevin
Remove specific comments

Revision 1.3  2007/06/14 16:38:34  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:11  kevin
Initial Open Source Version

Revision 1.9  2006/08/11 12:50:07  mike
change cfc objects from Server to Application scope

Revision 1.8  2006/07/24 13:14:33  kevin
Remove unwanted SQL

Revision 1.7  2006/06/23 17:43:42  mike
new naming convention for cfc objects

Revision 1.6  2005/12/02 17:27:48  mike
DSN => ForumDSN

Revision 1.5  2005/05/23 10:56:24  mike
handle attributes.sortkey, etc,

Revision 1.4  2005/05/21 10:17:52  mike
correct path for Forum_Facade.cfc

Revision 1.3  2005/05/20 12:40:56  kevin
New server cfc naming convention

Revision 1.2  2005/05/06 12:55:58  mike
recode to call methods in Forum_Facade.cfc, etc.

Revision 1.1  2005/05/05 12:29:26  mike
Initial FB4 Version

Revision 1.3  2004/11/07 14:32:34  mike
small edits

Revision 1.2  2004/11/05 13:24:31  mike
added fusedoc etc.
--->
</cfsilent>
