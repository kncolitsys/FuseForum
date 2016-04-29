<!--- 
	Created: 	28th November 2001
	By:			Fiona Barker
	Modified:	
	By:			
	Function:	Formatting a message before posting to the database
	Usage:
			<cf_formatinput 
				input="..."
				r_output="..."
				function="in|out"
				replacetags="true|false">
	Attributes:
				input 	 (required) 	- the string to format
				r_output (required) 	- the variable to return the formatted string in
				function (optional) 	- 'in' for replacing line breaks with <br>
									  	  'out' for replacing <br> with line breaks
										  Default is 'in'
				replacetags (optional)	- whether to replace <,> with &lt;,&gt; (in) or vice versa (out). Default is false
 --->
 
<cfif not isdefined("attributes.input")>
	Input is a required attribute
	<cfabort>
</cfif>
<cfif (not isdefined("attributes.r_output")) or (not len(attributes.r_output))>
	r_output is a required attribute
	<cfabort>
</cfif>

<cfparam name="attributes.function" default="in">

<cfif attributes.function neq "out">
	<cfset attributes.function="in">
</cfif>

<cfparam name="attributes.replacetags" default="false">

<cfif attributes.replacetags neq true>
	<cfset attributes.replacetags=false>
</cfif>
 
<cfif attributes.function is "in">
	<cfif attributes.replacetags>
		<cfset attributes.input=replacelist(attributes.input,"<,>","&lt;,&gt;")>
	</cfif>
	<cfset attributes.input=replacelist(attributes.input,"#chr(10)##chr(13)#,#chr(13)##chr(10)#,#chr(10)#,#chr(13)#","<br />,<br />,<br />,<br />")>
<cfelse>
	<cfif attributes.replacetags>
		<cfset attributes.input=replacelist(attributes.input,"&lt;,&gt;","<,>")>
	</cfif>
	<cfset attributes.input=replacelist(attributes.input,"<br />","#chr(10)#")>
</cfif>


<cfset "caller.#attributes.r_output#"=attributes.input>