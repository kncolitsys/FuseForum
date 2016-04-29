<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="act_forumsubscribe.cfm">
	<responsibilities>
		I subscribe the user to the forum.
	</responsibilities>
	<properties>
		<history author="Mike Oakes" email="mike@objectiveinternet.com" date="19-May-2005" role="Architect" type="Create" />
		<property name="copyright" value="(c)2004 Objective Internet Limited." />
		<property name="licence" value="Licensed under the Apache License, Version 2.0  See licence.txt" />
		<property name="version" value="$Revision: 1.3 $" />
		<property name="lastupdated" value="$Date: 2007/06/14 16:38:34 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<number name="userid" scope="request" />
			<number name="categoryid" scope="attributes" />
			<recordset name="checkexisting" scope="variables" format="CFML">
				<number name="recordid"/>
			</recordset>
		</in>
		<out>
		</out>
	</io>
</fusedoc>
--->
<cfif checkexisting.recordcount EQ 0>
	<cfinvoke component="#Application.ao__AppObj_mForumFacade_Forum_Facade#"
		method="fCreateForumSubscription"
		userid="#request.userid#"
		categoryid="#attributes.categoryid#"
		returnvariable="variables.temp">
</cfif>

<!--- 
$Log: act_forumsubscribe.cfm,v $
Revision 1.3  2007/06/14 16:38:34  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:10  kevin
Initial Open Source Version

Revision 1.5  2006/08/11 12:50:07  mike
change cfc objects from Server to Application scope

Revision 1.4  2006/06/23 17:43:41  mike
new naming convention for cfc objects

Revision 1.3  2005/05/24 13:29:20  mike
small edits

Revision 1.2  2005/05/21 10:17:51  mike
correct path for Forum_Facade.cfc

Revision 1.1  2005/05/20 11:35:51  mike
new file

--->
</cfsilent>
