<cfsilent>
<!--- Handle Search Engine Safe URLs --->
<!--- <cfset request.SESdummyExtension = ".cfm">
<cfset SESrBaseName = "request.baseHREF">
<cfinclude template="sesConverter.cfm"> --->

<!--- Set up Application Environment --->

<!--- Set the domain to that of the server. --->
<cfset domain = cgi.SERVER_NAME>

<!--- Check to see if the server has been accessed with an IP Address --->
<cfset isIPAddress = "Yes">
<cfloop list="#domain#" index="thisPart" delimiters=".">
	<cfif NOT (isNumeric(thisPart) AND thisPart LT 256 AND thisPart GE 0) >
		<cfset isIPAddress = "No">
	</cfif>
</cfloop>

<!--- If it was not an IP address then remove the start of the domain name (usually the www) --->
<cfif NOT isIPAddress AND ListLen(domain,".") GT 2>
	<cfset domain = ListRest(domain,".")>
</cfif>

<!--- Set the application up --->
<cfapplication name="FuseForum" clientmanagement="No" setclientcookies="No" sessionmanagement="Yes" sessiontimeout="#CreateTimeSpan(0,0,30,0)#">

<!--- Write the cookies if they are not there already. --->
<cfif isIPAddress>
	<cfif NOT (isDefined("cookie.cfid") AND cookie.cfid IS session.cfid)>
		<cfcookie name="cfid" value="#session.cfid#">
		<cfcookie name="cftoken" value="#session.cftoken#">
	</cfif>
<cfelse>
	<cfif NOT (isDefined("cookie.cfid") AND cookie.cfid IS session.cfid)>
		<cfcookie name="cfid" value="#session.cfid#" domain="#domain#">
		<cfcookie name="cftoken" value="#session.cftoken#" domain="#domain#">
	</cfif>
</cfif>
	
<!--- <cfinclude template="form_expression.cfm"> --->
</cfsilent>
<cfinclude template="/fusebox5/fusebox5.cfm" />
<cfsilent>
<!--- 
$Log: index.cfm,v $
Revision 1.2  2007/06/14 14:01:59  kevin
Initial Open Source Version

 --->
</cfsilent>
