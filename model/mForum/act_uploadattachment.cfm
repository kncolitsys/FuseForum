<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="$RCSfile: act_uploadattachment.cfm,v $" language="ColdFusion 5" version="2.0">
	<responsibilities>
		I upload an attachment to a message and return the filename of the uploaded file. 
		If there is no upload I use an existing filename or return an empty string.
	</responsibilities>
	<properties>
		<history author="Kevin Roche" email="kevin@objectiveinternet.com" date="13-Oct-2004" role="Architect" type="Create" />
		<property name="copyright" value="(c)2004 Objective Internet Limited." />
		<property name="licence" value="Licensed under the Apache License, Version 2.0  See licence.txt" />
		<property name="version" value="$Revision: 1.4 $" />
		<property name="lastupdated" value="$Date: 2007/06/14 16:52:21 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<string name="forumspath" scope="request" comments="Path to the Directory in which the subdirectory attachments is found and attachments will be saved." />
			<string name="attachmentmaxsize" scope="request" comments="Maximum size allowed for an attachment in K." />
			<number name="deleteattach" scope="attributes" optional="Yes" comments="If present the attachement will be deleted."/>
			<string name="attachment" scope="attributes" optional="Yes" />
			<string name="attachment_old" scope="attributes" optional="Yes" />
			<string name="thisserver" scope="request" optional="No" />
		</in>
		<out>
			<string name="attachment" scope="attributes" comments="Filename of the uploaded attachment."/>
			<string name="toolarge" scope="variables" optional="Yes" />
		</out>
	</io>
</fusedoc>
--->
<cfif isdefined("attributes.attachment")>
	<cfif len(attributes.attachment)>
		<!--- check file size, reject if zero or too big --->
		<cfset variables.dir=GetDirectoryFromPath(attributes.attachment)>
		<cfdirectory action="list" directory="#variables.dir#" name="filetest">
		<cfif ListFindNoCase(ValueList(filetest.name),Listlast(attributes.attachment,"\"))>
			<cfset variables.size=ListGetAt(ValueList(filetest.size),ListFindNoCase(ValueList(filetest.name),Listlast(attributes.attachment,"\")))>
			<cfif variables.size EQ 0>
				<cfset variables.toosmall=1>
				<cfset attributes.attachment="">
			<cfelseif variables.size GT (request.attachmentmaxsize*1000000)>
				<cfset variables.toolarge=1>
				<cfset attributes.attachment="">
			</cfif>
		</cfif>
	</cfif>
	<cfif len(attributes.attachment)>
		<!--- Upload the file --->
		<cffile action="UPLOAD" 
				filefield="attachment" 
				destination="#request.thisserver##request.attachmentpath#" 
				nameconflict="MAKEUNIQUE">
				
		<cfset variables.filename = file.serverfile>

		<!---
		Here are sample values:-
		request.thisserver=D:\inetpub\wwwroot\ 
		request.attachmentpath=FuseForum\attachments\ 
		variables.filename=Further Advice on Youth Guidelines doc1.doc
		--->

		<!--- rename the file if it contains spaces --->
		<cfif FindOneOf(" ",file.serverfile)>
			<cfset variables.filename=Replace(file.serverfile," ","_","All")>
			<cffile action="rename"
				source="#request.thisserver##request.attachmentpath##file.serverfile#"
				destination="#request.thisserver##request.attachmentpath##variables.filename#">
		</cfif>
		
		<!--- Copy to other servers in the cluster. --->
		<cfloop list="#request.lServers#" index="i">
 			<cffile
				action="copy"
				source="#request.thisserver##request.attachmentpath##variables.filename#"
				destination="#i##request.attachmentpath#">
		</cfloop>

		<cfset attributes.attachment=variables.filename>
		
	<cfelseif isdefined("attributes.deleteattach")>
		<cffile action="delete"
				file="#request.thisserver##request.attachmentpath##attributes.attachment#">
		<cfset attributes.attachment="">
		
	<cfelse>
		<cfset attributes.attachment=attributes.attachment_old>
		
	</cfif>
</cfif>
<!---
$Log: act_uploadattachment.cfm,v $
Revision 1.4  2007/06/14 16:52:21  kevin
Remove specific comments

Revision 1.3  2007/06/14 16:38:34  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:10  kevin
Initial Open Source Version

Revision 1.8  2006/08/15 12:41:59  mike
small edit

Revision 1.7  2006/01/26 16:07:50  mike
thisserverroot => thisserver, etc.

Revision 1.6  2005/12/16 15:54:41  mike
request.lservers => request.lserversroot, etc.

Revision 1.5  2005/12/15 14:54:37  bob
Change request.lServers to request.lServersroot

Revision 1.4  2005/12/13 16:39:54  bob
Change request.thisserver to request.thisserverroot

Revision 1.3  2005/11/09 15:49:30  mike
bug fix: remove redundant "attachments\" in destination path; check for empty or too-big attachments

Revision 1.2  2005/07/29 17:18:11  mike
max attachment size = 10Mb now

Revision 1.1  2005/05/05 12:29:25  mike
Initial FB4 Version

Revision 1.2  2004/11/15 16:24:36  mike
replace request.forumspath with better path

Revision 1.1  2004/11/09 13:33:34  kevin
Break out post new thread process into separate fuses.
 --->
</cfsilent>
