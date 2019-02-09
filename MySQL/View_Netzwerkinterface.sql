CREATE VIEW
	view_freiesInterface (LocationName, Hostname, Portnummer, Medium, Geschwindigkeit)
    AS
		SELECT 
			CONCAT_WS(building, room),
            device.hostname,
            deviceport.description,
            transportmedium.description,
            bandwith
		FROM
			device INNER JOIN location 
				ON location_fk=location_id
			INNER JOIN deviceport
				ON device_fk = device_id
			INNER JOIN transportmedium
				ON device_fk = device_id
			INNER JOIN interface
				ON interface.device_fk = device_id
		WHERE interface.is_in_use = 0
;