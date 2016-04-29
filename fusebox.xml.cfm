<?xml version="1.0" encoding="UTF-8"?>
<fusebox>	
	<circuits>
		<circuit alias="root" path="" parent=""/>
		
		<!-- Login & Registration
		<circuit alias="Login" path="controller/Login/" parent="root"/>
		<circuit alias="mLogin" path="model/mLogin/" parent="root"/>
		<circuit alias="vLogin" path="view/vLogin/" parent="CRLogin"/> -->

		<!-- Forums -->
		<circuit alias="Forum" path="controller/Forum/" parent="root"/>
		<circuit alias="mForum" path="model/mForum/" parent="root"/>
		<circuit alias="vForum" path="view/vForum/" parent="root"/>
		
		<!-- Admin -->
		<circuit alias="ForumAdmin" path="controller/ForumAdmin/" parent="root"/>
		<circuit alias="mForumAdmin" path="model/mForumAdmin/" parent="root"/>
		<circuit alias="vForumAdmin" path="view/vForumAdmin/" parent="root"/>

		<!-- Layout -->
		<circuit alias="vLayout" path="view/vLayout/" parent="root"/>
	</circuits>
	
	<parameters>
		<parameter name="fuseactionVariable" value="fuseaction" />
		<parameter name="defaultFuseaction" value="Forum.Forum_Home" />
		<parameter name="precedenceFormOrUrl" value="form"/>
		<parameter name="reparse" value="true" />
		<parameter name="execute" value="true" />
		<parameter name="mode" value="development-full-load"/>
		<parameter name="parseWithComments" value="true" />
		<parameter name="password" value="password"/>
		<parameter name="scriptLanguage" value="cfmx" />
		<parameter name="scriptFileDelimiter" value="cfm"/>
		<parameter name="maskedFileDelimiters" value="htm,cfm,cfml,php,php4,asp,aspx"/>
	</parameters>
	
	<globalfuseactions>
		<preprocess>
		</preprocess>
		<postprocess>	
		</postprocess>
	</globalfuseactions>
	
	<plugins>
		<phase name="preProcess">
		</phase>
		<phase name="preFuseaction">
		</phase>
		<phase name="postFuseaction">	
		</phase>
		<phase name="fuseactionException">
		</phase>		
		<phase name="postProcess">
		</phase>
		<phase name="processError">
		</phase>
	</plugins>

</fusebox>
<!-- 
$Log: fusebox.xml.cfm,v $
Revision 1.3  2007/06/15 14:00:02  kevin
Add Admin Modules

Revision 1.2  2007/06/14 14:01:59  kevin
Initial Open Source Version

 -->
