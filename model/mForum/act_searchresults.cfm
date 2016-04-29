<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="act_searchresults.cfm">
	<responsibilities>
		I find the search results
		NOT USED, BECAUSE VERITY USED FOR SEARCHING
		ONLY USED IF SEARCHES DONE BY SQL
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
			<string name="searchtype" scope="request" />
			<list name="categorylist" scope="attributes" optional="Yes" />
			<string name="search1" scope="attributes" />
			<string name="messagetype" scope="attributes" />
			<datetime name="date1" scope="attributes" />
			<datetime name="date2" scope="attributes" />
		</in>
		<out>
			<recordset name="searchresults" scope="variables" format="CFML">
				<number name="messageid" optional="Yes"/>
				<number name="threadid"/>
				<string name="threadname"/>
				<datetime name="datelastpost"/>
				<number name="messagecount"/>
				<datetime name="messagedate" optional="Yes" />
			</recordset>
		</out>
	</io>
</fusedoc>
--->

<cfparam name="request.searchtype" default="">

<cfif len(attributes.date1) AND len(attributes.date2)>
	<cfset startdate="#listlast(attributes.date1,'/')#-#listgetat(attributes.date1,2,'/')#-#listfirst(attributes.date1,'/')#">
	<cfset enddate="#listlast(attributes.date2,'/')#-#listgetat(attributes.date2,2,'/')#-#listfirst(attributes.date2,'/')#">	
	<cfset datestring="messagedate BETWEEN #startdate# AND #enddate#">
<cfelseif len(attributes.date1)>
	<cfset startdate="#listlast(attributes.date1,'/')#-#listgetat(attributes.date1,2,'/')#-#listfirst(attributes.date1,'/')#">
	<cfset datestring="messagedate > #startdate#">
<cfelseif len(attributes.date2)>
	<cfset enddate="#listlast(attributes.date2,'/')#-#listgetat(attributes.date2,2,'/')#-#listfirst(attributes.date2,'/')#">	
	<cfset datestring="messagedate < #enddate#">
<cfelse>
	<cfset datestring="1=1">
</cfif>		

<cfif request.searchtype IS "fulltext">
	<cfif isDefined("attributes.categorylist") AND len(attributes.search1)>
		<cfif attributes.messagetype IS "current">
			<cftry>	
				<cfquery name="searchresults" datasource="#request.ForumDSN#">
					SELECT 	DISTINCT 
							threads.threadid, 
							threads.threadname,
							threads.datelastpost,
							threads.messagecount,
							messages.messagedate
					FROM 	messages INNER JOIN
		                    threads ON messages.threadid = threads.threadid INNER JOIN
		                    categories ON threads.categoryid = categories.categoryid
					WHERE 	#preservesinglequotes(datestring)#
				    	AND	CONTAINS(message, '#attributes.search1#')
						AND	messages.approved = 1
						AND	categories.categoryid IN (#attributes.categorylist#)
					ORDER BY messages.messagedate
				</cfquery>
			<cfcatch type="Database">
				<cfif cfcatch.errorcode is "37000">
					<cfset errormsg="Your search could not be processed. Please be more specific.">
				</cfif>
			</cfcatch>
			</cftry>	
		<cfelse>
			<cftry>	
				<cfquery name="searchresults" datasource="#request.ForumDSN#">
					SELECT DISTINCT
						 	arch_messages.messageid, 
							arch_threads.threadid, 
							arch_threads.threadname,
							arch_threads.datelastpost,
							arch_threads.messagecount,
							arch_messages.messagedate
					FROM 	arch_messages INNER JOIN
		                    arch_threads ON arch_messages.threadid = arch_threads.threadid 
					WHERE 	#preservesinglequotes(datestring)#
				    	AND	CONTAINS(message, '#attributes.search1#')
					ORDER BY arch_messages.messagedate
				</cfquery>
			<cfcatch type="Database">
				<cfif cfcatch.errorcode is "37000">
					<cfset errormsg="Your search could not be processed. Please be more specific.">
				</cfif>
			</cfcatch>
			</cftry>	
		</cfif>
	</cfif>
<cfelse>
	<cfif attributes.messagetype IS "current">	
		<cfif isDefined("attributes.categorylist") AND len(attributes.search1)>
			<cfquery name="this_search" datasource="#request.ForumDSN#">
				SELECT DISTINCT 
						threads.threadid, threads.datelastpost
				FROM 	messages INNER JOIN
	                    threads ON messages.threadid = threads.threadid INNER JOIN
	                    categories ON threads.categoryid = categories.categoryid
				WHERE 	#preservesinglequotes(datestring)#
					AND	categories.categoryid IN (#attributes.categorylist#)
					AND	message LIKE '%#attributes.search1#%'
				ORDER BY threads.datelastpost			
			</cfquery>
			<cfif this_search.recordcount>
				<cfset my_query_results=valuelist(this_search.threadid)>
			<cfelse>
				<cfset my_query_results = 0>
			</cfif>
			<cfquery name="searchresults" datasource="#request.ForumDSN#">
				SELECT DISTINCT 
						threads.threadid, 
						threads.threadname,
						threads.datelastpost,
						threads.messagecount
				FROM 	messages INNER JOIN
	                    threads ON messages.threadid = threads.threadid INNER JOIN
	                    categories ON threads.categoryid = categories.categoryid
				WHERE 	#preservesinglequotes(datestring)#
					AND	threads.threadid IN (#my_query_results#)
					AND	categories.categoryid IN (#attributes.categorylist#)
				ORDER BY threads.datelastpost			
			</cfquery>
		</cfif>
	<cfelse>
		<cfquery name="searchresults" datasource="#request.ForumDSN#">
			SELECT DISTINCT 
					arch_threads.threadid, 
					arch_threads.threadname,
					arch_threads.datelastpost,
					arch_threads.messagecount
			FROM 	arch_messages INNER JOIN
	                   arch_threads ON arch_messages.threadid = arch_threads.threadid
			WHERE 	#preservesinglequotes(datestring)#
				AND	message LIKE '%#attributes.search1#%'
			ORDER BY arch_threads.datelastpost			
		</cfquery>
	</cfif>
</cfif>

<cfif NOT isDefined("searchresults")>
	<cfset searchresults.recordcount=0>
</cfif>

<!---
$Log: act_searchresults.cfm,v $
Revision 1.4  2007/06/14 16:52:21  kevin
Remove specific comments

Revision 1.3  2007/06/14 16:38:34  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:10  kevin
Initial Open Source Version

Revision 1.3  2005/12/02 17:27:48  mike
DSN => ForumDSN

Revision 1.2  2005/05/05 13:52:27  mike
improve layout and fusedoc; NB this code is not used

Revision 1.1  2005/05/05 12:29:25  mike
Initial FB4 Version

Revision 1.2  2004/11/02 16:36:37  mike
added fusedoc, etc.

Revision 1.1  2004/10/18 10:11:53  mike
initial version

Revision 1.3.6.2  2004/03/04 10:41:36  mike
fix $Log comment, reformat layout
 --->
</cfsilent>
