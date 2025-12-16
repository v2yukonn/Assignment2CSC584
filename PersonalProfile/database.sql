/**
 * Author:  aliff
 * Created: Dec 16, 2025
 */

CREATE TABLE PROFILE (
    ID VARCHAR(10) NOT NULL,
    NAME VARCHAR(100),
    PROGRAM VARCHAR(100),
    EMAIL VARCHAR(100),
    HOBBY VARCHAR(200),
    INTRO VARCHAR(500),
    PRIMARY KEY (ID)
);

INSERT INTO PROFILE (ID, NAME, PROGRAM, EMAIL, HOBBY, INTRO)
VALUES ('2025143489', 'Aliff Eirwann', 'CDCS253', 'aliff@student.uitm.edu.my', 'Swimming', 'i love hunting for aliens.');