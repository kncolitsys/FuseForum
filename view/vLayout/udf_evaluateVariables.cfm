<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="udf_evaluateVariables.cfm">
	<responsibilities>
		I evaluate a string and evaluate any CF variables included in double hash marks.
	</responsibilities>

	<properties>
		<history author="Bob Clifford" 
			email="bob@objectiveinternet.com" 
			date="03-August-2005" 
			role="Architect" 
			type="Create" />
		<property name="copyright" value="(c)2005 Objective Internet Limited." />
		<property name="licence" value="Licensed under the Apache License, Version 2.0  See licence.txt" />
		<property name="version" value="$Revision: 1.3 $" />
		<property name="lastupdated" value="$Date: 2007/06/14 16:38:35 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<string name="thisstring" />
			<string name="identifiers" />
		</in>
		<out>
			<string name="thisstring" />
		</out>
	</io>
</fusedoc>
--->
</cfsilent>

<cffunction name="evaluateVariables" returntype="string" hint="I evaluate a string and return it with CF variables evaluated.">
	<cfargument name="thisstring" required="Yes">
	<cfset var poundsign = "##">
	<cfset var poundsignplaceholder = "">
	<cfset var identifiers = poundsign>	<!--- Default identifier. --->
	<cfset var thisdelimiter = "!"> <!--- Default delimiter. --->
	<cfset var i = "1">

<cfscript>
	//
	// Replaces variable placeholders with values of said variables using any list of possible identifiers.
	// 
	// @param thisstring 	 The string to parse. (Required)
	// @param identifiers 	 Characters to use as identifiers. (Optional)
	// @return Returns a string. 
	// @author Steven Van Gemert (svg2@placs.net) 
	// @version 1, July 13, 2005 
	//
	
		if (ArrayLen(arguments) EQ 2){ //If we were passed a list of identifiers...
			identifiers = arguments[2]; //...then use them.
		}
		while(findnocase(thisdelimiter,identifiers & poundsign)){ //If we were passed the same identifier as we chose for our delimiter, or it's a pound sign or single quote...
			thisdelimiter = chr(asc(thisdelimiter) + 1); //...then use a different delimiter.
		}
		poundsignplaceholder = repeatstring(thisdelimiter,3) & "PoundSign" & repeatstring(thisdelimiter,3); //Create the pound sign placeholder to preserve existing pound signs in the string.
		
		if(not findnocase(poundsign,identifiers)){ //If the pound sign is not one of the identifiers...
			thisstring = replace(thisstring,poundsign,poundsignplaceholder,"ALL"); //...then replace any existing pound signs with a place holder to preserve them.
		}
	
		for(i=1; i LTE len(identifiers); i = i + 1){ //For each identifier...
			if(listlen(thisdelimiter & thisstring & thisdelimiter,mid(identifiers,i,1)) mod 2){ //If there is an odd number of items in the list (cursory check - not definitive - to verify that the evaluate statement will function properly).
				thisstring = replace(thisstring,mid(identifiers,i,1),poundsign,"ALL"); //...replace it with pound signs.
			}
		}
	
		thisstring = evaluate(de(thisstring)); //Evaluate the variables.
		
		if(not findnocase(poundsign,identifiers)){ //If the pound sign is not one of the identifiers...
			thisstring = replace(thisstring,poundsignplaceholder,poundsign,"ALL"); //...then re-instate the preserved pound signs.
		}
</cfscript>

<cfreturn thisstring>

</cffunction>

<cfsilent>
<!--- 
$Log: udf_evaluateVariables.cfm,v $
Revision 1.3  2007/06/14 16:38:35  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:47  kevin
Initial Open Source Version

Revision 1.1  2005/08/03 12:39:33  bob
CR2.2 - NEW FILE for Page Count

 --->
</cfsilent>
