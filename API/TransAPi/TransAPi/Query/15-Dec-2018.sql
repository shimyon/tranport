/*
   15 December 201812:26:18
   User: 
   Server: SCRUMBEES2\SQLEXPRESS14
   Database: Trans
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.LookUp
	(
	LookupId int NOT NULL IDENTITY (1, 1),
	GroupName nvarchar(MAX) NULL,
	RefId int NULL,
	ItemName nvarchar(MAX) NULL,
	ItemId nvarchar(MAX) NULL
	)  ON [PRIMARY]
	 TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE dbo.LookUp ADD CONSTRAINT
	PK_LookUp PRIMARY KEY CLUSTERED 
	(
	LookupId
	) WITH( STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]

GO
ALTER TABLE dbo.LookUp SET (LOCK_ESCALATION = TABLE)
GO
COMMIT
select Has_Perms_By_Name(N'dbo.LookUp', 'Object', 'ALTER') as ALT_Per, Has_Perms_By_Name(N'dbo.LookUp', 'Object', 'VIEW DEFINITION') as View_def_Per, Has_Perms_By_Name(N'dbo.LookUp', 'Object', 'CONTROL') as Contr_Per 