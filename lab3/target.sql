CREATE OR REPLACE FUNCTION OgrenciKayit(integer,varchar(30),varchar(30),date,varchar(60),varchar(15))
RETURNS void AS $$
	INSERT INTO tOgrenci(ogrenciID, ad, soyad, dogumtarih, adres, telefon) VALUES($1, $2, $3, $4, $5, $6);
$$ LANGUAGE SQL;

---

CREATE OR REPLACE FUNCTION OgrenciSayisi() RETURNS integer AS $$
DECLARE
	ToplamSayi integer;
BEGIN
	SELECT COUNT(*) INTO ToplamSayi FROM tOgrenci;
	RETURN ToplamSayi;
END;
$$
LANGUAGE plpgsql;

---

CREATE OR REPLACE FUNCTION notify_tOgrenci()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
	BEGIN
		IF TG_OP = 'INSERT' THEN
			INSERT INTO  tOgrenciYedek(ogrenciID, ad, soyad, dogumtarih, adres, telefon) VALUES(new.ogrenciID, new.ad, new.soyad, new.dogumtarih, new.adres, new.telefon);
			RETURN new;
		END IF;

		IF TG_OP = 'UPDATE' THEN
			INSERT INTO  tOgrenciYedek(ogrenciID, ad, soyad, dogumtarih, adres, telefon) VALUES(old.ogrenciID, old.ad, old.soyad, old.dogumtarih, old.adres, old.telefon);
			RETURN new;
		END IF;
	END
$$;

CREATE TRIGGER notify_tOgrenci AFTER UPDATE OR INSERT
ON tOgrenci
FOR EACH ROW
EXECUTE PROCEDURE notify_tOgrenci();
