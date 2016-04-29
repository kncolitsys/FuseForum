<cfsilent>
<!--- -->
<fusedoc fuse="$RCSfile: fbx_settings.cfm,v $" language="ColdFusion 5.0" version="2.0" />
<responsibilities>
	I set up the enviroment settings for this circuit. If this settings file is being inherited, then you can use CFSET to override a value set in a parent circuit or CFPARAM to accept a value set by a parent circuit
</responsibilities> 
	<properties>
		<history author="Mike Oakes" email="mike@objectiveinternet.com" date="30-Mar-2005" role="Architect" type="Create" />
		<property name="copyright" value="(c)2005 Objective Internet Limited." />
		<property name="licence" value="See licence.txt" />
		<property name="version" value="$Revision: 1.1 $" />
		<property name="lastupdated" value="$Date: 2007/06/15 13:59:05 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
</fusedoc>
--->
</cfsilent>

<cfparam name="request.forumDSN"/>
<cfparam name="request.userView"/>

<cfset modelPath = GetDirectoryFromPath(GetCurrentTemplatePath())>
<cfset rootPath = GetDirectoryFromPath(cgi.PATH_TRANSLATED)>
<cfset URLPath = GetDirectoryFromPath(cgi.PATH_INFO)>

<cfif left(modelPath,len(rootPath)) IS rootPath>
	<cfset modelPath = ListChangeDelims(URLPath & RemoveChars(modelPath,1,len(rootpath)),".","/\")>
</cfif>

<cfif isDefined("attributes.clearcache")>
	<cflock timeout="10" throwontimeout="No" type="exclusive" scope="server">
		<cfset Application.ao__AppObj_mForumAdmin_ForumAdmin_Facade = "">
		<cfset Application.ao__AppObj_mForumAdmin_Site_DAO = "">
		<cfset Application.ao__AppObj_mForumAdmin_Site_Gateway = "">
	</cflock>
	<cfoutput>CACHE CLEARED<br /></cfoutput>
</cfif>

<!--- Start of Create Facade object for ForumAdmin --->
<cfif NOT IsDefined("Application.ao__AppObj_mForumAdmin_ForumAdmin_Facade") OR
	  NOT IsStruct(Application.ao__AppObj_mForumAdmin_ForumAdmin_Facade)>
	<!--- Based on the directory work out which view to use --->
	
	<cflock timeout="10" throwontimeout="No" type="exclusive" scope="server">
		<cfif NOT IsDefined("Application.ao__AppObj_mForumAdmin_ForumAdmin_Facade") OR
			  NOT IsStruct(Application.ao__AppObj_mForumAdmin_ForumAdmin_Facade)>
			<cfset Application.ao__AppObj_mForumAdmin_ForumAdmin_Facade = createObject("component","#variables.modelPath#.ForumAdmin_Facade").init(request.forumDSN,request.userView)>
		</cfif>
	</cflock>
</cfif>
<!--- End of Create Facade object for ForumAdmin --->

<!--- Start of Create DAO and Gateway objects for the Site Table --->
<cfif NOT IsDefined("Application.ao__AppObj_mForumAdmin_Site_DAO") OR
	  NOT IsStruct(Application.ao__AppObj_mForumAdmin_Site_DAO)>
	<cflock timeout="10" throwontimeout="No" type="EXCLUSIVE" scope="SERVER">
		<cfif NOT IsDefined("Application.ao__AppObj_mForumAdmin_Site_DAO") OR
			  NOT IsStruct(Application.ao__AppObj_mForumAdmin_Site_DAO)>
			<cfset Application.ao__AppObj_mForumAdmin_Site_DAO = createObject("component","FuseForum.model.mForumAdmin.Site_DAO").init(request.forumDSN)>
		</cfif>
	</cflock>
</cfif>
<cfif NOT IsDefined("Application.ao__AppObj_mForumAdmin_Site_Gateway") OR
	  NOT IsStruct(Application.ao__AppObj_mForumAdmin_Site_Gateway)>
	<cflock timeout="10" throwontimeout="No" type="EXCLUSIVE" scope="SERVER">
		<cfif NOT IsDefined("Application.ao__AppObj_mForumAdmin_Site_Gateway") OR
			  NOT IsStruct(Application.ao__AppObj_mForumAdmin_Site_Gateway)>
			<cfset Application.ao__AppObj_mForumAdmin_Site_Gateway = createObject("component","FuseForum.model.mForumAdmin.Site_Gateway").init(request.forumDSN)>
		</cfif>
	</cflock>
</cfif>
<!--- End of Create DAO and Gateway objects for the Site Table --->


<cfsilent>
<!--- 
$Log: fbx_settings.cfm,v $
Revision 1.1  2007/06/15 13:59:05  kevin
Add Admin Modules

Revision 1.10  2006/08/11 12:55:37  mike
change cfc objects from Server to Application scope

Revision 1.9  2006/08/01 10:56:50  mike
correct the naming convention for the ForumAdmin_Facade.cfc object

Revision 1.8  2006/07/31 15:45:01  kevin
Trafalgar Conversion: specify name of users view at init.

Revision 1.7  2006/06/23 17:19:56  mike
new naming convention for cfc objects

Revision 1.6  2005/09/05 15:47:31  kevin
Change DSN for forums.

Revision 1.5  2005/05/21 15:26:35  mike
correct path for ForumAdmin_Facade

Revision 1.4  2005/05/20 12:33:38  kevin
New server cfc naming convention

Revision 1.3  2005/05/11 10:41:17  kevin
Rename from MVC conversion

Revision 1.2  2005/04/06 09:56:35  mike
new path to ForumAdmin_Facade.cfc

Revision 1.1  2005/03/31 14:25:05  mike
initial version

 --->
</cfsilent>
