<cfsilent>
<!--- -->
<?xml version="1.0" encoding="UTF-16"?>
<fusedoc fuse="act_selectboxes.cfm">
	<responsibilities>
		I operate the boxes allowing members to be added/removed from the Forum
	</responsibilities>
	<properties>
		<history author="Mike Oakes" email="mike@objectiveinternet.com" date="04-Feb-2005" role="Architect" type="Create" />
		<property name="copyright" value="(c)2005 Objective Internet Limited." />
		<property name="licence" value="See licence.txt" />
		<property name="version" value="$Revision: 1.1 $" />
		<property name="lastupdated" value="$Date: 2007/06/15 13:59:05 $" />
		<property name="updatedby" value="$Author: kevin $" />
	</properties>
	<io>
		<in>
		</in>
		<out>
		</out>
	</io>
</fusedoc>
--->

<script language="JavaScript" type="text/javascript">
<!--
function switchselects(from,to,hidden,action)
  {
	var a = eval('document.myForm' + '.' + from);
	var b = eval('document.myForm' + '.' + to);
	var c = eval('document.myForm' + '.' + hidden);
	
	if (!(a.value=="a"))
	  {	
		var aLen = a.length
		var bLen = b.length;
		var moveV = new Array(), moveT = new Array(), stayV = new Array(), stayT = new Array()
		var mx = 0, sx = 0; 

		c.value="";
		for (var x = 0; x < aLen; x++)
		  {
			if (a.options[x].selected == true)
			  {
				moveV[mx] = a.options[x].value;
				moveT[mx] = a.options[x].text;
				mx++;
			  }
			else
			  {
				stayV[sx] = a.options[x].value;
				stayT[sx] = a.options[x].text;
				sx++;	
			  }
		  }
		a.length = stayV.length;
		b.length += moveV.length;
		for (var x=0; x < stayV.length; x++)
		  {
			a.options[x].value = stayV[x];
			a.options[x].text = stayT[x];
			a.options[x].selected = false;	
		  }
		var y = 0;
		for (var x = bLen; x < b.length; x++)
		  {
			b.options[x].value = moveV[y];
			b.options[x].text = moveT[y];
			b.options[x].selected = false;
			y++
		  }
		if (action=="add")
		  {
			for (var i=0; i<b.length; i++)
			  {
				c.value+=','+b.options[i].value;
			  }
		  }
		else
		  {	
			for (var i=0; i<a.length; i++)
			  {
				c.value+=','+a.options[i].value;
			  }
		  }
	  }
  }
//-->
</script>	

<!--- 
$Log: act_selectboxes.cfm,v $
Revision 1.1  2007/06/15 13:59:05  kevin
Add Admin Modules

Revision 1.1  2005/03/29 13:28:26  mike
files moved from mForum

Revision 1.1  2005/03/09 13:49:09  mike
Moved to create MVC version

Revision 1.4  2005/02/24 13:57:28  mike
edits to use <cfsilent> instead of <cfsetting >

Revision 1.3  2005/02/10 13:32:14  mike
add type="text/javascript"

Revision 1.2  2005/02/09 10:41:31  mike
improve code layout

Revision 1.1  2005/02/04 19:56:49  mike
FB3 version made from wireframe with fusebuilder, with contents pasted from FB2 version, fbx_switch fully commented, and XFA usage improved throughout
--->
</cfsilent>
