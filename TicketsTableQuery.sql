USE CMPS_339_AmusementPark;

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Tickets]') AND type in(N'U'))
	BEGIN
		CREATE TABLE [dbo].[Tickets]
		(
			Id INT PRIMARY KEY IDENTITY(1,1),
			AttractionId INT NOT NULL,
			CONSTRAINT FK_Tickets_Attractions FOREIGN KEY (AttractionId) 
			REFERENCES Attractions(Id) 
			ON DELETE CASCADE
			ON UPDATE CASCADE
		);
		PRINT('Tickets table has been created!')
	END
ELSE
	BEGIN
		PRINT('The Tickets table already exists!')
	END
