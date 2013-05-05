create table tOgrenci (
	ogrenciID integer not null,
	ad varchar(30) not null,
	soyad varchar(30) not null,
	dogumtarih date not null,
	adres varchar(60) not null,
	telefon varchar(15) not null,
	CONSTRAINT ogrenciID_pk PRIMARY KEY(ogrenciID)
);

create table tOgrenciYedek (
	ogrenciID integer not null,
	ad varchar(30) not null,
	soyad varchar(30) not null,
	dogumtarih date not null,
	adres varchar(60) not null,
	telefon varchar(15) not null,
	CONSTRAINT ogrenciIDyedek_pk PRIMARY KEY(ogrenciID)
);
