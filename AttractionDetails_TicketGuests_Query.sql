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

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TicketGuests]') AND type in(N'U'))

	BEGIN
		CREATE TABLE [dbo].[TicketGuests]
		(
			TicketId INT PRIMARY KEY,
			GuestId INT,
			CONSTRAINT FK_TicketGuests_Ticket FOREIGN KEY (TicketId)
				REFERENCES Tickets(Id) ON DELETE CASCADE,
			CONSTRAINT FK_TicketGuests_Guest FOREIGN KEY (GuestId)
				REFERENCES Guests(Id) ON DELETE CASCADE,

		);

		ALTER TABLE TicketGuests
			ADD CONSTRAINT PK_TicketGuests_GuestsId UNIQUE (GuestId);

		PRINT('TicketGuests table created!')
	END
ELSE
	BEGIN
		PRINT('The TicketGuests table already exists!')
	End

