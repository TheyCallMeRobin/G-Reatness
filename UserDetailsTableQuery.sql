USE CMPS_339_AmusementPark;

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id=OBJECT_ID(N'[dbo].[UserDetails]') AND type in(N'U'))

	BEGIN
		CREATE TABLE [dbo].[UserDetails]
		(
			Id INT PRIMARY KEY IDENTITY(1,1),
			Email VARCHAR NOT NULL,
			PhoneNumber VARCHAR (20),
			Address VARCHAR NOT NULL,
			UserId INT,
			CONSTRAINT FK_UserDetails_Users FOREIGN KEY (UserId) REFERENCES Users(Id)
			ON DELETE CASCADE
			ON UPDATE CASCADE
			
		);

		ALTER TABLE [dbo].[UserDetails]
		ADD CONSTRAINT CHK_PhoneNumber_Format
		CHECK (PhoneNumber LIKE '+1 ([0-9][0-9][0-9]) [0-9][0-9][0-9]-[0-9][0-9][0-9][0-9]');

		PRINT('The UserDetails table has been created!')
	END
ELSE
	BEGIN
		PRINT('The UserDetails table already exists!')
	End