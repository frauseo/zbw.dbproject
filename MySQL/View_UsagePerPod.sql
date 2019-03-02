use inventarisierungsloesung;
DROP VIEW IF EXISTS v_usageperpod;

CREATE VIEW  v_usageperpod (interface_id, ldesignation,idevices_id_fk , pdesignation) AS 
 
SELECT i.interface_id, l.designation, COUNT(i.devices_id_fk) AS 'Anzahl belegter Port', p.designation FROM interfaces i 
INNER JOIN devices d 
ON i.devices_id_fk = d.device_id
INNER JOIN location l
ON d.location_fk = l.location_id
INNER JOIN pointofdelivery p
ON l.location_id = p.location_fk;

SELECT * FROM v_usageperpod;