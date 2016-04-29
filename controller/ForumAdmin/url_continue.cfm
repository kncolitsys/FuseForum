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
			date="10-Feb-2005" 
			role="architect" 
			type="create"/>
		<property name="copyright" value="(c) 2005 Activity Forum Limited."/>
		<property name="licence" value="See licence.txt"/>
		<property name="version" value="3.00"/>
	</properties>
	<io>
		<in>
			<string name="XFA.Continue" scope="request" />
			<number name="categoryid" scope="attributes" optional="Yes" />
			<string name="bantype" scope="attributes" optional="Yes" />
		</in>
		<out>
			<string name="fuseaction" scope="formOrUrl" />
			<number name="categoryid" scope="formOrUrl" optional="Yes" />
			<string name="bantype" scope="formOrUrl" optional="Yes" />
		</out>
	</io>
</fusedoc>
--->

<cfset parms="">
<cfif isDefined("attributes.categoryid")>
	<cfset parms = parms & "&categoryid=#attributes.categoryid#">
</cfif>
<cfif isDefined("attributes.bantype")>
	<cfset parms = parms & "&bantype=#attributes.bantype#">
</cfif>
<cflocation url="#request.BaseHREF##request.self#?fuseaction=#XFA.Continue##parms#" addtoken="No">

<!--- 
$Log: url_continue.cfm,v $
Revision 1.1  2007/06/15 13:58:56  kevin
Add Admin Modules

Revision 1.2  2005/05/03 12:59:04  kevin
Change XFA scope

Revision 1.1  2005/03/09 14:07:19  mike
Moved to create MVC version

Revision 1.4  2005/02/24 13:57:47  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.3  2005/02/16 11:31:55  mike
&amp; doesn't work in a <cflocation> url

Revision 1.2  2005/02/15 12:43:04  mike
replace & by &amp; for strict HTML compliance

Revision 1.1  2005/02/10 17:08:48  mike
new file
--->
</cfsilent>
