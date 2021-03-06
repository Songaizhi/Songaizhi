USE [master]
GO
/****** Object:  Database [TES]    Script Date: 07/01/2016 08:41:32 ******/
CREATE DATABASE [TES] ON  PRIMARY 
( NAME = N'TES', FILENAME = N'F:\140016646黄杰\ZDSoft.TES\Batabase\TES.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TES_log', FILENAME = N'F:\140016646黄杰\ZDSoft.TES\Batabase\TES_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TES] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TES].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TES] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [TES] SET ANSI_NULLS OFF
GO
ALTER DATABASE [TES] SET ANSI_PADDING OFF
GO
ALTER DATABASE [TES] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [TES] SET ARITHABORT OFF
GO
ALTER DATABASE [TES] SET AUTO_CLOSE ON
GO
ALTER DATABASE [TES] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [TES] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [TES] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [TES] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [TES] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [TES] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [TES] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [TES] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [TES] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [TES] SET  DISABLE_BROKER
GO
ALTER DATABASE [TES] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [TES] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [TES] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [TES] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [TES] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [TES] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [TES] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [TES] SET  READ_WRITE
GO
ALTER DATABASE [TES] SET RECOVERY SIMPLE
GO
ALTER DATABASE [TES] SET  MULTI_USER
GO
ALTER DATABASE [TES] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [TES] SET DB_CHAINING OFF
GO
USE [TES]
GO
/****** Object:  User [sha]    Script Date: 07/01/2016 08:41:33 ******/
CREATE USER [sha] FOR LOGIN [sha] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Table [dbo].[Function]    Script Date: 07/01/2016 08:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Function](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[SystemFunctionName] [nvarchar](50) NOT NULL,
	[ClassName] [nvarchar](200) NULL,
	[ControllerName] [nvarchar](50) NULL,
	[ActionName] [nvarchar](50) NULL,
	[ParentID] [int] NULL,
 CONSTRAINT [PK_Function] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Function] ON
INSERT [dbo].[Function] ([ID], [SystemFunctionName], [ClassName], [ControllerName], [ActionName], [ParentID]) VALUES (1, N'其他', N'', NULL, NULL, NULL)
INSERT [dbo].[Function] ([ID], [SystemFunctionName], [ClassName], [ControllerName], [ActionName], [ParentID]) VALUES (2, N'修改密码', N'ZDSoft.TES.Web.Controllers.UsersController', N'Users', N'ChangePassword', 1)
INSERT [dbo].[Function] ([ID], [SystemFunctionName], [ClassName], [ControllerName], [ActionName], [ParentID]) VALUES (3, N'学生评教', N'ZDSoft.TES.Web.Controllers.StudentController', N'Student', N'Index', 1)
INSERT [dbo].[Function] ([ID], [SystemFunctionName], [ClassName], [ControllerName], [ActionName], [ParentID]) VALUES (4, N'查看评价结果', N'ZDSoft.TES.Web.Controllers.SelectController', N'Select', N'Index', 1)
INSERT [dbo].[Function] ([ID], [SystemFunctionName], [ClassName], [ControllerName], [ActionName], [ParentID]) VALUES (5, N'用户管理', N'ZDSoft.TES.Web.Controllers.UsersController', N'Users', N'Yonghu', 6)
INSERT [dbo].[Function] ([ID], [SystemFunctionName], [ClassName], [ControllerName], [ActionName], [ParentID]) VALUES (6, N'综合管理', NULL, NULL, NULL, NULL)
INSERT [dbo].[Function] ([ID], [SystemFunctionName], [ClassName], [ControllerName], [ActionName], [ParentID]) VALUES (7, N'学生管理', N'ZDSoft.TES.Web.Controllers.StudentController', N'Student', N'Management', 6)
INSERT [dbo].[Function] ([ID], [SystemFunctionName], [ClassName], [ControllerName], [ActionName], [ParentID]) VALUES (8, N'教师管理', NULL, N'Teacher', N'Management', 6)
INSERT [dbo].[Function] ([ID], [SystemFunctionName], [ClassName], [ControllerName], [ActionName], [ParentID]) VALUES (9, N'班级管理', NULL, N'Class', N'Management', 6)
INSERT [dbo].[Function] ([ID], [SystemFunctionName], [ClassName], [ControllerName], [ActionName], [ParentID]) VALUES (11, N'指标管理', N'ZDSoft.TES.Web.Controllers.AdminController', N'Admin', N'ZhiBiaoIndex', NULL)
INSERT [dbo].[Function] ([ID], [SystemFunctionName], [ClassName], [ControllerName], [ActionName], [ParentID]) VALUES (12, N'问卷管理', NULL, N'QManagement', N'Index', 6)
INSERT [dbo].[Function] ([ID], [SystemFunctionName], [ClassName], [ControllerName], [ActionName], [ParentID]) VALUES (13, N'指标管理', NULL, N'Admin', N'ZhiBiaoIndex', 11)
SET IDENTITY_INSERT [dbo].[Function] OFF
/****** Object:  Table [dbo].[Curriculum]    Script Date: 07/01/2016 08:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curriculum](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Curriculum] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Curriculum] ON
INSERT [dbo].[Curriculum] ([ID], [Name]) VALUES (1, N'MVC')
INSERT [dbo].[Curriculum] ([ID], [Name]) VALUES (2, N'C#')
INSERT [dbo].[Curriculum] ([ID], [Name]) VALUES (3, N'PS')
INSERT [dbo].[Curriculum] ([ID], [Name]) VALUES (4, N'软件工程')
INSERT [dbo].[Curriculum] ([ID], [Name]) VALUES (5, N'数据库')
SET IDENTITY_INSERT [dbo].[Curriculum] OFF
/****** Object:  Table [dbo].[College]    Script Date: 07/01/2016 08:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[College](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_College] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[College] ON
INSERT [dbo].[College] ([ID], [Name]) VALUES (1, N'软件学院')
INSERT [dbo].[College] ([ID], [Name]) VALUES (2, N'管理学院')
INSERT [dbo].[College] ([ID], [Name]) VALUES (3, N'传媒学院')
INSERT [dbo].[College] ([ID], [Name]) VALUES (4, N'电子信息学院')
SET IDENTITY_INSERT [dbo].[College] OFF
/****** Object:  Table [dbo].[Role]    Script Date: 07/01/2016 08:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Role] ON
INSERT [dbo].[Role] ([ID], [Name]) VALUES (1, N'学生')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (2, N'教师')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (3, N'系主任/领导')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (4, N'教研室主任')
INSERT [dbo].[Role] ([ID], [Name]) VALUES (5, N'管理员')
SET IDENTITY_INSERT [dbo].[Role] OFF
/****** Object:  Table [dbo].[ResultSelects]    Script Date: 07/01/2016 08:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResultSelects](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](1000) NOT NULL,
	[Number] [nvarchar](50) NOT NULL,
	[Proportion] [decimal](18, 0) NOT NULL,
	[CreateUserID] [int] NOT NULL,
 CONSTRAINT [PK_Selectss] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ResultSelects] ON
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (1, N'语言精练，深入浅出，讲解准确', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (2, N'能把握重点、难点，但讲解不够明确', N'B', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (3, N'平淡叙述，缺乏连贯性', N'C', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (4, N'讲解较熟练，语言通俗', N'B', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (5, N'条目明白，书写整洁', N'B', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (6, N'辅导及时、并指导课外阅读', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (7, N'作业适量，批改及时', N'B', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (8, N'注意学生能力培养，并在教学中有所体现', N'B', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (9, N'对学生漠不关心，放任自流', N'D', CAST(0 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (10, N'举止文明，待人热情', N'B', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (11, N'语言精练，深入浅出，讲解准确', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (12, N'重点不明显，难点讲不透', N'C', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (13, N'平淡叙述，缺乏连贯性', N'C', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (14, N'讲解较熟练，语言通俗', N'B', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (15, N'条目明白，书写整洁', N'B', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (16, N'定期辅导，并布置课外阅读', N'B', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (17, N'作业适量，批改及时', N'B', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (18, N'能提出能力培养的要求，但缺乏具体的办法', N'C', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (19, N'对学生漠不关心，放任自流', N'D', CAST(0 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (20, N'注意礼貌，待人和气', N'C', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (21, N'语言精练，深入浅出，讲解准确', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (22, N'能把握重点、难点，但讲解不够明确', N'B', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (23, N'平淡叙述，缺乏连贯性', N'C', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (24, N'讲解生疏，远离课题，语言枯燥', N'D', CAST(0 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (25, N'次序凌乱，书写潦草', N'D', CAST(0 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (26, N'辅导及时、并指导课外阅读', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (27, N'选题得当，批改及时，注意讲评', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (28, N'忽视能力培养，单纯灌输书本知识', N'D', CAST(0 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (29, N'对学生漠不关心，放任自流', N'D', CAST(0 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (30, N'举止文明，待人热情', N'B', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (31, N'讲解清晰，容易接受', N'B', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (32, N'重点突出，讲清难点，举一反三', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (33, N'层次分明，融会贯通', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (34, N'讲解方法新颖，举例生动，有吸引力', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (35, N'布局较差，详略失当', N'C', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (36, N'辅导较少', N'C', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (37, N'选题随便，批改马虎', N'D', CAST(0 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (38, N'忽视能力培养，单纯灌输书本知识', N'D', CAST(0 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (39, N'单纯完成上课任务，与同学接触较少', N'C', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (40, N'注意礼貌，待人和气', N'C', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (41, N'注意学生动态，教学有条不紊', N'B', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (42, N'降低教学标准，内容时有差错', N'D', CAST(0 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (43, N'讲解基本准确，但不易接受', N'C', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (44, N'重点不明显，难点讲不透', N'C', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (45, N'讲解平淡，语言单调', N'C', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (46, N'教具使用失当，板书布局较差', N'C', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (47, N'注意调动学生思维和能力培养，方法和效果欠佳', N'B', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (48, N'理论与实际结合不理想', N'C', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (49, N'基本按照教材讲课，没有给学生什么新东西', N'C', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (50, N'忽视教学步骤，师生双边活动较差', N'C', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (51, N'基本达到教学大纲要求，内容偶有差错', N'C', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (52, N'概念紊乱，时有差错', N'D', CAST(0 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (53, N'能把握重点、难点，但讲解不够明确', N'B', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (54, N'讲解较熟练，语言通俗', N'B', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (55, N'注意直观教学，板书条目明白、整洁', N'B', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (56, N'注意调动学生思维和能力培养，方法和效果欠佳', N'B', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (57, N'理论与实际结合不理想', N'C', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (58, N'基本按照教材讲课，没有给学生什么新东西', N'C', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (59, N'注意学生动态，教学有条不紊', N'B', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (60, N'符合教学大纲要求，内容正确', N'B', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (61, N'讲解基本准确，但不易接受', N'C', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (62, N'能把握重点、难点，但讲解不够明确', N'B', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (63, N'讲解平淡，语言单调', N'C', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (64, N'教具使用失当，板书布局较差', N'C', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (65, N'缺乏启发式方法和能力培养手段', N'C', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (66, N'理论与实例、实验、实际密切结合', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (67, N'科学的处理教材，繁简增删适当，收事半功倍之效', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (68, N'概念紊乱，时有差错', N'D', CAST(0 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (69, N'能把握重点、难点，但讲解不够明确', N'B', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (70, N'层次分明，融会贯通', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (71, N'讲解生疏，远离课题，语言枯燥', N'D', CAST(0 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (72, N'次序凌乱，书写潦草', N'D', CAST(0 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (73, N'没有辅导', N'D', CAST(0 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (74, N'选题随便，批改马虎', N'D', CAST(0 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (75, N'忽视能力培养，单纯灌输书本知识', N'D', CAST(0 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (76, N'对学生漠不关心，放任自流', N'D', CAST(0 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (77, N'要求不严，言谈失当', N'D', CAST(0 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (78, N'忽视教学步骤，师生双边活动较差', N'C', CAST(1 AS Decimal(18, 0)), 2)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (79, N'符合教学大纲要求，内容正确', N'B', CAST(1 AS Decimal(18, 0)), 2)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (80, N'讲解基本准确，但不易接受', N'C', CAST(1 AS Decimal(18, 0)), 2)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (81, N'重点一言而过，难点草率了事', N'D', CAST(0 AS Decimal(18, 0)), 2)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (82, N'讲解平淡，语言单调', N'C', CAST(1 AS Decimal(18, 0)), 2)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (83, N'忽视直观教学，板书凌乱', N'D', CAST(0 AS Decimal(18, 0)), 2)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (84, N'照本宣科，不搞启发式教学', N'D', CAST(0 AS Decimal(18, 0)), 2)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (85, N'理论与实际严重脱节', N'D', CAST(0 AS Decimal(18, 0)), 2)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (86, N'对教材毫无处理，完全重复课本内容', N'D', CAST(0 AS Decimal(18, 0)), 2)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (87, N'讲解基本准确，但不易接受', N'C', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (88, N'重点突出，讲清难点，举一反三', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (89, N'条目较清楚，有分析归纳', N'B', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (90, N'讲解较熟练，语言通俗', N'B', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (91, N'条目明白，书写整洁', N'B', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (92, N'定期辅导，并布置课外阅读', N'B', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (93, N'选题得当，批改及时，注意讲评', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (94, N'注意学生能力培养，并在教学中有所体现', N'B', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (95, N'全面关心学生，经常接触学生，亲切、严格', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (96, N'举止文明，待人热情', N'B', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (97, N'讲解基本准确，但不易接受', N'C', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (98, N'重点突出，讲清难点，举一反三', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (99, N'层次分明，融会贯通', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (100, N'讲解方法新颖，举例生动，有吸引力', N'A', CAST(1 AS Decimal(18, 0)), 1)
GO
print 'Processed 100 total records'
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (101, N'简繁适度，清楚醒目', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (102, N'辅导及时、并指导课外阅读', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (103, N'选题得当，批改及时，注意讲评', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (104, N'思路开阔，鼓励创新，注意能力培养、效果明显', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (105, N'全面关心学生，经常接触学生，亲切、严格', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (106, N'严于律己，以身作则，堪称楷模', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (107, N'语言精练，深入浅出，讲解准确', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (108, N'重点突出，讲清难点，举一反三', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (109, N'层次分明，融会贯通', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (110, N'讲解方法新颖，举例生动，有吸引力', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (111, N'简繁适度，清楚醒目', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (112, N'辅导及时、并指导课外阅读', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (113, N'选题得当，批改及时，注意讲评', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (114, N'思路开阔，鼓励创新，注意能力培养、效果明显', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (115, N'全面关心学生，经常接触学生，亲切、严格', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (116, N'严于律己，以身作则，堪称楷模', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (117, N'语言精练，深入浅出，讲解准确', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (118, N'重点突出，讲清难点，举一反三', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (119, N'层次分明，融会贯通', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (120, N'讲解方法新颖，举例生动，有吸引力', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (121, N'简繁适度，清楚醒目', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (122, N'辅导及时、并指导课外阅读', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (123, N'选题得当，批改及时，注意讲评', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (124, N'思路开阔，鼓励创新，注意能力培养、效果明显', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (125, N'全面关心学生，经常接触学生，亲切、严格', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (126, N'严于律己，以身作则，堪称楷模', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (127, N'教学组织安排得当，气氛活跃，纪律良好', N'A', CAST(1 AS Decimal(18, 0)), 2)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (128, N'基本达到教学大纲要求，内容偶有差错', N'C', CAST(1 AS Decimal(18, 0)), 2)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (129, N'讲解基本准确，但不易接受', N'C', CAST(1 AS Decimal(18, 0)), 2)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (130, N'重点一言而过，难点草率了事', N'D', CAST(0 AS Decimal(18, 0)), 2)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (131, N'讲解生疏，远离课题，语言枯燥', N'D', CAST(0 AS Decimal(18, 0)), 2)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (132, N'忽视直观教学，板书凌乱', N'D', CAST(0 AS Decimal(18, 0)), 2)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (133, N'缺乏启发式方法和能力培养手段', N'C', CAST(1 AS Decimal(18, 0)), 2)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (134, N'理论与实际结合不理想', N'C', CAST(1 AS Decimal(18, 0)), 2)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (135, N'对教材毫无处理，完全重复课本内容', N'D', CAST(0 AS Decimal(18, 0)), 2)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (136, N'语言精练，深入浅出，讲解准确', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (137, N'重点突出，讲清难点，举一反三', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (138, N'层次分明，融会贯通', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (139, N'讲解方法新颖，举例生动，有吸引力', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (140, N'简繁适度，清楚醒目', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (141, N'辅导及时、并指导课外阅读', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (142, N'选题得当，批改及时，注意讲评', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (143, N'思路开阔，鼓励创新，注意能力培养、效果明显', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (144, N'全面关心学生，经常接触学生，亲切、严格', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (145, N'注意礼貌，待人和气', N'C', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (146, N'教学组织安排得当，气氛活跃，纪律良好', N'A', CAST(1 AS Decimal(18, 0)), 2)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (147, N'符合教学大纲要求，内容正确', N'B', CAST(1 AS Decimal(18, 0)), 2)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (148, N'讲解基本准确，但不易接受', N'C', CAST(1 AS Decimal(18, 0)), 2)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (149, N'重点突出，讲清难点，举一反三', N'A', CAST(1 AS Decimal(18, 0)), 2)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (150, N'讲解较熟练，语言通俗', N'B', CAST(1 AS Decimal(18, 0)), 2)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (151, N'教具使用合理，板书清晰，示教形象、直观', N'A', CAST(1 AS Decimal(18, 0)), 2)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (152, N'运用各种方法，调动学生积极思维，注重能力培养', N'A', CAST(1 AS Decimal(18, 0)), 2)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (153, N'理论能结合实际进行教学', N'B', CAST(1 AS Decimal(18, 0)), 2)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (154, N'科学的处理教材，繁简增删适当，收事半功倍之效', N'A', CAST(1 AS Decimal(18, 0)), 2)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (155, N'语言精练，深入浅出，讲解准确', N'A', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (156, N'重点不明显，难点讲不透', N'C', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (157, N'平淡叙述，缺乏连贯性', N'C', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (158, N'讲解方法新颖，举例生动，有吸引力', N'A', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (159, N'布局较差，详略失当', N'C', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (160, N'定期辅导，并布置课外阅读', N'B', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (161, N'选题随便，批改马虎', N'D', CAST(0 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (162, N'思路开阔，鼓励创新，注意能力培养、效果明显', N'A', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (163, N'对学生漠不关心，放任自流', N'D', CAST(0 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (164, N'注意礼貌，待人和气', N'C', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (165, N'语言精练，深入浅出，讲解准确', N'A', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (166, N'重点不明显，难点讲不透', N'C', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (167, N'平淡叙述，缺乏连贯性', N'C', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (168, N'讲解方法新颖，举例生动，有吸引力', N'A', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (169, N'布局较差，详略失当', N'C', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (170, N'定期辅导，并布置课外阅读', N'B', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (171, N'选题随便，批改马虎', N'D', CAST(0 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (172, N'思路开阔，鼓励创新，注意能力培养、效果明显', N'A', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (173, N'对学生漠不关心，放任自流', N'D', CAST(0 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (174, N'注意礼貌，待人和气', N'C', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (175, N'语言精练，深入浅出，讲解准确', N'A', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (176, N'重点不明显，难点讲不透', N'C', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (177, N'平淡叙述，缺乏连贯性', N'C', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (178, N'讲解方法新颖，举例生动，有吸引力', N'A', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (179, N'布局较差，详略失当', N'C', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (180, N'定期辅导，并布置课外阅读', N'B', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (181, N'选题随便，批改马虎', N'D', CAST(0 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (182, N'思路开阔，鼓励创新，注意能力培养、效果明显', N'A', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (183, N'对学生漠不关心，放任自流', N'D', CAST(0 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (184, N'注意礼貌，待人和气', N'C', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (185, N'概念紊乱，时有差错', N'D', CAST(0 AS Decimal(18, 0)), 3)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (186, N'重点一言而过，难点草率了事', N'D', CAST(0 AS Decimal(18, 0)), 3)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (187, N'杂乱无章，前后矛盾', N'D', CAST(0 AS Decimal(18, 0)), 3)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (188, N'讲解生疏，远离课题，语言枯燥', N'D', CAST(0 AS Decimal(18, 0)), 3)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (189, N'次序凌乱，书写潦草', N'D', CAST(0 AS Decimal(18, 0)), 3)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (190, N'没有辅导', N'D', CAST(0 AS Decimal(18, 0)), 3)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (191, N'选题随便，批改马虎', N'D', CAST(0 AS Decimal(18, 0)), 3)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (192, N'忽视能力培养，单纯灌输书本知识', N'D', CAST(0 AS Decimal(18, 0)), 3)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (193, N'对学生漠不关心，放任自流', N'D', CAST(0 AS Decimal(18, 0)), 3)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (194, N'要求不严，言谈失当', N'D', CAST(0 AS Decimal(18, 0)), 3)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (195, N'讲解基本准确，但不易接受', N'C', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (196, N'重点不明显，难点讲不透', N'C', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (197, N'条目较清楚，有分析归纳', N'B', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (198, N'讲解方法新颖，举例生动，有吸引力', N'A', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (199, N'简繁适度，清楚醒目', N'A', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (200, N'辅导及时、并指导课外阅读', N'A', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (201, N'选题得当，批改及时，注意讲评', N'A', CAST(1 AS Decimal(18, 0)), 5)
GO
print 'Processed 200 total records'
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (202, N'思路开阔，鼓励创新，注意能力培养、效果明显', N'A', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (203, N'关心学生的学业，引导学生学好本门课程', N'B', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (204, N'严于律己，以身作则，堪称楷模', N'A', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (205, N'讲解基本准确，但不易接受', N'C', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (206, N'重点不明显，难点讲不透', N'C', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (207, N'条目较清楚，有分析归纳', N'B', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (208, N'讲解方法新颖，举例生动，有吸引力', N'A', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (209, N'简繁适度，清楚醒目', N'A', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (210, N'辅导及时、并指导课外阅读', N'A', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (211, N'选题得当，批改及时，注意讲评', N'A', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (212, N'思路开阔，鼓励创新，注意能力培养、效果明显', N'A', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (213, N'关心学生的学业，引导学生学好本门课程', N'B', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (214, N'严于律己，以身作则，堪称楷模', N'A', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (215, N'讲解基本准确，但不易接受', N'C', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (216, N'重点不明显，难点讲不透', N'C', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (217, N'条目较清楚，有分析归纳', N'B', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (218, N'讲解方法新颖，举例生动，有吸引力', N'A', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (219, N'简繁适度，清楚醒目', N'A', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (220, N'辅导及时、并指导课外阅读', N'A', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (221, N'选题得当，批改及时，注意讲评', N'A', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (222, N'思路开阔，鼓励创新，注意能力培养、效果明显', N'A', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (223, N'关心学生的学业，引导学生学好本门课程', N'B', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (224, N'严于律己，以身作则，堪称楷模', N'A', CAST(1 AS Decimal(18, 0)), 5)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (225, N'教学组织安排得当，气氛活跃，纪律良好', N'A', CAST(1 AS Decimal(18, 0)), 2)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (226, N'符合教学大纲要求，内容正确', N'B', CAST(1 AS Decimal(18, 0)), 2)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (227, N'语言精练，深入浅出，讲解准确', N'A', CAST(1 AS Decimal(18, 0)), 2)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (228, N'重点突出，讲清难点，举一反三', N'A', CAST(1 AS Decimal(18, 0)), 2)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (229, N'讲解方法新颖，举例生动，有吸引力', N'A', CAST(1 AS Decimal(18, 0)), 2)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (230, N'注意直观教学，板书条目明白、整洁', N'B', CAST(1 AS Decimal(18, 0)), 2)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (231, N'注意调动学生思维和能力培养，方法和效果欠佳', N'B', CAST(1 AS Decimal(18, 0)), 2)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (232, N'理论与实例、实验、实际密切结合', N'A', CAST(1 AS Decimal(18, 0)), 2)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (233, N'对教材的处理，有助于学生理解和掌握内在联系', N'B', CAST(1 AS Decimal(18, 0)), 2)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (234, N'语言精练，深入浅出，讲解准确', N'A', CAST(1 AS Decimal(18, 0)), 3)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (235, N'重点突出，讲清难点，举一反三', N'A', CAST(1 AS Decimal(18, 0)), 3)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (236, N'层次分明，融会贯通', N'A', CAST(1 AS Decimal(18, 0)), 3)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (237, N'讲解较熟练，语言通俗', N'B', CAST(1 AS Decimal(18, 0)), 3)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (238, N'条目明白，书写整洁', N'B', CAST(1 AS Decimal(18, 0)), 3)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (239, N'定期辅导，并布置课外阅读', N'B', CAST(1 AS Decimal(18, 0)), 3)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (240, N'作业量时轻时重，批改不够及时', N'C', CAST(1 AS Decimal(18, 0)), 3)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (241, N'能提出能力培养的要求，但缺乏具体的办法', N'C', CAST(1 AS Decimal(18, 0)), 3)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (242, N'单纯完成上课任务，与同学接触较少', N'C', CAST(1 AS Decimal(18, 0)), 3)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (243, N'要求不严，言谈失当', N'D', CAST(0 AS Decimal(18, 0)), 3)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (244, N'讲解基本准确，但不易接受', N'C', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (245, N'重点突出，讲清难点，举一反三', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (246, N'平淡叙述，缺乏连贯性', N'C', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (247, N'讲解平淡，语言单调', N'C', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (248, N'布局较差，详略失当', N'C', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (249, N'定期辅导，并布置课外阅读', N'B', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (250, N'作业量时轻时重，批改不够及时', N'C', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (251, N'注意学生能力培养，并在教学中有所体现', N'B', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (252, N'关心学生的学业，引导学生学好本门课程', N'B', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (253, N'严于律己，以身作则，堪称楷模', N'A', CAST(1 AS Decimal(18, 0)), 1)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (254, N'讲解基本准确，但不易接受', N'C', CAST(1 AS Decimal(18, 0)), 14)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (255, N'重点突出，讲清难点，举一反三', N'A', CAST(1 AS Decimal(18, 0)), 14)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (256, N'杂乱无章，前后矛盾', N'D', CAST(0 AS Decimal(18, 0)), 14)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (257, N'讲解生疏，远离课题，语言枯燥', N'D', CAST(0 AS Decimal(18, 0)), 14)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (258, N'简繁适度，清楚醒目', N'A', CAST(1 AS Decimal(18, 0)), 14)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (259, N'没有辅导', N'D', CAST(0 AS Decimal(18, 0)), 14)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (260, N'作业适量，批改及时', N'B', CAST(1 AS Decimal(18, 0)), 14)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (261, N'思路开阔，鼓励创新，注意能力培养、效果明显', N'A', CAST(1 AS Decimal(18, 0)), 14)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (262, N'全面关心学生，经常接触学生，亲切、严格', N'A', CAST(1 AS Decimal(18, 0)), 14)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (263, N'举止文明，待人热情', N'B', CAST(1 AS Decimal(18, 0)), 14)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (264, N'讲解基本准确，但不易接受', N'C', CAST(1 AS Decimal(18, 0)), 14)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (265, N'重点突出，讲清难点，举一反三', N'A', CAST(1 AS Decimal(18, 0)), 14)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (266, N'杂乱无章，前后矛盾', N'D', CAST(0 AS Decimal(18, 0)), 14)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (267, N'讲解生疏，远离课题，语言枯燥', N'D', CAST(0 AS Decimal(18, 0)), 14)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (268, N'简繁适度，清楚醒目', N'A', CAST(1 AS Decimal(18, 0)), 14)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (269, N'没有辅导', N'D', CAST(0 AS Decimal(18, 0)), 14)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (270, N'作业适量，批改及时', N'B', CAST(1 AS Decimal(18, 0)), 14)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (271, N'思路开阔，鼓励创新，注意能力培养、效果明显', N'A', CAST(1 AS Decimal(18, 0)), 14)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (272, N'全面关心学生，经常接触学生，亲切、严格', N'A', CAST(1 AS Decimal(18, 0)), 14)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (273, N'举止文明，待人热情', N'B', CAST(1 AS Decimal(18, 0)), 14)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (274, N'概念紊乱，时有差错', N'D', CAST(0 AS Decimal(18, 0)), 15)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (275, N'重点一言而过，难点草率了事', N'D', CAST(0 AS Decimal(18, 0)), 15)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (276, N'杂乱无章，前后矛盾', N'D', CAST(0 AS Decimal(18, 0)), 15)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (277, N'讲解生疏，远离课题，语言枯燥', N'D', CAST(0 AS Decimal(18, 0)), 15)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (278, N'次序凌乱，书写潦草', N'D', CAST(0 AS Decimal(18, 0)), 15)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (279, N'没有辅导', N'D', CAST(0 AS Decimal(18, 0)), 15)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (280, N'选题随便，批改马虎', N'D', CAST(0 AS Decimal(18, 0)), 15)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (281, N'忽视能力培养，单纯灌输书本知识', N'D', CAST(0 AS Decimal(18, 0)), 15)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (282, N'对学生漠不关心，放任自流', N'D', CAST(0 AS Decimal(18, 0)), 15)
INSERT [dbo].[ResultSelects] ([ID], [Name], [Number], [Proportion], [CreateUserID]) VALUES (283, N'要求不严，言谈失当', N'D', CAST(0 AS Decimal(18, 0)), 15)
SET IDENTITY_INSERT [dbo].[ResultSelects] OFF
/****** Object:  Table [dbo].[ResultPapers]    Script Date: 07/01/2016 08:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResultPapers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[RoleID] [int] NOT NULL,
	[UserID] [int] NOT NULL,
	[Time] [datetime] NOT NULL,
	[Proportion] [decimal](18, 2) NOT NULL,
	[Semester] [nvarchar](50) NOT NULL,
	[CreateUserID] [int] NOT NULL,
 CONSTRAINT [PK_Paper] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[ResultPapers] ON
INSERT [dbo].[ResultPapers] ([ID], [Name], [RoleID], [UserID], [Time], [Proportion], [Semester], [CreateUserID]) VALUES (1, N'教师工作评价指标体系（教师用）', 2, 4, CAST(0x0000A63400B2839C AS DateTime), CAST(0.88 AS Decimal(18, 2)), N'第一学期', 2)
INSERT [dbo].[ResultPapers] ([ID], [Name], [RoleID], [UserID], [Time], [Proportion], [Semester], [CreateUserID]) VALUES (2, N'教师工作评价指标体系（学生用）', 1, 2, CAST(0x0000A63400B395D4 AS DateTime), CAST(0.74 AS Decimal(18, 2)), N'第一学期', 14)
INSERT [dbo].[ResultPapers] ([ID], [Name], [RoleID], [UserID], [Time], [Proportion], [Semester], [CreateUserID]) VALUES (3, N'教师工作评价指标体系（学生用）', 1, 2, CAST(0x0000A63400B7960C AS DateTime), CAST(0.68 AS Decimal(18, 2)), N'第一学期', 1)
INSERT [dbo].[ResultPapers] ([ID], [Name], [RoleID], [UserID], [Time], [Proportion], [Semester], [CreateUserID]) VALUES (4, N'教师工作评价指标体系（学生用）', 1, 4, CAST(0x0000A635009D44F0 AS DateTime), CAST(0.67 AS Decimal(18, 2)), N'第一学期', 14)
INSERT [dbo].[ResultPapers] ([ID], [Name], [RoleID], [UserID], [Time], [Proportion], [Semester], [CreateUserID]) VALUES (6, N'教师工作评价指标体系（学生用）', 1, 4, CAST(0x0000A63500A6D04C AS DateTime), CAST(0.25 AS Decimal(18, 2)), N'第一学期', 15)
SET IDENTITY_INSERT [dbo].[ResultPapers] OFF
/****** Object:  Table [dbo].[Users]    Script Date: 07/01/2016 08:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Account] [nvarchar](50) NOT NULL,
	[PassWord] [nvarchar](50) NOT NULL,
	[Identifier] [nvarchar](50) NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Users] ON
INSERT [dbo].[Users] ([ID], [Name], [Account], [PassWord], [Identifier]) VALUES (1, N'hj', N'140016646', N'123456', N'140016646')
INSERT [dbo].[Users] ([ID], [Name], [Account], [PassWord], [Identifier]) VALUES (2, N'冷亚红', N'lyh', N'123456', N'007')
INSERT [dbo].[Users] ([ID], [Name], [Account], [PassWord], [Identifier]) VALUES (3, N'管理员', N'admin', N'123456', NULL)
INSERT [dbo].[Users] ([ID], [Name], [Account], [PassWord], [Identifier]) VALUES (4, N'苟英', N'gy', N'123456', N'009')
INSERT [dbo].[Users] ([ID], [Name], [Account], [PassWord], [Identifier]) VALUES (5, N'朱德君', N'zdj', N'123456', N'008')
INSERT [dbo].[Users] ([ID], [Name], [Account], [PassWord], [Identifier]) VALUES (7, N'郭静', N'gj', N'123456', N'010')
INSERT [dbo].[Users] ([ID], [Name], [Account], [PassWord], [Identifier]) VALUES (8, N'袁开友', N'yky', N'123456', NULL)
INSERT [dbo].[Users] ([ID], [Name], [Account], [PassWord], [Identifier]) VALUES (9, N'唐一科', N'tyk', N'123456', NULL)
INSERT [dbo].[Users] ([ID], [Name], [Account], [PassWord], [Identifier]) VALUES (10, N'张浩然', N'zhr', N'123456', N'011')
INSERT [dbo].[Users] ([ID], [Name], [Account], [PassWord], [Identifier]) VALUES (11, N'周龙福', N'zlf', N'123456', NULL)
INSERT [dbo].[Users] ([ID], [Name], [Account], [PassWord], [Identifier]) VALUES (12, N'汪忆', N'wy', N'123456', NULL)
INSERT [dbo].[Users] ([ID], [Name], [Account], [PassWord], [Identifier]) VALUES (13, N'谭凤', N'tf', N'123456', NULL)
INSERT [dbo].[Users] ([ID], [Name], [Account], [PassWord], [Identifier]) VALUES (14, N'冯志', N'fz', N'123456', N'140016630')
INSERT [dbo].[Users] ([ID], [Name], [Account], [PassWord], [Identifier]) VALUES (15, N'马小东', N'mxd', N'123456', N'140016644')
INSERT [dbo].[Users] ([ID], [Name], [Account], [PassWord], [Identifier]) VALUES (16, N'宋爱志', N'saz', N'123456', N'140016610')
INSERT [dbo].[Users] ([ID], [Name], [Account], [PassWord], [Identifier]) VALUES (17, N'廖成飞', N'lcf', N'123456', N'140016636')
INSERT [dbo].[Users] ([ID], [Name], [Account], [PassWord], [Identifier]) VALUES (20, N'刘宣庆', N'lxq', N'123456', N'140016622')
SET IDENTITY_INSERT [dbo].[Users] OFF
/****** Object:  Table [dbo].[UserClass]    Script Date: 07/01/2016 08:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserClass](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[CollegeID] [int] NULL,
 CONSTRAINT [PK_Class] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[UserClass] ON
INSERT [dbo].[UserClass] ([ID], [Name], [CollegeID]) VALUES (1, N'1400161', 1)
INSERT [dbo].[UserClass] ([ID], [Name], [CollegeID]) VALUES (2, N'1400162', 1)
INSERT [dbo].[UserClass] ([ID], [Name], [CollegeID]) VALUES (3, N'1400163', 1)
INSERT [dbo].[UserClass] ([ID], [Name], [CollegeID]) VALUES (4, N'1400164', 1)
INSERT [dbo].[UserClass] ([ID], [Name], [CollegeID]) VALUES (5, N'1400165', 1)
INSERT [dbo].[UserClass] ([ID], [Name], [CollegeID]) VALUES (6, N'1400166', 1)
INSERT [dbo].[UserClass] ([ID], [Name], [CollegeID]) VALUES (7, N'1400123', 2)
INSERT [dbo].[UserClass] ([ID], [Name], [CollegeID]) VALUES (9, N'1400124', 2)
INSERT [dbo].[UserClass] ([ID], [Name], [CollegeID]) VALUES (10, N'1400125', 2)
SET IDENTITY_INSERT [dbo].[UserClass] OFF
/****** Object:  Table [dbo].[User_Role]    Script Date: 07/01/2016 08:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User_Role](
	[UserID] [int] NOT NULL,
	[RoleID] [int] NOT NULL,
 CONSTRAINT [PK_User--Role] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC,
	[RoleID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[User_Role] ([UserID], [RoleID]) VALUES (1, 1)
INSERT [dbo].[User_Role] ([UserID], [RoleID]) VALUES (2, 2)
INSERT [dbo].[User_Role] ([UserID], [RoleID]) VALUES (3, 5)
INSERT [dbo].[User_Role] ([UserID], [RoleID]) VALUES (4, 2)
INSERT [dbo].[User_Role] ([UserID], [RoleID]) VALUES (5, 2)
INSERT [dbo].[User_Role] ([UserID], [RoleID]) VALUES (7, 2)
INSERT [dbo].[User_Role] ([UserID], [RoleID]) VALUES (8, 3)
INSERT [dbo].[User_Role] ([UserID], [RoleID]) VALUES (11, 4)
INSERT [dbo].[User_Role] ([UserID], [RoleID]) VALUES (14, 1)
INSERT [dbo].[User_Role] ([UserID], [RoleID]) VALUES (15, 1)
INSERT [dbo].[User_Role] ([UserID], [RoleID]) VALUES (16, 1)
INSERT [dbo].[User_Role] ([UserID], [RoleID]) VALUES (17, 1)
INSERT [dbo].[User_Role] ([UserID], [RoleID]) VALUES (20, 1)
/****** Object:  Table [dbo].[TempPaperType]    Script Date: 07/01/2016 08:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TempPaperType](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleID] [int] NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TempPaperType] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TempPaperType] ON
INSERT [dbo].[TempPaperType] ([ID], [RoleID], [Name]) VALUES (5, 1, N'教师工作评价指标体系（学生用）')
INSERT [dbo].[TempPaperType] ([ID], [RoleID], [Name]) VALUES (6, 2, N'教师工作评价指标体系（教师用）')
INSERT [dbo].[TempPaperType] ([ID], [RoleID], [Name]) VALUES (7, 3, N'教师工作评价指标体系（系主任用）')
INSERT [dbo].[TempPaperType] ([ID], [RoleID], [Name]) VALUES (8, 4, N'教师工作评价指标体系（教研室主任）')
SET IDENTITY_INSERT [dbo].[TempPaperType] OFF
/****** Object:  Table [dbo].[Teacher]    Script Date: 07/01/2016 08:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Teacher](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Number] [nvarchar](50) NOT NULL,
	[UserID] [int] NULL,
	[ClassID] [int] NOT NULL,
	[Headportrait] [nvarchar](500) NULL,
	[Spask] [nvarchar](100) NULL,
 CONSTRAINT [PK_Teacher] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Teacher] ON
INSERT [dbo].[Teacher] ([ID], [Name], [Number], [UserID], [ClassID], [Headportrait], [Spask]) VALUES (1, N'冷亚洪', N'007', 2, 6, N'../../Content/images/Teacher/t1.png', N'没有什么事是一份黄焖鸡解决不了的')
INSERT [dbo].[Teacher] ([ID], [Name], [Number], [UserID], [ClassID], [Headportrait], [Spask]) VALUES (2, N'苟英', N'009', 4, 6, N'../../Content/images/Teacher/t7.png', N'不懂斗要问')
SET IDENTITY_INSERT [dbo].[Teacher] OFF
/****** Object:  Table [dbo].[Role_Function]    Script Date: 07/01/2016 08:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role_Function](
	[RoleID] [int] NOT NULL,
	[FunctionID] [int] NOT NULL,
 CONSTRAINT [PK_Role--Function] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC,
	[FunctionID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Role_Function] ([RoleID], [FunctionID]) VALUES (1, 1)
INSERT [dbo].[Role_Function] ([RoleID], [FunctionID]) VALUES (1, 2)
INSERT [dbo].[Role_Function] ([RoleID], [FunctionID]) VALUES (2, 2)
INSERT [dbo].[Role_Function] ([RoleID], [FunctionID]) VALUES (3, 2)
INSERT [dbo].[Role_Function] ([RoleID], [FunctionID]) VALUES (4, 2)
INSERT [dbo].[Role_Function] ([RoleID], [FunctionID]) VALUES (5, 5)
INSERT [dbo].[Role_Function] ([RoleID], [FunctionID]) VALUES (5, 6)
INSERT [dbo].[Role_Function] ([RoleID], [FunctionID]) VALUES (5, 11)
INSERT [dbo].[Role_Function] ([RoleID], [FunctionID]) VALUES (5, 12)
/****** Object:  Table [dbo].[Curriculum_Teacher]    Script Date: 07/01/2016 08:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Curriculum_Teacher](
	[CurriculumID] [int] NOT NULL,
	[TeacherID] [int] NOT NULL,
 CONSTRAINT [PK_Curriculum_Teacher] PRIMARY KEY CLUSTERED 
(
	[CurriculumID] ASC,
	[TeacherID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Curriculum_Teacher] ([CurriculumID], [TeacherID]) VALUES (1, 1)
INSERT [dbo].[Curriculum_Teacher] ([CurriculumID], [TeacherID]) VALUES (4, 2)
/****** Object:  Table [dbo].[Student]    Script Date: 07/01/2016 08:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Student](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[No] [nvarchar](50) NOT NULL,
	[UserID] [int] NULL,
	[ClassID] [int] NULL,
 CONSTRAINT [PK_Student] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Student] ON
INSERT [dbo].[Student] ([ID], [Name], [No], [UserID], [ClassID]) VALUES (1, N'黄杰', N'140016646', 1, 6)
INSERT [dbo].[Student] ([ID], [Name], [No], [UserID], [ClassID]) VALUES (3, N'冯志', N'140016630', 14, 6)
INSERT [dbo].[Student] ([ID], [Name], [No], [UserID], [ClassID]) VALUES (4, N'马小东', N'140016644', 15, 6)
INSERT [dbo].[Student] ([ID], [Name], [No], [UserID], [ClassID]) VALUES (5, N'宋爱志', N'140016610', 16, 6)
INSERT [dbo].[Student] ([ID], [Name], [No], [UserID], [ClassID]) VALUES (6, N'廖成飞', N'140016636', 17, 6)
INSERT [dbo].[Student] ([ID], [Name], [No], [UserID], [ClassID]) VALUES (8, N'刘宣庆', N'140016622', 20, 6)
SET IDENTITY_INSERT [dbo].[Student] OFF
/****** Object:  Table [dbo].[QManagement]    Script Date: 07/01/2016 08:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QManagement](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[QSTime] [datetime] NOT NULL,
	[SDTime] [datetime] NOT NULL,
	[ISActive] [bit] NOT NULL,
	[TempPaperTypeID] [int] NOT NULL,
	[Syst] [int] NULL,
 CONSTRAINT [PK_QManagement] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[QManagement] ON
INSERT [dbo].[QManagement] ([ID], [Name], [QSTime], [SDTime], [ISActive], [TempPaperTypeID], [Syst]) VALUES (1, N'学生评价问卷', CAST(0x0000A42600000000 AS DateTime), CAST(0x0000A73C00000000 AS DateTime), 1, 5, 0)
SET IDENTITY_INSERT [dbo].[QManagement] OFF
/****** Object:  Table [dbo].[Class_Teacher]    Script Date: 07/01/2016 08:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class_Teacher](
	[ClassID] [int] NOT NULL,
	[TeacherID] [int] NOT NULL,
 CONSTRAINT [PK_Class_Teacher] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC,
	[TeacherID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Class_Teacher] ([ClassID], [TeacherID]) VALUES (6, 1)
INSERT [dbo].[Class_Teacher] ([ClassID], [TeacherID]) VALUES (6, 2)
/****** Object:  Table [dbo].[Class_Curriculum]    Script Date: 07/01/2016 08:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Class_Curriculum](
	[ClassID] [int] NOT NULL,
	[CurriculumID] [int] NOT NULL,
 CONSTRAINT [PK_Class_Curriculum] PRIMARY KEY CLUSTERED 
(
	[ClassID] ASC,
	[CurriculumID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Class_Curriculum] ([ClassID], [CurriculumID]) VALUES (6, 1)
INSERT [dbo].[Class_Curriculum] ([ClassID], [CurriculumID]) VALUES (6, 2)
INSERT [dbo].[Class_Curriculum] ([ClassID], [CurriculumID]) VALUES (6, 3)
INSERT [dbo].[Class_Curriculum] ([ClassID], [CurriculumID]) VALUES (6, 4)
INSERT [dbo].[Class_Curriculum] ([ClassID], [CurriculumID]) VALUES (6, 5)
/****** Object:  Table [dbo].[TempTopic]    Script Date: 07/01/2016 08:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TempTopic](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Proportion] [decimal](18, 2) NOT NULL,
	[TempPaperTypeID] [int] NOT NULL,
	[ParentID] [int] NULL,
 CONSTRAINT [PK_TempTopic] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TempTopic] ON
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (1, N'概念的讲解', CAST(0.15 AS Decimal(18, 2)), 5, NULL)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (2, N'重点和难点', CAST(0.15 AS Decimal(18, 2)), 5, NULL)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (3, N'逻辑性和条理性', CAST(0.10 AS Decimal(18, 2)), 5, NULL)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (4, N'趣味性和生动性', CAST(0.10 AS Decimal(18, 2)), 5, NULL)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (5, N'板书', CAST(0.05 AS Decimal(18, 2)), 5, NULL)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (9, N'辅导（阅读指导）', CAST(0.08 AS Decimal(18, 2)), 5, NULL)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (10, N'作业与批改', CAST(0.10 AS Decimal(18, 2)), 5, NULL)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (11, N'能力培养', CAST(0.10 AS Decimal(18, 2)), 5, NULL)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (12, N'教书育人', CAST(0.10 AS Decimal(18, 2)), 5, NULL)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (13, N'为人师表', CAST(0.07 AS Decimal(18, 2)), 5, NULL)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (16, N'组织教学', CAST(0.15 AS Decimal(18, 2)), 6, NULL)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (17, N'教学要求、教学内容', CAST(0.15 AS Decimal(18, 2)), 6, NULL)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (18, N'概念讲解', CAST(0.10 AS Decimal(18, 2)), 6, NULL)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (19, N'重点和难点', CAST(0.10 AS Decimal(18, 2)), 6, NULL)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (20, N'趣味性与生动性', CAST(0.08 AS Decimal(18, 2)), 6, NULL)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (21, N'直观教学与板书', CAST(0.07 AS Decimal(18, 2)), 6, NULL)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (22, N'智力能力的培养', CAST(0.10 AS Decimal(18, 2)), 6, NULL)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (23, N'理论联系实际', CAST(0.10 AS Decimal(18, 2)), 6, NULL)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (24, N'教材处理', CAST(0.15 AS Decimal(18, 2)), 6, NULL)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (25, N'教学环节', CAST(0.60 AS Decimal(18, 2)), 8, NULL)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (26, N'接受任务', CAST(0.10 AS Decimal(18, 2)), 8, NULL)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (27, N'汲取新信息技术情况', CAST(0.10 AS Decimal(18, 2)), 8, NULL)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (28, N'学术与研究水平', CAST(0.10 AS Decimal(18, 2)), 8, NULL)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (29, N'参加教研活动', CAST(0.10 AS Decimal(18, 2)), 8, NULL)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (30, N'概念的讲解', CAST(0.15 AS Decimal(18, 2)), 8, 25)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (31, N'重点和难点', CAST(0.15 AS Decimal(18, 2)), 8, 25)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (32, N'逻辑性、条理性', CAST(0.10 AS Decimal(18, 2)), 8, 25)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (33, N'趣味性、生动性', CAST(0.10 AS Decimal(18, 2)), 8, 25)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (34, N'板书', CAST(0.05 AS Decimal(18, 2)), 8, 25)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (35, N'能力培养', CAST(0.15 AS Decimal(18, 2)), 8, 25)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (36, N'理论联系实际', CAST(0.10 AS Decimal(18, 2)), 8, 25)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (37, N'辅导（阅读指导）', CAST(0.10 AS Decimal(18, 2)), 8, 25)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (38, N'作业与批改', CAST(0.10 AS Decimal(18, 2)), 8, 25)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (39, N'教学工作量', CAST(0.75 AS Decimal(18, 2)), 7, 62)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (40, N'社会工作量', CAST(0.15 AS Decimal(18, 2)), 7, 62)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (41, N'任课班级', CAST(0.10 AS Decimal(18, 2)), 7, 62)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (42, N'工作态度', CAST(0.40 AS Decimal(18, 2)), 7, 63)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (43, N'接受任务态度', CAST(0.10 AS Decimal(18, 2)), 7, 42)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (44, N'教学常规', CAST(0.90 AS Decimal(18, 2)), 7, 42)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (45, N'授课计划制定', CAST(0.15 AS Decimal(18, 2)), 7, 44)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (46, N'教案首页', CAST(0.15 AS Decimal(18, 2)), 7, 44)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (47, N'备课余量', CAST(0.15 AS Decimal(18, 2)), 7, 44)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (48, N'教学日志的填写', CAST(0.15 AS Decimal(18, 2)), 7, 44)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (49, N'教学表格的填写', CAST(0.15 AS Decimal(18, 2)), 7, 44)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (50, N'辅导、作业', CAST(0.15 AS Decimal(18, 2)), 7, 44)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (51, N'教学秩序的掌握', CAST(0.20 AS Decimal(18, 2)), 7, 44)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (52, N'学术与研究水平', CAST(0.15 AS Decimal(18, 2)), 7, 63)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (53, N'职   称', CAST(0.10 AS Decimal(18, 2)), 7, 52)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (54, N'运用新知识、新技术能力', CAST(0.40 AS Decimal(18, 2)), 7, 52)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (55, N'论文撰写、教材编写能力', CAST(0.50 AS Decimal(18, 2)), 7, 52)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (56, N'完成任务情况', CAST(0.05 AS Decimal(18, 2)), 7, 63)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (57, N'教学水平变化', CAST(0.05 AS Decimal(18, 2)), 7, 63)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (58, N'教学（效果）反映', CAST(0.05 AS Decimal(18, 2)), 7, 63)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (59, N'能力培养', CAST(0.10 AS Decimal(18, 2)), 7, 63)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (60, N'汲取新信息技术情况', CAST(0.05 AS Decimal(18, 2)), 7, 63)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (61, N'考试命题', CAST(0.05 AS Decimal(18, 2)), 7, 63)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (62, N'量考核', CAST(0.30 AS Decimal(18, 2)), 7, NULL)
INSERT [dbo].[TempTopic] ([ID], [Name], [Proportion], [TempPaperTypeID], [ParentID]) VALUES (63, N'质考核', CAST(0.70 AS Decimal(18, 2)), 7, NULL)
SET IDENTITY_INSERT [dbo].[TempTopic] OFF
/****** Object:  Table [dbo].[TempSelects]    Script Date: 07/01/2016 08:41:34 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TempSelects](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[Number] [nvarchar](50) NOT NULL,
	[Proportion] [decimal](18, 2) NOT NULL,
	[TempTopicID] [int] NOT NULL,
 CONSTRAINT [PK_TempSelects] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[TempSelects] ON
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (1, N'语言精练，深入浅出，讲解准确', N'A', CAST(1.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (3, N'讲解清晰，容易接受', N'B', CAST(0.75 AS Decimal(18, 2)), 1)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (4, N'讲解基本准确，但不易接受', N'C', CAST(0.50 AS Decimal(18, 2)), 1)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (5, N'概念紊乱，时有差错', N'D', CAST(0.25 AS Decimal(18, 2)), 1)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (6, N'重点突出，讲清难点，举一反三', N'A', CAST(1.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (7, N'能把握重点、难点，但讲解不够明确', N'B', CAST(0.75 AS Decimal(18, 2)), 2)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (8, N'重点不明显，难点讲不透', N'C', CAST(0.50 AS Decimal(18, 2)), 2)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (9, N'重点一言而过，难点草率了事', N'D', CAST(0.25 AS Decimal(18, 2)), 2)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (10, N'层次分明，融会贯通', N'A', CAST(1.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (11, N'条目较清楚，有分析归纳', N'B', CAST(0.75 AS Decimal(18, 2)), 3)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (12, N'平淡叙述，缺乏连贯性', N'C', CAST(0.50 AS Decimal(18, 2)), 3)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (13, N'杂乱无章，前后矛盾', N'D', CAST(0.25 AS Decimal(18, 2)), 3)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (14, N'讲解方法新颖，举例生动，有吸引力', N'A', CAST(1.00 AS Decimal(18, 2)), 4)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (15, N'讲解较熟练，语言通俗', N'B', CAST(0.75 AS Decimal(18, 2)), 4)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (16, N'讲解平淡，语言单调', N'C', CAST(0.50 AS Decimal(18, 2)), 4)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (17, N'讲解生疏，远离课题，语言枯燥', N'D', CAST(0.25 AS Decimal(18, 2)), 4)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (20, N'简繁适度，清楚醒目', N'A', CAST(1.00 AS Decimal(18, 2)), 5)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (21, N'条目明白，书写整洁', N'B', CAST(0.75 AS Decimal(18, 2)), 5)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (22, N'布局较差，详略失当', N'C', CAST(0.50 AS Decimal(18, 2)), 5)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (23, N'次序凌乱，书写潦草', N'D', CAST(0.25 AS Decimal(18, 2)), 5)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (24, N'辅导及时、并指导课外阅读', N'A', CAST(1.00 AS Decimal(18, 2)), 9)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (25, N'定期辅导，并布置课外阅读', N'B', CAST(0.75 AS Decimal(18, 2)), 9)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (26, N'辅导较少', N'C', CAST(0.50 AS Decimal(18, 2)), 9)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (27, N'没有辅导', N'D', CAST(0.25 AS Decimal(18, 2)), 9)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (28, N'选题得当，批改及时，注意讲评', N'A', CAST(1.00 AS Decimal(18, 2)), 10)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (29, N'作业适量，批改及时', N'B', CAST(0.75 AS Decimal(18, 2)), 10)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (30, N'作业量时轻时重，批改不够及时', N'C', CAST(0.50 AS Decimal(18, 2)), 10)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (31, N'选题随便，批改马虎', N'D', CAST(0.25 AS Decimal(18, 2)), 10)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (32, N'思路开阔，鼓励创新，注意能力培养、效果明显', N'A', CAST(1.00 AS Decimal(18, 2)), 11)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (33, N'注意学生能力培养，并在教学中有所体现', N'B', CAST(0.75 AS Decimal(18, 2)), 11)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (34, N'能提出能力培养的要求，但缺乏具体的办法', N'C', CAST(0.50 AS Decimal(18, 2)), 11)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (35, N'忽视能力培养，单纯灌输书本知识', N'D', CAST(0.25 AS Decimal(18, 2)), 11)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (36, N'全面关心学生，经常接触学生，亲切、严格', N'A', CAST(1.00 AS Decimal(18, 2)), 12)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (37, N'关心学生的学业，引导学生学好本门课程', N'B', CAST(0.75 AS Decimal(18, 2)), 12)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (39, N'单纯完成上课任务，与同学接触较少', N'C', CAST(0.50 AS Decimal(18, 2)), 12)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (40, N'对学生漠不关心，放任自流', N'D', CAST(0.25 AS Decimal(18, 2)), 12)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (41, N'严于律己，以身作则，堪称楷模', N'A', CAST(1.00 AS Decimal(18, 2)), 13)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (42, N'举止文明，待人热情', N'B', CAST(0.75 AS Decimal(18, 2)), 13)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (43, N'注意礼貌，待人和气', N'C', CAST(0.50 AS Decimal(18, 2)), 13)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (44, N'要求不严，言谈失当', N'D', CAST(0.25 AS Decimal(18, 2)), 13)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (45, N'教学组织安排得当，气氛活跃，纪律良好', N'A', CAST(1.00 AS Decimal(18, 2)), 16)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (46, N'注意学生动态，教学有条不紊', N'B', CAST(0.75 AS Decimal(18, 2)), 16)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (47, N'忽视教学步骤，师生双边活动较差', N'C', CAST(0.50 AS Decimal(18, 2)), 16)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (48, N'只顾自己讲，不管学生情况', N'D', CAST(0.25 AS Decimal(18, 2)), 16)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (49, N'切合教学大纲要求与实际，内容组织科学严密', N'A', CAST(1.00 AS Decimal(18, 2)), 17)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (50, N'符合教学大纲要求，内容正确', N'B', CAST(0.75 AS Decimal(18, 2)), 17)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (51, N'基本达到教学大纲要求，内容偶有差错', N'C', CAST(0.50 AS Decimal(18, 2)), 17)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (52, N'降低教学标准，内容时有差错', N'D', CAST(0.25 AS Decimal(18, 2)), 17)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (53, N'语言精练，深入浅出，讲解准确', N'A', CAST(1.00 AS Decimal(18, 2)), 18)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (54, N'讲解清晰，容易接受', N'B', CAST(0.75 AS Decimal(18, 2)), 18)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (55, N'讲解基本准确，但不易接受', N'C', CAST(0.50 AS Decimal(18, 2)), 18)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (56, N'概念紊乱，时有差错', N'D', CAST(0.25 AS Decimal(18, 2)), 18)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (57, N'重点突出，讲清难点，举一反三', N'A', CAST(1.00 AS Decimal(18, 2)), 19)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (58, N'能把握重点、难点，但讲解不够明确', N'B', CAST(0.75 AS Decimal(18, 2)), 19)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (59, N'重点不明显，难点讲不透', N'C', CAST(0.50 AS Decimal(18, 2)), 19)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (60, N'重点一言而过，难点草率了事', N'D', CAST(0.25 AS Decimal(18, 2)), 19)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (61, N'讲解方法新颖，举例生动，有吸引力', N'A', CAST(1.00 AS Decimal(18, 2)), 20)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (62, N'讲解较熟练，语言通俗', N'B', CAST(0.75 AS Decimal(18, 2)), 20)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (63, N'讲解平淡，语言单调', N'C', CAST(0.50 AS Decimal(18, 2)), 20)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (64, N'讲解生疏，远离课题，语言枯燥', N'D', CAST(0.25 AS Decimal(18, 2)), 20)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (65, N'教具使用合理，板书清晰，示教形象、直观', N'A', CAST(1.00 AS Decimal(18, 2)), 21)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (66, N'注意直观教学，板书条目明白、整洁', N'B', CAST(0.75 AS Decimal(18, 2)), 21)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (67, N'教具使用失当，板书布局较差', N'C', CAST(0.50 AS Decimal(18, 2)), 21)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (68, N'忽视直观教学，板书凌乱', N'D', CAST(0.25 AS Decimal(18, 2)), 21)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (69, N'运用各种方法，调动学生积极思维，注重能力培养', N'A', CAST(1.00 AS Decimal(18, 2)), 22)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (70, N'注意调动学生思维和能力培养，方法和效果欠佳', N'B', CAST(0.75 AS Decimal(18, 2)), 22)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (71, N'缺乏启发式方法和能力培养手段', N'C', CAST(0.50 AS Decimal(18, 2)), 22)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (72, N'照本宣科，不搞启发式教学', N'D', CAST(0.25 AS Decimal(18, 2)), 22)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (73, N'理论与实例、实验、实际密切结合', N'A', CAST(1.00 AS Decimal(18, 2)), 23)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (74, N'理论能结合实际进行教学', N'B', CAST(0.75 AS Decimal(18, 2)), 23)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (75, N'理论与实际结合不理想', N'C', CAST(0.50 AS Decimal(18, 2)), 23)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (76, N'理论与实际严重脱节', N'D', CAST(0.25 AS Decimal(18, 2)), 23)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (77, N'科学的处理教材，繁简增删适当，收事半功倍之效', N'A', CAST(1.00 AS Decimal(18, 2)), 24)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (78, N'对教材的处理，有助于学生理解和掌握内在联系', N'B', CAST(0.75 AS Decimal(18, 2)), 24)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (79, N'基本按照教材讲课，没有给学生什么新东西', N'C', CAST(0.50 AS Decimal(18, 2)), 24)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (80, N'对教材毫无处理，完全重复课本内容', N'D', CAST(0.25 AS Decimal(18, 2)), 24)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (81, N'语言精练，深入浅出，讲解准确', N'A', CAST(1.00 AS Decimal(18, 2)), 30)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (82, N'讲解清晰，容易接受', N'B', CAST(0.75 AS Decimal(18, 2)), 30)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (83, N'讲解基本准确，但不易接受', N'C', CAST(0.50 AS Decimal(18, 2)), 30)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (84, N'概念紊乱，时有差错', N'D', CAST(0.25 AS Decimal(18, 2)), 30)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (85, N'重点突出，讲清难点，举一反三', N'A', CAST(1.00 AS Decimal(18, 2)), 31)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (86, N'能把握重点、难点，但讲解不够明确', N'B', CAST(0.75 AS Decimal(18, 2)), 31)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (87, N'重点不明显，难点讲不透', N'C', CAST(0.50 AS Decimal(18, 2)), 31)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (88, N'重点一言而过，难点草率了事', N'D', CAST(0.25 AS Decimal(18, 2)), 31)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (89, N'层次分明，融会贯通', N'A', CAST(1.00 AS Decimal(18, 2)), 32)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (90, N'条目较清楚，有分析归纳', N'B', CAST(0.75 AS Decimal(18, 2)), 32)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (91, N'平淡叙述，缺乏连贯性', N'C', CAST(0.50 AS Decimal(18, 2)), 32)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (92, N'杂乱无章，前后矛盾', N'D', CAST(0.25 AS Decimal(18, 2)), 32)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (93, N'讲解方法新颖，举例生动，有吸引力', N'A', CAST(1.00 AS Decimal(18, 2)), 33)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (94, N'讲解较熟练，语言通俗', N'B', CAST(0.75 AS Decimal(18, 2)), 33)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (95, N'讲解平淡，语言单调', N'C', CAST(0.50 AS Decimal(18, 2)), 33)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (96, N'讲解生疏，远离课题，语言枯燥', N'D', CAST(0.25 AS Decimal(18, 2)), 33)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (97, N'简繁适度，清楚醒目', N'A', CAST(1.00 AS Decimal(18, 2)), 34)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (98, N'条目明白，书写整洁', N'B', CAST(0.75 AS Decimal(18, 2)), 34)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (99, N'布局较差，详略适当', N'C', CAST(0.50 AS Decimal(18, 2)), 34)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (100, N'次序凌乱，书写潦草', N'D', CAST(0.25 AS Decimal(18, 2)), 34)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (101, N'思路开阔，鼓励创新，注意能力培养、效果明显', N'A', CAST(1.00 AS Decimal(18, 2)), 35)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (102, N'注意学生能力培养，并在教学中有所体现', N'B', CAST(0.75 AS Decimal(18, 2)), 35)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (103, N'能提出能力培养的要求，但缺乏具体的办法', N'C', CAST(0.50 AS Decimal(18, 2)), 35)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (104, N'忽视能力培养，单纯灌输书本知识', N'D', CAST(0.25 AS Decimal(18, 2)), 35)
GO
print 'Processed 100 total records'
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (105, N'理论紧密联系当前实际', N'A', CAST(1.00 AS Decimal(18, 2)), 36)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (106, N'理论能联系具体事例', N'B', CAST(0.75 AS Decimal(18, 2)), 36)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (107, N'联系实际较勉强', N'C', CAST(0.50 AS Decimal(18, 2)), 36)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (108, N'只有理论没有实际', N'D', CAST(0.25 AS Decimal(18, 2)), 36)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (109, N'辅导及时、并指导课外阅读', N'A', CAST(1.00 AS Decimal(18, 2)), 37)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (110, N'定期辅导，并布置课外阅读', N'B', CAST(0.75 AS Decimal(18, 2)), 37)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (111, N'辅导较少', N'C', CAST(0.50 AS Decimal(18, 2)), 37)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (112, N'没有辅导', N'D', CAST(0.25 AS Decimal(18, 2)), 37)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (113, N'选题得当，批改及时，注意讲评', N'A', CAST(1.00 AS Decimal(18, 2)), 38)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (114, N'作业适量，批改及时', N'B', CAST(0.75 AS Decimal(18, 2)), 38)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (115, N'作业量时轻时重，批改不够及时', N'C', CAST(0.50 AS Decimal(18, 2)), 38)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (116, N'选题随便，批改马虎', N'D', CAST(0.25 AS Decimal(18, 2)), 38)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (117, N'勇挑重担', N'A', CAST(1.00 AS Decimal(18, 2)), 26)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (118, N'主动承担', N'B', CAST(0.75 AS Decimal(18, 2)), 26)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (119, N'一    般', N'C', CAST(0.50 AS Decimal(18, 2)), 26)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (120, N'较    差', N'D', CAST(0.25 AS Decimal(18, 2)), 26)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (121, N'及时在教学中体现', N'A', CAST(1.00 AS Decimal(18, 2)), 27)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (122, N'教学中注意联系新信息新技术', N'B', CAST(0.75 AS Decimal(18, 2)), 27)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (123, N'教学中联系新信息新技术不够', N'C', CAST(0.50 AS Decimal(18, 2)), 27)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (124, N'教学中根本不联系新信息新技术', N'D', CAST(0.25 AS Decimal(18, 2)), 27)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (125, N'开出有一定水平的选修课、讲座、院级公开课或指导兴趣小组有成效', N'A', CAST(1.00 AS Decimal(18, 2)), 28)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (126, N'开出选修课、讲座、系内公开课或指导兴趣小组活动', N'B', CAST(0.75 AS Decimal(18, 2)), 28)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (127, N'承担室内研究课、协助开出讲座或配合指导学生课外活动', N'C', CAST(0.50 AS Decimal(18, 2)), 28)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (128, N'无', N'D', CAST(0.25 AS Decimal(18, 2)), 28)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (129, N'出主意、提建议、协助室主任搞好教研活动', N'A', CAST(1.00 AS Decimal(18, 2)), 29)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (130, N'积极参加讨论', N'B', CAST(0.75 AS Decimal(18, 2)), 29)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (131, N'能按时参加活动', N'C', CAST(0.50 AS Decimal(18, 2)), 29)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (132, N'参加活动不正常', N'D', CAST(0.25 AS Decimal(18, 2)), 29)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (133, N'超工作量', N'A', CAST(1.00 AS Decimal(18, 2)), 39)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (134, N'满工作量', N'B', CAST(0.75 AS Decimal(18, 2)), 39)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (135, N'接近完成（70%）', N'C', CAST(0.50 AS Decimal(18, 2)), 39)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (136, N'差距较大', N'D', CAST(0.25 AS Decimal(18, 2)), 39)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (137, N'担任教研室主任', N'A', CAST(1.00 AS Decimal(18, 2)), 40)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (138, N'担任办公室、工作室主任', N'B', CAST(0.75 AS Decimal(18, 2)), 40)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (139, N'担任专业班主任（辅导员）等其他工作', N'C', CAST(0.50 AS Decimal(18, 2)), 40)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (140, N'未承担', N'D', CAST(0.25 AS Decimal(18, 2)), 40)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (141, N'任4个班级以上，或双进度', N'A', CAST(1.00 AS Decimal(18, 2)), 41)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (142, N'任3个班级', N'B', CAST(0.75 AS Decimal(18, 2)), 41)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (143, N'任2个班级', N'C', CAST(0.50 AS Decimal(18, 2)), 41)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (144, N'任1个班级', N'D', CAST(0.25 AS Decimal(18, 2)), 41)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (145, N'勇挑重担', N'A', CAST(1.00 AS Decimal(18, 2)), 43)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (146, N'主动承担', N'B', CAST(0.75 AS Decimal(18, 2)), 43)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (147, N'一    般', N'C', CAST(0.50 AS Decimal(18, 2)), 43)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (148, N'较    差', N'D', CAST(0.25 AS Decimal(18, 2)), 43)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (149, N'清   晰', N'A', CAST(1.00 AS Decimal(18, 2)), 45)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (150, N'完   整', N'B', CAST(0.75 AS Decimal(18, 2)), 45)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (151, N'一   般', N'C', CAST(0.50 AS Decimal(18, 2)), 45)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (152, N'潦   草', N'D', CAST(0.25 AS Decimal(18, 2)), 45)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (153, N'完   整', N'A', CAST(1.00 AS Decimal(18, 2)), 46)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (154, N'缺一项', N'B', CAST(0.75 AS Decimal(18, 2)), 46)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (155, N'缺二项', N'C', CAST(0.50 AS Decimal(18, 2)), 46)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (156, N'缺二项以上', N'D', CAST(0.25 AS Decimal(18, 2)), 46)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (157, N'一周以上', N'A', CAST(1.00 AS Decimal(18, 2)), 47)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (158, N'一   周', N'B', CAST(0.75 AS Decimal(18, 2)), 47)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (159, N'接近一周', N'C', CAST(0.50 AS Decimal(18, 2)), 47)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (160, N'没有余量', N'D', CAST(0.25 AS Decimal(18, 2)), 47)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (161, N'清楚、准确', N'A', CAST(1.00 AS Decimal(18, 2)), 48)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (162, N'正确、及时', N'B', CAST(0.75 AS Decimal(18, 2)), 48)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (163, N'填写缺项', N'C', CAST(0.50 AS Decimal(18, 2)), 48)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (164, N'填写马虎', N'D', CAST(0.25 AS Decimal(18, 2)), 48)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (165, N'认真且有见解', N'A', CAST(1.00 AS Decimal(18, 2)), 49)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (166, N'详尽、整洁', N'B', CAST(0.75 AS Decimal(18, 2)), 49)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (167, N'正   确', N'C', CAST(0.50 AS Decimal(18, 2)), 49)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (168, N'潦草、拖拉', N'D', CAST(0.25 AS Decimal(18, 2)), 49)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (169, N'每周有辅导', N'A', CAST(1.00 AS Decimal(18, 2)), 50)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (170, N'辅导较经常', N'B', CAST(0.75 AS Decimal(18, 2)), 50)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (171, N'辅导较少', N'C', CAST(0.50 AS Decimal(18, 2)), 50)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (172, N'不辅导', N'D', CAST(0.25 AS Decimal(18, 2)), 50)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (173, N'严   格', N'A', CAST(1.00 AS Decimal(18, 2)), 51)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (174, N'较严格', N'B', CAST(0.75 AS Decimal(18, 2)), 51)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (175, N'一   般', N'C', CAST(0.50 AS Decimal(18, 2)), 51)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (176, N'出现教学事故', N'D', CAST(0.25 AS Decimal(18, 2)), 51)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (177, N'副教授', N'A', CAST(1.00 AS Decimal(18, 2)), 53)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (178, N'讲师', N'B', CAST(0.75 AS Decimal(18, 2)), 53)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (179, N'助教', N'C', CAST(0.50 AS Decimal(18, 2)), 53)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (180, N'未评职称', N'D', CAST(0.25 AS Decimal(18, 2)), 53)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (181, N'开出有一定水平的选修课、讲座、院级公开课或指导兴趣小组有成效', N'A', CAST(1.00 AS Decimal(18, 2)), 54)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (182, N'开出选修课、讲座、科内公开课或指导兴趣小组活动', N'B', CAST(0.75 AS Decimal(18, 2)), 54)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (183, N'承担室内研究课、协助开出讲座或配合指导学生课外活动', N'C', CAST(0.50 AS Decimal(18, 2)), 54)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (184, N'无', N'D', CAST(0.25 AS Decimal(18, 2)), 54)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (185, N'在核心刊物上发表、教材正式出版（三年内）', N'A', CAST(1.00 AS Decimal(18, 2)), 55)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (186, N'在公开刊物上发表，教材兄弟院校使用（二年内）', N'B', CAST(0.75 AS Decimal(18, 2)), 55)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (187, N'在内部刊上发表，教材在校内使用（一年内）', N'C', CAST(0.50 AS Decimal(18, 2)), 55)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (188, N'无', N'D', CAST(0.25 AS Decimal(18, 2)), 55)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (189, N'高质量完成', N'A', CAST(1.00 AS Decimal(18, 2)), 56)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (190, N'及时完成', N'B', CAST(0.75 AS Decimal(18, 2)), 56)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (191, N'基本完成', N'C', CAST(0.50 AS Decimal(18, 2)), 56)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (192, N'完不成', N'D', CAST(0.25 AS Decimal(18, 2)), 56)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (193, N'显著提高', N'A', CAST(1.00 AS Decimal(18, 2)), 57)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (194, N'有所提高', N'B', CAST(0.75 AS Decimal(18, 2)), 57)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (195, N'变化很小', N'C', CAST(0.50 AS Decimal(18, 2)), 57)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (196, N'下   降', N'D', CAST(0.25 AS Decimal(18, 2)), 57)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (197, N'优   秀', N'A', CAST(1.00 AS Decimal(18, 2)), 58)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (198, N'良   好', N'B', CAST(0.75 AS Decimal(18, 2)), 58)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (199, N'一   般', N'C', CAST(0.50 AS Decimal(18, 2)), 58)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (200, N'较差', N'D', CAST(0.25 AS Decimal(18, 2)), 58)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (201, N'思路开阔，鼓励创新，注意能力培养、效果明显', N'A', CAST(1.00 AS Decimal(18, 2)), 59)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (202, N'注意学生能力培养，并在教学中有所体现', N'B', CAST(0.75 AS Decimal(18, 2)), 59)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (203, N'能提出能力培养的要求，但缺乏具体的办法', N'C', CAST(0.50 AS Decimal(18, 2)), 59)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (204, N'忽视能力培养，单纯灌输书本知识', N'D', CAST(0.25 AS Decimal(18, 2)), 59)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (205, N'及时在教学中体现', N'A', CAST(1.00 AS Decimal(18, 2)), 60)
GO
print 'Processed 200 total records'
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (206, N'教学中注意联系新信息新技术', N'B', CAST(0.75 AS Decimal(18, 2)), 60)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (207, N'教学中联系新信息新技术不够', N'C', CAST(0.50 AS Decimal(18, 2)), 60)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (208, N'教学中根本不联系新信息新技术', N'D', CAST(0.25 AS Decimal(18, 2)), 60)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (209, N'试题的水平、题型、题量、分布、覆盖面符合教学目标的要求；难度适中，区分度适当；表述准确、严密、简洁。', N'A', CAST(1.00 AS Decimal(18, 2)), 61)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (210, N'有2项不符合要求', N'B', CAST(0.75 AS Decimal(18, 2)), 61)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (211, N'有3项不符合要求', N'C', CAST(0.50 AS Decimal(18, 2)), 61)
INSERT [dbo].[TempSelects] ([ID], [Name], [Number], [Proportion], [TempTopicID]) VALUES (212, N'有3项以上（不含3项）不符合要求', N'D', CAST(0.25 AS Decimal(18, 2)), 61)
SET IDENTITY_INSERT [dbo].[TempSelects] OFF
/****** Object:  ForeignKey [FK_Function_Function]    Script Date: 07/01/2016 08:41:34 ******/
ALTER TABLE [dbo].[Function]  WITH CHECK ADD  CONSTRAINT [FK_Function_Function] FOREIGN KEY([ParentID])
REFERENCES [dbo].[Function] ([ID])
GO
ALTER TABLE [dbo].[Function] CHECK CONSTRAINT [FK_Function_Function]
GO
/****** Object:  ForeignKey [FK_Class_College]    Script Date: 07/01/2016 08:41:34 ******/
ALTER TABLE [dbo].[UserClass]  WITH CHECK ADD  CONSTRAINT [FK_Class_College] FOREIGN KEY([CollegeID])
REFERENCES [dbo].[College] ([ID])
GO
ALTER TABLE [dbo].[UserClass] CHECK CONSTRAINT [FK_Class_College]
GO
/****** Object:  ForeignKey [FK_User_Role_Role]    Script Date: 07/01/2016 08:41:34 ******/
ALTER TABLE [dbo].[User_Role]  WITH CHECK ADD  CONSTRAINT [FK_User_Role_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[User_Role] CHECK CONSTRAINT [FK_User_Role_Role]
GO
/****** Object:  ForeignKey [FK_User_Role_User]    Script Date: 07/01/2016 08:41:34 ******/
ALTER TABLE [dbo].[User_Role]  WITH CHECK ADD  CONSTRAINT [FK_User_Role_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[User_Role] CHECK CONSTRAINT [FK_User_Role_User]
GO
/****** Object:  ForeignKey [FK_PaperType_Role]    Script Date: 07/01/2016 08:41:34 ******/
ALTER TABLE [dbo].[TempPaperType]  WITH CHECK ADD  CONSTRAINT [FK_PaperType_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[TempPaperType] CHECK CONSTRAINT [FK_PaperType_Role]
GO
/****** Object:  ForeignKey [FK_Teacher_Users]    Script Date: 07/01/2016 08:41:34 ******/
ALTER TABLE [dbo].[Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Teacher_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Teacher] CHECK CONSTRAINT [FK_Teacher_Users]
GO
/****** Object:  ForeignKey [FK_Role_Function_Function]    Script Date: 07/01/2016 08:41:34 ******/
ALTER TABLE [dbo].[Role_Function]  WITH CHECK ADD  CONSTRAINT [FK_Role_Function_Function] FOREIGN KEY([FunctionID])
REFERENCES [dbo].[Function] ([ID])
GO
ALTER TABLE [dbo].[Role_Function] CHECK CONSTRAINT [FK_Role_Function_Function]
GO
/****** Object:  ForeignKey [FK_Role_Function_Role]    Script Date: 07/01/2016 08:41:34 ******/
ALTER TABLE [dbo].[Role_Function]  WITH CHECK ADD  CONSTRAINT [FK_Role_Function_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([ID])
GO
ALTER TABLE [dbo].[Role_Function] CHECK CONSTRAINT [FK_Role_Function_Role]
GO
/****** Object:  ForeignKey [FK_Curriculum_Teacher_Curriculum]    Script Date: 07/01/2016 08:41:34 ******/
ALTER TABLE [dbo].[Curriculum_Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Curriculum_Teacher_Curriculum] FOREIGN KEY([CurriculumID])
REFERENCES [dbo].[Curriculum] ([ID])
GO
ALTER TABLE [dbo].[Curriculum_Teacher] CHECK CONSTRAINT [FK_Curriculum_Teacher_Curriculum]
GO
/****** Object:  ForeignKey [FK_Curriculum_Teacher_Teacher]    Script Date: 07/01/2016 08:41:34 ******/
ALTER TABLE [dbo].[Curriculum_Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Curriculum_Teacher_Teacher] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teacher] ([ID])
GO
ALTER TABLE [dbo].[Curriculum_Teacher] CHECK CONSTRAINT [FK_Curriculum_Teacher_Teacher]
GO
/****** Object:  ForeignKey [FK_Student_UserClass]    Script Date: 07/01/2016 08:41:34 ******/
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_UserClass] FOREIGN KEY([ClassID])
REFERENCES [dbo].[UserClass] ([ID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_UserClass]
GO
/****** Object:  ForeignKey [FK_Student_Users]    Script Date: 07/01/2016 08:41:34 ******/
ALTER TABLE [dbo].[Student]  WITH CHECK ADD  CONSTRAINT [FK_Student_Users] FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([ID])
GO
ALTER TABLE [dbo].[Student] CHECK CONSTRAINT [FK_Student_Users]
GO
/****** Object:  ForeignKey [FK_QManagement_TempPaperType]    Script Date: 07/01/2016 08:41:34 ******/
ALTER TABLE [dbo].[QManagement]  WITH CHECK ADD  CONSTRAINT [FK_QManagement_TempPaperType] FOREIGN KEY([TempPaperTypeID])
REFERENCES [dbo].[TempPaperType] ([ID])
GO
ALTER TABLE [dbo].[QManagement] CHECK CONSTRAINT [FK_QManagement_TempPaperType]
GO
/****** Object:  ForeignKey [FK_Class_Teacher_Teacher]    Script Date: 07/01/2016 08:41:34 ******/
ALTER TABLE [dbo].[Class_Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Class_Teacher_Teacher] FOREIGN KEY([TeacherID])
REFERENCES [dbo].[Teacher] ([ID])
GO
ALTER TABLE [dbo].[Class_Teacher] CHECK CONSTRAINT [FK_Class_Teacher_Teacher]
GO
/****** Object:  ForeignKey [FK_Class_Teacher_UserClass]    Script Date: 07/01/2016 08:41:34 ******/
ALTER TABLE [dbo].[Class_Teacher]  WITH CHECK ADD  CONSTRAINT [FK_Class_Teacher_UserClass] FOREIGN KEY([ClassID])
REFERENCES [dbo].[UserClass] ([ID])
GO
ALTER TABLE [dbo].[Class_Teacher] CHECK CONSTRAINT [FK_Class_Teacher_UserClass]
GO
/****** Object:  ForeignKey [FK_Class_Curriculum_Curriculum]    Script Date: 07/01/2016 08:41:34 ******/
ALTER TABLE [dbo].[Class_Curriculum]  WITH CHECK ADD  CONSTRAINT [FK_Class_Curriculum_Curriculum] FOREIGN KEY([CurriculumID])
REFERENCES [dbo].[Curriculum] ([ID])
GO
ALTER TABLE [dbo].[Class_Curriculum] CHECK CONSTRAINT [FK_Class_Curriculum_Curriculum]
GO
/****** Object:  ForeignKey [FK_Class_Curriculum_UserClass]    Script Date: 07/01/2016 08:41:34 ******/
ALTER TABLE [dbo].[Class_Curriculum]  WITH CHECK ADD  CONSTRAINT [FK_Class_Curriculum_UserClass] FOREIGN KEY([ClassID])
REFERENCES [dbo].[UserClass] ([ID])
GO
ALTER TABLE [dbo].[Class_Curriculum] CHECK CONSTRAINT [FK_Class_Curriculum_UserClass]
GO
/****** Object:  ForeignKey [FK_TempTopic_TempPaperType]    Script Date: 07/01/2016 08:41:34 ******/
ALTER TABLE [dbo].[TempTopic]  WITH CHECK ADD  CONSTRAINT [FK_TempTopic_TempPaperType] FOREIGN KEY([TempPaperTypeID])
REFERENCES [dbo].[TempPaperType] ([ID])
GO
ALTER TABLE [dbo].[TempTopic] CHECK CONSTRAINT [FK_TempTopic_TempPaperType]
GO
/****** Object:  ForeignKey [FK_TempTopic_TempTopic]    Script Date: 07/01/2016 08:41:34 ******/
ALTER TABLE [dbo].[TempTopic]  WITH CHECK ADD  CONSTRAINT [FK_TempTopic_TempTopic] FOREIGN KEY([ParentID])
REFERENCES [dbo].[TempTopic] ([ID])
GO
ALTER TABLE [dbo].[TempTopic] CHECK CONSTRAINT [FK_TempTopic_TempTopic]
GO
/****** Object:  ForeignKey [FK_TempSelects_TempTopic]    Script Date: 07/01/2016 08:41:34 ******/
ALTER TABLE [dbo].[TempSelects]  WITH CHECK ADD  CONSTRAINT [FK_TempSelects_TempTopic] FOREIGN KEY([TempTopicID])
REFERENCES [dbo].[TempTopic] ([ID])
GO
ALTER TABLE [dbo].[TempSelects] CHECK CONSTRAINT [FK_TempSelects_TempTopic]
GO
