PROGRAM CountingNumCharacter(INPUT, OUTPUT);
VAR
  Ch, Ones, Tens, Hundreds, Flag: CHAR;
BEGIN
  Ones := '0';
  Tens := '0';
  Hundreds := '0';
  Flag := '0';
  READ(Ch);
  WHILE Ch <> '#'
  DO
    BEGIN
      IF Ones = '9'
      THEN
        BEGIN
          Ones := '0';
          IF Tens = '9'
          THEN
            BEGIN
              Tens := '0';
                IF Hundreds = '9'
                THEN
                  Flag := 'O'  {Overflow}
                ELSE
                  IF Hundreds = '8'
                  THEN
                    Hundreds := '9'
                  ELSE
                    IF Hundreds = '7'
                    THEN
                      Hundreds := '8'
                    ELSE
                      IF Hundreds = '6'
                      THEN
                        Hundreds := '7'
                      ELSE
                        IF Hundreds = '5'
                        THEN
                          Hundreds := '6'
                        ELSE
                          IF Hundreds = '4'
                          THEN
                            Hundreds := '5'
                          ELSE
                            IF Hundreds = '3'
                            THEN
                              Hundreds := '4'
                            ELSE
                              IF Hundreds = '2'
                              THEN
                                Hundreds := '3'
                              ELSE
                                IF Hundreds = '1'
                                THEN
                                  Hundreds := '2'
                                ELSE
                                  Hundreds := '1'
            END
          ELSE
            IF Tens = '8'
            THEN
              Tens := '9'
            ELSE
              IF Tens = '7'
              THEN
                Tens := '8'
              ELSE
                IF Tens = '6'
                THEN
                  Tens := '7'
                ELSE
                  IF Tens = '5'
                  THEN
                    Tens := '6'
                  ELSE
                    IF Tens = '4'
                    THEN
                      Tens := '5'
                    ELSE
                      IF Tens = '3'
                      THEN
                        Tens := '4'
                      ELSE
                        IF Tens = '2'
                        THEN
                          Tens := '3'
                        ELSE
                          IF Tens = '1'
                          THEN
                            Tens := '2'
                          ELSE
                            Tens := '1'
        END
      ELSE
        IF Ones = '8'
        THEN
          Ones := '9'
        ELSE
          IF Ones = '7'
          THEN
            Ones := '8'
          ELSE
            IF Ones = '6'
            THEN
              Ones := '7'
            ELSE
              IF Ones = '5'
              THEN
                Ones := '6'
              ELSE
                IF Ones = '4'
                THEN
                  Ones := '5'
                ELSE
                  IF Ones = '3'
                  THEN
                    Ones := '4'
                  ELSE
                    IF Ones = '2'
                    THEN
                      Ones := '3'
                    ELSE
                      IF Ones = '1'
                      THEN
                        Ones := '2'
                      ELSE
                        Ones := '1';
      READ(Ch)
    END;
  IF Flag <> 'O'
  THEN
    WRITELN('Number of characters is ', Hundreds, Tens, Ones)
  ELSE
    WRITELN('Over 999 character, I CAN''T COUNT IT T.T')
END.