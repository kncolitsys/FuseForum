<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="qry_edittoday.cfm">
	<responsibilities>
		I get the given Today notice
	</responsibilities>
	<properties>
		<history author="Mike Oakes" email="mike@objectiveinternet.com" date="04-Feb-2005" role="Architect" type="Create" />
		<property name="copyright" value="(c)2005 Objective Internet Limited." />
		<property name="licence" value="See licence.txt" />
		<property name="version" value="$Revision: 1.1 $" />
		<property name="lastupdated" value="$Date: 2007/06/15 13:59:05 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<number name="postid" scope="attributes" />
		</in>
		<out>
			<recordset name="qThisToday" scope="variables" format="CFML">
				<string name="posttitle" />
				<string name="post" />
				<datetime name="postdate" />
				<datetime name="dateexpires" />
			</recordset>
		</out>
	</io>
</fusedoc>
--->

<cfparam name="attributes.postid" default="0">

<cfinvoke component="#Application.ao__AppObj_mForum_today_Gateway#"
	method="findSelected"
	postid="#attributes.postid#"
	returnvariable="qThisToday">

<!--- 
$Log: qry_edittoday.cfm,v $
Revision 1.1  2007/06/15 13:59:05  kevin
Add Admin Modules

Revision 1.7  2006/08/11 12:54:47  mike
change cfc objects from Server to Application scope

Revision 1.6  2006/07/31 15:43:24  kevin
Remove old SQL

Revision 1.5  2006/06/23 17:19:56  mike
new naming convention for cfc objects

Revision 1.4  2005/09/05 15:47:31  kevin
Change DSN for forums.

Revision 1.3  2005/05/20 12:33:38  kevin
New server cfc naming convention

Revision 1.2  2005/04/08 10:07:04  mike
changed to call Facade/Gateway/DAO cfc's

Revision 1.1  2005/03/29 13:28:27  mike
files moved from mForum

Revision 1.1  2005/03/09 13:53:01  mike
Moved to create MVC version

Revision 1.4  2005/02/24 13:57:43  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.3  2005/02/10 15:29:59  mike
improve fusedoc

Revision 1.2  2005/02/10 10:51:33  mike
improved fusedoc, etc.

Revision 1.1  2005/02/07 15:52:37  mike
new file, split off from dsp_today.cfm
--->
</cfsilent>
