PROGRAM CountingNumCharacter(INPUT, OUTPUT);
VAR
  Ch, Ones, Tens, Hundreds, Thousand, Flag: CHAR;
BEGIN
  Ones := '0';
  Tens := '0';
  Hundreds := '0';
  Thousand := '0';
  Flag := 'N';
  READ(Ch);
  WHILE Ch <> '#'
  DO
    BEGIN
      IF Flag <> 'O'
      THEN
        BEGIN
          IF Ones = '9'
          THEN
            IF Tens = '9'
            THEN
              IF Hundreds = '9'
              THEN
                IF Thousand = '9'
                THEN
                  Flag := 'O'                 //Overflow
                ELSE
                  BEGIN
                    Flag := '3';              // 10^3 = 1000
                    Ones := Thousand
                  END
              ELSE
                BEGIN
                  Flag := '2';              // 10^2 = 100
                  Ones := Hundreds
                END
            ELSE
              BEGIN
                Flag := '1';                // 10^1 = 10
                Ones := Tens
              END
          ELSE
            Flag := '0';                    // 10^0 = 1
          IF Ones = '8'
          THEN
            Ones := '9';
          IF Ones = '7'
          THEN
            Ones := '8';
          IF Ones = '6'
          THEN
            Ones := '7';
          IF Ones = '5'
          THEN
            Ones := '6';
          IF Ones = '4'
          THEN
            Ones := '5';
          IF Ones = '3'
          THEN
            Ones := '4';
          IF Ones = '2'
          THEN
            Ones := '3';
          IF Ones = '1'
          THEN
            Ones := '2';
          IF Ones = '0'
          THEN
            Ones := '1';
          IF Flag = '3'
          THEN
            BEGIN
              Flag := '2';
              Thousand := Ones;
              Ones := '0';
            END;
          IF Flag = '2'
          THEN
            BEGIN
              Flag := '1';
              Hundreds := Ones;
              Ones := '0';
            END;
          IF Flag = '1'
          THEN
            BEGIN
              Flag := 'N';
              Tens := Ones;
              Ones := '0';
            END
        END;
      READ(Ch)
    END;
  IF Flag <> 'O'
  THEN
    WRITELN('Number of characters is ', Thousand, Hundreds, Tens, Ones)
  ELSE
    WRITELN('Over 9999 character, I CAN''T COUNT IT T.T')
END.