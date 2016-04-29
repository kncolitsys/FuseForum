<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="qry_allthread.cfm">
	<responsibilities>
		I get details of all threads
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
			<number name="threadid" scope="attributes" />
		</in>
		<out>
			<recordset name="all_threads" scope="variables" format="CFML">
				<number name="threadid" />
				<string name="threadname" />
				<datetime name="datecreated" />
				<number name="messageid" />
				<string name="message" />
				<datetime name="messagedate" />
				<string name="attachment" />
			</recordset>
		</out>
	</io>
</fusedoc>
--->


<cfset all_threads=Application.ao__AppObj_mForumAdmin_ForumAdmin_Facade.fAllThreads(attributes.threadid,"msg.messagedate ASC")>

<!--- 
$Log: qry_allthread.cfm,v $
Revision 1.1  2007/06/15 13:59:05  kevin
Add Admin Modules

Revision 1.10  2006/08/11 12:54:13  mike
change cfc objects from Server to Application scope

Revision 1.9  2006/08/01 10:56:50  mike
correct the naming convention for the ForumAdmin_Facade.cfc object

Revision 1.8  2006/07/31 15:43:24  kevin
Remove old SQL

Revision 1.7  2006/06/23 17:19:56  mike
new naming convention for cfc objects

Revision 1.6  2005/09/05 15:47:31  kevin
Change DSN for forums.

Revision 1.5  2005/05/21 15:26:35  mike
correct path for ForumAdmin_Facade

Revision 1.4  2005/05/20 12:33:38  kevin
New server cfc naming convention

Revision 1.3  2005/04/01 13:43:17  mike
small edits

Revision 1.2  2005/04/01 12:17:13  mike
modify to call Facade &/or Gateway methods

Revision 1.1  2005/03/29 13:28:27  mike
files moved from mForum

Revision 1.2  2005/03/14 17:54:07  mike
correct fuse description

Revision 1.1  2005/03/09 13:53:00  mike
Moved to create MVC version

Revision 1.4  2005/02/24 13:57:40  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.3  2005/02/23 17:17:25  mike
small edits to code layout

Revision 1.2  2005/02/09 16:58:52  mike
improved fusedoc, etc.

Revision 1.1  2005/02/04 19:56:51  mike
FB3 version made from wireframe with fusebuilder, with contents pasted from FB2 version, fbx_switch fully commented, and XFA usage improved throughout
--->
</cfsilent>
