# Stored Procedure bereinigung der quittierte Logs

DELIMITER //
CREATE PROCEDURE LogClear 
(
	IN _logentries_id INT
)

BEGIN
	
	DELETE FROM v_logentries
    WHERE _logentries_id = v_logentrie_id;
    
    UPDATE Log
    SET is_acknowledged = 1
    WHERE log_id = _logentries_id;
	
END //
DELIMITER ;