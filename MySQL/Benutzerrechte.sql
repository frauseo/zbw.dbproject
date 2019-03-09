use inventarisierungsloesung;


-- Benutzerkonto Geschäftsführer--
CREATE USER 'Geschaeftsfuehrer'@'%' IDENTIFIED BY '1111';

-- Benutzerrechte --
GRANT SELECT, UPDATE
ON TABLE inventarisierungsloesung.*
TO 'Geschaeftsfuehrer'@'%';

-- REVOKE SELECT, UPDATE 
-- ON TABLE inventarisierungsloesung.*
-- FROM 'Geschaeftsfuehrer'@'%';

FLUSH PRIVILEGES;
SHOW GRANTS FOR 'Geschaeftsfuehrer'@'%';
 
-- Benutzerkonto Abteilungsleiter--
CREATE USER 'Abteilungsleiter'@'%' IDENTIFIED BY '1111';

-- Benutzerrechte --
GRANT  UPDATE
ON TABLE pointofdelivery 
TO 'Abteilungsleiter'@'%';

GRANT  UPDATE
ON TABLE location
TO 'Abteilungsleiter'@'%';

-- REVOKE SELECT, UPDATE 
-- ON TABLE inventarisierungsloesung.*
-- FROM 'Geschaeftsfuehrer'@'%';

FLUSH PRIVILEGES;
SHOW GRANTS FOR 'Abteilungsleiter'@'%';


-- Benutzerkonto Sachbearbeiter--
CREATE USER 'Sachbearbeiter'@'%' IDENTIFIED BY '1111';

-- Benutzerrechte --
GRANT  SELECT, UPDATE, DELETE, INSERT
ON TABLE *
TO 'Sachbearbeiter'@'%';

-- REVOKE SELECT, UPDATE 
-- ON TABLE inventarisierungsloesung.*
-- FROM 'Sachbearbeiter'@'%';

FLUSH PRIVILEGES;
SHOW GRANTS FOR 'Sachbearbeiter'@'%';

-- Benutzerkonto Logger--
CREATE USER 'Logger'@'%' IDENTIFIED BY '1111';

-- Benutzerrechte --
GRANT INSERT
ON TABLE log
TO 'Logger'@'%';

-- REVOKE SELECT, UPDATE 
-- ON TABLE inventarisierungsloesung.*
-- FROM 'Logger'@'%';

FLUSH PRIVILEGES;
SHOW GRANTS FOR 'Logger'@'%';


-- Benutzerkonto Device--
CREATE USER 'Device'@'%' IDENTIFIED BY '1111';


-- Benutzerrechte --
GRANT UPDATE, SELECT
ON TABLE log
TO 'Device'@'%';

-- REVOKE SELECT, UPDATE 
-- ON TABLE inventarisierungsloesung.*
-- FROM 'Device'@'%';

FLUSH PRIVILEGES;
SHOW GRANTS FOR 'Device'@'%';


SELECT *
FROM mysql.user;