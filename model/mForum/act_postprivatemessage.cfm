<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="act_postprivatemessage.cfm">
	<responsibilities>
		I send the private message to the selected person
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
			<boolean name="censorship" scope="request" />
			<number name="userid" scope="request" />
			<number name="userid" scope="attributes" />
			<string name="message" scope="attributes" />
		</in>
		<out>
		</out>
	</io>
</fusedoc>
--->
</cfsilent>

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

<cfset block=0>
<cfif request.censorship>
	
	<cfset forbiddenwords=Application.ao__AppObj_mForum_vulgarity_Gateway.findAll()>
	<cfloop query="forbiddenwords">
		<cfif findnocase(vulgarity,attributes.message)>
			<cfset attributes.message=replacenocase(attributes.message,vulgarity,"<span class='vulgarity'>#vulgarity#</span>","all")>
			<cfset block=1>
		<cfelse>
		</cfif>
	</cfloop>
</cfif>

<cfif block EQ 0>
	
	<cfinvoke component="#Application.ao__AppObj_mForumFacade_Forum_Facade#"
		method="fCreatePrivateMessage"
		userid="#attributes.userid#"
		message="#attributes.message#"
		senderid="#request.userid#"
		returnvariable="variables.messageid">

<cfelse>
	<cfoutput>
	MESSAGE HAS BEEN REFUSED!
	</cfoutput>
	<cfabort>
	<cfset refused_text=attributes.message>
	<!--- <cfinclude template="dsp_pagetop.cfm"> --->
	<!--- <cfinclude template="dsp_navigation.cfm">	--->
	<!--- <cfinclude template="dsp_vulgarity.cfm"> --->
	<!--- <cfinclude template="dsp_pagebottom.cfm"> --->
</cfif>

<cfsilent>
<!--- 
$Log: act_postprivatemessage.cfm,v $
Revision 1.4  2007/06/14 16:52:21  kevin
Remove specific comments

Revision 1.3  2007/06/14 16:38:34  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:10  kevin
Initial Open Source Version

Revision 1.9  2006/08/11 12:50:07  mike
change cfc objects from Server to Application scope

Revision 1.8  2006/07/24 13:14:33  kevin
Remove unwanted SQL

Revision 1.7  2006/06/23 17:43:42  mike
new naming convention for cfc objects

Revision 1.6  2005/12/02 17:27:48  mike
DSN => ForumDSN

Revision 1.5  2005/11/09 18:06:55  mike
call splitmessage custom tag

Revision 1.4  2005/05/21 10:17:52  mike
correct path for Forum_Facade.cfc

Revision 1.3  2005/05/20 12:40:56  kevin
New server cfc naming convention

Revision 1.2  2005/05/05 13:02:55  mike
recode to call methods in Forum_Facade.cfc etc.; improve fusedoc

Revision 1.1  2005/05/05 12:29:25  mike
Initial FB4 Version

Revision 1.6  2004/11/07 14:33:03  mike
small edits

Revision 1.5  2004/11/05 15:30:31  mike
call by <cfmodule> not cf_formatinput

Revision 1.4  2004/11/05 13:53:01  mike
removed dsp_vulgarity.cfm etc.

Revision 1.3  2004/11/04 18:53:09  mike
add a <cfabort> if vulgarity

Revision 1.2  2004/11/02 16:01:12  mike
added fusedoc, etc.

Revision 1.1  2004/10/18 10:11:53  mike
initial version
 --->
</cfsilent>
