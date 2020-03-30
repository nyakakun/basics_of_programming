PROGRAM Trim(INPUT, OUTPUT);
VAR
  Ch, State: CHAR;
BEGIN
  State := 'B';
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      IF Ch = ' '
      THEN
        BEGIN
          IF State = 'C'
          THEN
            State := ' '
        END
      ELSE
        BEGIN
          IF State = ' '
          THEN
            WRITE(' ');
          State := 'C';
          WRITE(Ch)
        END
    END;
  WRITELN  
END.