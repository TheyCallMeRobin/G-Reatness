USE CMPS_339_AmusementPark;

IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID (N'[dbo].[TicketDetails]') AND type in(N'U'))
	BEGIN
		CREATE TABLE [dbo].[TicketDetails]
		(
			Id INT PRIMARY KEY IDENTITY (1,1),
			TicketId INT NOT NULL
			CONSTRAINT FK_TicketDetails_Ticket FOREIGN KEY (TicketId)
			REFERENCES Tickets(Id)
			ON DELETE CASCADE
			ON UPDATE CASCADE
		);
		PRINT('The TicketDetails table has been create!')
	END
ELSE
	BEGIN
		PRINT ('The TicketDetails table already exists!')
	END
