USE [master]
GO
/****** Object:  Database [AssignmentDB]    Script Date: 24/07/2025 1:43:53 CH ******/
CREATE DATABASE [AssignmentDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'AssignmentDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\AssignmentDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'AssignmentDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\AssignmentDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [AssignmentDB] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [AssignmentDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [AssignmentDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [AssignmentDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [AssignmentDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [AssignmentDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [AssignmentDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [AssignmentDB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [AssignmentDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [AssignmentDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [AssignmentDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [AssignmentDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [AssignmentDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [AssignmentDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [AssignmentDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [AssignmentDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [AssignmentDB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [AssignmentDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [AssignmentDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [AssignmentDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [AssignmentDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [AssignmentDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [AssignmentDB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [AssignmentDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [AssignmentDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [AssignmentDB] SET  MULTI_USER 
GO
ALTER DATABASE [AssignmentDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [AssignmentDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [AssignmentDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [AssignmentDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [AssignmentDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [AssignmentDB] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [AssignmentDB] SET QUERY_STORE = ON
GO
ALTER DATABASE [AssignmentDB] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [AssignmentDB]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 24/07/2025 1:43:54 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[DepartmentID] [int] IDENTITY(1,1) NOT NULL,
	[DepartmentName] [varchar](100) NOT NULL,
	[ManagerID] [int] NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Feature]    Script Date: 24/07/2025 1:43:54 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feature](
	[FeatureID] [int] IDENTITY(1,1) NOT NULL,
	[FeatureURL] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Feature] PRIMARY KEY CLUSTERED 
(
	[FeatureID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeatureRole]    Script Date: 24/07/2025 1:43:54 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeatureRole](
	[FeatureID] [int] NOT NULL,
	[RoleID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeaveRequest]    Script Date: 24/07/2025 1:43:54 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveRequest](
	[RequestID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[FromDate] [date] NOT NULL,
	[ToDate] [date] NOT NULL,
	[Reason] [nvarchar](max) NULL,
	[StatusID] [int] NULL,
	[ApprovedBy] [int] NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
 CONSTRAINT [PK_LeaveRequest] PRIMARY KEY CLUSTERED 
(
	[RequestID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LeaveStatus]    Script Date: 24/07/2025 1:43:54 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LeaveStatus](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusName] [varchar](50) NOT NULL,
	[Description] [text] NOT NULL,
 CONSTRAINT [PK_LeaveStatus] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 24/07/2025 1:43:54 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [varchar](50) NOT NULL,
	[Description] [text] NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 24/07/2025 1:43:54 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[PasswordHash] [varchar](255) NOT NULL,
	[FullName] [nvarchar](100) NULL,
	[DepartmentID] [int] NOT NULL,
	[CreatedAt] [datetime] NOT NULL,
	[UpdatedAt] [datetime] NOT NULL,
	[IsActive] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 24/07/2025 1:43:54 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[UserID] [int] NOT NULL,
	[RoleID] [int] NOT NULL
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Department] ON 

INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [ManagerID]) VALUES (9, N'IT', 5)
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [ManagerID]) VALUES (10, N'Marketing', 11)
INSERT [dbo].[Department] ([DepartmentID], [DepartmentName], [ManagerID]) VALUES (11, N'Director', 4)
SET IDENTITY_INSERT [dbo].[Department] OFF
GO
SET IDENTITY_INSERT [dbo].[Feature] ON 

INSERT [dbo].[Feature] ([FeatureID], [FeatureURL]) VALUES (1, N'/LeaveRequest/edit')
INSERT [dbo].[Feature] ([FeatureID], [FeatureURL]) VALUES (2, N'/LeaveRequest/update')
INSERT [dbo].[Feature] ([FeatureID], [FeatureURL]) VALUES (3, N'/LeaveRequest/delete')
INSERT [dbo].[Feature] ([FeatureID], [FeatureURL]) VALUES (4, N'/LeaveRequest/create')
INSERT [dbo].[Feature] ([FeatureID], [FeatureURL]) VALUES (5, N'/LeaveRequest/manage')
INSERT [dbo].[Feature] ([FeatureID], [FeatureURL]) VALUES (6, N'/LeaveRequest/approve')
INSERT [dbo].[Feature] ([FeatureID], [FeatureURL]) VALUES (7, N'/LeaveRequest/reject')
SET IDENTITY_INSERT [dbo].[Feature] OFF
GO
INSERT [dbo].[FeatureRole] ([FeatureID], [RoleID]) VALUES (1, 1)
INSERT [dbo].[FeatureRole] ([FeatureID], [RoleID]) VALUES (1, 2)
INSERT [dbo].[FeatureRole] ([FeatureID], [RoleID]) VALUES (2, 1)
INSERT [dbo].[FeatureRole] ([FeatureID], [RoleID]) VALUES (2, 2)
INSERT [dbo].[FeatureRole] ([FeatureID], [RoleID]) VALUES (3, 1)
INSERT [dbo].[FeatureRole] ([FeatureID], [RoleID]) VALUES (3, 2)
INSERT [dbo].[FeatureRole] ([FeatureID], [RoleID]) VALUES (4, 1)
INSERT [dbo].[FeatureRole] ([FeatureID], [RoleID]) VALUES (4, 2)
INSERT [dbo].[FeatureRole] ([FeatureID], [RoleID]) VALUES (5, 1)
INSERT [dbo].[FeatureRole] ([FeatureID], [RoleID]) VALUES (5, 2)
INSERT [dbo].[FeatureRole] ([FeatureID], [RoleID]) VALUES (6, 1)
INSERT [dbo].[FeatureRole] ([FeatureID], [RoleID]) VALUES (6, 2)
INSERT [dbo].[FeatureRole] ([FeatureID], [RoleID]) VALUES (7, 1)
INSERT [dbo].[FeatureRole] ([FeatureID], [RoleID]) VALUES (7, 2)
GO
SET IDENTITY_INSERT [dbo].[LeaveRequest] ON 

INSERT [dbo].[LeaveRequest] ([RequestID], [UserID], [FromDate], [ToDate], [Reason], [StatusID], [ApprovedBy], [CreatedAt], [UpdatedAt]) VALUES (13, 6, CAST(N'2025-03-06' AS Date), CAST(N'2025-03-27' AS Date), N'đơn của nhân viên 1', 1, 4, CAST(N'2025-03-20T04:12:22.807' AS DateTime), CAST(N'2025-03-20T16:44:38.237' AS DateTime))
INSERT [dbo].[LeaveRequest] ([RequestID], [UserID], [FromDate], [ToDate], [Reason], [StatusID], [ApprovedBy], [CreatedAt], [UpdatedAt]) VALUES (14, 6, CAST(N'2025-03-10' AS Date), CAST(N'2025-03-29' AS Date), N'đơn của nhân viên 2', 1, 4, CAST(N'2025-03-20T04:12:44.830' AS DateTime), CAST(N'2025-03-20T16:44:39.827' AS DateTime))
INSERT [dbo].[LeaveRequest] ([RequestID], [UserID], [FromDate], [ToDate], [Reason], [StatusID], [ApprovedBy], [CreatedAt], [UpdatedAt]) VALUES (15, 6, CAST(N'2025-02-25' AS Date), CAST(N'2025-03-25' AS Date), N'lí do của nhân viên 3', 1, 4, CAST(N'2025-03-20T04:13:51.970' AS DateTime), CAST(N'2025-03-20T16:44:40.923' AS DateTime))
INSERT [dbo].[LeaveRequest] ([RequestID], [UserID], [FromDate], [ToDate], [Reason], [StatusID], [ApprovedBy], [CreatedAt], [UpdatedAt]) VALUES (16, 12, CAST(N'2025-02-26' AS Date), CAST(N'2025-03-26' AS Date), N'lí do nhân viên nữ 1', 2, 4, CAST(N'2025-03-20T04:18:21.560' AS DateTime), CAST(N'2025-03-20T16:44:42.287' AS DateTime))
INSERT [dbo].[LeaveRequest] ([RequestID], [UserID], [FromDate], [ToDate], [Reason], [StatusID], [ApprovedBy], [CreatedAt], [UpdatedAt]) VALUES (17, 12, CAST(N'2025-02-25' AS Date), CAST(N'2025-04-04' AS Date), N'lí do nhân viên nữ 2', 2, 4, CAST(N'2025-03-20T04:18:37.753' AS DateTime), CAST(N'2025-03-20T16:44:41.787' AS DateTime))
INSERT [dbo].[LeaveRequest] ([RequestID], [UserID], [FromDate], [ToDate], [Reason], [StatusID], [ApprovedBy], [CreatedAt], [UpdatedAt]) VALUES (18, 12, CAST(N'2025-02-27' AS Date), CAST(N'2025-04-02' AS Date), N'lí do nhân viên nữ 3', 2, 4, CAST(N'2025-03-20T04:18:48.973' AS DateTime), CAST(N'2025-03-20T16:44:42.853' AS DateTime))
INSERT [dbo].[LeaveRequest] ([RequestID], [UserID], [FromDate], [ToDate], [Reason], [StatusID], [ApprovedBy], [CreatedAt], [UpdatedAt]) VALUES (21, 6, CAST(N'2025-03-14' AS Date), CAST(N'2025-03-27' AS Date), N'lí do của nhân viên B', 1, 5, CAST(N'2025-03-20T23:49:22.190' AS DateTime), CAST(N'2025-03-22T22:15:59.550' AS DateTime))
INSERT [dbo].[LeaveRequest] ([RequestID], [UserID], [FromDate], [ToDate], [Reason], [StatusID], [ApprovedBy], [CreatedAt], [UpdatedAt]) VALUES (22, 6, CAST(N'2025-03-04' AS Date), CAST(N'2025-03-25' AS Date), N'lí do B2', 1, 5, CAST(N'2025-03-20T23:49:36.863' AS DateTime), CAST(N'2025-03-22T22:16:00.523' AS DateTime))
INSERT [dbo].[LeaveRequest] ([RequestID], [UserID], [FromDate], [ToDate], [Reason], [StatusID], [ApprovedBy], [CreatedAt], [UpdatedAt]) VALUES (1027, 4, CAST(N'2025-03-01' AS Date), CAST(N'2025-03-02' AS Date), N'abc', 1, 4, CAST(N'2025-03-23T22:07:31.520' AS DateTime), CAST(N'2025-03-23T22:10:08.703' AS DateTime))
INSERT [dbo].[LeaveRequest] ([RequestID], [UserID], [FromDate], [ToDate], [Reason], [StatusID], [ApprovedBy], [CreatedAt], [UpdatedAt]) VALUES (1028, 12, CAST(N'2025-05-23' AS Date), CAST(N'2025-05-24' AS Date), N'test 1', 2, 4, CAST(N'2025-03-24T07:44:19.647' AS DateTime), CAST(N'2025-03-24T08:33:11.957' AS DateTime))
INSERT [dbo].[LeaveRequest] ([RequestID], [UserID], [FromDate], [ToDate], [Reason], [StatusID], [ApprovedBy], [CreatedAt], [UpdatedAt]) VALUES (1029, 4, CAST(N'2025-08-13' AS Date), CAST(N'2025-08-24' AS Date), N'abc sonnt deptrai', 1, 4, CAST(N'2025-03-24T08:20:33.383' AS DateTime), CAST(N'2025-03-24T08:21:12.427' AS DateTime))
INSERT [dbo].[LeaveRequest] ([RequestID], [UserID], [FromDate], [ToDate], [Reason], [StatusID], [ApprovedBy], [CreatedAt], [UpdatedAt]) VALUES (1030, 15, CAST(N'2025-07-24' AS Date), CAST(N'2025-07-25' AS Date), N'lí do cá nhân', 2, 4, CAST(N'2025-07-23T16:26:02.837' AS DateTime), CAST(N'2025-07-23T21:59:52.567' AS DateTime))
INSERT [dbo].[LeaveRequest] ([RequestID], [UserID], [FromDate], [ToDate], [Reason], [StatusID], [ApprovedBy], [CreatedAt], [UpdatedAt]) VALUES (1031, 15, CAST(N'2025-07-24' AS Date), CAST(N'2025-07-26' AS Date), N'lí do cá nhân 2', 2, 4, CAST(N'2025-07-23T16:58:17.987' AS DateTime), CAST(N'2025-07-23T21:45:39.900' AS DateTime))
INSERT [dbo].[LeaveRequest] ([RequestID], [UserID], [FromDate], [ToDate], [Reason], [StatusID], [ApprovedBy], [CreatedAt], [UpdatedAt]) VALUES (1032, 15, CAST(N'2025-07-24' AS Date), CAST(N'2025-07-26' AS Date), N'lí do cá nhân 3', 1, 4, CAST(N'2025-07-23T17:01:54.017' AS DateTime), CAST(N'2025-07-23T21:45:36.440' AS DateTime))
INSERT [dbo].[LeaveRequest] ([RequestID], [UserID], [FromDate], [ToDate], [Reason], [StatusID], [ApprovedBy], [CreatedAt], [UpdatedAt]) VALUES (1033, 15, CAST(N'2025-07-25' AS Date), CAST(N'2025-07-28' AS Date), N'ádadasdasdas', 1, 4, CAST(N'2025-07-23T17:02:25.327' AS DateTime), CAST(N'2025-07-23T21:59:54.907' AS DateTime))
INSERT [dbo].[LeaveRequest] ([RequestID], [UserID], [FromDate], [ToDate], [Reason], [StatusID], [ApprovedBy], [CreatedAt], [UpdatedAt]) VALUES (1034, 4, CAST(N'2025-07-25' AS Date), CAST(N'2025-07-28' AS Date), N'ádsaddadasd', 1, 5, CAST(N'2025-07-23T18:14:20.670' AS DateTime), CAST(N'2025-07-23T21:44:43.403' AS DateTime))
INSERT [dbo].[LeaveRequest] ([RequestID], [UserID], [FromDate], [ToDate], [Reason], [StatusID], [ApprovedBy], [CreatedAt], [UpdatedAt]) VALUES (1035, 5, CAST(N'2025-07-25' AS Date), CAST(N'2025-07-29' AS Date), N'Nghỉ ốm', 1, 4, CAST(N'2025-07-23T21:54:07.663' AS DateTime), CAST(N'2025-07-23T21:56:41.877' AS DateTime))
INSERT [dbo].[LeaveRequest] ([RequestID], [UserID], [FromDate], [ToDate], [Reason], [StatusID], [ApprovedBy], [CreatedAt], [UpdatedAt]) VALUES (1036, 6, CAST(N'2025-07-25' AS Date), CAST(N'2025-07-26' AS Date), N'Nghỉ ốm', 3, NULL, CAST(N'2025-07-24T06:30:06.323' AS DateTime), CAST(N'2025-07-24T06:30:06.323' AS DateTime))
INSERT [dbo].[LeaveRequest] ([RequestID], [UserID], [FromDate], [ToDate], [Reason], [StatusID], [ApprovedBy], [CreatedAt], [UpdatedAt]) VALUES (1037, 6, CAST(N'2025-07-27' AS Date), CAST(N'2025-07-29' AS Date), N'testing', 3, NULL, CAST(N'2025-07-24T06:32:07.067' AS DateTime), CAST(N'2025-07-24T06:32:07.067' AS DateTime))
INSERT [dbo].[LeaveRequest] ([RequestID], [UserID], [FromDate], [ToDate], [Reason], [StatusID], [ApprovedBy], [CreatedAt], [UpdatedAt]) VALUES (1038, 5, CAST(N'2025-08-01' AS Date), CAST(N'2025-08-20' AS Date), N'test', 3, NULL, CAST(N'2025-07-24T06:34:16.587' AS DateTime), CAST(N'2025-07-24T06:34:16.587' AS DateTime))
SET IDENTITY_INSERT [dbo].[LeaveRequest] OFF
GO
SET IDENTITY_INSERT [dbo].[LeaveStatus] ON 

INSERT [dbo].[LeaveStatus] ([StatusID], [StatusName], [Description]) VALUES (1, N'Approved', N'your leave request has been approved')
INSERT [dbo].[LeaveStatus] ([StatusID], [StatusName], [Description]) VALUES (2, N'Rejected', N'your leave request has been rejected')
INSERT [dbo].[LeaveStatus] ([StatusID], [StatusName], [Description]) VALUES (3, N'Pending', N'your leave request is proccessing')
SET IDENTITY_INSERT [dbo].[LeaveStatus] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName], [Description]) VALUES (1, N'director', N'head director of the company')
INSERT [dbo].[Role] ([RoleID], [RoleName], [Description]) VALUES (2, N'department leader', N'leader of a department')
INSERT [dbo].[Role] ([RoleID], [RoleName], [Description]) VALUES (4, N'employee', N'employee of a department')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [Username], [PasswordHash], [FullName], [DepartmentID], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (4, N'dat', N'123', N'Le Tran Trong Dat', 9, CAST(N'2025-03-07T14:30:00.000' AS DateTime), CAST(N'2025-03-07T14:30:00.000' AS DateTime), 1)
INSERT [dbo].[User] ([UserID], [Username], [PasswordHash], [FullName], [DepartmentID], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (5, N'mra', N'111', N'A', 9, CAST(N'2025-03-07T14:30:00.000' AS DateTime), CAST(N'2025-03-07T14:30:00.000' AS DateTime), 1)
INSERT [dbo].[User] ([UserID], [Username], [PasswordHash], [FullName], [DepartmentID], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (6, N'mrb', N'222', N'B', 9, CAST(N'2025-03-07T14:30:00.000' AS DateTime), CAST(N'2025-03-07T14:30:00.000' AS DateTime), 1)
INSERT [dbo].[User] ([UserID], [Username], [PasswordHash], [FullName], [DepartmentID], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (9, N'mrc', N'333', N'C', 9, CAST(N'2025-03-07T14:30:00.000' AS DateTime), CAST(N'2025-03-07T14:30:00.000' AS DateTime), 1)
INSERT [dbo].[User] ([UserID], [Username], [PasswordHash], [FullName], [DepartmentID], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (11, N'msa', N'111', N'FA', 10, CAST(N'2025-03-07T14:30:00.000' AS DateTime), CAST(N'2025-03-07T14:30:00.000' AS DateTime), 1)
INSERT [dbo].[User] ([UserID], [Username], [PasswordHash], [FullName], [DepartmentID], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (12, N'msb', N'222', N'FB', 10, CAST(N'2025-03-07T14:30:00.000' AS DateTime), CAST(N'2025-03-07T14:30:00.000' AS DateTime), 1)
INSERT [dbo].[User] ([UserID], [Username], [PasswordHash], [FullName], [DepartmentID], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (13, N'msc', N'333', N'FC', 10, CAST(N'2025-03-07T14:30:00.000' AS DateTime), CAST(N'2025-03-07T14:30:00.000' AS DateTime), 1)
INSERT [dbo].[User] ([UserID], [Username], [PasswordHash], [FullName], [DepartmentID], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (14, N'dat2', N'$2b$10$dd5PZ9TlGNWgvgLLM60G0.JTXPAhIlX37L4ALWhtSLrVq61PK.aeu', N'Lê Trần Trọng Đạt', 9, CAST(N'2025-07-23T14:38:04.697' AS DateTime), CAST(N'2025-07-23T14:38:04.697' AS DateTime), 1)
INSERT [dbo].[User] ([UserID], [Username], [PasswordHash], [FullName], [DepartmentID], [CreatedAt], [UpdatedAt], [IsActive]) VALUES (15, N'dat3', N'$2b$10$yZTbPuLEY3rdn1f4NEoGWeXPw9LFQDtW/1ubUFHQt1wEJ03M3jy4W', N'Lê Trần Trọng Đạt', 10, CAST(N'2025-07-23T16:03:08.973' AS DateTime), CAST(N'2025-07-23T16:03:08.973' AS DateTime), 1)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
INSERT [dbo].[UserRole] ([UserID], [RoleID]) VALUES (4, 1)
INSERT [dbo].[UserRole] ([UserID], [RoleID]) VALUES (5, 2)
INSERT [dbo].[UserRole] ([UserID], [RoleID]) VALUES (11, 2)
INSERT [dbo].[UserRole] ([UserID], [RoleID]) VALUES (15, 4)
INSERT [dbo].[UserRole] ([UserID], [RoleID]) VALUES (14, 1)
INSERT [dbo].[UserRole] ([UserID], [RoleID]) VALUES (6, 4)
INSERT [dbo].[UserRole] ([UserID], [RoleID]) VALUES (9, 4)
INSERT [dbo].[UserRole] ([UserID], [RoleID]) VALUES (12, 4)
INSERT [dbo].[UserRole] ([UserID], [RoleID]) VALUES (13, 4)
GO
ALTER TABLE [dbo].[Department]  WITH CHECK ADD  CONSTRAINT [FK_Department_User] FOREIGN KEY([ManagerID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[Department] CHECK CONSTRAINT [FK_Department_User]
GO
ALTER TABLE [dbo].[FeatureRole]  WITH CHECK ADD  CONSTRAINT [FK_FeatureRole_Feature] FOREIGN KEY([FeatureID])
REFERENCES [dbo].[Feature] ([FeatureID])
GO
ALTER TABLE [dbo].[FeatureRole] CHECK CONSTRAINT [FK_FeatureRole_Feature]
GO
ALTER TABLE [dbo].[FeatureRole]  WITH CHECK ADD  CONSTRAINT [FK_FeatureRole_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[FeatureRole] CHECK CONSTRAINT [FK_FeatureRole_Role]
GO
ALTER TABLE [dbo].[LeaveRequest]  WITH CHECK ADD  CONSTRAINT [FK_LeaveRequest_LeaveStatus] FOREIGN KEY([StatusID])
REFERENCES [dbo].[LeaveStatus] ([StatusID])
GO
ALTER TABLE [dbo].[LeaveRequest] CHECK CONSTRAINT [FK_LeaveRequest_LeaveStatus]
GO
ALTER TABLE [dbo].[LeaveRequest]  WITH CHECK ADD  CONSTRAINT [FK_LeaveRequest_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[LeaveRequest] CHECK CONSTRAINT [FK_LeaveRequest_User]
GO
ALTER TABLE [dbo].[LeaveRequest]  WITH CHECK ADD  CONSTRAINT [FK_LeaveRequest_User1] FOREIGN KEY([ApprovedBy])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[LeaveRequest] CHECK CONSTRAINT [FK_LeaveRequest_User1]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD  CONSTRAINT [FK_User_Department] FOREIGN KEY([DepartmentID])
REFERENCES [dbo].[Department] ([DepartmentID])
GO
ALTER TABLE [dbo].[User] CHECK CONSTRAINT [FK_User_Department]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Role] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Role]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_User] FOREIGN KEY([UserID])
REFERENCES [dbo].[User] ([UserID])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_User]
GO
USE [master]
GO
ALTER DATABASE [AssignmentDB] SET  READ_WRITE 
GO
