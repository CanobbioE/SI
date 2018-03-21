DROP TABLE IF EXISTS MissioniFT;
DROP TABLE IF EXISTS DataDT;
DROP TABLE IF EXISTS RichiedenteDT;
DROP TABLE IF EXISTS LuogoDT;
DROP TABLE IF EXISTS ProgettoDT;

CREATE TABLE DataDT (
	dataID 	SERIAL 	NOT NULL,
	mese 	INT 	NOT NULL,
	anno 	INT 	NOT NULL,
	PRIMARY KEY (dataID)
);

CREATE TABLE RichiedenteDT (
	richiedenteID 	SERIAL 		NOT NULL,
	categoria 		VARCHAR(20) NOT NULL,
	ruolo 			VARCHAR(20) NOT NULL,
	PRIMARY KEY (richiedenteID)
);

CREATE TABLE LuogoDT (
	luogoID SERIAL	 		NOT NULL,
	citta 	VARCHAR(100) 	NOT NULL,
	stato 	VARCHAR(100) 	NOT NULL,
	PRIMARY KEY (luogoID)
);

CREATE TABLE ProgettoDT (
	progettoID 	SERIAL 		NOT NULL,
	tipo 		VARCHAR(20) NOT NULL,
	PRIMARY KEY (progettoID)
);

CREATE TABLE MissioniFT (
	dataID			INT		NOT NULL,
	luogoID			INT		NOT NULL,
	progettoID		INT		NOT NULL,
	richiedenteID	INT		NOT NULL,
	costo 			DECIMAL NOT NULL,
	PRIMARY KEY (dataID, luogoID, progettoID, richiedenteID),
	FOREIGN KEY (dataID) REFERENCES dataDT,
	FOREIGN KEY (luogoID) REFERENCES luogoDT,
	FOREIGN KEY (progettoID) REFERENCES progettoDT,
	FOREIGN KEY (richiedenteID) REFERENCES richiedenteDT
);
