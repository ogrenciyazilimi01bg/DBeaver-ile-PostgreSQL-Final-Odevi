

CREATE TABLE "hotels"(
    "id" SERIAL NOT NULL,
    "name" VARCHAR(150) NOT NULL,
    "address" TEXT NOT NULL,
    "city" VARCHAR(150) NOT NULL,
    "phone" VARCHAR(30) NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT null DEFAULT now()
);
ALTER TABLE
    "hotels" ADD PRIMARY KEY("id");
CREATE TABLE "room_types"(
    "id" SERIAL NOT NULL,
    "hotel_id" BIGINT NOT NULL,
    "name" VARCHAR(100) NOT NULL,
    "description" TEXT NOT NULL,
    "base_price" DECIMAL(10, 2) NOT NULL
);
ALTER TABLE
    "room_types" ADD PRIMARY KEY("id");
CREATE TABLE "rooms"(
    "id" SERIAL NOT NULL,
    "hotel_id" BIGINT NOT NULL,
    "room_type_id" BIGINT NOT NULL,
    "room_number" VARCHAR(20) NOT NULL,
    "floor" INTEGER NOT NULL,
    "status" VARCHAR(255) NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT null DEFAULT now()
);

ALTER TABLE
    "rooms" ADD PRIMARY KEY("id");
CREATE TABLE "guests"(
    "id" SERIAL NOT NULL,
    "first_name" VARCHAR(100) NOT NULL,
    "last_name" VARCHAR(100) NOT NULL,
    "email" VARCHAR(100) NOT NULL,
    "phone" VARCHAR(20) NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT null DEFAULT now()
);
ALTER TABLE
    "guests" ADD PRIMARY KEY("id");
   
CREATE TABLE "reservations"(
    "id" SERIAL NOT NULL,
    "hotel_id" BIGINT NOT NULL,
    "guests_id" BIGINT NOT NULL,
    "room_id" BIGINT NOT NULL,
    "check_in" DATE NOT NULL,
    "check_out" DATE NOT NULL,
    "nights" BIGINT NOT NULL,
    "rate_per_night" DECIMAL(10, 2) NOT NULL,
    "total_amount" DECIMAL(12, 2) NOT NULL,
    "status" VARCHAR(30) NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT null DEFAULT now()
);
ALTER TABLE
    "reservations" ADD PRIMARY KEY("id");
CREATE TABLE "services"(
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "description" TEXT NOT NULL,
    "price" DECIMAL(10, 2) NOT NULL
);
ALTER TABLE
    "services" ADD PRIMARY KEY("id");
CREATE TABLE "reservation_services"(
    "id" SERIAL NOT NULL,
    "reservation_id" BIGINT NOT NULL,
    "service_id" BIGINT NOT NULL,
    "quantity" BIGINT NOT NULL,
    "unit_price" DECIMAL(8, 2) NOT NULL,
    "created_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT null DEFAULT now()
);
ALTER TABLE
    "reservation_services" ADD PRIMARY KEY("id");
CREATE TABLE "payments"(
    "id" SERIAL NOT NULL,
    "reservation_id" BIGINT NOT NULL,
    "amount" DECIMAL(8, 2) NOT NULL,
    "paid_at" TIMESTAMP(0) WITHOUT TIME ZONE NOT NULL,
    "payment_method" VARCHAR(255) NOT NULL
);
ALTER TABLE
    "payments" ADD PRIMARY KEY("id");
ALTER TABLE
    "reservation_services" ADD CONSTRAINT "reservation_services_reservation_id_foreign" FOREIGN KEY("reservation_id") REFERENCES "reservations"("id");
ALTER TABLE
    "room_types" ADD CONSTRAINT "room_types_hotel_id_foreign" FOREIGN KEY("hotel_id") REFERENCES "hotels"("id");
ALTER TABLE
    "reservations" ADD CONSTRAINT "reservations_hotel_id_foreign" FOREIGN KEY("hotel_id") REFERENCES "hotels"("id");
ALTER TABLE
    "payments" ADD CONSTRAINT "payments_reservation_id_foreign" FOREIGN KEY("reservation_id") REFERENCES "reservations"("id");
ALTER TABLE
    "rooms" ADD CONSTRAINT "rooms_room_type_id_foreign" FOREIGN KEY("room_type_id") REFERENCES "room_types"("id");
ALTER TABLE
    "reservation_services" ADD CONSTRAINT "reservation_services_service_id_foreign" FOREIGN KEY("service_id") REFERENCES "services"("id");
ALTER TABLE
    "rooms" ADD CONSTRAINT "rooms_hotel_id_foreign" FOREIGN KEY("hotel_id") REFERENCES "hotels"("id");
ALTER TABLE
    "reservations" ADD CONSTRAINT "reservations_room_id_foreign" FOREIGN KEY("room_id") REFERENCES "rooms"("id");
ALTER TABLE
    "reservations" ADD CONSTRAINT "reservations_guests_id_foreign" FOREIGN KEY("guests_id") REFERENCES "guests"("id");
    
INSERT INTO hotels (name, address, city, phone) VALUES
('Sunrise Hotel', 'Deniz Cd No:10', 'Antalya', '0242 111 11 11'),
('Blue Lagoon', 'Marina Sk No:22', 'Muğla', '0252 222 22 22'),
('Mountain View', 'Yayla Yolu No:5', 'Rize', '0464 333 33 33'),
('Golden Palace', 'Merkez Mh 12', 'İstanbul', '0212 444 44 44'),
('Skyline Hotel', 'Kordon 25', 'İzmir', '0232 555 55 55'),
('Royal Garden', 'Havalimanı Cd 90', 'Ankara', '0312 666 66 66'),
('Forest Retreat', 'Orman Yolu 7', 'Bolu', '0374 777 77 77'),
('Sea Breeze', 'Liman Cd 4', 'Mersin', '0324 888 88 88'),
('City Comfort', 'Mevlana Cd 10', 'Konya', '0332 999 99 99'),
('Elite Suites', 'Atatürk Blv 50', 'Eskişehir', '0222 101 01 01'),
('Palm Resort', 'Sahil Cd 40', 'Antalya', '0242 202 02 02'),
('Desert Rose', 'Merkez Sk 8', 'Nevşehir', '0384 303 03 03'),
('Silver Moon', 'Yıldız Cd 77', 'Kars', '0474 404 04 04'),
('Oasis Hotel', 'Göl Cd 11', 'Burdur', '0248 505 05 05'),
('King Royal', 'Vadi Cd 33', 'Trabzon', '0462 606 06 06'),
('High Tower', 'Bulvar 20', 'Gaziantep', '0342 707 07 07'),
('Lagoon Star', 'Merkez 14', 'Aydın', '0256 808 08 08'),
('Wind Hotel', 'Rüzgar Sk 7', 'Çanakkale', '0286 909 09 09'),
('Diamond Inn', 'Taşlık Sk 1', 'Bursa', '0224 111 22 33'),
('City Star', 'Cumhuriyet Cd 18', 'Samsun', '0362 222 33 44');

select*from hotels;
INSERT INTO room_types (hotel_id, name, description, base_price) VALUES
-- HOTEL 1
(1,'Single','Tek kişilik oda',200.00),
(1,'Double','Çift kişilik oda',350.00),
(1,'Suite','Lüks suit',800.00),
(1,'Deluxe','Geniş deluxe oda',550.00),
(1,'Economy','Ekonomik oda',150.00),

-- HOTEL 2
(2,'Standard','Standart oda',250.00),
(2,'Family','Aile odası',450.00),
(2,'King','Geniş king oda',600.00),
(2,'Penthouse','Çatı katı oda',1200.00),
(2,'Twin','İki ayrı yataklı',300.00),

-- HOTEL 3
(3,'Single','Tek kişilik oda',180.00),
(3,'Double','Çift kişilik oda',320.00),
(3,'Superior','Manzaralı superior oda',500.00),
(3,'Honeymoon Suite','Balayı süiti',1400.00),
(3,'Economy','Ekonomik oda',140.00),

-- HOTEL 4
(4,'Standard','Standart oda',270.00),
(4,'Deluxe','Deluxe oda',490.00),
(4,'Family','Aile odası',430.00),
(4,'Executive','Executive oda',900.00),
(4,'Junior Suite','Genç suite',650.00),

-- HOTEL 5
(5,'Single','Tek kişilik oda',160.00),
(5,'Double','Çift kişilik oda',310.00),
(5,'Suite','Lüks suit',780.00),
(5,'Corner Room','Köşe oda',520.00),
(5,'Premium','Premium oda',700.00),

-- HOTEL 6
(6,'Economy','Ekonomik oda',130.00),
(6,'Standard','Standart oda',240.00),
(6,'Superior','Superior oda',460.00),
(6,'Family Deluxe','Deluxe aile odası',600.00),
(6,'Royal Suite','Kraliyet süiti',2200.00),

-- HOTEL 7
(7,'Single','Tek kişilik oda',190.00),
(7,'Double','Çift kişilik oda',330.00),
(7,'Triple','Üç kişilik oda',450.00),
(7,'Studio','Stüdyo oda',370.00),
(7,'Business','İş seyahati odası',520.00),

-- HOTEL 8
(8,'Standard','Standart oda',260.00),
(8,'Family','Aile odası',400.00),
(8,'Junior Suite','Junior suite',690.00),
(8,'Executive Suite','Executive süit',1400.00),
(8,'Loft','Loft tarzı geniş oda',880.00),

-- HOTEL 9
(9,'Single','Tek kişilik oda',170.00),
(9,'Double','Çift kişilik oda',315.00),
(9,'Deluxe','Deluxe oda',490.00),
(9,'Panorama Suite','Panorama manzaralı süit',1600.00),
(9,'Economy','Ekonomik oda',135.00),

-- HOTEL 10
(10,'Standard','Standart oda',245.00),
(10,'Twin','İki yataklı oda',290.00),
(10,'Suite','Suit oda',740.00),
(10,'Premium','Premium sınıf oda',880.00),
(10,'Royal Suite','Kraliyet süiti',2500.00);

select*from room_types rt ;

INSERT INTO rooms (hotel_id, room_type_id, room_number, floor, status) VALUES
-- HOTEL 1
(1,2,'101',1,'available'),
(1,2,'102',1,'available'),
(1,3,'201',2,'available'),
(1,4,'202',2,'occupied'),
(1,5,'301',3,'available'),
(1,6,'302',3,'maintenance'),

-- HOTEL 2
(2,2,'1A',1,'available'),
(2,3,'1B',1,'occupied'),
(2,4,'2A',2,'available'),
(2,5,'2B',2,'available'),
(2,6,'3C',3,'maintenance'),
(2,7,'3D',3,'available'),

-- HOTEL 3
(3,2,'101',1,'available'),
(3,3,'102',1,'occupied'),
(3,4,'201',2,'available'),
(3,5,'202',2,'available'),
(3,6,'301',3,'available'),
(3,7,'302',3,'maintenance'),

-- HOTEL 4
(4,2,'110',1,'available'),
(4,3,'111',1,'available'),
(4,4,'210',2,'occupied'),
(4,5,'211',2,'available'),
(4,6,'310',3,'maintenance'),
(4,7,'311',3,'available'),

-- HOTEL 5
(5,2,'120',1,'available'),
(5,3,'121',1,'available'),
(5,4,'220',2,'occupied'),
(5,5,'221',2,'available'),
(5,6,'320',3,'maintenance'),
(5,7,'321',3,'available'),

-- HOTEL 6
(6,2,'130',1,'available'),
(6,3,'131',1,'occupied'),
(6,4,'230',2,'available'),
(6,5,'231',2,'available'),
(6,6,'330',3,'maintenance'),
(6,7,'331',3,'available'),

-- HOTEL 7
(7,2,'140',1,'available'),
(7,3,'141',1,'occupied'),
(7,4,'240',2,'available'),
(7,5,'241',2,'available'),
(7,6,'340',3,'maintenance'),
(7,7,'341',3,'available'),

-- HOTEL 8
(8,2,'150',1,'available'),
(8,3,'151',1,'available'),
(8,4,'250',2,'occupied'),
(8,5,'251',2,'available'),
(8,6,'350',3,'maintenance'),
(8,7,'351',3,'available'),

-- HOTEL 9
(9,2,'160',1,'occupied'),
(9,3,'161',1,'available'),
(9,4,'260',2,'available'),
(9,5,'261',2,'maintenance'),
(9,6,'360',3,'available'),
(9,7,'361',3,'available'),

-- HOTEL 10
(10,2,'170',1,'available'),
(10,3,'171',1,'available'),
(10,4,'270',2,'available'),
(10,5,'271',2,'occupied'),
(10,6,'370',3,'maintenance'),
(10,7,'371',3,'available');

select *from rooms r ;

INSERT INTO guests(first_name, last_name, email, phone) VALUES
('Ahmet','Yılmaz','ahmet1@example.com','05000000001'),
('Ayşe','Kara','ayse2@example.com','05000000002'),
('Mehmet','Demir','mehmet3@example.com','05000000003'),
('Fatma','Şahin','fatma4@example.com','05000000004'),
('Ali','Kaya','ali5@example.com','05000000005'),
('Hüseyin','Öztürk','huseyin6@example.com','05000000006'),
('Emine','Aydın','emine7@example.com','05000000007'),
('Osman','Yıldız','osman8@example.com','05000000008'),
('Zeynep','Polat','zeynep9@example.com','05000000009'),
('Can','Kurt','can10@example.com','05000000010'),
('Murat','Demirci','murat11@example.com','05000000011'),
('Selin','Erdoğan','selin12@example.com','05000000012'),
('Cem','Çelik','cem13@example.com','05000000013'),
('Deniz','Arslan','deniz14@example.com','05000000014'),
('Seda','Karaca','seda15@example.com','05000000015'),
('Burak','Güneş','burak16@example.com','05000000016'),
('Ece','Taş','ece17@example.com','05000000017'),
('Oğuz','Korkmaz','oguz18@example.com','05000000018'),
('Yasemin','Kaplan','yasemin19@example.com','05000000019'),
('Tamer','Koç','tamer20@example.com','05000000020'),
('İrem','Polat','irem21@example.com','05000000021'),
('Serkan','Çetin','serkan22@example.com','05000000022'),
('Buse','Yıldırım','buse23@example.com','05000000023'),
('Hakan','Bulut','hakan24@example.com','05000000024'),
('Gizem','Öz','gizem25@example.com','05000000025'),
('Levent','Ak','levent26@example.com','05000000026'),
('Nazlı','Eren','nazli27@example.com','05000000027'),
('Merve','Kara','merve28@example.com','05000000028'),
('Furkan','Koç','furkan29@example.com','05000000029'),
('Derya','Yıldız','derya30@example.com','05000000030'),
('Selim','Şimşek','selim31@example.com','05000000031'),
('Aslı','Çetin','asli32@example.com','05000000032'),
('Kadir','Acar','kadir33@example.com','05000000033'),
('Esra','Demir','esra34@example.com','05000000034'),
('Volkan','Öz','volkan35@example.com','05000000035'),
('Bahar','Aktaş','bahar36@example.com','05000000036'),
('Onur','Er','onur37@example.com','05000000037'),
('Sibel','Kılıç','sibel38@example.com','05000000038'),
('Cihan','Öztürk','cihan39@example.com','05000000039'),
('Nil','Yavuz','nil40@example.com','05000000040'),
('İsmail','Aydın','ismail41@example.com','05000000041'),
('Pelin','Gül','pelin42@example.com','05000000042'),
('Emre','Polat','emre43@example.com','05000000043'),
('Dilan','Özer','dilan44@example.com','05000000044'),
('Baran','Kara','baran45@example.com','05000000045'),
('Cansu','Demir','cansu46@example.com','05000000046'),
('Tolga','Ak','tolga47@example.com','05000000047'),
('Sema','Çetin','sema48@example.com','05000000048'),
('Kerem','Yılmaz','kerem49@example.com','05000000049'),
('Ebru','Güneş','ebru50@example.com','05000000050');
 select *from guests g ;

INSERT INTO services(name, description, price) VALUES
('Kahvaltı','Günlük kahvaltı','50.00'),
('Havaalanı Transferi','Gidiş-dönüş transfer','200.00'),
('Extra Temizlik','Oda temizliği isteğe bağlı','30.00'),
('Spa','Spa ve masaj hizmeti','150.00'),
('Otopark','Araç park etme hizmeti','20.00'),
('Wi-Fi','Oda ve lobide ücretsiz internet','0.00'),
('Fitness','Spor salonu kullanımı','40.00'),
('Çamaşır Servisi','Çamaşır ve ütü hizmeti','25.00'),
('Mini Bar','Oda içi mini bar kullanımı','60.00'),
('Gece Atıştırması','Oda servisi gece menüsü','35.00');
select *from services s ;

INSERT INTO reservations(hotel_id, guests_id, room_id, check_in, check_out, nights, rate_per_night, total_amount, status)
VALUES
(1,1,1,'2025-12-10','2025-12-12',2,200.00,400.00,'booked'),
(1,2,2,'2025-12-15','2025-12-18',3,200.00,600.00,'booked'),
(1,3,3,'2025-12-20','2025-12-23',3,350.00,1050.00,'booked'),
(2,4,7,'2025-12-05','2025-12-07',2,250.00,500.00,'booked'),
(2,5,8,'2025-12-10','2025-12-12',2,450.00,900.00,'booked'),
(3,6,11,'2025-12-08','2025-12-10',2,180.00,360.00,'checked_in'),
(3,7,12,'2025-12-12','2025-12-14',2,320.00,640.00,'booked'),
(4,8,16,'2025-12-01','2025-12-04',3,270.00,810.00,'checked_out'),
(4,9,17,'2025-12-06','2025-12-09',3,490.00,1470.00,'booked'),
(5,10,21,'2025-12-15','2025-12-17',2,160.00,320.00,'booked'),
(5,11,22,'2025-12-18','2025-12-21',3,310.00,930.00,'booked'),
(6,12,26,'2025-12-05','2025-12-07',2,130.00,260.00,'checked_out'),
(6,13,27,'2025-12-10','2025-12-12',2,240.00,480.00,'booked'),
(7,14,31,'2025-12-08','2025-12-10',2,190.00,380.00,'booked'),
(7,15,32,'2025-12-12','2025-12-15',3,330.00,990.00,'booked');

select *from reservations r ;

INSERT INTO reservation_services(reservation_id, service_id, quantity, unit_price) VALUES
(1,1,2,50.00),
(1,3,1,30.00),
(2,1,3,50.00),
(2,2,1,200.00),
(3,1,2,50.00),
(3,4,1,150.00),
(4,2,1,200.00),
(4,5,1,20.00),
(5,3,2,30.00),
(5,6,1,0.00),
(6,1,1,50.00),
(6,7,1,40.00),
(7,8,2,25.00),
(8,1,3,50.00),
(9,9,1,60.00),
(10,10,2,35.00);
select *from reservation_services rs ;
INSERT INTO payments(reservation_id, amount, paid_at, payment_method) VALUES
(1,200.00,'2025-12-01 10:00:00','card'),
(1,230.00,'2025-12-01 14:30:00','cash'),
(2,100.00,'2025-12-02 09:15:00','card'),
(2,500.00,'2025-12-02 16:45:00','cash'),
(3,1050.00,'2025-12-03 11:00:00','card'),
(4,500.00,'2025-12-04 15:20:00','card'),
(4,20.00,'2025-12-04 18:00:00','cash'),
(5,320.00,'2025-12-05 12:10:00','card'),
(6,260.00,'2025-12-06 09:30:00','cash'),
(7,380.00,'2025-12-07 14:00:00','card'),
(8,810.00,'2025-12-08 11:45:00','card'),
(9,1470.00,'2025-12-09 16:30:00','cash'),
(10,930.00,'2025-12-10 13:00:00','card'),
(11,480.00,'2025-12-11 10:20:00','card'),
(12,260.00,'2025-12-12 15:10:00','cash'),
(13,480.00,'2025-12-13 09:50:00','card'),
(14,380.00,'2025-12-14 14:40:00','cash'),
(15,990.00,'2025-12-15 11:30:00','card');
 select *from payments p ;


--Rezervasyon toplam tutarını hesaplayan fonksiyon

CREATE OR REPLACE FUNCTION calculate_reservation_total(res_id BIGINT)
RETURNS NUMERIC AS $$
DECLARE
    total NUMERIC;
BEGIN
    SELECT r.rate_per_night * r.nights + COALESCE(SUM(rs.unit_price * rs.quantity), 0)
    INTO total
    FROM reservations r
    LEFT JOIN reservation_services rs ON rs.reservation_id = r.id
    WHERE r.id = res_id
    GROUP BY r.id, r.rate_per_night, r.nights;

    RETURN total;
END;
$$ LANGUAGE plpgsql;

-- Test:
SELECT calculate_reservation_total(3) AS total_payment;

--Müsait odaları bulan fonksiyon

CREATE OR REPLACE FUNCTION available_rooms(
    p_hotel_id BIGINT, 
    p_check_in DATE, 
    p_check_out DATE, 
    p_room_type VARCHAR
)
RETURNS TABLE(room_id INTEGER, room_number VARCHAR, floor INTEGER) AS $$
BEGIN
    RETURN QUERY
    SELECT r.id, r.room_number, r.floor
    FROM rooms r
    JOIN room_types rt ON rt.id = r.room_type_id
    WHERE r.hotel_id = p_hotel_id
      AND rt.name = p_room_type
      AND r.status = 'available'
      AND r.id NOT IN (
          SELECT res.room_id
          FROM reservations res
          WHERE NOT (res.check_out <= p_check_in OR res.check_in >= p_check_out)
      );
END;
$$ LANGUAGE plpgsql;

--Test
SELECT * FROM available_rooms(2, '2025-12-10', '2025-12-12', 'Double');

--Otelin doluluk oranını hesaplayan fonksiyon
CREATE OR REPLACE FUNCTION occupancy_rate(p_hotel_id BIGINT, p_month INT, p_year INT)
RETURNS TEXT AS $$
DECLARE
    total_rooms INT;
    booked_days INT;
    month_days INT;
    occupancy NUMERIC(5,2);
BEGIN
    -- Toplam oda sayısı
    SELECT COUNT(*) INTO total_rooms
    FROM rooms
    WHERE hotel_id = p_hotel_id;

    -- O ayın toplam gün sayısı
    SELECT DATE_PART('day', (DATE_TRUNC('month', make_date(p_year, p_month,1)) + INTERVAL '1 month' 
                             - DATE_TRUNC('month', make_date(p_year, p_month,1)))) 
    INTO month_days;

    -- Rezervasyonlu gün sayısı
    SELECT COALESCE(SUM(
        LEAST(
            r.check_out - r.check_in,
            month_days
        )
    ),0)
    INTO booked_days
    FROM reservations r
    WHERE r.hotel_id = p_hotel_id
      AND EXTRACT(MONTH FROM r.check_in) = p_month
      AND EXTRACT(YEAR FROM r.check_in) = p_year;

    -- Doluluk oranı hesaplama
    IF total_rooms = 0 THEN
        occupancy := 0;
    ELSE
        occupancy := (booked_days::NUMERIC / (total_rooms * month_days)) * 100;
    END IF;

    -- Yüzde olarak, string formatında döndürme
    RETURN occupancy::TEXT || ' %';
END;
$$ LANGUAGE plpgsql;

-- Test sorgusu
SELECT occupancy_rate(2, 12, 2025) AS occupancy_percent;
SELECT occupancy_rate(1, 12, 2025) AS occupancy_percent;


CREATE OR REPLACE FUNCTION check_room_availability()
RETURNS TRIGGER AS $$
DECLARE
    overlapping_count INT;
BEGIN
    -- Aynı oda için çakışan rezervasyon var mı kontrol et
    SELECT COUNT(*) INTO overlapping_count
    FROM reservations
    WHERE room_id = NEW.room_id
      AND NOT (check_out <= NEW.check_in OR check_in >= NEW.check_out);

    IF overlapping_count > 0 THEN
        RAISE EXCEPTION 'Oda zaten seçilen tarihler arasında dolu!';
    END IF;

    -- Oda müsaitse işlemi devam ettir
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 2. Trigger tanımı
CREATE TRIGGER trigger_check_room_availability
BEFORE INSERT ON reservations
FOR EACH ROW
EXECUTE FUNCTION check_room_availability();
-- Trigger çalıştığını kotrol etmek için yaptım aşaıdakini
--INSERT INTO reservations(hotel_id, guests_id, room_id, check_in, check_out, nights, rate_per_night, total_amount, status)
--VALUES (1, 20, 1, '2025-12-11', '2025-12-13', 2, 200.00, 400.00, 'booked');

--Check-out yapıldığında oda durumunu güncelleyen trigger
CREATE OR REPLACE FUNCTION trg_update_room_status()
RETURNS TRIGGER AS $$
BEGIN
    IF NEW.status = 'checked_out' THEN
        UPDATE rooms SET status = 'available' WHERE id = NEW.room_id;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_room_status
AFTER UPDATE OF status ON reservations
FOR EACH ROW
EXECUTE FUNCTION trg_update_room_status();

--Ödeme alındığında rezervasyon durumunu güncelleyen trigger
CREATE OR REPLACE FUNCTION trg_update_reservation_payment()
RETURNS TRIGGER AS $$
DECLARE
    total_paid NUMERIC;
    total_due NUMERIC;
BEGIN
    SELECT COALESCE(SUM(amount),0) INTO total_paid FROM payments WHERE reservation_id = NEW.reservation_id;
    SELECT rate_per_night * nights INTO total_due FROM reservations WHERE id = NEW.reservation_id;

    IF total_paid >= total_due THEN
        UPDATE reservations SET status = 'paid' WHERE id = NEW.reservation_id;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER update_reservation_payment
AFTER INSERT ON payments
FOR EACH ROW
EXECUTE FUNCTION trg_update_reservation_payment();


--Rezervasyon oluşturma (müsaitlik kontrolü ile)
CREATE OR REPLACE PROCEDURE sp_create_reservation(
    p_hotel_id BIGINT,
    p_guest_id BIGINT,
    p_room_id BIGINT,
    p_check_in DATE,
    p_check_out DATE,
    p_rate NUMERIC
)
LANGUAGE plpgsql AS $$
BEGIN
    PERFORM 1 FROM reservations
    WHERE room_id = p_room_id
      AND NOT (p_check_out <= check_in OR p_check_in >= check_out);
    
    IF FOUND THEN
        RAISE EXCEPTION 'Oda bu tarihlerde dolu!';
    END IF;

    INSERT INTO reservations(hotel_id, guests_id, room_id, check_in, check_out, nights, rate_per_night, total_amount, status, created_at)
    VALUES (p_hotel_id, p_guest_id, p_room_id, p_check_in, p_check_out, (p_check_out - p_check_in), p_rate, (p_check_out - p_check_in)*p_rate, 'booked', now());
END;
$$;
--Bu STORED PROCEDURELER çalışıp çalışmadığını anlamak için ilki çalışırsa dolı yazacak 2.çalışırsa eklenecek
-- CALL sp_create_reservation(2, 10, 7, '2025-12-06', '2025-12-08', 250.00);
--CALL sp_create_reservation(2, 11, 7, '2025-12-08', '2025-12-10', 250.00);

--check-out işlemi ve toplam ödeme hesaplama
CREATE OR REPLACE PROCEDURE sp_checkout(p_reservation_id INTEGER)
LANGUAGE plpgsql AS $$
DECLARE
    total NUMERIC;
BEGIN
    SELECT calculate_reservation_total(p_reservation_id) INTO total;
    UPDATE reservations SET status='checked_out', total_amount=total WHERE id = p_reservation_id;
    UPDATE rooms SET status='available' WHERE id = (SELECT room_id FROM reservations WHERE id=p_reservation_id);
END;
$$;


-- Test:
 --CALL sp_checkout(1);
--SELECT * 
--FROM payments 
--WHERE reservation_id = 1;

--SELECT r.id, r.total_amount, COALESCE(SUM(p.amount),0) AS total_paid
--FROM reservations r
--LEFT JOIN payments p ON p.reservation_id = r.id
--WHERE r.id = 1
--GROUP BY r.id, r.total_amount;

-- Otellerin aylık gelir ve doluluk istatistikleri
CREATE OR REPLACE VIEW v_hotel_monthly_stats AS
SELECT h.id AS hotel_id, h.name AS hotel_name,
       EXTRACT(MONTH FROM r.check_in) AS month,
       EXTRACT(YEAR FROM r.check_in) AS year,
       SUM(r.total_amount) AS total_revenue,
       occupancy_rate(h.id, EXTRACT(MONTH FROM r.check_in)::INT, EXTRACT(YEAR FROM r.check_in)::INT) AS occupancy_percent
FROM hotels h
JOIN reservations r ON r.hotel_id = h.id
GROUP BY h.id, h.name, EXTRACT(MONTH FROM r.check_in), EXTRACT(YEAR FROM r.check_in);
--views bakma
SELECT * FROM v_hotel_monthly_stats;

--Oda tiplerine göre rezervasyon ortalamaları
CREATE OR REPLACE VIEW v_room_type_avg AS
SELECT rt.name AS room_type, AVG(r.total_amount) AS avg_reservation_amount
FROM room_types rt
JOIN rooms rm ON rm.room_type_id = rt.id
JOIN reservations r ON r.room_id = rm.id
GROUP BY rt.name;
--views
select *from  v_room_type_avg;

--Otellere göre en popüler oda tipleri
SELECT h.name AS hotel_name, rt.name AS room_type, COUNT(r.id) AS total_reservations
FROM reservations r
JOIN rooms rm ON rm.id = r.room_id
JOIN room_types rt ON rt.id = rm.room_type_id
JOIN hotels h ON h.id = rm.hotel_id
GROUP BY h.name, rt.name
ORDER BY total_reservations DESC;
--Oetl filtreli olarak en popüler oda tipi
SELECT h.name AS hotel_name, 
       rt.name AS room_type, 
       COUNT(r.id) AS total_reservations
FROM reservations r
JOIN rooms rm ON rm.id = r.room_id
JOIN room_types rt ON rt.id = rm.room_type_id
JOIN hotels h ON h.id = rm.hotel_id
WHERE h.name = 'Skyline Hotel'
GROUP BY h.name, rt.name
ORDER BY total_reservations DESC;

--Aylara göre gelir analizi
SELECT EXTRACT(MONTH FROM check_in) AS month, EXTRACT(YEAR FROM check_in) AS year, SUM(total_amount) AS revenue
FROM reservations
GROUP BY EXTRACT(MONTH FROM check_in), EXTRACT(YEAR FROM check_in)
HAVING SUM(total_amount) > 1000
ORDER BY year, month;

-- Ortalama rezervasyon tutarından yüksek rezervasyonlar
SELECT *
FROM reservations
WHERE total_amount > (
    SELECT AVG(total_amount) FROM reservations
);
--En çok kazandıran oteller
SELECT h.name AS hotel_name, SUM(res.total_amount) AS total_revenue
FROM reservations res
JOIN hotels h ON res.hotel_id = h.id
GROUP BY h.name
ORDER BY total_revenue DESC;
--en sık rezervasyon yapılan oda tipleri
SELECT rt.name AS room_type, COUNT(res.id) AS reservation_count
FROM reservations res
JOIN rooms r ON res.room_id = r.id
JOIN room_types rt ON r.room_type_id = rt.id
GROUP BY rt.name
ORDER BY reservation_count DESC;

--otellere göre aylık gelir
SELECT h.name AS hotel_name,
       EXTRACT(MONTH FROM res.check_in) AS month,
       AVG(res.total_amount) AS avg_monthly_revenue
FROM reservations res
JOIN hotels h ON res.hotel_id = h.id
GROUP BY h.name, month
ORDER BY h.name, month;
--Her ek hizmetten ne kadar gelir elde ettiğim
SELECT s.name AS service_name, SUM(rs.quantity * rs.unit_price) AS service_revenue
FROM reservation_services rs
JOIN services s ON rs.service_id = s.id
GROUP BY s.name
ORDER BY service_revenue DESC;

