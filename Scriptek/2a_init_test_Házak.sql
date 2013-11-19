--NLS
ALTER SESSION SET NLS_LANGUAGE= 'HUNGARIAN';
ALTER SESSION SET NLS_TERRITORY= 'HUNGARY';
ALTER SESSION SET NLS_DATE_FORMAT= 'YYYY-MM-DD';
ALTER SESSION SET NLS_DATE_LANGUAGE = 'HUNGARIAN';
ALTER SESSION SET NLS_ISO_CURRENCY = 'HUNGARY';
ALTER SESSION SET NLS_NUMERIC_CHARACTERS = ',.';
ALTER SESSION SET NLS_SORT = 'HUNGARIAN';

--Házak tesztadatok
DELETE Házak;

INSERT INTO Házak 
    (ház_szám, ház_megnevezés, férőhely_szám)
VALUES
    (
        1,
        'fa',
        10
    )
;

INSERT INTO Házak 
    (ház_szám, ház_megnevezés, férőhely_szám)
VALUES
    (
        2,
        'piros',
        20
    )
;

INSERT INTO Házak 
    (ház_szám, ház_megnevezés, férőhely_szám)
VALUES
    (
        3,
        'kék',
        15
    )
;

INSERT INTO Házak 
    (ház_szám, ház_megnevezés, férőhely_szám)
VALUES
    (
        4,
        'zöld',
        12
    )
;

INSERT INTO Házak 
    (ház_szám, ház_megnevezés, férőhely_szám)
VALUES
    (
        5,
        'nagy',
        30
    )
;

INSERT INTO Házak 
    (ház_szám, ház_megnevezés, férőhely_szám)
VALUES
    (
        6,
        'kis',
        5
    )
;

INSERT INTO Házak 
    (ház_szám, ház_megnevezés, férőhely_szám)
VALUES
    (
        7,
        'kék',
        10
    )
;

INSERT INTO Házak 
    (ház_szám, ház_megnevezés, férőhely_szám)
VALUES
    (
        8,
        'fa',
        15
    )
;

INSERT INTO Házak 
    (ház_szám, ház_megnevezés, férőhely_szám)
VALUES
    (
        9,
        'nagy',
        40
    )
;

INSERT INTO Házak 
    (ház_szám, ház_megnevezés, férőhely_szám)
VALUES
    (
        10,
        'sárga',
        10
    )
;