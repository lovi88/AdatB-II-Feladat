ALTER SESSION SET NLS_LANGUAGE= 'HUNGARIAN';
ALTER SESSION SET NLS_TERRITORY= 'HUNGARY';
ALTER SESSION SET NLS_DATE_FORMAT= 'YYYY-MM-DD';
ALTER SESSION SET NLS_DATE_LANGUAGE = 'HUNGARIAN';
ALTER SESSION SET NLS_ISO_CURRENCY = 'HUNGARY';
ALTER SESSION SET NLS_NUMERIC_CHARACTERS = ',.';
ALTER SESSION SET NLS_SORT = 'HUNGARIAN';

DROP TABLE Lakók;
CREATE TABLE Lakók (
    Név                           VARCHAR2(30),
    Egészségbiztosítási_szám      CHAR(9) UNIQUE,
    SzületésiDátum                DATE,
    Nem                           CHAR(1) CHECK( Nem IN ('f','n') ),
    Személyigazolvány_szám        CHAR(11) UNIQUE,
    Tartózkodas_tól               DATE,
    Tartózkodas_ig                DATE,
    Ország                        VARCHAR2(50),
    ház_szám                      NUMBER(4),
    Csoport_név                   VARCHAR2(50),
    Csoportvezető                 VARCHAR2(30)
);


DROP TABLE Csoportok;
CREATE TABLE Csoportok(
    csoport_név            VARCHAR2(50),
    csoportvezető          VARCHAR2(30),
    csoport_pontszám       NUMBER(5,1)
);

DROP TABLE Házak;
CREATE TABLE Házak (
    ház_szám               NUMBER(3),
    ház_megnevezés         VARCHAR2(25) NOT NULL,
    férőhely_szám          NUMBER(3) NOT NULL
);