
--a)    
/*SELECT USER_ID, (SELECT COUNT(*) FROM LOG AS L WHERE DATE(TIME) <= DATE(MIN((SELECT TIME FROM LOG AS L WHERE L.USER_ID = U.USER_ID AND L.BET IS NOT NULL))) AND L.USER_ID = U.USER_ID) AS times
FROM USERS AS U GROUP BY USER_ID*/


--b) avg win == 306%
--SELECT CAST((SUM(WIN) - SUM(BET)) AS FLOAT) / SUM(BET) * 100  AS P FROM LOG

--c)
--SELECT USER_ID, (SELECT SUM(WIN) - SUM(BET) FROM LOG WHERE LOG.USER_ID = U.USER_ID) AS BALANCE FROM USERS AS U WHERE BALANCE IS NOT NULL

--d) moscow 492.7%
--SELECT GEO, (SELECT ROUND(CAST(SUM(UL.WIN) AS FLOAT) / SUM(UL.BET), 3) * 100 FROM USERS CROSS JOIN LOG AS UL ON USERS.USER_ID = UL.USER_ID AND GEO = U.GEO) AS WIN FROM USERS AS U GROUP BY GEO

--e) Moscow 1678321
--SELECT GEO, (SELECT MAX(UL.BET) FROM USERS CROSS JOIN LOG AS UL ON USERS.USER_ID = UL.USER_ID AND GEO = U.GEO) AS WIN FROM USERS AS U GROUP BY GEO

--f) avg(days) == 47.03
/*SELECT AVG(days) 
FROM (SELECT USER_ID, (SELECT julianday(MIN((  SELECT TIME FROM LOG WHERE USER_ID = U.USER_ID AND BET IS NOT NULL  ))) -
                              julianday(MIN((  SELECT TIME FROM LOG WHERE USER_ID = U.USER_ID )))) AS days
FROM USERS AS U GROUP BY USER_ID)*/

