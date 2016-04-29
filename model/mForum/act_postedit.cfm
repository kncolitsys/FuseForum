<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="act_postedit.cfm">
	<responsibilities>
		I upload the edited message to the database
	</responsibilities>
	<properties>
		<history author="Mike Oakes" email="mike@objectiveinternet.com" date="01-Nov-2004" role="Architect" type="Create" />
		<property name="copyright" value="(c)2004 Objective Internet Limited." />
		<property name="licence" value="Licensed under the Apache License, Version 2.0  See licence.txt" />
		<property name="version" value="$Revision: 1.5 $" />
		<property name="lastupdated" value="$Date: 2007/06/14 16:52:21 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<boolean name="censorship" scope="request" />
			<list name="lservers" scope="request" />
			<string name="adminEmail" scope="request" />
			<number name="threadid" scope="attributes" />
			<string name="message" scope="attributes" />
			<string name="attachment" scope="attributes" optional="Yes" />
			<string name="attachment_old" scope="attributes" />
			<string name="toolarge" scope="variables" optional="Yes" />
		</in>
		<out>
		</out>
	</io>
</fusedoc>
--->
</cfsilent>

<!--- <cfdump var="#attributes#"> --->
<cfmodule template="../../tags/formatinput/formatinput.cfm"
	input="#attributes.message#"
	r_output="attributes.message"
	function="in"
	replacetags="true">

<!--- NB the following added 9Nov05 --->
<!--- Check that message doesn't have any VERY long substrings (which can corrupt page layouts) --->
<cfmodule template="../../tags/splitmessage/splitmessage.cfm"
	message="#attributes.message#"
	maxwordlen="80"
	r_output="attributes.message">

<!--- find the thread's category --->
<cfset variables.categoryid=0><!--- default --->
<cfinvoke component="#Application.ao__AppObj_threads_Gateway#"
	method="fCategory"
	threadid="#attributes.threadid#"
	returnvariable="qCategory">
<cfif qCategory.recordcount>
	<cfset variables.categoryid=qCategory.categoryid>
</cfif>

<cfset block=0><!--- default --->

<cfif request.censorship>
	<!--- Remove any forbidden words --->
	<cfset forbiddenwords=Application.ao__AppObj_vulgarity_Gateway.findAll()>
	<cfloop query="forbiddenwords">
		<cfif findNoCase(vulgarity,attributes.message)>
			<cfset attributes.message=replacenocase(attributes.message,vulgarity,"<span class='vulgarity'>#vulgarity#</span>","all")>
			<cfset block=1>
		</cfif>
	</cfloop>
</cfif>

<cfif block EQ 0>

	<cfif isDefined("attributes.attachment")>
		<cfif len(attributes.attachment)>
			<cfif len(attributes.attachment_old)>
				<cftry>
					<cffile action="delete"
							file="#request.thisserver##request.attachmentpath##attributes.attachment_old#">
					<cfloop list="#request.lServers#" index="i">
			 			<cffile
							action="delete"
							file="#i##request.attachmentpath##attributes.attachment_old#">
					</cfloop>
				<cfcatch/>
				</cftry>
			</cfif>
			<cffile action="upload"
					destination="#request.thisserver##request.attachmentpath#"
					nameconflict="makeunique"
					filefield="attachment">
			<cfset variables.filename=file.serverfile>
			<cfif file.filesize GT (request.attachmentmaxsize*1000000)>
				<cffile action="delete"
					file="#request.thisserver##request.attachmentpath##file.serverfile#">
				<cfset variables.toolarge=1>
			<cfelse>
				<cfif FindOneOf(" ",file.serverfile)>
					<cfset variables.filename=Replace(file.serverfile," ","_","All")>
					<cffile action="rename"
						source="#request.thisserver##request.attachmentpath##file.serverfile#"
						destination="#request.thisserver##request.attachmentpath##variables.filename#">
				</cfif>
				<cfloop list="#request.lServers#" index="i">
		 			<cffile
						action="copy"
						source="#request.thisserver##request.attachmentpath##variables.filename#"
						destination="#i##request.attachmentpath#">
				</cfloop>
			</cfif>
			<cfset attributes.attachment=variables.filename>
		<cfelseif isdefined("attributes.deleteattach")>
			<cftry>
				<cffile action="delete"
						file="#request.thisserver##request.attachmentpath##attributes.attachment_old#">
				<cfloop list="#request.lServers#" index="i">
		 			<cffile
						action="delete"
						file="#i##request.attachmentpath##attributes.attachment_old#">
				</cfloop>
			<cfcatch/>
			</cftry>
			<cfset attributes.attachment="">
		<cfelse>
			<cfset attributes.attachment=attributes.attachment_old>
		</cfif>
	</cfif>
	
	<!--- find out whether the thread's category requires its threads to be approved --->
	<cfinvoke component="#Application.ao__AppObj_categories_Gateway#"
		method="findSelected"
		categoryid="#variables.categoryid#"
		returnvariable="getapproved">
	<cfif getapproved.approval EQ 1>
		<cfset variables.approval="true">
		<cfset variables.approved=0>
	<cfelse>
		<cfset variables.approval="false">
		<cfset variables.approved=1>
	</cfif>
	
	<cfset variables.today=dateformat(now(),"ddd, dd mmmm yy")>
	<cfset variables.editmessage="This message edited on #variables.today# by #request.username#">
	<cfif isDefined("attributes.attachment") AND len(attributes.attachment) AND NOT isdefined("variables.toolarge")>
		<cfset variables.attachment=attributes.attachment>
	<cfelse>
		<cfset variables.attachment="">
	</cfif>
	<cfinvoke component="#Application.ao__AppObj_messages_Gateway#"
		method="updateSelected"
		messageid="#attributes.messageid#"
		message="#attributes.message#"
		approved="#variables.approved#"
		editmessage="#variables.editmessage#"
		attachment="#variables.attachment#"
		returnvariable="variables.temp">
	

	<cfif variables.approval>
		<!--- Get the moderators for this category --->
		<cfinvoke component="#Application.ao__AppObj_mForumFacade_Forum_Facade#"
			method="fForumModerators"
			categoryid="#variables.categoryid#"
			returnvariable="getapproved">
		<cfif getapproved.recordcount>
			<cfset emailto = "">
			<cfloop query="getapproved">
				<!--- send the email to the moderator's preferred address --->
				<cfset variables.emailto = ListAppend(variables.emailto, emailaddress)>
			</cfloop>
		<cfelse>
			<cfset variables.emailto = request.adminEmail>
		</cfif>

		<cfif Len(variables.emailto)>
			<cfmail from="#request.adminEmail#"
					to="#variables.emailto#"
					subject="Message edit approval required">
	
			A message has been edited in one of your moderation forums.
			Please proceed to the moderation area to approve or reject this message
			before it appears on the forum.
	
			</cfmail>
		</cfif>
	</cfif>

<cfelse><!--- so block EQ 1 --->

	<cfoutput>
	MESSAGE HAS BEEN REFUSED!
	</cfoutput>
	<cfabort>
	<cfset refused_text=attributes.message>
	<!--- <cfinclude template="dsp_pagetop.cfm"> --->
	<!--- <cfinclude template="dsp_navigation.cfm"> --->
	<!--- <cfinclude template="dsp_vulgarity.cfm"> --->
	<!--- <cfinclude template="dsp_pagebottom.cfm"> --->

</cfif>

<cfsilent>
<!--- 
$Log: act_postedit.cfm,v $
Revision 1.5  2007/06/14 16:52:21  kevin
Remove specific comments

Revision 1.4  2007/06/14 16:38:33  kevin
Copyright statement

Revision 1.3  2007/06/14 15:07:14  kevin
single email address

Revision 1.2  2007/06/14 14:01:10  kevin
Initial Open Source Version

Revision 1.14  2006/08/11 12:50:07  mike
change cfc objects from Server to Application scope

Revision 1.13  2006/07/24 13:14:33  kevin
Remove unwanted SQL

Revision 1.12  2006/06/23 17:43:41  mike
new naming convention for cfc objects

Revision 1.11  2006/01/26 16:07:50  mike
thisserverroot => thisserver, etc.

Revision 1.10  2005/12/16 15:56:17  mike
request.lservers => request.lserversroot, etc.

Revision 1.9  2005/12/02 17:27:47  mike
DSN => ForumDSN

Revision 1.8  2005/11/09 18:05:05  mike
call splitmessage custom tag

Revision 1.7  2005/07/29 17:15:59  mike
max attachment size = 10Mb now

Revision 1.6  2005/05/21 10:17:51  mike
correct path for Forum_Facade.cfc

Revision 1.5  2005/05/20 12:40:56  kevin
New server cfc naming convention

Revision 1.4  2005/05/13 17:46:08  mike
final working version

Revision 1.3  2005/05/06 13:39:45  mike
simplify, by setting variables.categoryid first

Revision 1.2  2005/05/05 13:00:31  mike
recode to call methods in Forum_Facade.cfc, etc.

Revision 1.1  2005/05/05 12:29:24  mike
Initial FB4 Version

Revision 1.6  2004/11/15 16:24:53  mike
replace request.forumspath with better path

Revision 1.5  2004/11/05 15:30:30  mike
call by <cfmodule> not cf_formatinput

Revision 1.4  2004/11/05 13:53:00  mike
removed dsp_vulgarity.cfm etc.

Revision 1.3  2004/11/03 19:18:30  mike
added check of Len(variables.emailto) to stop errors, etc.

Revision 1.2  2004/11/02 15:53:44  mike
added fusedoc, etc.
--->
</cfsilent>
