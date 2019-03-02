use inventarisierungsloesung;
DROP VIEW IF EXISTS v_usageperlocation;

SELECT COUNT(devices_id_fk), 'devices_id_fk' FROM interfaces
GROUP BY devices_id_fk;

CREATE VIEW  v_usageperlocation AS
 
SELECT i.interface_id, l.designation, COUNT(i.devices_id_fk) AS 'Anzahl belegter Port' FROM interfaces i INNER JOIN devices d ON i.devices_id_fk = d.device_id
INNER JOIN location l
ON d.location_fk = l.location_id
GROUP BY i.devices_id_fk;

SELECT * FROM v_usageperlocation;