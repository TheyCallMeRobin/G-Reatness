IF NOT EXISTS (SELECT [name] FROM sys.databases WHERE [name] = 'CMPS_339_AmusementPark')
	BEGIN
		CREATE DATABASE CMPS_339_AmusementPark;
		PRINT('The CMPS_339_AmusementPark database has been created!');
	END

ELSE
	BEGIN
		PRINT('The CMPS_339_AmusementPark database already exists!');
	END