<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="qry_showtoday.cfm">
	<responsibilities>
		I get a particular notice record
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
			<number name="postid" scope="attributes" />
		</in>
		<out>
			<recordset name="showtoday" scope="variables" format="CFML">
				<number name="postid"/>
				<string name="posttitle"/>
				<string name="post"/>
				<datetime name="postdate"/>
				<datetime name="dateexpires" />
			</recordset>
		</out>
	</io>
</fusedoc>
--->
<cfinvoke component="#Application.ao__AppObj_mForum_today_Gateway#"
	method="findSelected"
	postid="#attributes.postid#"
	returnvariable="showtoday">

<!--- 
$Log: qry_showtoday.cfm,v $
Revision 1.4  2007/06/14 16:52:21  kevin
Remove specific comments

Revision 1.3  2007/06/14 16:38:33  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:12  kevin
Initial Open Source Version

Revision 1.7  2006/08/11 12:50:07  mike
change cfc objects from Server to Application scope

Revision 1.6  2006/07/24 13:14:33  kevin
Remove unwanted SQL

Revision 1.5  2006/06/23 17:43:42  mike
new naming convention for cfc objects

Revision 1.4  2005/12/02 17:27:48  mike
DSN => ForumDSN

Revision 1.3  2005/05/20 12:40:56  kevin
New server cfc naming convention

Revision 1.2  2005/05/06 15:31:10  mike
recode to call methods in Forum_Facade.cfc, etc.

Revision 1.1  2005/05/05 12:29:27  mike
Initial FB4 Version

Revision 1.3  2004/11/05 13:21:22  mike
added fusedoc etc.
--->
</cfsilent>

