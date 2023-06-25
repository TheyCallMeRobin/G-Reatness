USE CMPS_339_AmusementPark;

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[AttractionDetails]') AND type in(N'U'))

	BEGIN
		CREATE TABLE [dbo].[AttractionDetails]
		(
			Id INT PRIMARY KEY IDENTITY(1,1),
			AttrationId INT,
			Capacity INT NOT NULL,
			OpenTime TIME NOT NULL,
			TicketPrice DECIMAL(5,2) NOT NULL,
			MinimumHeight INT

		);
		PRINT('AttractionDetails table created!')
	END
ELSE
	BEGIN
		PRINT('The AttractionDetails table already exists!')
	End


