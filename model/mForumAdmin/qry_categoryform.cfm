<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="qry_categoryform.cfm">
	<responsibilities>
		I get details of the given forum
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
			<number name="categoryid" scope="attributes" />
		</in>
		<out>
			<recordset name="thiscategory" scope="variables" format="CFML">
				<string name="categoryname" />
				<string name="description" />
				<string name="status" />
				<boolean name="allowattachments" />
				<number name="messagelimit" />
				<number name="archivedays" />
				<boolean name="approval" />
				<boolean name="readonly" />
				<string name="visibleto" />
			</recordset>
		</out>
	</io>
</fusedoc>
--->

<cfset thiscategory=Application.ao__AppObj_mForum_categories_Gateway.findSelected(attributes.categoryid)>

<!--- 
$Log: qry_categoryform.cfm,v $
Revision 1.1  2007/06/15 13:59:05  kevin
Add Admin Modules

Revision 1.8  2006/08/11 12:54:13  mike
change cfc objects from Server to Application scope

Revision 1.7  2006/07/31 15:43:24  kevin
Remove old SQL

Revision 1.6  2006/06/23 17:19:56  mike
new naming convention for cfc objects

Revision 1.5  2005/09/05 15:47:31  kevin
Change DSN for forums.

Revision 1.4  2005/05/20 12:33:38  kevin
New server cfc naming convention

Revision 1.3  2005/04/20 11:39:57  mike
handle new field archivedays

Revision 1.2  2005/04/07 16:14:25  mike
changed to call Facade/Gateway/DAO cfc's

Revision 1.1  2005/03/29 13:28:27  mike
files moved from mForum

Revision 1.1  2005/03/09 13:53:00  mike
Moved to create MVC version

Revision 1.3  2005/02/24 13:57:41  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.2  2005/02/10 15:27:55  mike
improve fusedoc, etc.

Revision 1.1  2005/02/08 15:02:59  mike
new file, hived off from dsp_categoryform.cfm
--->
</cfsilent>
