USE CMPS_339_AmusementPark;

IF NOT EXISTS 
	(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Guests]')
	AND type in (N'U'))

	BEGIN
		CREATE TABLE [dbo].[Guests]
		(
			Id INT PRIMARY KEY IDENTITY(1,1),
			FirstName VARCHAR NOT NULL,
			LastName VARCHAR NOT NULL,
			MiddleInitial VARCHAR(2) NOT NULL,
			DateOfBirth DATE NOT NULL,
			UserId INT 
				CONSTRAINT FK_Guests_Users FOREIGN KEY (UserId)
				REFERENCES Users(Id) ON DELETE CASCADE,
		);
		PRINT ('Guests Table has been created successfully')
	END
		
ELSE

	Begin
		PRINT ('Guests table already exists!')
	End