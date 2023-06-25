USE CMPS_339_AmusementPark;

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[TicketGuests]') AND type in(N'U'))

	BEGIN
		CREATE TABLE [dbo].[TicketGuests]
		(
			TicketId INT PRIMARY KEY,
			GuestId INT,
			CONSTRAINT FK_TicketGuests_Ticket FOREIGN KEY (TicketId)
				REFERENCES Tickets(Id) ON DELETE CASCADE ON UPDATE CASCADE,
			CONSTRAINT FK_TicketGuest_Guest FOREIGN KEY (GuestId)
				REFERENCES Guests(Id) ON DELETE NO ACTION ON UPDATE NO ACTION

		);

		ALTER TABLE TicketGuests
			ADD CONSTRAINT PK_TicketGuests_GuestsId UNIQUE (GuestId);

		PRINT('TicketGuests table created!')
	END
ELSE
	BEGIN
		PRINT('The TicketGuests table already exists!')
	End
