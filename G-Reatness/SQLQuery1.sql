USE CMPS_339_AmusementPark;

IF NOT EXISTS 
	(SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[Guests]')
	AND type in (N'U'))

	BEGIN
		CREATE TABLE Guests
		(
			Id INT PRIMARY KEY IDENTITY(1,1),
			FirstName VARCHAR NOT NULL,
			LastName VARCHAR NOT NULL,
			MiddleInitial VARCHAR(2) NOT NULL,
			DateOfBirth DATE NOT NULL,
			UserId INT 
				CONSTRAINT FK_Guests_Users FOREIGN KEY (UsersId)
				REFERENCES Guests(Id) ON DELETE CASCADE,
		);
	END