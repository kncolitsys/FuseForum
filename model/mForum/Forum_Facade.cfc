<!--- $RCSfile: Forum_Facade.cfc,v $ $Revision: 1.4 $ $Author: kevin $ $Date: 2007/06/14 16:52:21 $ --->
<cfcomponent displayname="Forum_Facade" hint="I provide a gateway for the complex queries which involve access to the user data.">
	<cffunction name="init" access="public" returntype="Forum_Facade" output="true"
		displayname="Forum Facade Constructor" hint="I initialize the Forum Facade.">
		<cfargument name="dsn" type="string" required="yes"
			displayname="Data Source Name" hint="I am the data source to use for persistence." />
		<cfargument name="userView" type="string" required="no" default="Users1"
			displayname="UserView" hint="I am the name of the table or view being used for user data." />
		
		<cfset variables.dsn = arguments.dsn />
		<cfset variables.userView = arguments.userView />
		<cfset variables.VeryShortTimespan = CreateTimeSpan(0,0,5,0)>
		
		<cfreturn this />
	</cffunction>
	
	<cffunction name="fArchivePrivateMessage" access="public" returntype="boolean" 
				output="false" displayname="Archive Private Message"
				hint="I archive the given private message">
		<cfargument name="messageid" type="numeric" required="true">
		<cfargument name="userid" type="numeric" required="true">
		<cfargument name="message" type="string" required="true">
		<cfargument name="senderid" type="numeric" required="true">
		<cfargument name="messagedate" type="date" required="true">
		<cfargument name="arch_date" type="date" required="true">
		<cfset var getmaxid = 0 />
		<cfset var archivepm = 0 />
		<cfset var removeold = 0 />
		<cfset var arch_messageid = 0 />
		<cftransaction>
			<cfquery name="getmaxid" datasource="#variables.dsn#">
				SELECT MAX(MessageID) AS MaxID
				FROM arch_privatemessages
			</cfquery>
			<cfif isnumeric(getmaxid.MaxID)>
				<cfset arch_messageid=getmaxid.MaxID+1>
			<cfelse>
				<cfset arch_messageid=1>
			</cfif>
			<cfquery name="archivepm" datasource="#variables.dsn#">
				INSERT INTO	arch_privatemessages
					(
					  messageid,
					  userid,
					  message,
					  senderid,
					  messagedate,
					  arch_date
					)
				VALUES
					(
					  #arch_messageid#,
					  #arguments.userid#,
					  '#arguments.message#',
					  #arguments.senderid#,
					  #createodbcdatetime(arguments.messagedate)#,
					  #createodbcdatetime(arguments.arch_date)#
					)
			</cfquery>
			<cfquery name="removeold" datasource="#variables.dsn#">
				DELETE FROM privatemessages
				WHERE messageid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.messageid#">
			</cfquery>
		</cftransaction>
		<cfreturn "true">
	</cffunction>

	<cffunction name="fThreadSubscribers" access="public" returntype="query" 
				output="false" displayname="Thread Subscribers"
				hint="I get subscribers to the given thread">
		<cfargument name="threadid" type="numeric" required="true">
		<cfargument name="orderby" type="string" required="false" default="" />
		<cfset var qThreadSubscribers = 0 />
		<cfquery name="qThreadSubscribers" datasource="#variables.dsn#">
			SELECT 	DISTINCT
					usr.userid,
					usr.emailaddress
			FROM 	subscriptions INNER JOIN
			   		#variables.userView# usr ON subscriptions.userid = usr.userid
			WHERE 	subscriptions.threadid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.threadid#">
				AND usr.emailsubs = 1
				AND	LTRIM(RTRIM(usr.emailaddress)) <> ''
			<cfif arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			</cfif>
		</cfquery>
		<cfreturn qThreadSubscribers>
	</cffunction>

	<cffunction name="fForumSubscribers" access="public" returntype="query" 
				output="false" displayname="Forum Subscribers"
				hint="I get subscribers to the given forum">
		<cfargument name="categoryid" type="numeric" required="true">
		<cfargument name="lThreadSubscribers" type="string" required="false" default="" />
		<cfargument name="orderby" type="string" required="false" default="" />
		<cfset var qForumSubscribers = 0 />
		<cfquery name="qForumSubscribers" datasource="#variables.dsn#">
			SELECT	DISTINCT
					usr.userid,
					usr.emailaddress
			FROM 	forum_subscriptions INNER JOIN
				   		#variables.userView# usr ON forum_subscriptions.fs_name_id = usr.userid
			WHERE 	forum_subscriptions.fs_forum_id = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.categoryid#">
				AND usr.emailsubs = 1
				AND	LTRIM(RTRIM(usr.emailaddress)) <> ''
				<cfif ListLen(arguments.lThreadSubscribers) NEQ 0>
					AND NOT (fs_name_id IN (#arguments.lThreadSubscribers#) )
				</cfif>
			<cfif arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			</cfif>
		</cfquery>
		<cfreturn qForumSubscribers>
	</cffunction>

	<cffunction name="fAddFriend" access="public" returntype="boolean" 
				output="false" displayname="Add Friend"
				hint="I insert a friend record">
		<cfargument name="userid" type="numeric" required="true">
		<cfargument name="friendid" type="numeric" required="true">
		<cfset var getmaxid = 0 />
		<cfset var recordid = 0 />
		<cfset var addfriend = 0 />
		<cftransaction>
			<!--- we don't use autonumbers, so must increment the identifier explicitly --->
			<cfquery name="getmaxid" datasource="#variables.dsn#">
				SELECT MAX(recordID) AS MaxID
				FROM friends
			</cfquery>
			<cfif isnumeric(getmaxid.MaxID)>
				<cfset recordid=getmaxid.MaxID+1>
			<cfelse>
				<cfset recordid=1>
			</cfif>
			<cfquery name="addfriend" datasource="#variables.dsn#">
				INSERT INTO friends
					(
					  recordid,
					  userid,
					  friendid
					)
				VALUES
					(
					  <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#recordid#">,
					  <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">,
					  <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.friendid#">
					)
			</cfquery>
		</cftransaction>
		<cfreturn "true" >
	</cffunction>

	<cffunction name="fForumModerators" access="public" returntype="query" 
				output="false" displayname="Forum Moderators"
				hint="I get the moderators for this forum">
		<cfargument name="categoryid" type="numeric" required="true">
		<cfargument name="orderby" type="string" required="false" default="" />
		<cfset var qForumModerators = 0 />
		<cfquery name="qForumModerators" datasource="#variables.dsn#">
			SELECT 	usr.emailaddress
					
			FROM 	#variables.userView# usr INNER JOIN
		  			categories_mod ON usr.userid = categories_mod.userid
			WHERE 	categories_mod.categoryid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.categoryid#">
				AND	LTRIM(RTRIM(usr.emailaddress)) <> ''
			<cfif arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			</cfif>
		</cfquery>
		<cfreturn qForumModerators>
	</cffunction>

	<cffunction name="findForumSubscriptionsOfUser" access="public" returntype="query" 
				output="false" displayname="Find Forum Subscriptions Of User"
				hint="I find the forum_subscriptions for this user">
		<cfargument name="userid" type="numeric" required="true">
		<cfargument name="orderby" type="string" required="false" default="" />
		<cfset var qForumSubscriptionsOfUser = 0 />
		<cfquery name="qForumSubscriptionsOfUser" datasource="#variables.dsn#">
			SELECT	forum_subscriptions.fs_id,
					forum_subscriptions.fs_forum_id,
					categories.categoryname
			FROM	forum_subscriptions, categories
			WHERE	forum_subscriptions.fs_name_id = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">
				AND	forum_subscriptions.fs_forum_id = categories.categoryid
			<cfif arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			</cfif>
		</cfquery>
		<cfreturn qForumSubscriptionsOfUser>
	</cffunction>

	<cffunction name="findSubscriptionsOfUser" access="public" returntype="query" 
				output="false" displayname="Find Subscriptions Of User"
				hint="I find the subscriptions for this user">
		<cfargument name="userid" type="numeric" required="true">
		<cfargument name="orderby" type="string" required="false" default="" />
		<cfset var qSubscriptionsOfUser = 0 />
		<cfquery name="qSubscriptionsOfUser" datasource="#variables.dsn#">
			SELECT 	subscriptions.threadid, 
					subscriptions.recordid,
					categories.categoryname, 
					threads.threadname, 
					threads.datelastpost,
					threads.messagecount
			FROM 	subscriptions, threads, categories
			WHERE 	subscriptions.userid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">
				AND	subscriptions.threadid = threads.threadid
				AND	threads.categoryid = categories.categoryid
			<cfif arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			</cfif>
		</cfquery>
		<cfreturn qSubscriptionsOfUser>
	</cffunction>

	<cffunction name="findMessagesOfUser" access="public" returntype="query" 
				output="false" displayname="Find Messages Of User"
				hint="I find the messages for this user">
		<cfargument name="userid" type="numeric" required="true">
		<cfargument name="orderby" type="string" required="false" default="" />
		<cfset var qMessagesOfUser = 0 />
		<cfquery name="qMessagesOfUser" datasource="#variables.dsn#">
			SELECT	DISTINCT
					threads.threadid, 
					threads.threadname, 
					threads.messagecount, 
					threads.datelastpost, 
					usr.username
			FROM 	#variables.userView# usr INNER JOIN (messages INNER JOIN threads 
						ON messages.threadid = threads.threadid) 
						ON usr.userid = messages.userid
			WHERE	messages.userid = #arguments.userid#
				AND	messages.messagedate >= #createodbcdate(dateadd('d',-10,now()))#
			<cfif arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			</cfif>
		</cfquery>
		<cfreturn qMessagesOfUser>
	</cffunction>

	<cffunction name="findPrivateMessagesOfUser" access="public" returntype="query" 
				output="false" displayname="Find Private Messages Of User"
				hint="I find the privatemessages for this user">
		<cfargument name="userid" type="numeric" required="true">
		<cfargument name="orderby" type="string" required="false" default="" />
		<cfset var qPrivateMessagesOfUser = 0 />
		<cfquery name="qPrivateMessagesOfUser" datasource="#variables.dsn#">
			SELECT	privatemessages.messageid, 
					privatemessages.userid, 
					privatemessages.messagedate, 
					usr.username
			FROM 	privatemessages
					INNER JOIN #variables.userView# usr ON privatemessages.senderid = usr.userid
			WHERE	privatemessages.userid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">
			<cfif arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			</cfif>
		</cfquery>
		<cfreturn qPrivateMessagesOfUser>
	</cffunction>

	<cffunction name="findFriendsOfUser" access="public" returntype="query" 
				output="false" displayname="Find Friends Of User"
				hint="I find the friends for this user">
		<cfargument name="userid" type="numeric" required="true">
		<cfargument name="orderby" type="string" required="false" default="" />
		<cfset var qFriendsOfUser = 0 />
		<cfquery name="qFriendsOfUser" datasource="#variables.dsn#">
			SELECT 	friends.recordid, 
					usr.username, 
					friends.friendid,
					count(messages.messageid) as countmsg
			FROM 	friends INNER JOIN (#variables.userView# usr LEFT JOIN messages ON usr.userid = messages.userid) 
						ON friends.friendid = usr.userid
			WHERE 	friends.userid = #arguments.userid#
				AND	(messages.messagedate >= #createodbcdate(dateadd('d',-10,now()))#
				OR 	messages.messagedate IS NULL)
			GROUP BY friends.recordid, usr.username, friends.friendid
			<cfif arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			</cfif>
		</cfquery>
		<cfreturn qFriendsOfUser>
	</cffunction>

	<!--- this is not used any more
	<cffunction name="fModerators" access="public" returntype="query" 
				output="false" displayname="Moderators"
				hint="I get the moderators for this thread's forum">
		<cfargument name="threadid" type="numeric" required="true">
		<cfargument name="orderby" type="string" required="false" default="" />
		<cfset var qModerators = 0 />
		<cfquery name="qModerators" datasource="#variables.dsn#">
			SELECT 	users.emailaddress
				
			FROM 	threads INNER JOIN
    				categories ON threads.categoryid = categories.categoryid LEFT JOIN
    				users INNER JOIN
    				categories_mod ON
						users.userid = categories_mod.userid ON
    					categories.categoryid = categories_mod.categoryid
			WHERE 	threads.threadid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.threadid#">
			<cfif arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			</cfif>
		</cfquery>
		<cfreturn qModerators>
	</cffunction>
	--->

	<!--- this is not used any more
	<cffunction name="fAllowAttachments" access="public" returntype="query" 
				output="false" displayname="Allow Attachments"
				hint="I find whether this thread's forum allows attachments">
		<cfargument name="threadid" type="numeric" required="true">
		<cfset var qAllowAttachments = 0 />
		<cfquery name="qAllowAttachments" datasource="#variables.dsn#">
			SELECT 	categories.allowattachments
			FROM	categories INNER JOIN threads ON categories.categoryid=threads.categoryid
			WHERE	threadid=<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.threadid#">
		</cfquery>
		<cfreturn qAllowAttachments>
	</cffunction>
	--->

	<cffunction name="fCountForumMessages" access="public" returntype="query" 
				output="false" displayname="Count Forum Messages"
				hint="I count the number of messages in this forum">
		<cfargument name="categoryid" type="numeric" required="true">
		<cfset var qCountForumMessages = 0 />
		<cfquery name="qCountForumMessages" datasource="#variables.dsn#">
			SELECT 	categories.messagelimit, 
					SUM(threads.messagecount) AS numberofmessages
			FROM 	categories INNER JOIN
			    	threads ON 
			    	categories.categoryid = threads.categoryid
			WHERE 	categories.categoryid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.categoryid#">
			GROUP BY categories.messagelimit
		</cfquery>
		<cfreturn qCountForumMessages>
	</cffunction>

	<cffunction name="fArchivedPrivateMessages" access="public" returntype="query" 
				output="false" displayname="Archived Private Messages"
				hint="I get the archived private messages for the specified user">
		<cfargument name="userid" type="numeric" required="true">
		<cfargument name="orderby" type="string" required="false" default="" />
		<cfset var qArchivedPrivateMessages = 0 />
		<cfquery name="qArchivedPrivateMessages" datasource="#variables.dsn#">
			SELECT	  arch_privatemessages.messageid, 
					  arch_privatemessages.userid, 
					  arch_privatemessages.messagedate, 
					  usr.username
			FROM 	  arch_privatemessages
					INNER JOIN  #variables.userView# usr ON arch_privatemessages.senderid = usr.userid
			WHERE	  arch_privatemessages.userid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">
			<cfif arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			</cfif>
		</cfquery>
		<cfreturn qArchivedPrivateMessages>
	</cffunction>

	<cffunction name="fArchivedPrivateMessage" access="public" returntype="query" 
				output="false" displayname="Archived Private Message"
				hint="I get the specified archived private message">
		<cfargument name="messageid" type="numeric" required="true">
		<cfset var qArchivedPrivateMessage = 0 />
		<cfquery name="qArchivedPrivateMessage" datasource="#variables.dsn#">
			SELECT 	pv.messageid,
					pv.userid,
					pv.message,
					pv.senderid,
					pv.messagedate,
					usr.username,
					usr.privatemessages,
					usr.signature
			FROM	arch_privatemessages AS pv LEFT JOIN #variables.userView# usr ON pv.senderid = usr.userid
			WHERE	pv.messageid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.messageid#">
		</cfquery>
		<cfreturn qArchivedPrivateMessage>
	</cffunction>

	<cffunction name="fPrivateMessage" access="public" returntype="query" 
				output="false" displayname="Private Message"
				hint="I get the specified private message">
		<cfargument name="messageid" type="numeric" required="true">
		<cfset var qPrivateMessage = 0 />
		<cfquery name="qPrivateMessage" datasource="#variables.dsn#">
			SELECT 	pv.messageid,
					pv.userid,
					pv.message,
					pv.senderid,
					pv.messagedate,
					usr.username,
					usr.privatemessages,
					usr.signature
			FROM	privatemessages AS pv LEFT JOIN #variables.userView# usr ON pv.senderid = usr.userid
			WHERE	pv.messageid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.messageid#">
		</cfquery>
		<cfreturn qPrivateMessage>
	</cffunction>

	<cffunction name="fCreateThread" access="public" returntype="numeric" 
				output="false" displayname="Create Thread"
				hint="I insert a new threads record">
		<cfargument name="threadname" type="string" required="true">
		<cfargument name="userid" type="numeric" required="true">
		<cfargument name="categoryid" type="numeric" required="true">
		<cfargument name="approved" type="boolean" required="true">
		<cfargument name="datecreated" type="date" required="No" default="now()" />
		<cfargument name="datelastpost" type="date" required="No" default="now()" />
		<cfset var qInsertThread = 0 />
		<cfset var qInsertedThreadid = 0 />
		<cftransaction>
			<cfquery name="qInsertThread" datasource="#variables.dsn#">
				INSERT INTO threads
					(
					  threadname,
					  datecreated,
					  userid,
					  categoryid,
					  messagecount,
					  datelastpost,
					  approved,
					  locked
					)
				VALUES
					(
					  '#arguments.threadname#',
					  #createodbcdatetime(arguments.datecreated)#,
					  #arguments.userid#,
					  #arguments.categoryid#,
					  1,
					  #createodbcdatetime(arguments.datelastpost)#,
					  #arguments.approved#,
					  0
					)
			</cfquery>
			<cfquery name="qInsertedThreadid" datasource="#variables.dsn#">
				SELECT IDENT_CURRENT('threads') AS threadid
			</cfquery>
		</cftransaction>
		<cfreturn qInsertedThreadid.threadid>
	</cffunction>

	<cffunction name="fCreateMessage" access="public" returntype="numeric" 
				output="false" displayname="Create Message"
				hint="I insert a new messages record">
		<cfargument name="message" type="string" required="true">
		<cfargument name="threadid" type="numeric" required="true">
		<cfargument name="userid" type="numeric" required="true">
		<cfargument name="approved" type="boolean" required="true">
		<cfargument name="messagedate" type="date" required="No" default="now()" />
		<cfargument name="attachment" type="string" required="true">
		<cfset var qInsertMessage = 0 />
		<cfset var qInsertedMessageid = 0 />
		<cftransaction>
			<cfquery name="qInsertMessage" datasource="#variables.dsn#">
				INSERT INTO messages
					(
					  message,
					  messagedate,
					  threadid,
					  userid,
					  approved,
					  attachment
					)
				VALUES
					(
					  '#arguments.message#',
					  #createodbcdatetime(arguments.messagedate)#,
					  #arguments.threadid#,
					  #arguments.userid#,
					  #arguments.approved#,
					  <cfif len(arguments.attachment)>'#arguments.attachment#'<cfelse>NULL</cfif>
					)
			</cfquery>
			<cfquery name="qInsertedMessageid" datasource="#variables.dsn#">
				SELECT IDENT_CURRENT('messages') AS messageid
			</cfquery>
		</cftransaction>
		<cfreturn qInsertedMessageid.messageid>
	</cffunction>

	<cffunction name="fCreatePrivateMessage" access="public" returntype="numeric" 
				output="false" displayname="Create Private Message"
				hint="I insert a new privatemessages record">
		<cfargument name="userid" type="numeric" required="true">
		<cfargument name="message" type="string" required="true">
		<cfargument name="senderid" type="numeric" required="true">
		<cfset var getmaxid = 0 />
		<cfset var messageid = 0 />
		<cfset var sendmessage = 0 />
		<cftransaction>
			<cfquery name="getmaxid" datasource="#variables.dsn#">
				SELECT	MAX(messageid) AS MaxID
				FROM	privatemessages
			</cfquery>
			<cfif IsNumeric(getmaxid.MaxID)>
				<cfset messageid=getmaxid.MaxID+1>
			<cfelse>
				<cfset messageid=1>
			</cfif>
			<cfquery name="sendmessage" datasource="#variables.dsn#">
				INSERT INTO	privatemessages
					(
					  messageid,
					  userid,
					  message,
					  senderid,
					  messagedate
					)
				VALUES
					(
					  #messageid#,
					  #arguments.userid#,
					  '#arguments.message#',
					  #arguments.senderid#,
					  #createodbcdatetime(now())#
					)
			</cfquery>
		</cftransaction>
		<cfreturn messageid>
	</cffunction>

	<cffunction name="fThreadDetails" access="public" returntype="query" 
				output="false" displayname="Thread Details"
				hint="I get details of the given thread">
		<cfargument name="threadid" type="numeric" required="true">
		<cfargument name="orderby" type="string" required="false" default="" />
		<cfset var qThreadDetails = 0 />
		<cfquery name="qThreadDetails" datasource="#variables.dsn#">
			SELECT 	threads.threadname,
					threads.categoryid,
					categories.categoryname
			FROM 	threads INNER JOIN
			    	categories ON
			    	threads.categoryid = categories.categoryid
			WHERE 	threads.threadid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.threadid#">
		</cfquery>
		<cfreturn qThreadDetails>
	</cffunction>

	<cffunction name="fForumsVisible" access="public" returntype="query" 
				output="false" displayname="Forum Visible"
				hint="I find which forums are visible to a user (depending on their status)">
		<cfargument name="userid" type="numeric" required="true">
		<cfargument name="SiteId" type="numeric" required="true">
		<cfargument name="categoryid" type="numeric" required="false" />
		<cfargument name="orderby" type="string" required="false" default="" />
		<cfset var qForumsVisible = 0 />
		<cfquery name="qForumsVisible" datasource="#variables.dsn#">
			SELECT 	DISTINCT
					categories.categoryid, 
					categories.categoryname,
					categories.description,
					categories.readonly,
					categories.visibleto
			<cfif session.userisadmin>
				FROM	categories INNER JOIN
							SiteCategories ON categories.categoryid = SiteCategories.CategoryId
				WHERE	categories.status = 'Active' AND SiteCategories.SiteId = #arguments.SiteId#
			<cfelseif session.userismod>
				FROM	categories INNER JOIN
							SiteCategories ON categories.categoryid = SiteCategories.CategoryId LEFT OUTER JOIN
							categories_mod ON categories.categoryid = categories_mod.categoryid LEFT OUTER JOIN
							categories_per ON categories.categoryid = categories_per.categoryid  
				WHERE	categories.status = 'Active' AND SiteCategories.SiteId = #arguments.SiteId#
					AND	(
						categories_mod.userid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#"> OR
						categories_per.userid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#"> OR
						categories.visibleto = 'Moderators' OR
						categories.visibleto = 'Public' OR
					<cfif isDefined("client.userisERSCmember") AND client.userisERSCmember>
						categories.visibleto = 'ERSC' OR
					</cfif>
					<cfif isDefined("client.userisReferee") AND client.userisReferee>
						categories.visibleto = 'Referees' OR
					</cfif>
						categories.visibleto = 'ER'
						)
			<cfelse>
				FROM	categories INNER JOIN
							SiteCategories ON categories.categoryid = SiteCategories.CategoryId LEFT OUTER JOIN
							categories_per ON categories.categoryid = categories_per.categoryid  
				WHERE	categories.status = 'Active' AND SiteCategories.SiteId = #arguments.SiteId#
					AND	(
						categories_per.userid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#"> OR
						categories.visibleto = 'Public' OR
					<cfif isDefined("client.userisERSCmember") AND client.userisERSCmember>
						categories.visibleto = 'ERSC' OR
					</cfif>
					<cfif isDefined("client.userisReferee") AND client.userisReferee>
						categories.visibleto = 'Referees' OR
					</cfif>
						categories.visibleto = 'ER'
						)
			</cfif>
			<cfif isDefined("arguments.categoryid")>
				AND	categories.categoryid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.categoryid#">
			</cfif>
			<cfif arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			</cfif>
		</cfquery>
		<cfreturn qForumsVisible>
	</cffunction>

	<!--- this function not used any more
	<cffunction name="fForumsAndThreads" access="public" returntype="query" 
				output="false" displayname="Forums And Threads"
				hint="I find forums and their thread info">
		<cfargument name="userid" type="numeric" required="true">
		<cfargument name="lCategoryids" type="string" required="true" />
		<cfargument name="orderby" type="string" required="false" default="" />
		<cfset var qForumsAndThreads = 0 />
		<cfquery name="qForumsAndThreads" datasource="#variables.dsn#">
			SELECT DISTINCT
				 	categories.categoryid, 
					categories.categoryname, 
					categories.description, 
					categories.readonly,
					threads.datelastpost, 
			    	threads.messagecount
			FROM 	categories LEFT OUTER JOIN
			    	threads ON categories.categoryid = threads.categoryid
			<cfif ListLen(arguments.lCategoryids)>
				WHERE	categories.categoryid IN (#arguments.lCategoryids#)
			<cfelse>
				WHERE	0 = 1
			</cfif>
				AND	(threads.Approved = 1 OR threads.Approved IS NULL)
			<cfif arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			</cfif>
		</cfquery>
		<cfreturn qForumsAndThreads>
	</cffunction>
	--->

	<cffunction name="fForumThreads" access="public" returntype="query" 
				output="false" displayname="Forum Threads"
				hint="I find categories and threads info for the given forum">
		<cfargument name="categoryid" type="numeric" required="true" />
		<cfargument name="orderby" type="string" required="false" default="" />
		<cfset var qForumThreads = 0 />
		<cfquery name="qForumThreads" datasource="#variables.dsn#">
			SELECT 	categories.categoryname,
					categories.description,
					categories.readonly,
					threads.threadid,
					threads.threadname,
					UPPER(threads.threadname) AS Uthreadname,
					threads.datecreated,
					threads.datelastpost,
					CONVERT(char(8),threads.datelastpost,112) AS juliandate,
					threads.messagecount,
					usr.username,
					UPPER(usr.username) AS Uusername
			FROM	categories INNER JOIN threads 
					  ON categories.categoryid = threads.categoryid INNER JOIN
					  #variables.userView# usr ON threads.userid = usr.userid
			WHERE	categories.categoryid = #arguments.categoryid#
				AND	(threads.approved = 1 OR threads.approved IS NULL)
			<cfif arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			</cfif>
		</cfquery>
		<cfreturn qForumThreads>
	</cffunction>

	<cffunction name="fLastPosters" access="public" returntype="query" 
				output="false" displayname="Last Posters"
				hint="I find the last posters to the given set of threads">
		<cfargument name="lThreadids" type="string" required="true" />
		<cfargument name="orderby" type="string" required="false" default="" />
		<cfset var qLastPosters = 0 />
		<cfquery name="qLastPosters" datasource="#variables.dsn#">
			SELECT	threads.threadid,
					usr.username AS last_poster
			FROM	threads, messages LEFT JOIN #variables.userView# usr ON usr.userid = messages.userid
			WHERE	messages.threadid = threads.threadid
				AND threads.threadid IN (#arguments.lThreadids#)
				AND	messages.messagedate = 
				(SELECT MAX(messagesB.messagedate)
				 FROM messages messagesB
	     			 WHERE messagesB.threadid = threads.threadid
				 AND messagesB.approved = 1
				 )
			<cfif arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			</cfif>
		</cfquery>
		<cfreturn qLastPosters>
	</cffunction>

	<cffunction name="fLastPoster" access="public" returntype="query" 
				output="false" displayname="Last Poster"
				hint="I find the last poster to the given thread">
		<cfargument name="threadid" type="numeric" required="true" />
		<cfargument name="messagedate" type="date" required="false" />
		<cfset var qLastPoster = 0 />
		<cfquery name="qLastPoster" datasource="#variables.dsn#">
			SELECT	messages.messagedate,
					usr.username AS lastposter
			FROM	messages LEFT JOIN #variables.userView# usr ON usr.userid = messages.userid
			WHERE	messages.threadid = #arguments.threadid#
				AND	messages.approved = 1
			<cfif isDefined("arguments.messagedate")>
				AND	messages.messagedate = #createODBCdatetime(arguments.messagedate)#
			</cfif>
		</cfquery>
		<cfreturn qLastPoster>
	</cffunction>

	<cffunction name="fArchivedMessages" access="public" returntype="query" 
				output="false" displayname="Archived Messages"
				hint="I find the arch_messages for the given arch_threads record">
		<cfargument name="threadid" type="numeric" required="true" />
		<cfargument name="orderby" type="string" required="false" default="" />
		<cfset var qArchivedMessages = 0 />
		<cfquery name="qArchivedMessages" datasource="#variables.dsn#">
			SELECT arch_threads.threadid, 
					arch_threads.threadname, 
					arch_messages.messageid, 
					arch_messages.message, 
					arch_messages.messagedate, 
					arch_messages.editmessage, 
					arch_messages.attachment,	
					arch_messages.moderatormessage,
					arch_messages.username,
					arch_messages.email
			FROM 	arch_threads INNER JOIN arch_messages ON arch_threads.threadid = arch_messages.threadid
			WHERE 	arch_threads.threadid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.threadid#">
			<cfif arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			</cfif>
		</cfquery>
		<cfreturn qArchivedMessages>
	</cffunction>

	<cffunction name="fThreadMessages" access="public" returntype="query" 
				output="false" displayname="Thread Messages"
				hint="I find the messages for the given threads record">
		<cfargument name="threadid" type="numeric" required="true" />
		<cfargument name="orderby" type="string" required="false" default="" />
		<cfset var qThreadMessages = 0 />
		<cfquery name="qThreadMessages" datasource="#variables.dsn#">
			SELECT	threads.threadid, 
					threads.threadname, 
					threads.locked,
					messages.messageid, 
					messages.message, 
					messages.messagedate, 
					<!--- CONVERT(varchar,messages.messagedate,120) AS messagedatetime, --->
					messages.userid,
					messages.editmessage,
					messages.attachment,	
					messages.moderatormessage,		  
					usr.username, 
					usr.emailaddress,
					usr.showemail, 
					usr.showprofile,
					usr.privatemessages, 
					usr.signature, 
					(SELECT recordid
					 FROM	subscriptions
					 WHERE	userid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">
					 	AND	threadid=[threads].[threadid]
					) AS recordid,
					categories.categoryname,
					categories.readonly
			FROM	(((threads INNER JOIN messages ON threads.threadid = messages.threadid) 
					  INNER JOIN #variables.userView# usr ON messages.userid = usr.userid)) 
					  INNER JOIN categories ON threads.categoryid = categories.categoryid
			WHERE 	threads.threadid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.threadid#">
				AND	threads.approved = 1
				AND messages.approved = 1
			<cfif arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			</cfif>
		</cfquery>
		<cfreturn qThreadMessages>
	</cffunction>

	<cffunction name="fCreateSubscription" access="public" returntype="numeric" 
				output="false" displayname="Create Subscription"
				hint="I insert a new subscriptions record">
		<cfargument name="userid" type="numeric" required="true">
		<cfargument name="threadid" type="numeric" required="true">
		<cfset var getmaxid = 0 />
		<cfset var recordid = 0 />
		<cfset var subscribe = 0 />
		<cftransaction>
			<!--- we don't use autonumbers, so must increment the identifier explicitly --->
			<cfquery name="getmaxid" datasource="#variables.dsn#">
				SELECT MAX(recordID) AS MaxID
				FROM subscriptions
			</cfquery>
			<cfif isnumeric(getmaxid.MaxID)>
				<cfset recordid=getmaxid.MaxID+1>
			<cfelse>
				<cfset recordid=1>
			</cfif>
			<cfquery name="subscribe" datasource="#variables.dsn#">
				INSERT INTO subscriptions
					(
					  recordid,
					  userid,
					  threadid
					)
				VALUES
					(
					  <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#recordid#">,
					  <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">,
					  <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.threadid#">
					)
			</cfquery>
		</cftransaction>
		<cfreturn recordid>
	</cffunction>

	<cffunction name="fCreateForumSubscription" access="public" returntype="numeric" 
				output="false" displayname="Create Forum Subscription"
				hint="I insert a new forums_subscriptions record">
		<cfargument name="userid" type="numeric" required="true">
		<cfargument name="categoryid" type="numeric" required="true">
		<cfset var subscribe = 0 />
		<cfset var qInsertedSubscription = 0 />
		<cftransaction>
			<cfquery name="subscribe" datasource="#variables.dsn#">
				INSERT INTO forum_subscriptions
					(
					  fs_name_id,
					  fs_forum_id
					)
				VALUES
					(
					  <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">,
					  <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.categoryid#">
					)
			</cfquery>
			<cfquery name="qInsertedSubscription" datasource="#variables.dsn#">
				SELECT IDENT_CURRENT('forum_subscriptions') AS fs_id
			</cfquery>
		</cftransaction>
		<cfreturn qInsertedSubscription.fs_id>
	</cffunction>

	<cffunction name="fLatestThreads" access="public" returntype="query" 
				output="false" 
				displayname="Latest Threads"
				hint="I get a recordset of the most recent Forums Postings.">
		<cfargument name="lForums" type="any" required="true" hint="List of ForumIds to be queried.">
		<cfargument name="maxrows" type="numeric" required="false" default="4" hint="Number of postings to be returned.">
		<cfargument name="orderby" type="string" required="false" default="Threads.DateLastPost DESC" hint="Order to be returned." />
		<cfset var qLatestThreads = 0 />
		<cfquery name="qLatestThreads" datasource="#variables.dsn#" maxrows="#arguments.maxrows#" cachedwithin="#variables.VeryShortTimespan#">
			SELECT 	Threads.ThreadID,
					Threads.ThreadName,
					Threads.MessageCount
			FROM	Threads
			WHERE	Threads.categoryid IN (#arguments.lForums#)
				AND	(Threads.Approved = 1 OR Threads.Approved IS NULL)
			ORDER BY #arguments.orderby#
		</cfquery>

		<cfreturn qLatestThreads>
	</cffunction>
	
	<cffunction name="fFriendsOnline" access="public" returntype="query" 
				output="false" displayname="Latest Threads"
				hint="I get a recordset of the Friend who logged in recently - so may be online.">
		<cfargument name="qClientVarCheck" type="query" required="true" hint="Query from client vars table">
		<cfargument name="userid" type="numeric" required="true">
		
		<cfargument name="maxentries" type="numeric" required="No" default="20" hint="Set the maximum number of entries that we are interested in " >
		<cfargument name="timeout" type="numeric" required="No" default="240" hint="Set time in Minutes that we are interested in." >
		
		<cfset var Today = dateformat(now(),"yyyy-mm-dd")>
		<cfset var Yesterday = dateformat(DateAdd("d",-1,now()),"yyyy-mm-dd")>
		<cfset var qMyFriends = 0>
		<cfset var lFriendIds = "">
		<cfset var qFriendsOnline = QueryNew("NameId,LoginName,LoginTime,LoginPeriod")>
		<cfset var rowcount = 0>
		<cfset var NameIdIndex = 0>
		<cfset var LoginNameIndex = 0>
		<cfset var nameid = 0>
		<cfset var LoginPeriod = 0>

		<cfquery name="qMyFriends" datasource="#variables.dsn#">
			SELECT	friendid
			FROM	friends
			WHERE	userid = #arguments.userid#
		</cfquery>
		<cfset lFriendIds = ValueList(qMyFriends.friendid)>
		
		<cfif ListLen(lFriendIds)>
			<cfset rowcount = 0>
			<cfloop query="arguments.qClientVarCheck">
				<!--- Check if the record is for one of the dates of interest --->
				<cfif LoginDate IS Today OR LoginDate IS Yesterday>
					<!--- Find the position in the string of the nameId and loginName --->
					<cfset NameIdIndex=Find("##",qClientVarCheck.NameId)>
					<cfset LoginNameIndex=Find("##",qClientVarCheck.LoginName)>
					<!--- If we found the nameId and loginName --->
					<cfif NameIdIndex NEQ 0 AND LoginNameIndex NEQ 0><!--- should always be true --->
						<!--- Extract the nameId --->
						<cfset nameid=Left(qClientVarCheck.NameId,NameIdIndex-1)>
						<!--- Calculate the period since user logged on --->
						<cfset LoginPeriod = 24*60*(now()-qClientVarCheck.LoginTime)>
						<!--- If logonTime is within the timeout period --->
						<cfif LoginPeriod LT arguments.timeout>
							<!--- Check that user is not already in the recordset --->
							<cfif ListFindNoCase(ValueList(qFriendsOnline.NameId),NameId) EQ 0
							  AND ListFind(lFriendIds,nameid)>
								<cfset temp=QueryAddRow(qFriendsOnline)>
								<cfset temp=QuerySetCell(qFriendsOnline,"NameId",Left(qClientVarCheck.NameId,NameIdIndex-1))>
								<cfset temp=QuerySetCell(qFriendsOnline,"LoginName",Left(qClientVarCheck.LoginName,LoginNameIndex-1))>
								<cfset temp=QuerySetCell(qFriendsOnline,"LoginTime",qClientVarCheck.LoginTime)>
								<cfset temp=QuerySetCell(qFriendsOnline,"LoginPeriod",LoginPeriod)>
								<cfset rowcount = rowcount+1>
								<cfif rowcount GTE arguments.maxentries>
									<cfbreak>
								</cfif>
							</cfif>
						</cfif>
					</cfif>
				<cfelse>
					<cfbreak>
				</cfif>
			</cfloop>
		</cfif>
		
		<cfreturn qFriendsOnline >
	</cffunction>
	
	<!--
	<cffunction name="fXxx" access="public" returntype="query" 
				output="false" displayname="..."
				hint="I get ...">
		<cfargument name="xxx" type="numeric" required="true">
		<cfargument name="orderby" type="string" required="false" default="" />
		<cfset var qXxx = 0 />
		<cfquery name="qXxx" datasource="#variables.dsn#">
		</cfquery>
		<cfreturn qXxx>
	</cffunction>
	-->

</cfcomponent>
<!--- 
$Log: Forum_Facade.cfc,v $
Revision 1.4  2007/06/14 16:52:21  kevin
Remove specific comments

Revision 1.3  2007/06/14 15:07:14  kevin
single email address

Revision 1.2  2007/06/14 14:01:11  kevin
Initial Open Source Version

Revision 1.22  2006/07/26 13:34:44  mike
bug fix: correct small typo

Revision 1.21  2006/07/25 11:50:10  kevin
Make siteId a parameter in fForumsvisible.
Add veryshortTimespan to init.
New methods to support FB4

Revision 1.20  2006/07/24 13:12:59  kevin
Changes to datadbase access for Trafalgar conversion.

Revision 1.19  2005/05/27 15:38:43  mike
bug fixes: variables.recordid => recordid, etc.

Revision 1.18  2005/05/27 09:21:20  mike
ensure all local variables are in var scope

Revision 1.17  2005/05/24 13:27:50  mike
new method fForumSubscribers() etc.

Revision 1.16  2005/05/23 16:16:28  mike
remove fForumVisible(), etc.

Revision 1.15  2005/05/23 15:21:54  mike
check for client.userisReferee

Revision 1.14  2005/05/23 11:44:13  mike
test request.SiteId

Revision 1.13  2005/05/21 10:17:52  mike
correct path for Forum_Facade.cfc

Revision 1.12  2005/05/20 12:40:56  kevin
New server cfc naming convention

Revision 1.11  2005/05/20 11:40:45  mike
new method fCreateForumSubscription()

Revision 1.10  2005/05/20 08:30:41  mike
bug fix: test client.userisERSCmember differently

Revision 1.9  2005/05/17 07:58:12  mike
set Uthreadname and Uusername too

Revision 1.8  2005/05/16 18:28:44  mike
return juliandate too

Revision 1.7  2005/05/16 14:51:48  mike
new function fLastPoster()

Revision 1.6  2005/05/16 14:09:51  mike
pass messagedate etc. explicitly, to ensure threads and messages records synchronised

Revision 1.5  2005/05/13 18:36:07  mike
test that client.userisERSCmember exists

Revision 1.4  2005/05/09 17:58:53  mike
lots of new functions

Revision 1.3  2005/05/09 09:39:03  mike
correct path for Forum_Facade

Revision 1.2  2005/05/06 18:23:38  mike
lots of new methods

Revision 1.1  2005/05/05 12:28:14  mike
Initial FB4 Version

 --->

