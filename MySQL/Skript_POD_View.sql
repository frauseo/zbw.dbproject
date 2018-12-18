CREATE 
    ALGORITHM = UNDEFINED 
    DEFINER = `root`@`localhost` 
    SQL SECURITY DEFINER
VIEW `inventarisierungsloesung`.`v_usageperlocation` AS
    SELECT 
        `inventarisierungsloesung`.`pointofdelivery`.`designation` AS `designation`
    FROM
        `inventarisierungsloesung`.`pointofdelivery`