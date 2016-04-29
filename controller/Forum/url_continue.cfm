<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="url_continue.cfm">
	<responsibilities>
		I redirect to XFA.Continue
	</responsibilities>
	<properties>
		<history 
			author="Mike Oakes" 
			email="mike@objectiveinternet.com" 
			date="04-May-2005" 
			role="architect" 
			type="create"/>
		<property name="copyright" value="(c) 2005 Objective Internet Limited."/>
		<property name="licence" value="See licence.txt"/>
		<property name="version" value="3.00"/>
	</properties>
	<io>
		<in>
			<string name="XFA.Continue" scope="variables" />
			<number name="categoryid" scope="attributes" optional="Yes" />
			<number name="threadid" scope="attributes" optional="Yes" />
		</in>
		<out>
			<string name="fuseaction" scope="formOrUrl" />
			<number name="categoryid" scope="formOrUrl" optional="Yes" />
			<number name="threadid" scope="formOrUrl" optional="Yes" />
		</out>
	</io>
</fusedoc>
--->

<cfset parms="">
<cfif isDefined("attributes.categoryid")>
	<cfset parms = parms & "&categoryid=#attributes.categoryid#">
</cfif>
<cfif isDefined("attributes.threadid")>
	<cfset parms = parms & "&threadid=#attributes.threadid#">
</cfif>
<cflocation url="#request.BaseHREF##request.self#?fuseaction=#XFA.Continue##parms#" addtoken="No">

<!--- 
$Log: url_continue.cfm,v $
Revision 1.4  2007/06/14 16:56:23  kevin
Copyright statement

Revision 1.3  2007/06/14 16:52:21  kevin
Remove specific comments

Revision 1.2  2007/06/14 14:00:59  kevin
Initial Open Source Version
--->
</cfsilent>
