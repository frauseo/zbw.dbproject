# Stored Procedure bereinigung der quittierte Logs

DELIMITER //
CREATE PROCEDURE LogClear 
(
	IN _logentries_id INT
)

BEGIN
	
	DELETE FROM v_logentries
    WHERE _logentreies_id = logentrie_id;
    
    UPDATE Log
    SET is_acknowledged = 1
    WHERE log_is = _logentries_id;
	
END //
DELIMITER ;