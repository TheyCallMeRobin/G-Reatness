USE CMPS_339_AmusementPark;

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID(N'[dbo].[Parks]') AND type in(N'U'))

	BEGIN
		CREATE TABLE [dbo].[Parks]
		(
			Id INT PRIMARY KEY IDENTITY(1,1),
			[Name] VARCHAR(30) NOT NULL
		);
		PRINT('Park table created!')
	END
ELSE
	BEGIN
		PRINT('The Parks table already exists!')
	End

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID(N'[dbo].[Attractions]') AND type in(N'U'))

	BEGIN
		CREATE TABLE [dbo].[Attractions]
		(
			Id INT PRIMARY KEY IDENTITY(1,1),
			ParkId INT,
			CONSTRAINT FK_Attractions_Parks FOREIGN KEY (ParkId) REFERENCES Parks(Id) ON DELETE CASCADE
		);
		PRINT('The Attractions table has been created!')
	END
		
ELSE
	BEGIN
		PRINT('The Attractions table already exists!')
	End