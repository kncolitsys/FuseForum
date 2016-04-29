<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="qry_usercategories.cfm">
	<responsibilities>
		I determine the user's status vis a vis access to the Forums
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
			<boolean name="userisERSCmember" scope="client" />
			<boolean name="userisadmin" scope="client" />
			<boolean name="userismod" scope="client" />
		</in>
		<out>
			<recordset name="usercategories" scope="variables" format="CFML">
				<number name="categoryid"/>
				<string name="categoryname"/>
			</recordset>
		</out>
	</io>
</fusedoc>
--->

<cfinvoke component="#Application.ao__AppObj_mForumFacade_Forum_Facade#"
	method="fForumsVisible"
	userid="#request.userid#"
	orderby="categories.categoryname"
	returnvariable="usercategories">

<!--- 
$Log: qry_usercategories.cfm,v $
Revision 1.4  2007/06/14 16:52:21  kevin
Remove specific comments

Revision 1.3  2007/06/14 16:38:34  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:12  kevin
Initial Open Source Version

Revision 1.9  2006/08/11 12:50:08  mike
change cfc objects from Server to Application scope

Revision 1.8  2006/07/24 13:14:33  kevin
Remove unwanted SQL

Revision 1.7  2006/06/23 17:43:42  mike
new naming convention for cfc objects

Revision 1.6  2006/06/20 14:21:39  mike
delete stray character

Revision 1.5  2005/12/02 17:27:48  mike
DSN => ForumDSN

Revision 1.4  2005/05/21 10:17:53  mike
correct path for Forum_Facade.cfc

Revision 1.3  2005/05/20 12:40:57  kevin
New server cfc naming convention

Revision 1.2  2005/05/09 17:20:35  mike
recode to call methods in Forum_Facade.cfc, etc.

Revision 1.1  2005/05/05 12:29:28  mike
Initial FB4 Version

Revision 1.6  2004/11/17 13:58:55  mike
use client.userisERSCmember

Revision 1.5  2004/11/12 09:42:13  mike
DSN => MainDSN

Revision 1.4  2004/11/10 11:28:40  mike
added OR (Cat.VisibleTo = 'ER')

Revision 1.3  2004/11/07 14:30:53  mike
small edits

Revision 1.2  2004/11/02 16:41:55  mike
added fusedoc, etc.

Revision 1.1  2004/10/18 10:11:53  mike
initial version
--->
</cfsilent>

