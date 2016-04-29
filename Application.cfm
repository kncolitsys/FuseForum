<cfsilent>
<cfset IPList = "127.0.0.1">

<!--- Only allow index.cfm and cfcs --->
<cfif right(cgi.script_name, Len("index.cfm")) NEQ "index.cfm" 
  AND GetFileFromPath(GetBaseTemplatePath()) neq "testServer.cfm"
  AND right(cgi.script_name, 3) NEQ "cfc">
	<cflocation url="index.cfm" addtoken="no">
</cfif>

<cfif NOT ListFind(IPList,cgi.REMOTE_HOST)>
	<cferror type="REQUEST"   template="/errortemplates/request.cfm"   mailto="errors@objectiveinternet.com">
	<cferror type="EXCEPTION" template="/errortemplates/exception.cfm" mailto="errors@objectiveinternet.com">
</cfif>
<!--- 
$Log: Application.cfm,v $
Revision 1.2  2007/06/14 14:01:59  kevin
Initial Open Source Version

 --->
</cfsilent>