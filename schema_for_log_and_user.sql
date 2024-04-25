CREATE TABLE EMP(
  EMP_NO INTEGER PRIMARY KEY,
  EMP_NAME VARCHAR(20) DEFAULT 'Incognito' NOT NULL,
  ENP_BDATE DATE DEFAULT NULL CHECK(ENP_BDATE >= '1917-10-24'),
  EMP_SAL NUMERIC(10, 2) DEFAULT 10000.00 CHECK(EMP_SAL > 10000.00 AND EMP_SAL < 20000000.00) NOT NULL,
  DEPT_NO INTEGER DEFAULT NULL REFERENCES 
  DEPT ON DELETE SET NULL,
  PRO_NO INTEGER DEFAULT NULL,
  FOREIGN KEY (PRO_NO) REFERENCES PRO (PRO_NO) ON DELETE SET NULL
);  

CREATE TABLE DEPT (
 DEPT_NO INTEGER PRIMARY KEY,
 DEPT_EMP_NO INTEGER NO NULL CHECK(DEPT_EMP_NO > 1 AND DEPT_EMP_NO < 100),
 DEPT_NAME VARCHAR(200) DEFAULT 'Nameless' NOT NULL,
 DEPT_TOTAL_SAL NUMERIC(10, 2) DEFAULT 10000.00 CHECK(DEPT_TOTAL_SAL >= 10000.00) NOT NULL,
 DEPT_MNG EMP_NO DEFAULT NULL REFERENCES EMP ON DELETE SET NULL
);