
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Site](
	[SiteId] [int] IDENTITY(1,1) NOT NULL,
	[SiteName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[SiteURL] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[RootDirectoy] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[ImagePath] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[AttachmentPath] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[StyleSheetPath] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[DownloadPath] [varchar](255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[CFAppName] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	
 CONSTRAINT [PK_tblSite] PRIMARY KEY CLUSTERED 
(
	[SiteId] ASC
) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[messages]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[messages](
	[messageid] [int] IDENTITY(1,1) NOT NULL,
	[message] [text] NULL,
	[messagedate] [datetime] NOT NULL,
	[threadid] [int] NOT NULL,
	[userid] [int] NOT NULL,
	[editmessage] [varchar](100) NULL,
	[moderatormessage] [varchar](100) NULL,
	[attachment] [varchar](50) NULL,
	[filesize] [int] NULL,
	[approved] [bit] NULL,
	[timeoflastchange] [binary](8) NULL,
	[archived] [bit] NULL,
 CONSTRAINT [PK_messages] PRIMARY KEY CLUSTERED 
(
	[messageid] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[threads]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[threads](
	[threadid] [int] IDENTITY(1,1) NOT NULL,
	[threadname] [varchar](50) NOT NULL,
	[datecreated] [datetime] NOT NULL,
	[userid] [int] NOT NULL,
	[categoryid] [int] NOT NULL,
	[messagecount] [int] NOT NULL,
	[datelastpost] [datetime] NOT NULL,
	[approved] [bit] NULL,
	[locked] [bit] NULL,
	[archived] [bit] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[today]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[today](
	[postid] [int] NOT NULL,
	[posttitle] [varchar](50) NOT NULL,
	[post] [text] NULL,
	[postdate] [datetime] NOT NULL,
	[dateexpires] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[banning]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[banning](
	[banid] [int] NOT NULL,
	[bantype] [varchar](10) NOT NULL,
	[banstring] [varchar](100) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[SiteCategories]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[SiteCategories](
	[SiteCategoriesId] [int] IDENTITY(1,1) NOT NULL,
	[SiteId] [int] NOT NULL,
	[CategoryId] [int] NOT NULL,
	[Sequence] [smallint] NOT NULL,
 CONSTRAINT [PK_SiteCategories] PRIMARY KEY CLUSTERED 
(
	[SiteCategoriesId] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[forum_subscriptions]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[forum_subscriptions](
	[fs_id] [int] IDENTITY(1,1) NOT NULL,
	[fs_name_id] [int] NOT NULL,
	[fs_forum_id] [int] NOT NULL,
 CONSTRAINT [PK_forum_subscriptions] PRIMARY KEY CLUSTERED 
(
	[fs_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[forum_preferences]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[forum_preferences](
	[nafp_id] [int] IDENTITY(1,1) NOT NULL,
	[userid] [int] NULL,
	[signature] [varchar](150) NULL,
	[threadorder] [varchar](4) NULL CONSTRAINT [DF__forum_pre__name___607251E5]  DEFAULT ('ASC'),
	[messageorder] [varchar](4) NOT NULL CONSTRAINT [DF__forum_pre__name___6166761E]  DEFAULT ('ASC'),
	[active] [bit] NULL CONSTRAINT [DF__forum_pre__name___625A9A57]  DEFAULT (1),
	[numberofthreads] [int] NULL CONSTRAINT [DF__forum_pre__name___634EBE90]  DEFAULT (10),
	[numberofmessages] [int] NOT NULL CONSTRAINT [DF__forum_pre__name___6442E2C9]  DEFAULT (10),
	[datelastvisited] [datetime] NULL,
	[showemail] [bit] NULL CONSTRAINT [DF__forum_pre__name___65370702]  DEFAULT (0),
	[defaultfuseaction] [varchar](50) NULL CONSTRAINT [DF__forum_pre__name___662B2B3B]  DEFAULT ('for.today'),
	[privatemessages] [bit] NULL CONSTRAINT [DF__forum_pre__name___671F4F74]  DEFAULT (0),
	[showprofile] [bit] NULL CONSTRAINT [DF__forum_pre__name___681373AD]  DEFAULT (0),
	[emailsubs] [bit] NULL CONSTRAINT [DF__forum_pre__name___690797E6]  DEFAULT (0),
	[profile] [varchar](200) NULL,
 CONSTRAINT [PK__forum_preference__5F7E2DAC] PRIMARY KEY CLUSTERED 
(
	[nafp_id] ASC
) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM dbo.sysindexes WHERE id = OBJECT_ID(N'[dbo].[forum_preferences]') AND name = N'IX_name_id')
CREATE NONCLUSTERED INDEX [IX_name_id] ON [dbo].[forum_preferences] 
(
	[userid] ASC
) ON [PRIMARY]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[arch_messages]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[arch_messages](
	[messageid] [int] NOT NULL,
	[message] [text] NULL,
	[messagedate] [datetime] NOT NULL,
	[threadid] [int] NOT NULL,
	[editmessage] [varchar](100) NULL,
	[attachment] [varchar](50) NULL,
	[filesize] [int] NULL,
	[moderatormessage] [varchar](100) NULL,
	[timeoflastchange] [binary](8) NULL,
	[username] [varchar](100) NULL,
	[email] [varchar](50) NULL,
 CONSTRAINT [PK_arch_messages] PRIMARY KEY CLUSTERED 
(
	[messageid] ASC
)WITH FILLFACTOR = 90 ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[arch_threads]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[arch_threads](
	[threadid] [int] NOT NULL,
	[threadname] [varchar](50) NOT NULL,
	[datecreated] [datetime] NOT NULL,
	[messagecount] [int] NOT NULL,
	[datelastpost] [datetime] NOT NULL,
	[username] [varchar](100) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[forumUser]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[forumUser](
	[userid] [int] NOT NULL,
	[username] [nvarchar](100) NOT NULL,
	[password] [nvarchar](50) NOT NULL,
	[emailaddress] [nvarchar](50) NOT NULL,
	[city] [nvarchar](50) NULL,
	[datecreated] [datetime] NULL,
	[active] [bit] NULL,
	[firstname] [nvarchar](50) NULL,
	[lastname] [nvarchar](50) NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[arch_privatemessages]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[arch_privatemessages](
	[messageid] [int] NOT NULL,
	[userid] [int] NOT NULL,
	[message] [text] NULL,
	[senderid] [int] NOT NULL,
	[messagedate] [datetime] NOT NULL,
	[arch_date] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[categories]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[categories](
	[categoryid] [int] NOT NULL,
	[categoryname] [varchar](50) NOT NULL,
	[description] [varchar](100) NULL,
	[status] [varchar](50) NULL,
	[allowattachments] [bit] NULL,
	[messagelimit] [int] NULL,
	[approval] [bit] NULL,
	[readonly] [bit] NULL,
	[categoryowner] [int] NULL,
	[visibleto] [varchar](15) NULL,
	[archivedays] [int] NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[subscriptions]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[subscriptions](
	[recordid] [int] NOT NULL,
	[userid] [int] NOT NULL,
	[threadid] [int] NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[userlevels]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[userlevels](
	[userlevelid] [int] NOT NULL,
	[userlevel] [varchar](50) NOT NULL
) ON [PRIMARY]
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[vulgarity]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[vulgarity](
	[vulgarityid] [int] NOT NULL,
	[vulgarity] [varchar](30) NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[categories_mod]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[categories_mod](
	[categoryid] [int] NOT NULL,
	[userid] [int] NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[categories_per]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[categories_per](
	[categoryid] [int] NOT NULL,
	[userid] [int] NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[friends]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[friends](
	[recordid] [int] NOT NULL,
	[userid] [int] NOT NULL,
	[friendid] [int] NOT NULL
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[privatemessages]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[privatemessages](
	[messageid] [int] NOT NULL,
	[userid] [int] NOT NULL,
	[message] [text] NULL,
	[senderid] [int] NOT NULL,
	[messagedate] [datetime] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[settings]') AND OBJECTPROPERTY(id, N'IsUserTable') = 1)
BEGIN
CREATE TABLE [dbo].[settings](
	[settingid] [int] NOT NULL,
	[dateinstalled] [datetime] NOT NULL,
	[adminemail] [varchar](150) NULL,
	[forumsname] [varchar](50) NOT NULL,
	[forumspath] [varchar](150) NOT NULL,
	[forumsurl] [varchar](150) NOT NULL,
	[emailmessage] [text] NULL,
	[moderatoremail] [varchar](150) NULL,
	[companyurl] [varchar](150) NULL,
	[censorship] [bit] NULL,
	[querycaching] [bit] NULL,
	[cachingduration] [int] NULL,
	[archive] [bit] NULL,
	[archivetimespan] [int] NULL,
	[backgroundcolor1] [char](6) NOT NULL,
	[backgroundimage1] [varchar](50) NULL,
	[textcolor1] [char](6) NOT NULL,
	[hyperlinkcolor1] [char](6) NOT NULL,
	[backgroundcolor2] [char](6) NOT NULL,
	[backgroundimage2] [varchar](50) NULL,
	[textcolor2] [char](6) NOT NULL,
	[hyperlinkcolor2] [char](6) NOT NULL,
	[attachmentpath] [varchar](50) NULL,
	[attachmentname] [varchar](50) NULL,
	[attachmentmaxsize] [int] NULL,
	[topiclistnumber] [int] NOT NULL,
	[messagelistnumber] [int] NOT NULL,
	[messageorder] [varchar](4) NOT NULL,
	[threadorder] [varchar](4) NOT NULL,
	[smtpserver] [varchar](50) NOT NULL,
	[privatemessages] [bit] NULL,
	[mailfooter] [varchar](50) NULL,
	[logourl] [varchar](150) NULL,
	[archivetimeofday] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Forum_Moderators]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'

CREATE       PROCEDURE [dbo].[Forum_Moderators] @CategoryID int
AS



SELECT 	 DISTINCT name.name_id, name.name_first_name, name.name_surname, name.name_login_name
FROM 	ActivityForum.dbo.name as name, permissions, sections, permission_sections, group_permissions, group_members
WHERE 	permissions.name = ''Moderate''
	and sections.name = ''Forums''
	and permissions.permission_id = permission_sections.permission_id
	and sections.section_id = permission_sections.section_id
	and group_permissions.permission_section_id = permission_sections.permission_section_id
	and name.name_id = group_members.user_id
	and name.name_id NOT IN ( SELECT users.userid
				  FROM categories INNER JOIN
			    	  categories_mod ON 
			    	  categories.categoryid = categories_mod.categoryid INNER JOIN
			    	  users ON 
				  categories_mod.userid = users.userid
				  WHERE categories.categoryid = @categoryID)

	order by name.name_surname, name.name_first_name

SELECT 	 users.userid, users.username
FROM 	  categories INNER JOIN
    	  categories_mod ON 
    	  categories.categoryid = categories_mod.categoryid INNER JOIN
    	users users ON 
	categories_mod.userid = Users.userid
WHERE 	  categories.categoryid = @CategoryID
ORDER BY  users.username

' 
END
GO


SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[users1]') AND OBJECTPROPERTY(id, N'IsView') = 1)
EXEC dbo.sp_executesql @statement = N'CREATE VIEW [dbo].[users1]
	AS
	SELECT
			forumUser.userid AS userid,
			forumUser.username AS username,
			forumUser.password AS password,
			forumUser.firstname AS firstname,
			forumUser.lastname AS lastname,
			forumUser.emailaddress AS emailaddress,
			forumUser.city AS city,
			forumUser.datecreated AS datecreated,
			forum_preferences.signature AS signature,
			forum_preferences.threadorder AS threadorder,
			forum_preferences.messageorder AS messageorder, 
			forum_preferences.active AS active,
			forum_preferences.numberofthreads AS numberofthreads,
			forum_preferences.numberofmessages AS numberofmessages,
			forum_preferences.datelastvisited AS datelastvisited,
			forum_preferences.showemail AS showemail,
			forum_preferences.defaultfuseaction AS defaultfuseaction,
			forum_preferences.privatemessages AS privatemessages,
			forum_preferences.showprofile AS showprofile,
			forum_preferences.emailsubs AS emailsubs,
			forum_preferences.profile AS profile
	FROM	forumUser
	LEFT OUTER JOIN forum_preferences ON forumUser.userid = forum_preferences.userid' 
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[Archive_Messages]') AND OBJECTPROPERTY(id,N'IsProcedure') = 1)
BEGIN
EXEC dbo.sp_executesql @statement = N'
CREATE          PROCEDURE [dbo].[Archive_Messages]

AS

DECLARE @ArchiveDate datetime
SET @ArchiveDate = DateAdd(day, -10, GetDate()) 

INSERT INTO arch_messages
SELECT messageid, message, messagedate, threadid, editmessage,  attachment, filesize, moderatormessage, timeoflastchange
FROM messages
WHERE MessageDate < @ArchiveDate

INSERT INTO arch_threads
SELECT threadid, threadname, datecreated, messagecount, datelastpost
FROM threads
WHERE datecreated < @ArchiveDate

DELETE 
FROM messages
WHERE MessageDate < @ArchiveDate

DELETE
FROM threads
WHERE datecreated < @ArchiveDate


' 
END
