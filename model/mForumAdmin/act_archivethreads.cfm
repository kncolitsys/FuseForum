<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="act_archivethreads.cfm">
	<responsibilities>
		Scheduled process, run overnight, to automatically archive all "dormant" threads in all Forums
	</responsibilities>
	<properties>
		<history author="Mike Oakes" email="mike@objectiveinternet.com" date="19-Apr-2005" role="Architect" type="Create" />
		<property name="copyright" value="(c)2005 Objective Internet Limited." />
		<property name="licence" value="See licence.txt" />
		<property name="version" value="$Revision: 1.1 $" />
		<property name="lastupdated" value="$Date: 2007/06/15 13:59:05 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<recordset name="qCategories" scope="variables" format="CFML">
				<number name="categoryid" />
				<string name="categoryname" />
				<string name="description" />
				<string name="status" />
				<boolean name="allowattachments" />
				<number name="messagelimit" />
				<number name="archivedays" />
				<boolean name="approval" />
				<boolean name="readonly" />
				<number name="categoryowner" />
				<string name="visibleto" />
			</recordset>
		</in>
		<out>
		</out>
	</io>
</fusedoc>
--->

<!--- <cfset request.archivethreads_name_id = 0> --->

<cfloop query="qCategories">
	<cfif qCategories.archivedays NEQ 0>
		<cfset variables.SelectDate = dateadd("d",qCategories.archivedays,now())>
		<cfquery name="qThreads" datasource="#request.forumDSN#">
			SELECT 	threads.threadid
					threads.messagecount,
					threads.datelastpost
			FROM	threads
			WHERE	threads.categoryid = #qCategories.categoryid#
				AND	threads.archived <> 1
				AND	threads.datelastpost < #createodbcdate(variables.SelectDate)#
		</cfquery>
		<cfloop query="qThreads">
			<cfquery datasource="#request.forumDSN#">
				UPDATE	threads 
				SET		threads.archived = 1
				WHERE	threads.threadid = #qThreads.threadid#
			</cfquery>
			<!--- I guess the following isn't strictly necessary... --->
			<cfquery datasource="#request.forumDSN#">
				UPDATE	messages 
				SET		messages.archived = 1
				WHERE	messages.threadid = #qThreads.threadid#
			</cfquery>
		</cfloop>
	</cfif>
</cfloop>

<cfabort>

<!--- 
$Log: act_archivethreads.cfm,v $
Revision 1.1  2007/06/15 13:59:05  kevin
Add Admin Modules

Revision 1.4  2006/07/31 15:43:24  kevin
Remove old SQL

Revision 1.3  2005/09/05 15:47:31  kevin
Change DSN for forums.

Revision 1.2  2005/04/20 14:15:25  mike
expect qCategories query to be already done, etc.

Revision 1.1  2005/04/20 11:41:59  mike
new file
--->
</cfsilent>

