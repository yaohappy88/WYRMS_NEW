USE [master]
GO
/****** Object:  Database [WYRMS]    Script Date: 10/18/2017 09:09:50 ******/
CREATE DATABASE [WYRMS] ON  PRIMARY 
( NAME = N'WYRMS', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\WYRMS.mdf' , SIZE = 2304KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'WYRMS_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL10_50.MSSQLSERVER\MSSQL\DATA\WYRMS_1.LDF' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [WYRMS] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WYRMS].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WYRMS] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [WYRMS] SET ANSI_NULLS OFF
GO
ALTER DATABASE [WYRMS] SET ANSI_PADDING OFF
GO
ALTER DATABASE [WYRMS] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [WYRMS] SET ARITHABORT OFF
GO
ALTER DATABASE [WYRMS] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [WYRMS] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [WYRMS] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [WYRMS] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [WYRMS] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [WYRMS] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [WYRMS] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [WYRMS] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [WYRMS] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [WYRMS] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [WYRMS] SET  DISABLE_BROKER
GO
ALTER DATABASE [WYRMS] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [WYRMS] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [WYRMS] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [WYRMS] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [WYRMS] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [WYRMS] SET READ_COMMITTED_SNAPSHOT ON
GO
ALTER DATABASE [WYRMS] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [WYRMS] SET  READ_WRITE
GO
ALTER DATABASE [WYRMS] SET RECOVERY FULL
GO
ALTER DATABASE [WYRMS] SET  MULTI_USER
GO
ALTER DATABASE [WYRMS] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [WYRMS] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'WYRMS', N'ON'
GO
USE [WYRMS]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/18/2017 09:09:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](20) NOT NULL,
	[Password] [nvarchar](32) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Phone] [nvarchar](50) NULL,
	[Address] [nvarchar](300) NULL,
	[UpdateDate] [datetime] NOT NULL,
	[TrueName] [nvarchar](20) NOT NULL,
	[Enabled] [bit] NOT NULL,
	[ImgUrl] [nvarchar](100) NULL,
 CONSTRAINT [PK_dbo.Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Email], [Phone], [Address], [UpdateDate], [TrueName], [Enabled], [ImgUrl]) VALUES (1, N'admin', N'e10adc3949ba59abbe56e057f20f883e', N'1226520745@qq.com', N'18181818181', N'广东广州市天河区科韵路XX街XX号XXX房X号', CAST(0x0000A7F800E0E8AE AS DateTime), N'管理员', 1, NULL)
INSERT [dbo].[Users] ([Id], [UserName], [Password], [Email], [Phone], [Address], [UpdateDate], [TrueName], [Enabled], [ImgUrl]) VALUES (2, N'xiaowu', N'e10adc3949ba59abbe56e057f20f883e', N'111211@1111.com', N'18181818181', N'广东广州市天河区科韵路XX街X广东广州市天河区科韵路XX街XX号XXX房X号', CAST(0x0000A80F01139315 AS DateTime), N'小吴', 1, NULL)
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Table [dbo].[UserGroupUsers]    Script Date: 10/18/2017 09:09:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroupUsers](
	[UserGroup_Id] [int] NOT NULL,
	[User_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.UserGroupUsers] PRIMARY KEY CLUSTERED 
(
	[UserGroup_Id] ASC,
	[User_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_User_Id] ON [dbo].[UserGroupUsers] 
(
	[User_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_UserGroup_Id] ON [dbo].[UserGroupUsers] 
(
	[UserGroup_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[UserGroupUsers] ([UserGroup_Id], [User_Id]) VALUES (1, 1)
INSERT [dbo].[UserGroupUsers] ([UserGroup_Id], [User_Id]) VALUES (2, 2)
/****** Object:  Table [dbo].[UserGroups]    Script Date: 10/18/2017 09:09:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[GroupName] [nvarchar](20) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[OrderSort] [int] NOT NULL,
	[Enabled] [bit] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.UserGroups] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[UserGroups] ON
INSERT [dbo].[UserGroups] ([Id], [GroupName], [Description], [OrderSort], [Enabled], [UpdateDate]) VALUES (1, N'开发组', N'开发人员组', 1, 1, CAST(0x0000A7F800E0E8D3 AS DateTime))
INSERT [dbo].[UserGroups] ([Id], [GroupName], [Description], [OrderSort], [Enabled], [UpdateDate]) VALUES (2, N'项目经理组', N'项目经理组', 2, 1, CAST(0x0000A7F800E0E8D3 AS DateTime))
SET IDENTITY_INSERT [dbo].[UserGroups] OFF
/****** Object:  Table [dbo].[UserGroupRoles]    Script Date: 10/18/2017 09:09:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroupRoles](
	[UserGroup_Id] [int] NOT NULL,
	[Role_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.UserGroupRoles] PRIMARY KEY CLUSTERED 
(
	[UserGroup_Id] ASC,
	[Role_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Role_Id] ON [dbo].[UserGroupRoles] 
(
	[Role_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_UserGroup_Id] ON [dbo].[UserGroupRoles] 
(
	[UserGroup_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[UserGroupRoles] ([UserGroup_Id], [Role_Id]) VALUES (1, 2)
INSERT [dbo].[UserGroupRoles] ([UserGroup_Id], [Role_Id]) VALUES (2, 2)
INSERT [dbo].[UserGroupRoles] ([UserGroup_Id], [Role_Id]) VALUES (2, 8)
INSERT [dbo].[UserGroupRoles] ([UserGroup_Id], [Role_Id]) VALUES (1, 11)
INSERT [dbo].[UserGroupRoles] ([UserGroup_Id], [Role_Id]) VALUES (2, 11)
INSERT [dbo].[UserGroupRoles] ([UserGroup_Id], [Role_Id]) VALUES (2, 12)
/****** Object:  Table [dbo].[RoleUsers]    Script Date: 10/18/2017 09:09:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RoleUsers](
	[Role_Id] [int] NOT NULL,
	[User_Id] [int] NOT NULL,
 CONSTRAINT [PK_dbo.RoleUsers] PRIMARY KEY CLUSTERED 
(
	[Role_Id] ASC,
	[User_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Role_Id] ON [dbo].[RoleUsers] 
(
	[Role_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_User_Id] ON [dbo].[RoleUsers] 
(
	[User_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[RoleUsers] ([Role_Id], [User_Id]) VALUES (1, 1)
INSERT [dbo].[RoleUsers] ([Role_Id], [User_Id]) VALUES (2, 1)
INSERT [dbo].[RoleUsers] ([Role_Id], [User_Id]) VALUES (9, 1)
INSERT [dbo].[RoleUsers] ([Role_Id], [User_Id]) VALUES (11, 1)
INSERT [dbo].[RoleUsers] ([Role_Id], [User_Id]) VALUES (12, 1)
INSERT [dbo].[RoleUsers] ([Role_Id], [User_Id]) VALUES (2, 2)
/****** Object:  Table [dbo].[Roles]    Script Date: 10/18/2017 09:09:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](20) NOT NULL,
	[Description] [nvarchar](100) NULL,
	[Enabled] [bit] NOT NULL,
	[OrderSort] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Roles] ON
INSERT [dbo].[Roles] ([Id], [RoleName], [Description], [Enabled], [OrderSort], [UpdateDate]) VALUES (1, N'superadmin', N'超级管理员', 1, 1, CAST(0x0000A7F800E0E66D AS DateTime))
INSERT [dbo].[Roles] ([Id], [RoleName], [Description], [Enabled], [OrderSort], [UpdateDate]) VALUES (2, N'管理员', N'系统管理员', 1, 1, CAST(0x0000A7F800E0E66D AS DateTime))
INSERT [dbo].[Roles] ([Id], [RoleName], [Description], [Enabled], [OrderSort], [UpdateDate]) VALUES (3, N'普通角色1', N'普通角色1', 1, 1, CAST(0x0000A7F800E0E66D AS DateTime))
INSERT [dbo].[Roles] ([Id], [RoleName], [Description], [Enabled], [OrderSort], [UpdateDate]) VALUES (4, N'普通角色2', N'普通角色2', 1, 1, CAST(0x0000A7F800E0E66D AS DateTime))
INSERT [dbo].[Roles] ([Id], [RoleName], [Description], [Enabled], [OrderSort], [UpdateDate]) VALUES (5, N'普通角色3', N'普通角色3', 1, 1, CAST(0x0000A7F800E0E66D AS DateTime))
INSERT [dbo].[Roles] ([Id], [RoleName], [Description], [Enabled], [OrderSort], [UpdateDate]) VALUES (6, N'普通角色4', N'普通角色4', 1, 1, CAST(0x0000A7F800E0E66D AS DateTime))
INSERT [dbo].[Roles] ([Id], [RoleName], [Description], [Enabled], [OrderSort], [UpdateDate]) VALUES (7, N'普通角色5', N'普通角色5', 1, 1, CAST(0x0000A7F800E0E66D AS DateTime))
INSERT [dbo].[Roles] ([Id], [RoleName], [Description], [Enabled], [OrderSort], [UpdateDate]) VALUES (8, N'普通角色6', N'普通角色6', 1, 1, CAST(0x0000A7F800E0E66D AS DateTime))
INSERT [dbo].[Roles] ([Id], [RoleName], [Description], [Enabled], [OrderSort], [UpdateDate]) VALUES (9, N'普通角色7', N'普通角色7', 1, 1, CAST(0x0000A7F800E0E66D AS DateTime))
INSERT [dbo].[Roles] ([Id], [RoleName], [Description], [Enabled], [OrderSort], [UpdateDate]) VALUES (10, N'普通角色8', N'普通角色8', 1, 1, CAST(0x0000A7F800E0E66D AS DateTime))
INSERT [dbo].[Roles] ([Id], [RoleName], [Description], [Enabled], [OrderSort], [UpdateDate]) VALUES (11, N'普通角色9', N'普通角色9', 1, 1, CAST(0x0000A7F800E0E66D AS DateTime))
INSERT [dbo].[Roles] ([Id], [RoleName], [Description], [Enabled], [OrderSort], [UpdateDate]) VALUES (12, N'普通角色10', N'普通角色10', 1, 1, CAST(0x0000A7F800E0E66D AS DateTime))
INSERT [dbo].[Roles] ([Id], [RoleName], [Description], [Enabled], [OrderSort], [UpdateDate]) VALUES (13, N'普通角色12', N'阿萨德发', 1, 9999, CAST(0x0000A80B00C02A90 AS DateTime))
SET IDENTITY_INSERT [dbo].[Roles] OFF
/****** Object:  Table [dbo].[Permissions]    Script Date: 10/18/2017 09:09:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Permissions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](20) NOT NULL,
	[Code] [nvarchar](max) NULL,
	[Description] [nvarchar](100) NULL,
	[Enabled] [bit] NOT NULL,
	[ModuleId] [int] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
 CONSTRAINT [PK_dbo.Permissions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_ModuleId] ON [dbo].[Permissions] 
(
	[ModuleId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Permissions] ON
INSERT [dbo].[Permissions] ([Id], [Name], [Code], [Description], [Enabled], [ModuleId], [UpdateDate]) VALUES (1, N'查询', N'QueryRole', N'描述', 1, 2, CAST(0x0000A7F800E0E664 AS DateTime))
INSERT [dbo].[Permissions] ([Id], [Name], [Code], [Description], [Enabled], [ModuleId], [UpdateDate]) VALUES (2, N'新增', N'AddRole', N'描述', 1, 2, CAST(0x0000A7F800E0E664 AS DateTime))
INSERT [dbo].[Permissions] ([Id], [Name], [Code], [Description], [Enabled], [ModuleId], [UpdateDate]) VALUES (3, N'修改', N'UpdateRole', N'描述', 1, 2, CAST(0x0000A7F800E0E664 AS DateTime))
INSERT [dbo].[Permissions] ([Id], [Name], [Code], [Description], [Enabled], [ModuleId], [UpdateDate]) VALUES (4, N'删除', N'DeleteRole', N'描述', 1, 2, CAST(0x0000A7F800E0E664 AS DateTime))
INSERT [dbo].[Permissions] ([Id], [Name], [Code], [Description], [Enabled], [ModuleId], [UpdateDate]) VALUES (5, N'授权', N'AuthorizeRole', N'描述', 1, 2, CAST(0x0000A7F800E0E664 AS DateTime))
INSERT [dbo].[Permissions] ([Id], [Name], [Code], [Description], [Enabled], [ModuleId], [UpdateDate]) VALUES (6, N'查询', N'QueryUser', N'描述', 1, 3, CAST(0x0000A7F800E0E664 AS DateTime))
INSERT [dbo].[Permissions] ([Id], [Name], [Code], [Description], [Enabled], [ModuleId], [UpdateDate]) VALUES (7, N'新增', N'AddUser', N'描述', 1, 3, CAST(0x0000A7F800E0E664 AS DateTime))
INSERT [dbo].[Permissions] ([Id], [Name], [Code], [Description], [Enabled], [ModuleId], [UpdateDate]) VALUES (8, N'修改', N'UpdateUser', N'描述', 1, 3, CAST(0x0000A7F800E0E664 AS DateTime))
INSERT [dbo].[Permissions] ([Id], [Name], [Code], [Description], [Enabled], [ModuleId], [UpdateDate]) VALUES (9, N'删除', N'DeleteUser', N'描述', 1, 3, CAST(0x0000A7F800E0E664 AS DateTime))
INSERT [dbo].[Permissions] ([Id], [Name], [Code], [Description], [Enabled], [ModuleId], [UpdateDate]) VALUES (10, N'重置密码', N'ResetPwdUser', N'描述', 1, 3, CAST(0x0000A7F800E0E664 AS DateTime))
INSERT [dbo].[Permissions] ([Id], [Name], [Code], [Description], [Enabled], [ModuleId], [UpdateDate]) VALUES (11, N'设置用户组', N'SetGroupUser', N'描述', 1, 3, CAST(0x0000A7F800E0E664 AS DateTime))
INSERT [dbo].[Permissions] ([Id], [Name], [Code], [Description], [Enabled], [ModuleId], [UpdateDate]) VALUES (12, N'设置角色', N'SetRolesUser', N'描述', 1, 3, CAST(0x0000A7F800E0E664 AS DateTime))
INSERT [dbo].[Permissions] ([Id], [Name], [Code], [Description], [Enabled], [ModuleId], [UpdateDate]) VALUES (13, N'查询', N'QueryModule', N'描述', 1, 4, CAST(0x0000A7F800E0E664 AS DateTime))
INSERT [dbo].[Permissions] ([Id], [Name], [Code], [Description], [Enabled], [ModuleId], [UpdateDate]) VALUES (14, N'新增', N'AddModule', N'描述', 1, 4, CAST(0x0000A7F800E0E664 AS DateTime))
INSERT [dbo].[Permissions] ([Id], [Name], [Code], [Description], [Enabled], [ModuleId], [UpdateDate]) VALUES (15, N'修改', N'UpdateModule', N'描述', 1, 4, CAST(0x0000A7F800E0E664 AS DateTime))
INSERT [dbo].[Permissions] ([Id], [Name], [Code], [Description], [Enabled], [ModuleId], [UpdateDate]) VALUES (16, N'查询', N'QueryPermission', N'描述', 1, 5, CAST(0x0000A7F800E0E664 AS DateTime))
INSERT [dbo].[Permissions] ([Id], [Name], [Code], [Description], [Enabled], [ModuleId], [UpdateDate]) VALUES (17, N'新增', N'AddPermission', N'描述', 1, 5, CAST(0x0000A7F800E0E664 AS DateTime))
INSERT [dbo].[Permissions] ([Id], [Name], [Code], [Description], [Enabled], [ModuleId], [UpdateDate]) VALUES (18, N'修改', N'UpdatePermission', N'描述', 1, 5, CAST(0x0000A7F800E0E664 AS DateTime))
INSERT [dbo].[Permissions] ([Id], [Name], [Code], [Description], [Enabled], [ModuleId], [UpdateDate]) VALUES (19, N'查询', N'QuerySystemLog', N'描述', 1, 7, CAST(0x0000A7F800E0E664 AS DateTime))
INSERT [dbo].[Permissions] ([Id], [Name], [Code], [Description], [Enabled], [ModuleId], [UpdateDate]) VALUES (20, N'查询', N'QueryUserGroup', N'描述', 1, 8, CAST(0x0000A7F800E0E664 AS DateTime))
INSERT [dbo].[Permissions] ([Id], [Name], [Code], [Description], [Enabled], [ModuleId], [UpdateDate]) VALUES (21, N'新增', N'AddUserGroup', N'描述', 1, 8, CAST(0x0000A7F800E0E664 AS DateTime))
INSERT [dbo].[Permissions] ([Id], [Name], [Code], [Description], [Enabled], [ModuleId], [UpdateDate]) VALUES (22, N'修改', N'UpdateUserGroup', N'描述', 1, 8, CAST(0x0000A7F800E0E664 AS DateTime))
INSERT [dbo].[Permissions] ([Id], [Name], [Code], [Description], [Enabled], [ModuleId], [UpdateDate]) VALUES (23, N'删除', N'DeleteUserGroup', N'描述', 1, 8, CAST(0x0000A7F800E0E664 AS DateTime))
INSERT [dbo].[Permissions] ([Id], [Name], [Code], [Description], [Enabled], [ModuleId], [UpdateDate]) VALUES (24, N'设置角色', N'SetRolesUserGroup', N'描述', 1, 8, CAST(0x0000A7F800E0E664 AS DateTime))
SET IDENTITY_INSERT [dbo].[Permissions] OFF
/****** Object:  Table [dbo].[PermissionRoles]    Script Date: 10/18/2017 09:09:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PermissionRoles](
	[Permission_Id] [int] NOT NULL,
	[Role_Id] [int] NOT NULL,
 CONSTRAINT [PK_PermissionRoles] PRIMARY KEY NONCLUSTERED 
(
	[Permission_Id] ASC,
	[Role_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Permission_Id] ON [dbo].[PermissionRoles] 
(
	[Permission_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IX_Role_Id] ON [dbo].[PermissionRoles] 
(
	[Role_Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (1, 1)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (1, 2)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (1, 3)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (2, 1)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (2, 2)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (2, 3)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (3, 1)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (3, 2)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (3, 3)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (4, 1)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (4, 2)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (4, 3)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (5, 1)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (5, 2)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (5, 3)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (6, 1)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (6, 2)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (6, 3)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (7, 1)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (7, 2)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (7, 3)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (8, 1)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (8, 2)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (8, 3)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (9, 1)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (9, 2)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (9, 3)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (10, 1)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (10, 2)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (10, 3)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (11, 1)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (11, 2)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (11, 3)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (12, 1)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (12, 2)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (12, 3)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (13, 1)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (13, 2)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (13, 3)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (14, 1)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (14, 2)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (14, 3)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (15, 1)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (15, 2)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (15, 3)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (16, 1)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (16, 2)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (16, 3)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (16, 4)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (17, 1)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (17, 2)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (17, 3)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (17, 4)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (18, 1)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (18, 2)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (18, 3)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (18, 4)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (19, 1)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (19, 3)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (20, 1)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (20, 2)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (20, 3)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (21, 1)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (21, 2)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (21, 3)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (22, 1)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (22, 2)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (22, 3)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (23, 1)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (23, 2)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (23, 3)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (24, 1)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (24, 2)
INSERT [dbo].[PermissionRoles] ([Permission_Id], [Role_Id]) VALUES (24, 3)
/****** Object:  Table [dbo].[Modules]    Script Date: 10/18/2017 09:09:51 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Modules](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ParentId] [int] NULL,
	[Name] [nvarchar](20) NOT NULL,
	[LinkUrl] [nvarchar](50) NOT NULL,
	[IsMenu] [bit] NOT NULL,
	[Code] [int] NOT NULL,
	[Description] [nvarchar](100) NULL,
	[Enabled] [bit] NOT NULL,
	[UpdateDate] [datetime] NOT NULL,
	[Icon] [varchar](50) NULL,
 CONSTRAINT [PK_dbo.Modules] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [IX_ParentId] ON [dbo].[Modules] 
(
	[ParentId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Modules] ON
INSERT [dbo].[Modules] ([Id], [ParentId], [Name], [LinkUrl], [IsMenu], [Code], [Description], [Enabled], [UpdateDate], [Icon]) VALUES (1, NULL, N'授权管理', N'#', 1, 200, NULL, 1, CAST(0x0000A80F01288CB7 AS DateTime), N' fa-tasks')
INSERT [dbo].[Modules] ([Id], [ParentId], [Name], [LinkUrl], [IsMenu], [Code], [Description], [Enabled], [UpdateDate], [Icon]) VALUES (2, 1, N'角色管理', N'~/Member/Role/Index', 1, 201, NULL, 1, CAST(0x0000A80F0128F93F AS DateTime), N' fa-slack')
INSERT [dbo].[Modules] ([Id], [ParentId], [Name], [LinkUrl], [IsMenu], [Code], [Description], [Enabled], [UpdateDate], [Icon]) VALUES (3, 1, N'用户管理', N'~/Member/User/Index', 1, 202, NULL, 1, CAST(0x0000A80F0128AC9D AS DateTime), N' fa-user')
INSERT [dbo].[Modules] ([Id], [ParentId], [Name], [LinkUrl], [IsMenu], [Code], [Description], [Enabled], [UpdateDate], [Icon]) VALUES (4, 1, N'模块管理', N'~/Member/Module/Index', 1, 204, N'aaa', 1, CAST(0x0000A80F01291143 AS DateTime), N'fa-cubes')
INSERT [dbo].[Modules] ([Id], [ParentId], [Name], [LinkUrl], [IsMenu], [Code], [Description], [Enabled], [UpdateDate], [Icon]) VALUES (5, 1, N'权限管理', N'~/Member/Permission/Index', 1, 205, NULL, 1, CAST(0x0000A80F0129573F AS DateTime), N' fa-unlock-alt')
INSERT [dbo].[Modules] ([Id], [ParentId], [Name], [LinkUrl], [IsMenu], [Code], [Description], [Enabled], [UpdateDate], [Icon]) VALUES (6, NULL, N'系统应用', N'#', 1, 300, NULL, 1, CAST(0x0000A80F01296F31 AS DateTime), N' fa-windows')
INSERT [dbo].[Modules] ([Id], [ParentId], [Name], [LinkUrl], [IsMenu], [Code], [Description], [Enabled], [UpdateDate], [Icon]) VALUES (7, 6, N'操作日志管理', N'#', 1, 301, NULL, 1, CAST(0x0000A80F0129D4E3 AS DateTime), N' fa-file-text')
INSERT [dbo].[Modules] ([Id], [ParentId], [Name], [LinkUrl], [IsMenu], [Code], [Description], [Enabled], [UpdateDate], [Icon]) VALUES (8, 1, N'用户组管理', N'~/Member/UserGroup/Index', 1, 203, NULL, 1, CAST(0x0000A80F0128BBE1 AS DateTime), N' fa-users')
SET IDENTITY_INSERT [dbo].[Modules] OFF
/****** Object:  Default [DF__Users__TrueName__108B795B]    Script Date: 10/18/2017 09:09:51 ******/
ALTER TABLE [dbo].[Users] ADD  DEFAULT ('') FOR [TrueName]
GO
/****** Object:  Default [DF__Users__Enabled__117F9D94]    Script Date: 10/18/2017 09:09:51 ******/
ALTER TABLE [dbo].[Users] ADD  DEFAULT ((0)) FOR [Enabled]
GO
/****** Object:  ForeignKey [FK_dbo.Modules_dbo.Modules_ParentId]    Script Date: 10/18/2017 09:09:51 ******/
ALTER TABLE [dbo].[Modules]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Modules_dbo.Modules_ParentId] FOREIGN KEY([ParentId])
REFERENCES [dbo].[Modules] ([Id])
GO
ALTER TABLE [dbo].[Modules] CHECK CONSTRAINT [FK_dbo.Modules_dbo.Modules_ParentId]
GO
