-- DDL for the Transport Management System (TMS)

-- Table for Transport Orders
CREATE TABLE TRANSPORT_ORDER (
    ORDER_ID INT PRIMARY KEY AUTO_INCREMENT,
    CUSTOMER_NAME VARCHAR(255) NOT NULL,
    ORDER_DATE DATE NOT NULL,
    DELIVERY_DATE DATE NOT NULL,
    DESTINATION VARCHAR(255) NOT NULL,
    ORDER_STATUS VARCHAR(255) NOT NULL
);

-- Table for Transport Units
CREATE TABLE TRANSPORT_UNIT (
    UNIT_ID INT PRIMARY KEY AUTO_INCREMENT,
    ORDER_ID INT NOT NULL,
    UNIT_DECRIPTION VARCHAR(255),
    FOREIGN KEY (ORDER_ID) REFERENCES TRANSPORT_ORDER(ORDER_ID)
        ON DELETE CASCADE
);

-- Table for Trips
CREATE TABLE TRIP (
    TRIP_ID INT PRIMARY KEY AUTO_INCREMENT,
    ORIGIN VARCHAR(255) NOT NULL,
    DESTINATION VARCHAR(255) NOT NULL,
    VECTOR VARCHAR(255) NOT NULL,
    DEPARTURE_DATE DATETIME NOT NULL,
    ARRIVAL_DATE DATETIME,
    TRIP_STATUS VARCHAR(255) NOT NULL
);

-- Table for Legs (association between Transport Units and Trips)
CREATE TABLE LEG (
    UNIT_ID INT NOT NULL,
    TRIP_ID INT NOT NULL,
    LEG_SEQUENCE INT NOT NULL,
    PRIMARY KEY (UNIT_ID, TRIP_ID, LEG_SEQUENCE),
    FOREIGN KEY (UNIT_ID) REFERENCES TRANSPORT_UNIT(UNIT_ID)
        ON DELETE CASCADE,
    FOREIGN KEY (TRIP_ID) REFERENCES TRIP(TRIP_ID)
        ON DELETE CASCADE
);
-- CONTRAINTS: 
-- 1. I valori LEG_SEQUENCE per una UNIT_ID associato and N TRIP devono andare da 1 a N, senza buchi e/o duplicati
-- 2. Ogni trip nella sequence deve avere  DEPARTURE_DATE maggiore di ARRIVAL_DATE del trip precedente nella sequence
-- 3. Ogni trip nella sequence deve avere  ORIGIN uhuale ad ARRIVAL del trip precedente nella sequenza