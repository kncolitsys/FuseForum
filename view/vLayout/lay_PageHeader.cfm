<cfsilent>
<!--- -->
<fusedoc fuse="$RCSfile: lay_PageHeader.cfm,v $" language="ColdFusion 6.1" version="2.0">
	<responsibilities>
		I get the current tags for the selected page from the database.
	</responsibilities>
	<properties>
		<history author="Kevin Roche" email="kevin@objectiveinternet.com" date="10-May-2005" role="Architect" type="Create" />
		<property name="copyright" value="(c)2004 Objective Internet Limited." />
		<property name="licence" value="Licensed under the Apache License, Version 2.0  See licence.txt" />
		<property name="version" value="$Revision: 1.4 $" />
		<property name="lastupdated" value="$Date: 2007/06/15 14:00:08 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
			<string name="XFA.Register" scope="variables"/>
			<string name="XFA.Login" scope="variables"/>
			<string name="XFA.ForumsMyMessages" scope="variables"/>
			<string name="XFA.Edit_Details" scope="variables"/>
			<string name="XFA.ForumsMySubscriptions" scope="variables"/>
			<string name="XFA.Logout" scope="variables"/>
			<string name="XFA.Home" scope="variables"/>
			<string name="XFA.SearchResults" scope="variables"/>
			<string name="XFA.AdvancedSearch" scope="variables"/>
			<string name="self" scope="variables"/>
			<string name="SiteId" scope="request"/>
			<number name="userid" scope="request" comments="defines whether or not user is logged-in"/>
		</in>
		<out>
			<string name="fuseaction" scope="formOrUrl" />
			<string name="SearchText" scope="formOrUrl" />
			<list name="Publications" scope="formOrUrl"/>
			<string name="SearchWhat" scope="formOrUrl" comments="Current"/>
			<string name="SortOrder" scope="formOrUrl" comments="Relevance"/>
			<boolean name="Quick" scope="formOrUrl" comments="to force a search of all Publications"/>
		</out>
	</io>
</fusedoc>
--->
</cfsilent>
<cfoutput>
<!--- Start Header --->

<script language="JavaScript" type="text/JavaScript">
	<!--
	function MM_goToURL() { //v3.0
	  var i, args=MM_goToURL.arguments; document.MM_returnValue = false;
	  for (i=0; i<(args.length-1); i+=2) eval(args[i]+".location='"+args[i+1]+"'");
	}
	
	function MM_findObj(n, d) { //v4.01
	  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
	    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
	  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
	  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
	  if(!x && d.getElementById) x=d.getElementById(n); return x;
	}
	
	function MM_showHideLayers() { //v6.0
	  var i,p,v,obj,args=MM_showHideLayers.arguments;
	  for (i=0; i<(args.length-2); i+=3) if ((obj=MM_findObj(args[i]))!=null) { v=args[i+2];
	    if (obj.style) { obj=obj.style; v=(v=='show')?'visible':(v=='hide')?'hidden':v; }
	    obj.visibility=v; }
	}
	//-->
</script>
</cfoutput>
<cfsilent>
<!--- 
$Log: lay_PageHeader.cfm,v $
Revision 1.4  2007/06/15 14:00:08  kevin
Add Admin Modules

Revision 1.3  2007/06/14 16:38:35  kevin
Copyright statement

Revision 1.2  2007/06/14 14:01:47  kevin
Initial Open Source Version

Revision 1.14  2006/04/04 13:08:32  andrew
removed attenda logo

Revision 1.13  2005/11/15 17:04:48  kevin
Fix Advanced search link to support SES URLs

Revision 1.12  2005/10/13 10:53:43  mike
link to Serendipity if user has permission

Revision 1.11  2005/08/03 12:38:54  bob
CR2.2 - Include udf_evaluateVariables.cfm line 36

Revision 1.10  2005/07/29 10:21:01  bob
CR - Add generated banner value

Revision 1.9  2005/07/05 12:03:32  mike
display new banner ad

Revision 1.8  2005/06/30 10:37:53  mike
pass attributes.Quick, etc.; improve fusedoc

Revision 1.7  2005/06/28 16:17:34  mike
change field name to searchText

Revision 1.6  2005/06/24 15:20:17  mike
change XFA names

Revision 1.5  2005/05/26 11:00:06  mike
change xfa names

Revision 1.4  2005/05/26 09:19:40  mike
improve the use of xfa's

Revision 1.3  2005/05/21 11:57:46  mike
proer links for when logged-in and when not

Revision 1.2  2005/05/14 13:38:03  kevin
XHTML fix

Revision 1.1  2005/05/10 12:30:30  kevin
Initial File
 --->
</cfsilent>
