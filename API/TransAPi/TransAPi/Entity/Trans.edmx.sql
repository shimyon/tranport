
-- --------------------------------------------------
-- Entity Designer DDL Script for SQL Server 2005, 2008, 2012 and Azure
-- --------------------------------------------------
-- Date Created: 12/10/2018 10:42:10
-- Generated from EDMX file: F:\projects\Trasport\API\TransAPi\TransAPi\Entity\Trans.edmx
-- --------------------------------------------------

SET QUOTED_IDENTIFIER OFF;
GO
USE [Trans];
GO
IF SCHEMA_ID(N'dbo') IS NULL EXECUTE(N'CREATE SCHEMA [dbo]');
GO

-- --------------------------------------------------
-- Dropping existing FOREIGN KEY constraints
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[FK_Permission_Branch]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Permission] DROP CONSTRAINT [FK_Permission_Branch];
GO
IF OBJECT_ID(N'[dbo].[FK_Role_Branch]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[Role] DROP CONSTRAINT [FK_Role_Branch];
GO
IF OBJECT_ID(N'[dbo].[FK_RolePermission_Role]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RolePermission] DROP CONSTRAINT [FK_RolePermission_Role];
GO
IF OBJECT_ID(N'[dbo].[FK_RolePermission_Role1]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[RolePermission] DROP CONSTRAINT [FK_RolePermission_Role1];
GO
IF OBJECT_ID(N'[dbo].[FK_UserPermission_Permission2]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserPermission] DROP CONSTRAINT [FK_UserPermission_Permission2];
GO
IF OBJECT_ID(N'[dbo].[FK_UserPermission_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UserPermission] DROP CONSTRAINT [FK_UserPermission_User];
GO
IF OBJECT_ID(N'[dbo].[FK_Users_Branch]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_Users_Branch];
GO
IF OBJECT_ID(N'[dbo].[FK_UsersRole_Role]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UsersRole] DROP CONSTRAINT [FK_UsersRole_Role];
GO
IF OBJECT_ID(N'[dbo].[FK_UsersRole_User]', 'F') IS NOT NULL
    ALTER TABLE [dbo].[UsersRole] DROP CONSTRAINT [FK_UsersRole_User];
GO

-- --------------------------------------------------
-- Dropping existing tables
-- --------------------------------------------------

IF OBJECT_ID(N'[dbo].[Branch]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Branch];
GO
IF OBJECT_ID(N'[dbo].[Permission]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Permission];
GO
IF OBJECT_ID(N'[dbo].[Role]', 'U') IS NOT NULL
    DROP TABLE [dbo].[Role];
GO
IF OBJECT_ID(N'[dbo].[RolePermission]', 'U') IS NOT NULL
    DROP TABLE [dbo].[RolePermission];
GO
IF OBJECT_ID(N'[dbo].[User]', 'U') IS NOT NULL
    DROP TABLE [dbo].[User];
GO
IF OBJECT_ID(N'[dbo].[UserPermission]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UserPermission];
GO
IF OBJECT_ID(N'[dbo].[UsersRole]', 'U') IS NOT NULL
    DROP TABLE [dbo].[UsersRole];
GO

-- --------------------------------------------------
-- Creating all tables
-- --------------------------------------------------

-- Creating table 'Branches'
CREATE TABLE [dbo].[Branches] (
    [BranchId] int IDENTITY(1,1) NOT NULL,
    [BranchName] nvarchar(50)  NULL,
    [CreatedOn] datetime  NULL,
    [IsEnable] bit  NULL,
    [IsMaster] bit  NULL
);
GO

-- Creating table 'Roles'
CREATE TABLE [dbo].[Roles] (
    [RoleId] int IDENTITY(1,1) NOT NULL,
    [RoleName] nvarchar(50)  NOT NULL,
    [BranchId] int  NULL,
    [CreateOn] datetime  NULL,
    [IsDelete] bit  NULL
);
GO

-- Creating table 'Users'
CREATE TABLE [dbo].[Users] (
    [UserId] int IDENTITY(1,1) NOT NULL,
    [FirstName] nvarchar(max)  NULL,
    [SurName] nvarchar(max)  NULL,
    [LastName] nvarchar(max)  NULL,
    [Password] nvarchar(max)  NULL,
    [Email] nvarchar(max)  NULL,
    [CreatedOn] datetime  NULL,
    [IsEnable] bit  NULL,
    [BranchId] int  NULL
);
GO

-- Creating table 'UsersRoles'
CREATE TABLE [dbo].[UsersRoles] (
    [RoleUserId] int IDENTITY(1,1) NOT NULL,
    [RoleId] int  NOT NULL,
    [UserId] int  NOT NULL
);
GO

-- Creating table 'Permissions'
CREATE TABLE [dbo].[Permissions] (
    [PermissionId] int IDENTITY(1,1) NOT NULL,
    [PermissionName] varchar(50)  NULL,
    [IsDelete] bit  NULL,
    [BranchID] int  NULL
);
GO

-- Creating table 'UserPermissions'
CREATE TABLE [dbo].[UserPermissions] (
    [UserPermissionId] int IDENTITY(1,1) NOT NULL,
    [UserId] int  NULL,
    [PermissionId] int  NULL
);
GO

-- Creating table 'RolePermissions'
CREATE TABLE [dbo].[RolePermissions] (
    [RolePermissionId] int IDENTITY(1,1) NOT NULL,
    [RoleId] int  NULL,
    [PermissionId] int  NULL
);
GO

-- --------------------------------------------------
-- Creating all PRIMARY KEY constraints
-- --------------------------------------------------

-- Creating primary key on [BranchId] in table 'Branches'
ALTER TABLE [dbo].[Branches]
ADD CONSTRAINT [PK_Branches]
    PRIMARY KEY CLUSTERED ([BranchId] ASC);
GO

-- Creating primary key on [RoleId] in table 'Roles'
ALTER TABLE [dbo].[Roles]
ADD CONSTRAINT [PK_Roles]
    PRIMARY KEY CLUSTERED ([RoleId] ASC);
GO

-- Creating primary key on [UserId] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [PK_Users]
    PRIMARY KEY CLUSTERED ([UserId] ASC);
GO

-- Creating primary key on [RoleUserId] in table 'UsersRoles'
ALTER TABLE [dbo].[UsersRoles]
ADD CONSTRAINT [PK_UsersRoles]
    PRIMARY KEY CLUSTERED ([RoleUserId] ASC);
GO

-- Creating primary key on [PermissionId] in table 'Permissions'
ALTER TABLE [dbo].[Permissions]
ADD CONSTRAINT [PK_Permissions]
    PRIMARY KEY CLUSTERED ([PermissionId] ASC);
GO

-- Creating primary key on [UserPermissionId] in table 'UserPermissions'
ALTER TABLE [dbo].[UserPermissions]
ADD CONSTRAINT [PK_UserPermissions]
    PRIMARY KEY CLUSTERED ([UserPermissionId] ASC);
GO

-- Creating primary key on [RolePermissionId] in table 'RolePermissions'
ALTER TABLE [dbo].[RolePermissions]
ADD CONSTRAINT [PK_RolePermissions]
    PRIMARY KEY CLUSTERED ([RolePermissionId] ASC);
GO

-- --------------------------------------------------
-- Creating all FOREIGN KEY constraints
-- --------------------------------------------------

-- Creating foreign key on [BranchId] in table 'Roles'
ALTER TABLE [dbo].[Roles]
ADD CONSTRAINT [FK_Role_Branch]
    FOREIGN KEY ([BranchId])
    REFERENCES [dbo].[Branches]
        ([BranchId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Role_Branch'
CREATE INDEX [IX_FK_Role_Branch]
ON [dbo].[Roles]
    ([BranchId]);
GO

-- Creating foreign key on [BranchId] in table 'Users'
ALTER TABLE [dbo].[Users]
ADD CONSTRAINT [FK_Users_Branch]
    FOREIGN KEY ([BranchId])
    REFERENCES [dbo].[Branches]
        ([BranchId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Users_Branch'
CREATE INDEX [IX_FK_Users_Branch]
ON [dbo].[Users]
    ([BranchId]);
GO

-- Creating foreign key on [RoleId] in table 'UsersRoles'
ALTER TABLE [dbo].[UsersRoles]
ADD CONSTRAINT [FK_UsersRole_Role]
    FOREIGN KEY ([RoleId])
    REFERENCES [dbo].[Roles]
        ([RoleId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UsersRole_Role'
CREATE INDEX [IX_FK_UsersRole_Role]
ON [dbo].[UsersRoles]
    ([RoleId]);
GO

-- Creating foreign key on [UserId] in table 'UsersRoles'
ALTER TABLE [dbo].[UsersRoles]
ADD CONSTRAINT [FK_UsersRole_User]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UsersRole_User'
CREATE INDEX [IX_FK_UsersRole_User]
ON [dbo].[UsersRoles]
    ([UserId]);
GO

-- Creating foreign key on [BranchID] in table 'Permissions'
ALTER TABLE [dbo].[Permissions]
ADD CONSTRAINT [FK_Permission_Branch]
    FOREIGN KEY ([BranchID])
    REFERENCES [dbo].[Branches]
        ([BranchId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_Permission_Branch'
CREATE INDEX [IX_FK_Permission_Branch]
ON [dbo].[Permissions]
    ([BranchID]);
GO

-- Creating foreign key on [PermissionId] in table 'UserPermissions'
ALTER TABLE [dbo].[UserPermissions]
ADD CONSTRAINT [FK_UserPermission_Permission2]
    FOREIGN KEY ([PermissionId])
    REFERENCES [dbo].[Permissions]
        ([PermissionId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserPermission_Permission2'
CREATE INDEX [IX_FK_UserPermission_Permission2]
ON [dbo].[UserPermissions]
    ([PermissionId]);
GO

-- Creating foreign key on [UserId] in table 'UserPermissions'
ALTER TABLE [dbo].[UserPermissions]
ADD CONSTRAINT [FK_UserPermission_User]
    FOREIGN KEY ([UserId])
    REFERENCES [dbo].[Users]
        ([UserId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_UserPermission_User'
CREATE INDEX [IX_FK_UserPermission_User]
ON [dbo].[UserPermissions]
    ([UserId]);
GO

-- Creating foreign key on [PermissionId] in table 'RolePermissions'
ALTER TABLE [dbo].[RolePermissions]
ADD CONSTRAINT [FK_RolePermission_Role]
    FOREIGN KEY ([PermissionId])
    REFERENCES [dbo].[Permissions]
        ([PermissionId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RolePermission_Role'
CREATE INDEX [IX_FK_RolePermission_Role]
ON [dbo].[RolePermissions]
    ([PermissionId]);
GO

-- Creating foreign key on [RoleId] in table 'RolePermissions'
ALTER TABLE [dbo].[RolePermissions]
ADD CONSTRAINT [FK_RolePermission_Role1]
    FOREIGN KEY ([RoleId])
    REFERENCES [dbo].[Roles]
        ([RoleId])
    ON DELETE NO ACTION ON UPDATE NO ACTION;
GO

-- Creating non-clustered index for FOREIGN KEY 'FK_RolePermission_Role1'
CREATE INDEX [IX_FK_RolePermission_Role1]
ON [dbo].[RolePermissions]
    ([RoleId]);
GO

-- --------------------------------------------------
-- Script has ended
-- --------------------------------------------------