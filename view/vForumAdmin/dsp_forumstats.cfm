<cfsilent>
<!--- -->
<?xml version="1.0"?>
<fusedoc fuse="dsp_forumstats.cfm">
	<responsibilities>
		I display a report in graphical form
	</responsibilities>
	<properties>
		<history author="Mike Oakes" email="mike@objectiveinternet.com" date="04-Feb-2005" role="Architect" type="Create" />
		<property name="copyright" value="(c)2005 Objective Internet Limited." />
		<property name="licence" value="See licence.txt" />
		<property name="version" value="$Revision: 1.1 $" />
		<property name="lastupdated" value="$Date: 2007/06/15 13:59:14 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<string name="day" scope="attributes" optional="Yes" />
			<string name="month" scope="attributes" optional="Yes" />
			<string name="year" scope="attributes" optional="Yes" />
			<string name="for" scope="attributes" optional="Yes" />
			<recordset name="totalthreads" scope="variables" format="CFML">
				<number name="threadcount"/>
			</recordset>
			<recordset name="unapprovedthreads" scope="variables" format="CFML">
				<number name="threadcount"/>
			</recordset>
			<recordset name="totalmessages" scope="variables" format="CFML">
				<number name="messagecount"/>
			</recordset>
			<recordset name="unapprovedmessages" scope="variables" format="CFML">
				<number name="messagecount"/>
			</recordset>
			<recordset name="archivedthreads" scope="variables" format="CFML">
				<number name="threadcount"/>
			</recordset>
			<recordset name="archivedmessages" scope="variables" format="CFML">
				<number name="messagecount"/>
			</recordset>
			<recordset name="activitybyday" scope="variables" format="CFML">
				<string name="Dayofweek"/>
				<number name="NumberOfDups"/>
			</recordset>
			<recordset name="activitybytime" scope="variables" format="CFML">
				<string name="hourofday"/>
				<number name="NumberOfDups"/>
			</recordset>
		</in>
		<out>
		</out>
	</io>
</fusedoc>
--->
</cfsilent>

<cfoutput>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>
<head>
	<title>#request.forumsname# Statistics</title>
	<link rel="shortcut icon" href="http://www.rfu.com/furniture/rfu.ico">
</head>

<body topmargin="0" leftmargin="0" marginheight="0" marginwidth="0" onload="this.focus();">
<div align="left">&nbsp;<a href="javascript:print();"><b>Print this report</b></a></div>
<table align="center" border="0" width="85%" class="style1">
<!--- <cfif fusebox.fuseaction IS "AllStats"> --->
<cfset variables.fuseaction=ListLast(attributes.fuseaction,".")>
<cfif variables.fuseaction IS "AllStats">
	<tr>
		<th align="center" colspan="2" class="headingtext">F O R U M &nbsp;&nbsp;S T A T I S T I C S</th>
	</tr>
	<tr>
		<td align="center" colspan="2" class="smallheader">
		at #dateformat(now(),"dd/mm/yyyy")# #timeformat(now(),"HH:mm:ss")#<br /><br /></td>
	</tr>
<cfelse>
	<tr>
		<th align="center" colspan="2" class="headingtext">R E S T R I C T E D &nbsp;&nbsp;S T A T I S T I C S</th>
	</tr>
	<tr>
		<td align="center" colspan="2" class="smallheader">
		<!--- <cfset variables.date="#attributes.day#/#attributes.month#/#attributes.year#">NO! --->
		<cfset variables.date=CreateDate(attributes.year,attributes.month,attributes.day)>
		<cfset variables.date=dateformat(variables.date,"dd/mm/yyyy")>
		<cfswitch expression="#attributes.for#">
			<cfcase value="Only">
				New Forum Entries On: #variables.date#<br /><br />
			</cfcase>
			<cfcase value="UpTo">
				New Forum Entries Up To: #variables.date#<br /><br />
			</cfcase>
			<cfcase value="Since">
				New Forum Entries Since: #variables.date#<br /><br />
			</cfcase>
		</cfswitch>
		</td>
	</tr>
</cfif>
	<tr>
		<td class="smallheader" valign="top">Threads:</td>
		<td>
			<b>Total: #totalthreads.threadcount#</b><br />
			Approved: #evaluate(totalthreads.threadcount-unapprovedthreads.threadcount)#<br />
			Unapproved: #unapprovedthreads.threadcount#
			<cfif totalthreads.threadcount GT 0>
			<cfmodule template="dsp_OIFGraph.cfm"
				type="combined"
				key="yes"
				subtitles="no"
				graphname="Breakdown of threads"
				totalname="Total Threads"
				total="#totalthreads.threadcount#"
				rows="2"
				subnames="Approved Threads,Unapproved Threads"
				subvalues="#evaluate(totalthreads.threadcount-unapprovedthreads.threadcount)#,#unapprovedthreads.threadcount#"
				backgroundcolour="white"
				totalcolour="silver"
				subcolours="red,blue">
			</cfif><p></p>
		</td>
	</tr>	
	<tr>
		<td class="smallheader" valign="top">Messages:</td>
		<td>
			<b>Total: #totalmessages.messagecount#</b><br />
			Approved: #evaluate(totalmessages.messagecount-unapprovedmessages.messagecount)#<br />
			Unapproved: #unapprovedmessages.messagecount#
			<cfif totalmessages.messagecount GT 0>
			<cfmodule template="dsp_OIFGraph.cfm"
				type="combined"
				key="yes"
				subtitles="no"
				graphname="Breakdown of messages"
				totalname="Total Messages"
				total="#totalmessages.messagecount#"
				rows="2"
				subnames="Approved Messages,Unapproved Messages"
				subvalues="#evaluate(totalmessages.messagecount-unapprovedmessages.messagecount)#,#unapprovedmessages.messagecount#"
				backgroundcolour="white"
				totalcolour="silver"
				subcolours="red,blue">
			</cfif><p></p>
		</td>
	</tr>
	<!---
	<tr>
		<td class="smallheader" valign="top">Users:</td>
		<td>
			<b>Total: #TotalUsers.TotalUsers#</b><br />
			Administrators: #AdminUsers.AdminUsers#<br />
			Moderators: #ModUsers.ModUsers#<br />
			Users: #evaluate(TotalUsers.TotalUsers-(AdminUsers.AdminUsers+ModUsers.ModUsers))#
			<cfif TotalUsers.TotalUsers GT 0>
			<cfmodule template="dsp_OIFGraph.cfm"
				type="separate"
				key="yes"
				subtitles="no"
				graphname="Breakdown of users"
				totalname="Total Users"
				total="#TotalUsers.TotalUsers#"
				rows="3"
				subnames="Administrators,Moderators,Users"
				subvalues="#AdminUsers.AdminUsers#,#ModUsers.ModUsers#,#evaluate(TotalUsers.TotalUsers-(AdminUsers.AdminUsers+ModUsers.ModUsers))#"
				backgroundcolour="white"
				totalcolour="silver"
				subcolours="red,blue,green">
			</cfif><p></p>
		</td>
	</tr>
	--->	
 	<tr>
		<td class="smallheader" valign="top">Archive:</td>
		<td>
		Archived threads: #archivedthreads.threadcount#<br />
		Archived Messages: #archivedmessages.messagecount#
		<p></p>
		</td>
	</tr>
	<!---
	<tr>
		<td class="smallheader" valign="top">Top 10 Users:</td>
		<td>
		<cfloop query="top10users">
			#top10users.username# - #top10users.NumberOfDups# messages<br />
		</cfloop><p></p>
		</td>
	</tr>
	--->	
 	<tr>
		<td class="smallheader" valign="top">Activity by day of week:</td>
		<td>
		<cfset dayvalues="">
		<cfloop from="1" to="7" index="i">
		  <cfset "day#i#"=0>
		  <cfloop query="activitybyday">
			<cfif activitybyday.dayofweek EQ i>
				<cfset "day#i#" = activitybyday.NumberOfDups>
			</cfif>
		  </cfloop>
		  <cfset dayvalues=listappend(dayvalues,evaluate("day"&i))>
		</cfloop>
		<cfif totalmessages.messagecount GT 0>
 			<cfmodule template="dsp_OIFGraph.cfm"
				type="separate"
				key="no"
				subtitles="yes"
				graphname="Activity by day of week"
				totalname="Total Activity"
				total="#TotalMessages.messagecount#"
				rows="7"
				subnames="Sun,Mon,Tues,Weds,Thurs,Fri,Sat"
				subvalues="#dayvalues#"
				backgroundcolour="white"
				totalcolour="silver"
				subcolours="red,blue,red,blue,red,blue,red">
		</cfif><p></p>
		</td>
	</tr>
	<tr>
		<td class="smallheader" valign="top">Activity by time of day:</td>
		<td>
		<cfset timevalues="">
		<cfloop from="0" to="23" index="i">
		  <cfset "time#i#"=0>
		  <cfloop query="activitybytime">
			<cfif activitybytime.hourofday EQ i>
				<cfset "time#i#" = activitybytime.NumberOfDups>
			</cfif>
		  </cfloop>
		  <cfset timevalues=listappend(timevalues,evaluate("time"&i))>
		</cfloop>
		<cfif totalmessages.messagecount GT 0>
 			<cfmodule template="dsp_OIFGraph.cfm"
				type="separate"
				key="no"
				subtitles="yes"
				graphname="Activity by time of day"
				totalname="Total Activity"
				total="#TotalMessages.messagecount#"
				rows="24"
				subnames="00:00-00:59,01:00-01:59,02:00-02:59,03:00-03:59,04:00-04:59,05:00-05:59,06:00-06:59,07:00-07:59,08:00-08:59,09:00-09:59,10:00-10:59,11:00-11:59,12:00-12:59,13:00-13:59,14:00-14:59,15:00-15:59,16:00-16:59,17:00-17:59,18:00-18:59,19:00-19:59,20:00-20:59,21:00-21:59,22:00-22:59,23:00-23:59"
				subvalues="#timevalues#"
				backgroundcolour="white"
				totalcolour="silver"
				subcolours="red,blue,red,blue,red,blue,red,blue,red,blue,red,blue,red,blue,red,blue,red,blue,red,blue,red,blue,red,blue">
		</cfif><p></p>
		</td>
	</tr>	
</table>
</body>
</html>
</cfoutput>

<cfsilent>
<!--- 
$Log: dsp_forumstats.cfm,v $
Revision 1.1  2007/06/15 13:59:14  kevin
Add Admin Modules

Revision 1.3  2005/05/25 14:08:57  andrew
XHTML Validation chages including removing encoding="UTF-16" to prevent double spacing

Revision 1.2  2005/04/11 12:21:35  mike
change to use messagecount and threadcount throughout (to make queries more uniform and reusable)

Revision 1.1  2005/03/09 13:51:28  mike
Moved to create MVC version

Revision 1.7  2005/03/07 16:38:53  mike
recode references to fusebox.fuseaction

Revision 1.6  2005/02/24 13:57:37  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.5  2005/02/15 12:24:28  mike
explicitly qualify fields inside a <cfloop> by the query name; improve fusedoc

Revision 1.4  2005/02/10 14:46:19  mike
add popuplayout=1, handle monthly stats too, etc.

Revision 1.3  2005/02/08 14:50:35  mike
remove useless onfocus= clause

Revision 1.2  2005/02/07 12:16:21  mike
improve fusedoc

Revision 1.1  2005/02/04 19:56:50  mike
FB3 version made from wireframe with fusebuilder, with contents pasted from FB2 version, fbx_switch fully commented, and XFA usage improved throughout
---> 
</cfsilent>