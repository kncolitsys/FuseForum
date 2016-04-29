<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="splitmessage.cfm" language="ColdFusion" specification="2.0">
	<responsibilities>
		I am a custom tag used to ensure that messages do not contain very long pseudo-words.
	</responsibilities>
	<properties>
		<history 
			author="Mike Oakes"
			email="mike@objectiveinternet.com"
			type="Create" 
			date="9/Nov/2005"
			role="Architect" />
		<property name="copyright" value="(c)2005 Objective Limited."/>
		<property name="licence" value="See licence.txt"/>
		<property name="version" value="3.00"/>
	</properties>
	<io>
		<in>
			<string name="message" scope="attributes" comments="string containing a message" />
			<string name="r_output" scope="attributes" comments="name of the variable to return" />
			<number name="maxwordlength" scope="attributes" comments="maximum length of allowed word. If exceeded, spaces are inserted to allow the display to wrap around without destroying the page layout" />
		</in>
		<out>
			<string name="r_output"" scope="caller" comments="the string returned" />
		</out>
	</io>
</fusedoc>
--->

<cfparam name="attributes.message" default="">
<cfparam name="attributes.maxwordlength" default="60">
<cfparam name="attributes.r_output" default="r_output">

<!--- Check that message doesn't have any VERY long substrings (which can corrupt page layouts) --->
<cfset ind=1>
<cfloop condition="(ind LTE len(attributes.message)) AND (Find(' ',attributes.message,ind) NEQ 0)">
	<cfset ind2=Find(" ",attributes.message,ind)>
	<cfif ind2 GT (ind+attributes.maxwordlength)>
		<cfloop condition="len(attributes.message) GT (ind+attributes.maxwordlength)">
			<cfset attributes.message=Insert(" ",attributes.message,ind+attributes.maxwordlength)>
			<cfset ind=ind+attributes.maxwordlength>
		</cfloop>
	<cfelse>
		<cfset ind=ind2>
	</cfif>
	<!--- At this point, the character at ind is a space --->
	<cfset ind=ind+1> <!--- advance one place --->
</cfloop>

<!--- so no more spaces --->
<cfloop condition = "len(attributes.message) GT (ind+attributes.maxwordlength)">
	<cfset attributes.message=Insert(" ",attributes.message,ind+attributes.maxwordlength)>
	<cfset ind=ind+attributes.maxwordlength>
</cfloop>

<cfset "caller.#attributes.r_output#"=attributes.message>
		
<!--- 
$Log: splitmessage.cfm,v $
Revision 1.3  2007/06/14 16:56:23  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:35  kevin
Initial Open Source Version

Revision 1.1  2005/11/09 18:01:31  mike
new file

--->

