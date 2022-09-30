USE [BookStoreDb]
GO

ALTER TABLE [dbo].[Books] DROP CONSTRAINT [FK_Books_Authors]
GO

/****** Object:  Table [dbo].[Books] ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Books]') AND type in (N'U'))
DROP TABLE [dbo].[Books]
GO

/****** Object:  Table [dbo].[Authors] ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Authors]') AND type in (N'U'))
DROP TABLE [dbo].[Authors]
GO

/****** Object:  Table [dbo].[Authors] ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Authors](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NULL,
	[LastName] [nvarchar](50) NULL,
	[Bio] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

/****** Object:  Table [dbo].[Books] ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Books](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](50) NULL,
	[Year] [int] NULL,
	[ISBN] [nvarchar](50) NOT NULL,
	[Summary] [nvarchar](250) NULL,
	[Image] [nvarchar](50) NULL,
	[Price] [decimal](18, 2) NULL,
	[AuthorId] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
UNIQUE NONCLUSTERED 
(
	[ISBN] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Books]  WITH CHECK ADD  CONSTRAINT [FK_Books_Authors] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Authors] ([Id])
GO

ALTER TABLE [dbo].[Books] CHECK CONSTRAINT [FK_Books_Authors]
GO


