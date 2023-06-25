USE CMPS_339_AmusementPark;

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID (N'[dbo].[Users]') AND type in(N'U'))
	BEGIN
		CREATE TABLE [dbo].[Users]
		(
			Id INT PRIMARY KEY IDENTITY (1,1),
			Username VARCHAR NOT NULL,
			Password VARCHAR NOT NULL,
			IsActive BIT NOT NULL DEFAULT (1)
		);
		PRINT('The User table has been create!')
	END
ELSE
	BEGIN
		PRINT ('The User table already exists!')
	END