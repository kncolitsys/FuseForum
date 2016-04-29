
<!--- -->
<fusedoc fuse="$RCSfile: fbx_settings.cfm,v $" language="ColdFusion 5.0" version="2.0" />
<responsibilities>
	I set up the enviroment settings for this circuit. If this settings file is being inherited, then you can use CFSET to override a value set in a parent circuit or CFPARAM to accept a value set by a parent circuit
</responsibilities> 
	<properties>
		<history author="Mike Oakes" email="mike@objectiveinternet.com" date="29-Apr-2005" role="Architect" type="Create" />
		<property name="copyright" value="(c)2005 Objective Internet Limited." />
		<property name="licence" value="Licensed under the Apache License, Version 2.0  See licence.txt" />
		<property name="version" value="$Revision: 1.5 $" />
		<property name="lastupdated" value="$Date: 2007/06/15 14:00:08 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
</fusedoc>
--->

<cfparam name="request.ForumDSN" />
<cfparam name="request.userView"/>

<cfset modelPath = GetDirectoryFromPath(GetCurrentTemplatePath())>
<cfset rootPath = GetDirectoryFromPath(cgi.PATH_TRANSLATED)>
<cfset URLPath = GetDirectoryFromPath(cgi.PATH_INFO)>

<cfif left(modelPath,len(rootPath)) IS rootPath>
	<cfset modelPath = ListChangeDelims(URLPath & RemoveChars(modelPath,1,len(rootpath)),".","/\")>
</cfif>

<cfif isDefined("attributes.clearcache")>
	<cflock timeout="10" throwontimeout="No" type="exclusive" scope="APPLICATION">
		<cfset Application.ao__AppObj_mForumFacade_Forum_Facade = "">
	</cflock>
	<cfoutput>CACHE CLEARED<br /></cfoutput>
</cfif>

<!--- Start of Create Facade object for Forum --->
<cfif NOT IsDefined("Application.ao__AppObj_mForumFacade_Forum_Facade") OR
	  NOT IsStruct(Application.ao__AppObj_mForumFacade_Forum_Facade)>
	<cflock timeout="10" throwontimeout="No" type="exclusive" scope="APPLICATION">
		<cfif NOT IsDefined("Application.ao__AppObj_mForumFacade_Forum_Facade") OR
			  NOT IsStruct(Application.ao__AppObj_mForumFacade_Forum_Facade)>
			<cfset Application.ao__AppObj_mForumFacade_Forum_Facade = createObject("component","#variables.modelPath#.Forum_Facade").init(request.ForumDSN,request.userView)>
		</cfif>
	</cflock>
</cfif>
<!--- End of Create Facade object for Forum --->

<cfif isDefined("attributes.clearcache")>
	<cflock timeout="10" throwontimeout="No" type="EXCLUSIVE" scope="APPLICATION">
		<cfset Application.ao__AppObj_mForum_arch_messages_DAO = "">
		<cfset Application.ao__AppObj_mForum_arch_messages_Gateway = "">
		<cfset Application.ao__AppObj_mForum_arch_privatemessages_DAO = "">
		<cfset Application.ao__AppObj_mForum_arch_privatemessages_Gateway = "">
		<cfset Application.ao__AppObj_mForum_arch_threads_DAO = "">
		<cfset Application.ao__AppObj_mForum_arch_threads_Gateway = "">
		<cfset Application.ao__AppObj_mForum_banning_DAO = "">
		<cfset Application.ao__AppObj_mForum_banning_Gateway = "">
		<cfset Application.ao__AppObj_mForum_categories_DAO = "">
		<cfset Application.ao__AppObj_mForum_categories_Gateway = "">
		<cfset Application.ao__AppObj_mForum_categories_mod_DAO = "">
		<cfset Application.ao__AppObj_mForum_categories_mod_Gateway = "">
		<cfset Application.ao__AppObj_mForum_categories_per_DAO = "">
		<cfset Application.ao__AppObj_mForum_categories_per_Gateway = "">
		<cfset Application.ao__AppObj_mForum_forum_subscriptions_DAO = "">
		<cfset Application.ao__AppObj_mForum_forum_subscriptions_Gateway = "">
		<cfset Application.ao__AppObj_mForum_friends_DAO = "">
		<cfset Application.ao__AppObj_mForum_friends_Gateway = "">
		<cfset Application.ao__AppObj_mForum_messages_DAO = "">
		<cfset Application.ao__AppObj_mForum_messages_Gateway = "">
		<cfset Application.ao__AppObj_mForum_privatemessages_DAO = "">
		<cfset Application.ao__AppObj_mForum_privatemessages_Gateway = "">
		<cfset Application.ao__AppObj_mForum_settings_DAO = "">
		<cfset Application.ao__AppObj_mForum_settings_Gateway = "">
		<cfset Application.ao__AppObj_mForum_subscriptions_DAO = "">
		<cfset Application.ao__AppObj_mForum_subscriptions_Gateway = "">
		<cfset Application.ao__AppObj_mForum_threads_DAO = "">
		<cfset Application.ao__AppObj_mForum_threads_Gateway = "">
		<cfset Application.ao__AppObj_mForum_today_DAO = "">
		<cfset Application.ao__AppObj_mForum_today_Gateway = "">
		<cfset Application.ao__AppObj_mForum_userlevels_DAO = "">
		<cfset Application.ao__AppObj_mForum_userlevels_Gateway = "">
		<cfset Application.ao__AppObj_mForum_users_DAO = "">
		<cfset Application.ao__AppObj_mForum_users_Gateway = "">
		<cfset Application.ao__AppObj_mForum_vulgarity_DAO = "">
		<cfset Application.ao__AppObj_mForum_vulgarity_Gateway = "">
		<cfset Application.ao__AppObj_mForum_SiteCategories_DAO = "">
		<cfset Application.ao__AppObj_mForum_SiteCategories_Gateway = "">
	</cflock>
	CACHE CLEARED<br />
</cfif>

<!--- Start of Create DAO and Gateway objects for the arch_messages Table --->
<cfif NOT IsDefined("Application.ao__AppObj_mForum_arch_messages_DAO") OR
	  NOT IsStruct(Application.ao__AppObj_mForum_arch_messages_DAO)>
	<cflock timeout="10" throwontimeout="No" type="EXCLUSIVE" scope="APPLICATION">
		<cfif NOT IsDefined("Application.ao__AppObj_mForum_arch_messages_DAO") OR
			  NOT IsStruct(Application.ao__AppObj_mForum_arch_messages_DAO)>
			<cfset Application.ao__AppObj_mForum_arch_messages_DAO = createObject("component","#variables.modelPath#.arch_messages_DAO").init(request.forumDSN)>
		</cfif>
	</cflock>
</cfif>
<cfif NOT IsDefined("Application.ao__AppObj_mForum_arch_messages_Gateway") OR
	  NOT IsStruct(Application.ao__AppObj_mForum_arch_messages_Gateway)>
	<cflock timeout="10" throwontimeout="No" type="EXCLUSIVE" scope="APPLICATION">
		<cfif NOT IsDefined("Application.ao__AppObj_mForum_arch_messages_Gateway") OR
			  NOT IsStruct(Application.ao__AppObj_mForum_arch_messages_Gateway)>
			<cfset Application.ao__AppObj_mForum_arch_messages_Gateway = createObject("component","#variables.modelPath#.arch_messages_Gateway").init(request.forumDSN)>
		</cfif>
	</cflock>
</cfif>
<!--- End of Create DAO and Gateway objects for the arch_messages Table --->

<!--- Start of Create DAO and Gateway objects for the arch_privatemessages Table --->
<cfif NOT IsDefined("Application.ao__AppObj_mForum_arch_privatemessages_DAO") OR
	  NOT IsStruct(Application.ao__AppObj_mForum_arch_privatemessages_DAO)>
	<cflock timeout="10" throwontimeout="No" type="EXCLUSIVE" scope="APPLICATION">
		<cfif NOT IsDefined("Application.ao__AppObj_mForum_arch_privatemessages_DAO") OR
			  NOT IsStruct(Application.ao__AppObj_mForum_arch_privatemessages_DAO)>
			<cfset Application.ao__AppObj_mForum_arch_privatemessages_DAO = createObject("component","#variables.modelPath#.arch_privatemessages_DAO").init(request.forumDSN)>
		</cfif>
	</cflock>
</cfif>
<cfif NOT IsDefined("Application.ao__AppObj_mForum_arch_privatemessages_Gateway") OR
	  NOT IsStruct(Application.ao__AppObj_mForum_arch_privatemessages_Gateway)>
	<cflock timeout="10" throwontimeout="No" type="EXCLUSIVE" scope="APPLICATION">
		<cfif NOT IsDefined("Application.ao__AppObj_mForum_arch_privatemessages_Gateway") OR
			  NOT IsStruct(Application.ao__AppObj_mForum_arch_privatemessages_Gateway)>
			<cfset Application.ao__AppObj_mForum_arch_privatemessages_Gateway = createObject("component","#variables.modelPath#.arch_privatemessages_Gateway").init(request.forumDSN)>
		</cfif>
	</cflock>
</cfif>
<!--- End of Create DAO and Gateway objects for the arch_privatemessages Table --->

<!--- Start of Create DAO and Gateway objects for the arch_threads Table --->
<cfif NOT IsDefined("Application.ao__AppObj_mForum_arch_threads_DAO") OR
	  NOT IsStruct(Application.ao__AppObj_mForum_arch_threads_DAO)>
	<cflock timeout="10" throwontimeout="No" type="EXCLUSIVE" scope="APPLICATION">
		<cfif NOT IsDefined("Application.ao__AppObj_mForum_arch_threads_DAO") OR
			  NOT IsStruct(Application.ao__AppObj_mForum_arch_threads_DAO)>
			<cfset Application.ao__AppObj_mForum_arch_threads_DAO = createObject("component","#variables.modelPath#.arch_threads_DAO").init(request.forumDSN)>
		</cfif>
	</cflock>
</cfif>
<cfif NOT IsDefined("Application.ao__AppObj_mForum_arch_threads_Gateway") OR
	  NOT IsStruct(Application.ao__AppObj_mForum_arch_threads_Gateway)>
	<cflock timeout="10" throwontimeout="No" type="EXCLUSIVE" scope="APPLICATION">
		<cfif NOT IsDefined("Application.ao__AppObj_mForum_arch_threads_Gateway") OR
			  NOT IsStruct(Application.ao__AppObj_mForum_arch_threads_Gateway)>
			<cfset Application.ao__AppObj_mForum_arch_threads_Gateway = createObject("component","#variables.modelPath#.arch_threads_Gateway").init(request.forumDSN)>
		</cfif>
	</cflock>
</cfif>
<!--- End of Create DAO and Gateway objects for the arch_threads Table --->

<!--- Start of Create DAO and Gateway objects for the banning Table --->
<cfif NOT IsDefined("Application.ao__AppObj_mForum_banning_DAO") OR
	  NOT IsStruct(Application.ao__AppObj_mForum_banning_DAO)>
	<cflock timeout="10" throwontimeout="No" type="EXCLUSIVE" scope="APPLICATION">
		<cfif NOT IsDefined("Application.ao__AppObj_mForum_banning_DAO") OR
			  NOT IsStruct(Application.ao__AppObj_mForum_banning_DAO)>
			<cfset Application.ao__AppObj_mForum_banning_DAO = createObject("component","#variables.modelPath#.banning_DAO").init(request.forumDSN)>
		</cfif>
	</cflock>
</cfif>
<cfif NOT IsDefined("Application.ao__AppObj_mForum_banning_Gateway") OR
	  NOT IsStruct(Application.ao__AppObj_mForum_banning_Gateway)>
	<cflock timeout="10" throwontimeout="No" type="EXCLUSIVE" scope="APPLICATION">
		<cfif NOT IsDefined("Application.ao__AppObj_mForum_banning_Gateway") OR
			  NOT IsStruct(Application.ao__AppObj_mForum_banning_Gateway)>
			<cfset Application.ao__AppObj_mForum_banning_Gateway = createObject("component","#variables.modelPath#.banning_Gateway").init(request.forumDSN)>
		</cfif>
	</cflock>
</cfif>
<!--- End of Create DAO and Gateway objects for the banning Table --->

<!--- Start of Create DAO and Gateway objects for the categories Table --->
<cfif NOT IsDefined("Application.ao__AppObj_mForum_categories_DAO") OR
	  NOT IsStruct(Application.ao__AppObj_mForum_categories_DAO)>
	<cflock timeout="10" throwontimeout="No" type="EXCLUSIVE" scope="APPLICATION">
		<cfif NOT IsDefined("Application.ao__AppObj_mForum_categories_DAO") OR
			  NOT IsStruct(Application.ao__AppObj_mForum_categories_DAO)>
			<cfset Application.ao__AppObj_mForum_categories_DAO = createObject("component","#variables.modelPath#.categories_DAO").init(request.forumDSN)>
		</cfif>
	</cflock>
</cfif>
<cfif NOT IsDefined("Application.ao__AppObj_mForum_categories_Gateway") OR
	  NOT IsStruct(Application.ao__AppObj_mForum_categories_Gateway)>
	<cflock timeout="10" throwontimeout="No" type="EXCLUSIVE" scope="APPLICATION">
		<cfif NOT IsDefined("Application.ao__AppObj_mForum_categories_Gateway") OR
			  NOT IsStruct(Application.ao__AppObj_mForum_categories_Gateway)>
			<cfset Application.ao__AppObj_mForum_categories_Gateway = createObject("component","#variables.modelPath#.categories_Gateway").init(request.forumDSN)>
		</cfif>
	</cflock>
</cfif>
<!--- End of Create DAO and Gateway objects for the categories Table --->
 
<!--- Start of Create DAO and Gateway objects for the categories_mod Table --->
<cfif NOT IsDefined("Application.ao__AppObj_mForum_categories_mod_DAO") OR
	  NOT IsStruct(Application.ao__AppObj_mForum_categories_mod_DAO)>
	<cflock timeout="10" throwontimeout="No" type="EXCLUSIVE" scope="APPLICATION">
		<cfif NOT IsDefined("Application.ao__AppObj_mForum_categories_mod_DAO") OR
			  NOT IsStruct(Application.ao__AppObj_mForum_categories_mod_DAO)>
			<cfset Application.ao__AppObj_mForum_categories_mod_DAO = createObject("component","#variables.modelPath#.categories_mod_DAO").init(request.forumDSN)>
		</cfif>
	</cflock>
</cfif>
<cfif NOT IsDefined("Application.ao__AppObj_mForum_categories_mod_Gateway") OR
	  NOT IsStruct(Application.ao__AppObj_mForum_categories_mod_Gateway)>
	<cflock timeout="10" throwontimeout="No" type="EXCLUSIVE" scope="APPLICATION">
		<cfif NOT IsDefined("Application.ao__AppObj_mForum_categories_mod_Gateway") OR
			  NOT IsStruct(Application.ao__AppObj_mForum_categories_mod_Gateway)>
			<cfset Application.ao__AppObj_mForum_categories_mod_Gateway = createObject("component","#variables.modelPath#.categories_mod_Gateway").init(request.forumDSN)>
		</cfif>
	</cflock>
</cfif>
<!--- End of Create DAO and Gateway objects for the categories_mod Table --->

<!--- Start of Create DAO and Gateway objects for the categories_per Table --->
<cfif NOT IsDefined("Application.ao__AppObj_mForum_categories_per_DAO") OR
	  NOT IsStruct(Application.ao__AppObj_mForum_categories_per_DAO)>
	<cflock timeout="10" throwontimeout="No" type="EXCLUSIVE" scope="APPLICATION">
		<cfif NOT IsDefined("Application.ao__AppObj_mForum_categories_per_DAO") OR
			  NOT IsStruct(Application.ao__AppObj_mForum_categories_per_DAO)>
			<cfset Application.ao__AppObj_mForum_categories_per_DAO = createObject("component","#variables.modelPath#.categories_per_DAO").init(request.forumDSN)>
		</cfif>
	</cflock>
</cfif>
<cfif NOT IsDefined("Application.ao__AppObj_mForum_categories_per_Gateway") OR
	  NOT IsStruct(Application.ao__AppObj_mForum_categories_per_Gateway)>
	<cflock timeout="10" throwontimeout="No" type="EXCLUSIVE" scope="APPLICATION">
		<cfif NOT IsDefined("Application.ao__AppObj_mForum_categories_per_Gateway") OR
			  NOT IsStruct(Application.ao__AppObj_mForum_categories_per_Gateway)>
			<cfset Application.ao__AppObj_mForum_categories_per_Gateway = createObject("component","#variables.modelPath#.categories_per_Gateway").init(request.forumDSN)>
		</cfif>
	</cflock>
</cfif>
<!--- End of Create DAO and Gateway objects for the categories_per Table --->

<!--- Start of Create DAO and Gateway objects for the forum_subscriptions Table --->
<cfif NOT IsDefined("Application.ao__AppObj_mForum_forum_subscriptions_DAO") OR
	  NOT IsStruct(Application.ao__AppObj_mForum_forum_subscriptions_DAO)>
	<cflock timeout="10" throwontimeout="No" type="EXCLUSIVE" scope="APPLICATION">
		<cfif NOT IsDefined("Application.ao__AppObj_mForum_forum_subscriptions_DAO") OR
			  NOT IsStruct(Application.ao__AppObj_mForum_forum_subscriptions_DAO)>
			<cfset Application.ao__AppObj_mForum_forum_subscriptions_DAO = createObject("component","#variables.modelPath#.forum_subscriptions_DAO").init(request.forumDSN)>
		</cfif>
	</cflock>
</cfif>
<cfif NOT IsDefined("Application.ao__AppObj_mForum_forum_subscriptions_Gateway") OR
	  NOT IsStruct(Application.ao__AppObj_mForum_forum_subscriptions_Gateway)>
	<cflock timeout="10" throwontimeout="No" type="EXCLUSIVE" scope="APPLICATION">
		<cfif NOT IsDefined("Application.ao__AppObj_mForum_forum_subscriptions_Gateway") OR
			  NOT IsStruct(Application.ao__AppObj_mForum_forum_subscriptions_Gateway)>
			<cfset Application.ao__AppObj_mForum_forum_subscriptions_Gateway = createObject("component","#variables.modelPath#.forum_subscriptions_Gateway").init(request.forumDSN)>
		</cfif>
	</cflock>
</cfif>
<!--- End of Create DAO and Gateway objects for the forum_subscriptions Table --->

<!--- Start of Create DAO and Gateway objects for the friends Table --->
<cfif NOT IsDefined("Application.ao__AppObj_mForum_friends_DAO") OR
	  NOT IsStruct(Application.ao__AppObj_mForum_friends_DAO)>
	<cflock timeout="10" throwontimeout="No" type="EXCLUSIVE" scope="APPLICATION">
		<cfif NOT IsDefined("Application.ao__AppObj_mForum_friends_DAO") OR
			  NOT IsStruct(Application.ao__AppObj_mForum_friends_DAO)>
			<cfset Application.ao__AppObj_mForum_friends_DAO = createObject("component","#variables.modelPath#.friends_DAO").init(request.forumDSN)>
		</cfif>
	</cflock>
</cfif>
<cfif NOT IsDefined("Application.ao__AppObj_mForum_friends_Gateway") OR
	  NOT IsStruct(Application.ao__AppObj_mForum_friends_Gateway)>
	<cflock timeout="10" throwontimeout="No" type="EXCLUSIVE" scope="APPLICATION">
		<cfif NOT IsDefined("Application.ao__AppObj_mForum_friends_Gateway") OR
			  NOT IsStruct(Application.ao__AppObj_mForum_friends_Gateway)>
			<cfset Application.ao__AppObj_mForum_friends_Gateway = createObject("component","#variables.modelPath#.friends_Gateway").init(request.forumDSN)>
		</cfif>
	</cflock>
</cfif>
<!--- End of Create DAO and Gateway objects for the friends Table --->

<!--- Start of Create DAO and Gateway objects for the messages Table --->
<cfif NOT IsDefined("Application.ao__AppObj_mForum_messages_DAO") OR
	  NOT IsStruct(Application.ao__AppObj_mForum_messages_DAO)>
	<cflock timeout="10" throwontimeout="No" type="EXCLUSIVE" scope="APPLICATION">
		<cfif NOT IsDefined("Application.ao__AppObj_mForum_messages_DAO") OR
			  NOT IsStruct(Application.ao__AppObj_mForum_messages_DAO)>
			<cfset Application.ao__AppObj_mForum_messages_DAO = createObject("component","#variables.modelPath#.messages_DAO").init(request.forumDSN)>
		</cfif>
	</cflock>
</cfif>
<cfif NOT IsDefined("Application.ao__AppObj_mForum_messages_Gateway") OR
	  NOT IsStruct(Application.ao__AppObj_mForum_messages_Gateway)>
	<cflock timeout="10" throwontimeout="No" type="EXCLUSIVE" scope="APPLICATION">
		<cfif NOT IsDefined("Application.ao__AppObj_mForum_messages_Gateway") OR
			  NOT IsStruct(Application.ao__AppObj_mForum_messages_Gateway)>
			<cfset Application.ao__AppObj_mForum_messages_Gateway = createObject("component","#variables.modelPath#.messages_Gateway").init(request.forumDSN)>
		</cfif>
	</cflock>
</cfif>
<!--- End of Create DAO and Gateway objects for the messages Table --->

<!--- Start of Create DAO and Gateway objects for the privatemessages Table --->
<cfif NOT IsDefined("Application.ao__AppObj_mForum_privatemessages_DAO") OR
	  NOT IsStruct(Application.ao__AppObj_mForum_privatemessages_DAO)>
	<cflock timeout="10" throwontimeout="No" type="EXCLUSIVE" scope="APPLICATION">
		<cfif NOT IsDefined("Application.ao__AppObj_mForum_privatemessages_DAO") OR
			  NOT IsStruct(Application.ao__AppObj_mForum_privatemessages_DAO)>
			<cfset Application.ao__AppObj_mForum_privatemessages_DAO = createObject("component","#variables.modelPath#.privatemessages_DAO").init(request.forumDSN)>
		</cfif>
	</cflock>
</cfif>
<cfif NOT IsDefined("Application.ao__AppObj_mForum_privatemessages_Gateway") OR
	  NOT IsStruct(Application.ao__AppObj_mForum_privatemessages_Gateway)>
	<cflock timeout="10" throwontimeout="No" type="EXCLUSIVE" scope="APPLICATION">
		<cfif NOT IsDefined("Application.ao__AppObj_mForum_privatemessages_Gateway") OR
			  NOT IsStruct(Application.ao__AppObj_mForum_privatemessages_Gateway)>
			<cfset Application.ao__AppObj_mForum_privatemessages_Gateway = createObject("component","#variables.modelPath#.privatemessages_Gateway").init(request.forumDSN)>
		</cfif>
	</cflock>
</cfif>
<!--- End of Create DAO and Gateway objects for the privatemessages Table --->

<!--- Start of Create DAO and Gateway objects for the settings Table --->
<cfif NOT IsDefined("Application.ao__AppObj_mForum_settings_DAO") OR
	  NOT IsStruct(Application.ao__AppObj_mForum_settings_DAO)>
	<cflock timeout="10" throwontimeout="No" type="EXCLUSIVE" scope="APPLICATION">
		<cfif NOT IsDefined("Application.ao__AppObj_mForum_settings_DAO") OR
			  NOT IsStruct(Application.ao__AppObj_mForum_settings_DAO)>
			<cfset Application.ao__AppObj_mForum_settings_DAO = createObject("component","#variables.modelPath#.settings_DAO").init(request.forumDSN)>
		</cfif>
	</cflock>
</cfif>
<cfif NOT IsDefined("Application.ao__AppObj_mForum_settings_Gateway") OR
	  NOT IsStruct(Application.ao__AppObj_mForum_settings_Gateway)>
	<cflock timeout="10" throwontimeout="No" type="EXCLUSIVE" scope="APPLICATION">
		<cfif NOT IsDefined("Application.ao__AppObj_mForum_settings_Gateway") OR
			  NOT IsStruct(Application.ao__AppObj_mForum_settings_Gateway)>
			<cfset Application.ao__AppObj_mForum_settings_Gateway = createObject("component","#variables.modelPath#.settings_Gateway").init(request.forumDSN)>
		</cfif>
	</cflock>
</cfif>
<!--- End of Create DAO and Gateway objects for the settings Table --->

<!--- Start of Create DAO and Gateway objects for the subscriptions Table --->
<cfif NOT IsDefined("Application.ao__AppObj_mForum_subscriptions_DAO") OR
	  NOT IsStruct(Application.ao__AppObj_mForum_subscriptions_DAO)>
	<cflock timeout="10" throwontimeout="No" type="EXCLUSIVE" scope="APPLICATION">
		<cfif NOT IsDefined("Application.ao__AppObj_mForum_subscriptions_DAO") OR
			  NOT IsStruct(Application.ao__AppObj_mForum_subscriptions_DAO)>
			<cfset Application.ao__AppObj_mForum_subscriptions_DAO = createObject("component","#variables.modelPath#.subscriptions_DAO").init(request.forumDSN)>
		</cfif>
	</cflock>
</cfif>
<cfif NOT IsDefined("Application.ao__AppObj_mForum_subscriptions_Gateway") OR
	  NOT IsStruct(Application.ao__AppObj_mForum_subscriptions_Gateway)>
	<cflock timeout="10" throwontimeout="No" type="EXCLUSIVE" scope="APPLICATION">
		<cfif NOT IsDefined("Application.ao__AppObj_mForum_subscriptions_Gateway") OR
			  NOT IsStruct(Application.ao__AppObj_mForum_subscriptions_Gateway)>
			<cfset Application.ao__AppObj_mForum_subscriptions_Gateway = createObject("component","#variables.modelPath#.subscriptions_Gateway").init(request.forumDSN)>
		</cfif>
	</cflock>
</cfif>
<!--- End of Create DAO and Gateway objects for the subscriptions Table --->

<!--- Start of Create DAO and Gateway objects for the threads Table --->
<cfif NOT IsDefined("Application.ao__AppObj_mForum_threads_DAO") OR
	  NOT IsStruct(Application.ao__AppObj_mForum_threads_DAO)>
	<cflock timeout="10" throwontimeout="No" type="EXCLUSIVE" scope="APPLICATION">
		<cfif NOT IsDefined("Application.ao__AppObj_mForum_threads_DAO") OR
			  NOT IsStruct(Application.ao__AppObj_mForum_threads_DAO)>
			<cfset Application.ao__AppObj_mForum_threads_DAO = createObject("component","#variables.modelPath#.threads_DAO").init(request.forumDSN)>
		</cfif>
	</cflock>
</cfif>
<cfif NOT IsDefined("Application.ao__AppObj_mForum_threads_Gateway") OR
	  NOT IsStruct(Application.ao__AppObj_mForum_threads_Gateway)>
	<cflock timeout="10" throwontimeout="No" type="EXCLUSIVE" scope="APPLICATION">
		<cfif NOT IsDefined("Application.ao__AppObj_mForum_threads_Gateway") OR
			  NOT IsStruct(Application.ao__AppObj_mForum_threads_Gateway)>
			<cfset Application.ao__AppObj_mForum_threads_Gateway = createObject("component","#variables.modelPath#.threads_Gateway").init(request.forumDSN)>
		</cfif>
	</cflock>
</cfif>
<!--- End of Create DAO and Gateway objects for the threads Table --->

<!--- Start of Create DAO and Gateway objects for the today Table --->
<cfif NOT IsDefined("Application.ao__AppObj_mForum_today_DAO") OR
	  NOT IsStruct(Application.ao__AppObj_mForum_today_DAO)>
	<cflock timeout="10" throwontimeout="No" type="EXCLUSIVE" scope="APPLICATION">
		<cfif NOT IsDefined("Application.ao__AppObj_mForum_today_DAO") OR
			  NOT IsStruct(Application.ao__AppObj_mForum_today_DAO)>
			<cfset Application.ao__AppObj_mForum_today_DAO = createObject("component","#variables.modelPath#.today_DAO").init(request.forumDSN)>
		</cfif>
	</cflock>
</cfif>
<cfif NOT IsDefined("Application.ao__AppObj_mForum_today_Gateway") OR
	  NOT IsStruct(Application.ao__AppObj_mForum_today_Gateway)>
	<cflock timeout="10" throwontimeout="No" type="EXCLUSIVE" scope="APPLICATION">
		<cfif NOT IsDefined("Application.ao__AppObj_mForum_today_Gateway") OR
			  NOT IsStruct(Application.ao__AppObj_mForum_today_Gateway)>
			<cfset Application.ao__AppObj_mForum_today_Gateway = createObject("component","#variables.modelPath#.today_Gateway").init(request.forumDSN)>
		</cfif>
	</cflock>
</cfif>
<!--- End of Create DAO and Gateway objects for the today Table --->

<!--- Start of Create DAO and Gateway objects for the userlevels Table NB NEVER USED NOW --->
<!---
<cfif NOT IsDefined("Application.ao__AppObj_mForum_userlevels_DAO") OR
	  NOT IsStruct(Application.ao__AppObj_mForum_userlevels_DAO)>
	<cflock timeout="10" throwontimeout="No" type="EXCLUSIVE" scope="SERVER">
		<cfif NOT IsDefined("Application.ao__AppObj_mForum_userlevels_DAO") OR
			  NOT IsStruct(Application.ao__AppObj_mForum_userlevels_DAO)>
			<cfset Application.ao__AppObj_mForum_userlevels_DAO = createObject("component","#variables.modelPath#.userlevels_DAO").init(request.forumDSN)>
		</cfif>
	</cflock>
</cfif>
<cfif NOT IsDefined("Application.ao__AppObj_mForum_userlevels_Gateway") OR
	  NOT IsStruct(Application.ao__AppObj_mForum_userlevels_Gateway)>
	<cflock timeout="10" throwontimeout="No" type="EXCLUSIVE" scope="SERVER">
		<cfif NOT IsDefined("Application.ao__AppObj_mForum_userlevels_Gateway") OR
			  NOT IsStruct(Application.ao__AppObj_mForum_userlevels_Gateway)>
			<cfset Application.ao__AppObj_mForum_userlevels_Gateway = createObject("component","#variables.modelPath#.userlevels_Gateway").init(request.forumDSN)>
		</cfif>
	</cflock>
</cfif>
 --->
 <!--- End of Create DAO and Gateway objects for the userlevels Table --->

<!--- Start of Create DAO and Gateway objects for the users Table --->
<cfif NOT IsDefined("Application.ao__AppObj_mForum_users_DAO") OR
	  NOT IsStruct(Application.ao__AppObj_mForum_users_DAO)>
	<cflock timeout="10" throwontimeout="No" type="EXCLUSIVE" scope="APPLICATION">
		<cfif NOT IsDefined("Application.ao__AppObj_mForum_users_DAO") OR
			  NOT IsStruct(Application.ao__AppObj_mForum_users_DAO)>
			<cfset Application.ao__AppObj_mForum_users_DAO = createObject("component","#variables.modelPath#.users_DAO").init(request.forumDSN)>
		</cfif>
	</cflock>
</cfif>
<cfif NOT IsDefined("Application.ao__AppObj_mForum_users_Gateway") OR
	  NOT IsStruct(Application.ao__AppObj_mForum_users_Gateway)>
	<cflock timeout="10" throwontimeout="No" type="EXCLUSIVE" scope="APPLICATION">
		<cfif NOT IsDefined("Application.ao__AppObj_mForum_users_Gateway") OR
			  NOT IsStruct(Application.ao__AppObj_mForum_users_Gateway)>
			<cfset Application.ao__AppObj_mForum_users_Gateway = createObject("component","#variables.modelPath#.users_Gateway").init(request.forumDSN)>
		</cfif>
	</cflock>
</cfif>
<!--- End of Create DAO and Gateway objects for the users Table --->

<!--- Start of Create DAO and Gateway objects for the vulgarity Table --->
<cfif NOT IsDefined("Application.ao__AppObj_mForum_vulgarity_DAO") OR
	  NOT IsStruct(Application.ao__AppObj_mForum_vulgarity_DAO)>
	<cflock timeout="10" throwontimeout="No" type="EXCLUSIVE" scope="APPLICATION">
		<cfif NOT IsDefined("Application.ao__AppObj_mForum_vulgarity_DAO") OR
			  NOT IsStruct(Application.ao__AppObj_mForum_vulgarity_DAO)>
			<cfset Application.ao__AppObj_mForum_vulgarity_DAO = createObject("component","#variables.modelPath#.vulgarity_DAO").init(request.forumDSN)>
		</cfif>
	</cflock>
</cfif>
<cfif NOT IsDefined("Application.ao__AppObj_mForum_vulgarity_Gateway") OR
	  NOT IsStruct(Application.ao__AppObj_mForum_vulgarity_Gateway)>
	<cflock timeout="10" throwontimeout="No" type="EXCLUSIVE" scope="APPLICATION">
		<cfif NOT IsDefined("Application.ao__AppObj_mForum_vulgarity_Gateway") OR
			  NOT IsStruct(Application.ao__AppObj_mForum_vulgarity_Gateway)>
			<cfset Application.ao__AppObj_mForum_vulgarity_Gateway = createObject("component","#variables.modelPath#.vulgarity_Gateway").init(request.forumDSN)>
		</cfif>
	</cflock>
</cfif>
<!--- End of Create DAO and Gateway objects for the vulgarity Table --->

<!--- Start of Create DAO and Gateway objects for the SiteCategories Table --->
<cfif NOT IsDefined("Application.ao__AppObj_mForum_SiteCategories_DAO") OR
	  NOT IsStruct(Application.ao__AppObj_mForum_SiteCategories_DAO)>
	<cflock timeout="10" throwontimeout="No" type="EXCLUSIVE" scope="APPLICATION">
		<cfif NOT IsDefined("Application.ao__AppObj_mForum_SiteCategories_DAO") OR
			  NOT IsStruct(Application.ao__AppObj_mForum_SiteCategories_DAO)>
			<cfset Application.ao__AppObj_mForum_SiteCategories_DAO = createObject("component","#variables.modelPath#.SiteCategories_DAO").init(request.forumDSN)>
		</cfif>
	</cflock>
</cfif>
<cfif NOT IsDefined("Application.ao__AppObj_mForum_SiteCategories_Gateway") OR
	  NOT IsStruct(Application.ao__AppObj_mForum_SiteCategories_Gateway)>
	<cflock timeout="10" throwontimeout="No" type="EXCLUSIVE" scope="APPLICATION">
		<cfif NOT IsDefined("Application.ao__AppObj_mForum_SiteCategories_Gateway") OR
			  NOT IsStruct(Application.ao__AppObj_mForum_SiteCategories_Gateway)>
			<cfset Application.ao__AppObj_mForum_SiteCategories_Gateway = createObject("component","#variables.modelPath#.SiteCategories_Gateway").init(request.forumDSN)>
		</cfif>
	</cflock>
</cfif>
<!--- End of Create DAO and Gateway objects for the SiteCategories Table --->


<!--- 
$Log: fbx_settings.cfm,v $
Revision 1.5  2007/06/15 14:00:08  kevin
Add Admin Modules

Revision 1.4  2007/06/14 16:52:21  kevin
Remove specific comments

Revision 1.3  2007/06/14 16:38:34  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:11  kevin
Initial Open Source Version

Revision 1.7  2006/08/11 12:50:07  mike
change cfc objects from Server to Application scope

Revision 1.6  2006/06/23 17:43:42  mike
new naming convention for cfc objects

Revision 1.5  2005/12/02 17:27:48  mike
DSN => ForumDSN

Revision 1.4  2005/05/21 10:17:52  mike
correct path for Forum_Facade.cfc

Revision 1.3  2005/05/20 12:40:56  kevin
New server cfc naming convention

Revision 1.2  2005/05/09 09:38:48  mike
correct path for Forum_Facade

Revision 1.1  2005/05/05 12:27:44  mike
Initial FB4 Version

 --->

