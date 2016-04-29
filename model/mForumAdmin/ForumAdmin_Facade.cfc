<!--- $RCSfile: ForumAdmin_Facade.cfc,v $ $Revision: 1.1 $ $Author: kevin $ $Date: 2007/06/15 13:59:05 $ --->
<cfcomponent displayname="ForumAdmin_Facade">
	<cffunction name="init" access="public" returntype="ForumAdmin_Facade" output="true"
		displayname="ForumAdmin Facade Constructor" hint="I initialize the ForumAdmin Facade.">
		<cfargument name="dsn" type="string" required="yes"
			displayname="Data Source Name" hint="I am the data source to use for persistence." />
		<cfargument name="UsersViewName" type="string" required="no" default="users1"
			displayname="Users View Name" hint="I am the name of the view to be used for the users view." />	
		<cfset variables.dsn = arguments.dsn />
		<cfset variables.UsersViewName = arguments.UsersViewName />
		<cfreturn this />
	</cffunction>
	
	<cffunction name="fAllSiteCategories" access="public" returntype="query" 
				output="false" displayname="All SiteCategories"
				hint="I get all SiteCategories records">
		<cfargument name="orderby" type="string" required="false" default="" />
		<cfset var qAllSiteCategories = 0 />
		<cfquery name="qAllSiteCategories" datasource="#variables.dsn#">
			SELECT	SiteCategories.SiteCategoriesId,
					SiteCategories.SiteId,
					SiteCategories.CategoryId,
					SiteCategories.Sequence,
					categories.categoryname
			FROM	SiteCategories, categories
			WHERE	SiteCategories.CategoryId = categories.categoryid
				AND	categories.status= 'Active'
			<cfif arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			</cfif>
		</cfquery>
		<cfreturn qAllSiteCategories>
	</cffunction>

	<cffunction name="fAllModerators" access="public" returntype="query" 
				output="false" displayname="All Moderators"
				hint="I get all the moderators for the given forum who are not in the given list">
		<cfargument name="userids" type="string" required="true">
		<cfset var qAllModerators = 0 />
		<!--- <cfif variables.UsersViewName IS "users2"> --->
			<!--- TODO: Set security for a real list of moderators --->
			<cfquery name="qAllModerators" datasource="#request.ForumDSN#">
				SELECT	DISTINCT
						userid AS name_id,
						username AS name_login_name
				FROM	users1
				WHERE 	username <> ''
				
						<!--- permissions,sections,permission_sections,group_permissions,group_members
				WHERE 	permissions.name = 'Moderate'
					AND	sections.name = 'Forums'
					AND permissions.permission_id = permission_sections.permission_id
					AND sections.section_id = permission_sections.section_id
					AND group_permissions.permission_section_id = permission_sections.permission_section_id
					AND name.name_id = group_members.user_id
					AND name.name_login_name IS NOT NULL
					AND 
					<cfif ListLen(arguments.userids) NEQ 0>
						AND name.name_id NOT IN (#arguments.userids#)
					</cfif> --->
				ORDER BY	name.name_login_name
			</cfquery>
		<!--- <cfelse>
			<cfquery name="qAllModerators" datasource="#request.userDSN#">
				SELECT	DISTINCT
						FWBIndividual.AF_NAME_ID AS name_id,
						NGSUsers.UserID AS name_login_name
				FROM	#request.TrafalgarDBName#.FWBIndividual	AS FWBIndividual INNER JOIN
						#request.TrafalgarDBName#.NGSUsers AS NGSUsers
							ON FWBIndividual.IndividualID = NGSUsers.IndividualID,
						permissions,sections,permission_sections,group_permissions,group_members
				WHERE	permissions.name = 'Moderate'
					AND sections.name = 'Forums'
					AND permissions.permission_id = permission_sections.permission_id
					AND sections.section_id = permission_sections.section_id
					AND group_permissions.permission_section_id = permission_sections.permission_section_id
					AND FWBIndividual.AF_NAME_ID = group_members.user_id
					AND NGSUsers.UserID IS NOT NULL <!--- added 8Aug06 --->
					AND NGSUsers.UserID <> '' <!--- added 8Aug06 --->
					<cfif ListLen(arguments.userids) NEQ 0>
						AND FWBIndividual.AF_NAME_ID NOT IN (#arguments.userids#)
					</cfif>
				ORDER BY	NGSUsers.UserID
			</cfquery>
		</cfif> --->
		<cfreturn qAllModerators>
	</cffunction>

	<cffunction name="fCategoryModerators" access="public" returntype="query" 
				output="false" displayname="Category Moderators"
				hint="I get all the moderators for the given forum">
		<cfargument name="categoryid" type="numeric" required="true">
		<cfargument name="orderby" type="string" required="false" default="" />
		<cfset var qCategoryModerators = 0 />
		<cfquery name="qCategoryModerators" datasource="#variables.dsn#">
			SELECT	DISTINCT
					usr.userid,
					usr.username
			FROM	categories INNER JOIN
				categories_mod ON categories.categoryid = categories_mod.categoryid INNER JOIN
			    #variables.UsersViewName# usr ON categories_mod.userid = usr.userid 
			WHERE	categories.categoryid = #arguments.categoryid#
			<cfif arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			</cfif>
		</cfquery>
		<cfreturn qCategoryModerators>
	</cffunction>
	
	<cffunction name="fAllThreads" access="public" returntype="query" 
				output="false" displayname="All Threads"
				hint="I get details of all threads">
		<cfargument name="threadid" type="numeric" required="true">
		<cfargument name="orderby" type="string" required="false" default="" />
		<cfset var qAllThreads = 0 />
		<cfquery name="qAllThreads" datasource="#variables.dsn#">
			SELECT    thr.threadid, 
					  thr.threadname, 
					  thr.datecreated, 
					  msg.messageid, 
					  msg.message, 
					  msg.messagedate, 
					  msg.attachment
			FROM      threads thr INNER JOIN
			          messages msg ON 
					  thr.threadid = msg.threadid INNER JOIN
			          categories ON 
					  thr.categoryid = categories.categoryid
			WHERE 	  thr.threadid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.threadid#">
			<cfif arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			</cfif>
		</cfquery>
		<cfreturn qAllThreads>
	</cffunction>

	<cffunction name="fThreadAndMessageDetails" access="public" returntype="query" 
				output="false" displayname="Thread And Message Details"
				hint="I get details of a thread">
		<cfargument name="threadid" type="numeric" required="true">
		<cfset var qThreadAndMessageDetails = 0 />
		<cfquery name="qThreadAndMessageDetails" datasource="#variables.dsn#">
			SELECT 	messages.message, 
					messages.moderatormessage,
					messages.messageid,
					threads.threadname
			FROM 	threads INNER JOIN
			    	messages ON threads.threadid = messages.threadid
			WHERE 	threads.threadid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.threadid#">
		</cfquery>
		<cfreturn qThreadAndMessageDetails>
	</cffunction>

	<cffunction name="fMessageAuthor" access="public" returntype="query" 
				output="false" displayname="Message Author"
				hint="I find who posted the message">
		<cfargument name="messageid" type="numeric" required="true">
		<cfset var qMessageAuthor = 0 />
		<cfquery name="qMessageAuthor" datasource="#variables.dsn#">
			SELECT 	usr.username
			FROM 	#variables.UsersViewName# usr INNER JOIN
			    	messages ON usr.userid = messages.userid
			WHERE 	messages.messageid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.messageid#">
		</cfquery>
		<cfreturn qMessageAuthor>
	</cffunction>

	<cffunction name="fThreadSubscribers" access="public" returntype="query" 
				output="false" displayname="Thread Subscribers"
				hint="I get the users who are subscribed to a thread">
		<cfargument name="threadid" type="numeric" required="true">
		<cfset var qThreadSubscribers = 0 />
		<cfquery name="qThreadSubscribers" datasource="#variables.dsn#">
			SELECT 	usr.username
			FROM 	#variables.UsersViewName# usr INNER JOIN
			    	threads ON usr.userid = threads.userid
			WHERE 	threads.threadid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.threadid#">
		</cfquery>
		<cfreturn qThreadSubscribers>
	</cffunction>

	<cffunction name="fEmailSubscribersByThread" access="public" returntype="query" 
				output="false" displayname="Email Subscribers By Thread"
				hint="I get details of user who have subscribed to the given thread">
		<cfargument name="threadid" type="numeric" required="true">
		<cfset var qEmailSubscribersByThread = 0 />
		<cfquery name="qEmailSubscribersByThread" datasource="#variables.dsn#">
			SELECT 	usr.wemailAddress,
					usr.hemailAddress,
					usr.emailPref,
					usr.emailsubs,
		    		threads.threadname,
					categories.categoryname,
		    		messages.message
			FROM 	subscriptions INNER JOIN
		    		#variables.UsersViewName# usr ON subscriptions.userid = usr.userid INNER JOIN
		    		threads ON
		    		subscriptions.threadid = threads.threadid INNER JOIN
		    		categories ON
		    		threads.categoryid = categories.categoryid INNER JOIN
		    		messages ON threads.threadid = messages.threadid
			WHERE	subscriptions.threadid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.threadid#">
				AND	usr.emailsubs = 1
				AND	(
					(usr.emailpref = 'H' AND usr.hemailaddress <> '')
					OR (usr.emailpref = 'W' AND usr.wemailaddress <> '')
					)
		</cfquery>
		<cfreturn qEmailSubscribersByThread>
	</cffunction>

	<cffunction name="fEmailSubscribersByMessage" access="public" returntype="query" 
				output="false" displayname="Email Subscribers By Message"
				hint="I get details of user who have subscribed to the thread which the given message is in">
		<cfargument name="messageid" type="numeric" required="true">
		<cfset var qEmailSubscribersByMessage = 0 />
		<cfquery name="qEmailSubscribersByMessage" datasource="#variables.dsn#">
			SELECT 	usr.wemailAddress,
					usr.hemailAddress,
					usr.emailPref,
					usr.emailsubs,
			    	threads.threadname,
					threads.threadid,
					messages.message,
					categories.categoryname
			FROM 	subscriptions INNER JOIN
			    	#variables.UsersViewName# usr ON subscriptions.userid = usr.userid INNER JOIN
			    	threads ON
			    	subscriptions.threadid = threads.threadid INNER JOIN
			    	categories ON
			    	threads.categoryid = categories.categoryid INNER JOIN
			    	messages ON usr.userid = messages.userid
			WHERE 	usr.emailsubs = 1
				AND	messages.messageid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.messageid#">
				AND	(
					(usr.emailpref = 'H' AND usr.hemailaddress <> '')
					OR (usr.emailpref = 'W' AND usr.wemailaddress <> '')
					)
		</cfquery>
		<cfreturn qEmailSubscribersByMessage>
	</cffunction>

	<cffunction name="fAllForumsOfModerator" access="public" returntype="query" 
				output="false" displayname="All Forums Of Moderator"
				hint="I get all the Forums">
		<cfargument name="userid" type="numeric" required="true">
		<cfargument name="orderby" type="string" required="false" default="" />
		<cfset var qAllForumsOfModerator = 0 />
		<cfquery name="qAllForumsOfModerator" datasource="#variables.dsn#">
			SELECT	categories.categoryid,
					categories.categoryname,
					categories.description,
					categories.status,
					categories.allowattachments,
					categories.messagelimit,
					categories.approval,
					categories.readonly,
					categories.categoryowner,
					categories.visibleto
			FROM    categories INNER JOIN
			        categories_mod ON categories.categoryid = categories_mod.categoryid
			WHERE   categories.status = 'Active'
				AND	categories_mod.userid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.userid#">
			<cfif arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			</cfif>
		</cfquery>
		<cfreturn qAllForumsOfModerator>
	</cffunction>

	<cffunction name="fApproveThreads" access="public" returntype="query" 
				output="false" displayname="Approve Threads"
				hint="I get any threads (from forums the user moderates) needing approval">
		<cfargument name="userid" type="numeric" required="true">
		<cfargument name="orderby" type="string" required="false" default="" />
		<cfset var qApproveThreads = 0 />
		<cfquery name="qApproveThreads" datasource="#variables.dsn#">
			SELECT 	threads.threadid, 
					threads.threadname, 
					threads.datecreated
			FROM 	threads INNER JOIN
			    	categories ON 
			    	threads.categoryid = categories.categoryid LEFT JOIN
			    	categories_mod ON 
			    	categories.categoryid = categories_mod.categoryid
			WHERE	threads.approved = 0
				AND	categories_mod.userid = #arguments.userid#
			<cfif arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			</cfif>
		</cfquery>
		<cfreturn qApproveThreads>
	</cffunction>

	<cffunction name="fApproveMessages" access="public" returntype="query" 
				output="false" displayname="Approve Messages"
				hint="I get any messages needing approval">
		<cfargument name="orderby" type="string" required="false" default="" />
		<cfset var qApproveMessages = 0 />
		<cfquery name="qApproveMessages" datasource="#variables.dsn#">
			SELECT  messages.messageid, 
					messages.message, 
					messages.messagedate
			FROM	threads INNER JOIN
						messages ON threads.threadid = messages.threadid
			WHERE	messages.approved = 0 
				AND	threads.approved = 1
			<cfif arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			</cfif>
		</cfquery>
		<cfreturn qApproveMessages>
	</cffunction>

	<cffunction name="fApproveMessagesForModerator" access="public" returntype="query" 
				output="false" displayname="Approve Messages For Moderator"
				hint="I get any messages needing approval">
		<cfargument name="userid" type="numeric" required="true">
		<cfargument name="orderby" type="string" required="false" default="" />
		<cfset var qApproveMessagesForModerator = 0 />
		<cfquery name="qApproveMessagesForModerator" datasource="#variables.dsn#">
			SELECT  messages.messageid, 
					messages.message, 
					messages.messagedate
			FROM    threads INNER JOIN
			        categories ON 
					threads.categoryid = categories.categoryid LEFT OUTER JOIN
			        categories_mod ON 
					categories.categoryid = categories_mod.categoryid INNER JOIN
			        messages ON threads.threadid = messages.threadid
			WHERE	messages.approved = 0 
				AND	threads.approved = 1
				AND	categories_mod.userid = #arguments.userid# 
			<cfif arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			</cfif>
		</cfquery>
		<cfreturn qApproveMessagesForModerator>
	</cffunction>

	<cffunction name="fModeratedForums" access="public" returntype="query" 
				output="false" displayname="Moderated Forums"
				hint="I find all forums which are moderated">
		<cfargument name="orderby" type="string" required="false" default="" />
		<cfset var qModeratedForums = 0 />
		<cfquery name="qModeratedForums" datasource="#variables.dsn#">
			SELECT	DISTINCT
					categories.categoryid,
					categories.categoryname,
					categories.description,
					categories.visibleto
			FROM	categories LEFT JOIN
			    	categories_mod ON 
			    		categories.categoryid = categories_mod.categoryid
			<cfif arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			</cfif>
		</cfquery>
		<cfreturn qModeratedForums>
	</cffunction>

	<cffunction name="fModeratorForums" access="public" returntype="query" 
				output="false" displayname="Moderator Forums"
				hint="I find all forums of which the user is a moderator">
		<cfargument name="userid" type="numeric" required="true">
		<cfargument name="orderby" type="string" required="false" default="" />
		<cfset var qModeratorForums = 0 />
		<cfquery name="qModeratorForums" datasource="#variables.dsn#">
			SELECT	DISTINCT
					categories.categoryid,
					categories.categoryname,
					categories.description,
					categories.visibleto
			FROM	categories LEFT JOIN
			    	categories_mod ON 
			    		categories.categoryid = categories_mod.categoryid
			WHERE	categories_mod.userid = #arguments.userid#
			<cfif arguments.orderby IS NOT "">
				ORDER BY #arguments.orderby#
			</cfif>
		</cfquery>
		<cfreturn qModeratorForums>
	</cffunction>


	<!--- functions using <cftransaction> --->

	<cffunction name="fDeleteAndShuffle" access="public" returntype="boolean" 
				output="false" displayname="Delete And Shuffle"
				hint="I delete the record and shuffle higher numbered forums down">
		<cfargument name="SiteCategoriesId" type="numeric" required="true">
		<cfargument name="SiteId" type="numeric" required="true">
		<cfargument name="Sequence" type="numeric" required="true">
		<cfset var qDeleteSiteForum = 0 />
		<cfset var qShuffleDown = 0 />
		<cftransaction>
			<!--- delete the record --->
			<cfquery name="qDeleteSiteForum" datasource="#variables.dsn#">
				DELETE FROM SiteCategories
				WHERE	SiteCategoriesId=<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.SiteCategoriesId#">
			</cfquery>
			<!--- Shuffle higher numbered forums down --->
			<cfquery name="qShuffleDown" datasource="#variables.dsn#">
				UPDATE 	SiteCategories
				SET 	Sequence = Sequence - 1
				WHERE 	SiteId = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.SiteId#">
					AND	Sequence > <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.Sequence#">
			</cfquery>
		</cftransaction>
		<cfreturn "true">
	</cffunction>

	<cffunction name="fShuffleAndInsert" access="public" returntype="boolean" 
				output="false" displayname="Shuffle And Insert"
				hint="I shuffle higher numbered forums up and insert the record">
		<cfargument name="CategoryId" type="numeric" required="true">
		<cfargument name="SiteId" type="numeric" required="true">
		<cfargument name="Sequence" type="numeric" required="true">
		<cfset var qShuffleUp = 0 />
		<cfset var qInsertSiteForum = 0 />
		<cftransaction>
			<!--- Shuffle equal and higher numbered forums up --->
			<cfquery name="qShuffleUp" datasource="#variables.dsn#">
				UPDATE 	SiteCategories
				SET 	Sequence = Sequence + 1
				WHERE 	SiteId = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.SiteId#">
					AND	Sequence >= <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.Sequence#">
			</cfquery>
			<!--- Add it in the right place in the ordering --->
			<cfquery name="qInsertSiteForum" datasource="#variables.dsn#">
				INSERT INTO SiteCategories
					(
					SiteId,
					CategoryId,
					Sequence
					)
				VALUES
					(
					#arguments.SiteId#,
					#arguments.CategoryId#,
					#arguments.Sequence#
					)
			</cfquery>
		</cftransaction>
		<cfreturn "true">
	</cffunction>

	<cffunction name="fInsertBanning" access="public" returntype="boolean" 
				output="false" displayname="Insert Banning"
				hint="I ban the given individual or IP address range">
		<cfargument name="bantype" type="string" required="true">
		<cfargument name="ban" type="string" required="true">
		<cfset var getmaxid = 0 />
		<cfset var newID = 0 />
		<cfset var qInsertBanning = 0 />
		<cftransaction>
			<cfquery name="getmaxid" datasource="#variables.dsn#">
				SELECT 	MAX(banid) AS MaxID
				FROM	banning
			</cfquery>
			<cfif isNumeric(getmaxid.MaxID)>
				<cfset newID=getmaxid.MaxID+1>
			<cfelse>
				<cfset newID=1>
			</cfif>
			<cfquery name="qInsertBanning" datasource="#variables.dsn#">
				INSERT INTO banning
					(
					BanID,
					Bantype,
					Banstring
					)
				VALUES
					(
					<cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#newID#">,
					<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.bantype#">,
					<cfqueryparam cfsqltype="CF_SQL_VARCHAR" value="#arguments.ban#">
					)
			</cfquery>
		</cftransaction>
		<cfreturn "true">
	</cffunction>

	<cffunction name="fInsertCategory" access="public" returntype="numeric" 
				output="false" displayname="Insert Category"
				hint="I insert a categories (Forum) record">
		<cfargument name="categoryname" type="string" required="true">
		<cfargument name="description" type="string" required="true">
		<cfargument name="status" type="string" required="true">
		<cfargument name="allowattachments" type="any" required="true">
		<cfargument name="messagelimit" type="numeric" required="true">
		<cfargument name="archivedays" type="numeric" required="true">
		<cfargument name="approval" type="any" required="true">
		<cfargument name="readonly" type="any" required="true">
		<cfargument name="visibleto" type="string" required="true">
		<cfset var getmaxid = 0 />
		<cfset var categoryid = 0 />
		<cfset var qInsertCategory = 0 />
		<cftransaction isolation="SERIALIZABLE">
			<cfquery name="getmaxid" datasource="#variables.dsn#">
				SELECT	MAX(categoryid) AS MAXID
				FROM	categories
			</cfquery>
			<cfif isNumeric(getmaxid.MAXID)>
				<cfset categoryid=getmaxid.MAXID+1>
			<cfelse>
				<cfset categoryid=1>
			</cfif>	
			<cfquery name="qInsertCategory" datasource="#variables.dsn#">
				INSERT INTO categories
					(
					categoryid,
					categoryname,
					description,
					status,
					allowattachments,
					messagelimit,
					archivedays,
					approval,
					readonly,
					visibleto
					)
				VALUES
					(
					#categoryid#,
					'#arguments.categoryname#',
					'#arguments.description#',
					'#arguments.status#',
					#arguments.allowattachments#,
					#arguments.messagelimit#,
					#arguments.archivedays#,
					#arguments.approval#,
					#arguments.readonly#,
					'#arguments.visibleto#'
					)
			</cfquery>
		</cftransaction>
		<cfreturn categoryid>
	</cffunction>

	<cffunction name="fInsertToday" access="public" returntype="numeric" 
				output="false" displayname="Insert Today"
				hint="I insert a Today notice">
		<cfargument name="posttitle" type="string" required="true">
		<cfargument name="post" type="string" required="true">
		<cfargument name="postdate" type="date" required="true">
		<cfargument name="dateexpires" type="any" required="true"><!--- a date or empty string --->
		<cfset var getmaxid = 0 />
		<cfset var postid = 0 />
		<cfset var qInsertToday = 0 />
		<cftransaction isolation="SERIALIZABLE">
			<cfquery name="getmaxid" datasource="#variables.dsn#">
				SELECT	MAX(postid) AS MAXID
				FROM	today
			</cfquery>
			<cfif isNumeric(getmaxid.MAXID)>
				<cfset postid=getmaxid.MAXID+1>
			<cfelse>
				<cfset postid=1>
			</cfif>	
			<cfquery name="qInsertToday" datasource="#variables.dsn#">
				INSERT INTO today
					(
					postid,
					posttitle,
					post,
					postdate,
					dateexpires
					)
				VALUES
					(
					#postid#,
					'#PreserveSingleQuotes(arguments.posttitle)#',
					'#arguments.post#',
					<cfif len(arguments.postdate)>#CreateODBCdate(arguments.postdate)#<cfelse>#createodbcdate(now())#</cfif>,
					<cfif len(arguments.dateexpires)>#CreateODBCDate(arguments.dateexpires)#<cfelse>NULL</cfif>
					)
			</cfquery>
		</cftransaction>
		<cfreturn postid>
	</cffunction>

	<cffunction name="fInsertVulgarity" access="public" returntype="numeric" 
				output="false" displayname="Insert Vulgarity"
				hint="I insert the given word from the database of forbidden words">
		<cfargument name="vulgarity" type="string" required="true">
		<cfset var getmaxid = 0 />
		<cfset var vulgarityid = 0 />
		<cfset var qInsertVulgarity = 0 />
		<cftransaction isolation="SERIALIZABLE">
			<cfquery name="getmaxid" datasource="#variables.dsn#">
				SELECT	MAX(vulgarityid) AS MAXID
				FROM	vulgarity
			</cfquery>
			<cfif IsNumeric(getmaxid.MAXID)>
				<cfset vulgarityid=getmaxid.MAXID+1>
			<cfelse>
				<cfset vulgarityid=1>
			</cfif>
			<cfquery name="qInsertVulgarity" datasource="#variables.dsn#">
				INSERT INTO vulgarity
					(
					vulgarityid,
					vulgarity
					)
				VALUES
					(
					#vulgarityid#,
					'#arguments.vulgarity#'
					)
			</cfquery>
		</cftransaction>
		<cfreturn vulgarityid>
	</cffunction>
	
	<cffunction name="fDeleteThreadAndMessages" access="public" returntype="boolean" 
				output="false" displayname="Delete Thread And Messages"
				hint="I delete a thread and all its messages">
		<cfargument name="threadid" type="numeric" required="true">
		<cfset var deletemessage = 0 />
		<cfset var deletethread = 0 />
		<cftransaction>
			<cfquery name="deletemessage" datasource="#variables.dsn#">
				DELETE
				FROM 	messages
				WHERE	threadid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.threadid#">
			</cfquery>
			<cfquery name="deletethread" datasource="#variables.dsn#">
				DELETE
				FROM 	threads
				WHERE	threadid = <cfqueryparam cfsqltype="CF_SQL_INTEGER" value="#arguments.threadid#">
			</cfquery>
		</cftransaction>
	<cfreturn "true">
	</cffunction>

	<cffunction name="fArchiveThread" access="public" returntype="numeric" 
				output="false" displayname="Archive Thread"
				hint="I archive a forum's thread">
		<cfargument name="threadid" type="numeric" required="true">
		<cfset var getmaxid = 0 />
		<cfset var newthreadid = 0 />
		<cfset var qArchiveThread = 0 />
		<cftransaction>
			<cfquery name="getmaxid" datasource="#variables.dsn#">
				SELECT 	MAX(threadid) AS MaxID
				FROM	arch_threads
			</cfquery>
			<cfif isnumeric(getmaxid.MaxID)>
				<cfset newthreadid=getmaxid.MaxID+1>
			<cfelse>
				<cfset newthreadid=1>
			</cfif>
			<cfquery name="qArchiveThread" datasource="#variables.dsn#">
				INSERT INTO arch_threads
		    		(  
					  threadname, 
					  datecreated, 
					  messagecount, 
					  datelastpost, 
					  threadid
					)
					SELECT  threadname, 
							datecreated,
							messagecount, 
							datelastpost,
							#newthreadid# AS Expr1
					FROM 	threads
					WHERE 	threadid = #arguments.threadid#
			</cfquery>
		</cftransaction>
		<cfreturn newthreadid>
	</cffunction>

	<cffunction name="fArchiveMessage" access="public" returntype="boolean" 
				output="false" displayname="Archive Message"
				hint="I archive a forum's message">
		<cfargument name="messageid" type="numeric" required="true">
		<cfargument name="newthreadid" type="numeric" required="true">
		<cfset var getmaxid = 0 />
		<cfset var newmessageid = 0 />
		<cfset var qArchiveMessage = 0 />
		<cftransaction>
			<cfquery name="getmaxid" datasource="#variables.dsn#">
				SELECT 	MAX(messageID) AS MaxID
				FROM	arch_messages
			</cfquery>	
			<cfif isnumeric(getmaxid.MaxID)>
				<cfset newmessageid=getmaxid.MaxID+1>
			<cfelse>
				<cfset newmessageid=1>
			</cfif>
			<cfquery name="qArchiveMessage" datasource="#variables.dsn#">
				INSERT INTO arch_messages
		    		(
					  message, 
					  messagedate, 
					  threadid, 
					  editmessage, 
					  attachment, 
					  filesize, 
					  messageid
					)
					SELECT 	message, 
							messagedate, 
							#arguments.newthreadid# AS Expr1, 
							editmessage, 
							attachment, 
							filesize, 
							#newmessageid# AS Expr2
					FROM 	messages
					WHERE 	messageid = #arguments.messageid#
				</cfquery>
			</cftransaction>
			<cfreturn "true">
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
$Log: ForumAdmin_Facade.cfc,v $
Revision 1.1  2007/06/15 13:59:05  kevin
Add Admin Modules

Revision 1.18  2006/08/08 11:04:40  mike
code qAllModerators query also for Trafalgar

Revision 1.17  2006/07/31 15:45:01  kevin
Trafalgar Conversion: specify name of users view at init.

Revision 1.16  2006/06/20 16:09:43  mike
delete fNonMembers() and other unused methods

Revision 1.15  2005/10/11 15:42:51  mike
use request.AFDBName

Revision 1.14  2005/09/26 16:17:10  kevin
Remove debug code.

Revision 1.13  2005/09/05 15:47:31  kevin
Change DSN for forums.

Revision 1.12  2005/05/27 10:12:04  mike
ensure all local variables are in var scope

Revision 1.11  2005/05/11 10:41:17  kevin
Rename from MVC conversion

Revision 1.10  2005/05/09 14:18:30  mike
change type from "boolean" to "any" to allow arguments either of "true"/"false" or of 0/1

Revision 1.9  2005/05/06 17:54:59  mike
fix a displayname

Revision 1.8  2005/04/29 13:13:43  mike
newmethods fDeleteAndShuffle etc.

Revision 1.7  2005/04/22 17:54:45  mike
new method fAllSiteCategories

Revision 1.6  2005/04/22 16:22:41  mike
add output="false"  and displayname=".." to each method

Revision 1.5  2005/04/20 14:13:50  mike
include new archivedays field

Revision 1.4  2005/04/11 16:36:50  mike
fArchiveThread must do <cfreturn variables.newthreadid>

Revision 1.3  2005/04/11 11:34:29  mike
new methods fArchiveThread() etc.

Revision 1.2  2005/04/06 18:10:23  mike
added lots of new functions

Revision 1.1  2005/04/06 08:37:24  mike
moved from mForum directory

Revision 1.2  2005/04/01 13:42:30  mike
small edits
 --->

