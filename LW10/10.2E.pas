PROGRAM FormatProgram(INPUT, OUTPUT);
VAR
  W1, W2, W3, W4, W5, W6, W7, W8, W9, State: CHAR;
BEGIN
  W1 := ' ';
  W2 := W1;
  W3 := W1;
  W4 := W1;
  W5 := W1;
  W6 := W1;
  W7 := W1;
  W8 := W1;
  W9 := W1;
  State := 'B';
  WHILE NOT (EOLN OR EOF)
  DO
    BEGIN
      W9 := W8;
      W8 := W7;
      W7 := W6;
      W6 := W5;
      W5 := W4;
      W4 := W3;
      W3 := W2;
      W2 := W1;
      READ(W1);
      IF (State = 'N') OR (State = 'B') OR (State = 'C') OR (State = 'E') OR (State = 'K')
      THEN
        BEGIN
          IF ((W7 = ' ') OR (W7 = '}')) AND (W6 = 'B') AND (W5 = 'E') AND (W4 = 'G') AND (W3 = 'I') AND (W2 = 'N') AND ((W1 = ' ') OR (W1 = '{') OR (W1 = ';'))
          THEN
            BEGIN
              IF State = 'C'
              THEN
                WRITELN;
              WRITE('BEGIN');
              State := 'K'
            END;
          IF ((W5 = ' ') OR (W5 = ';') OR (W5 = '}')) AND (W4 = 'E') AND (W3 = 'N') AND (W2 = 'D') AND ((W1 = ' ') OR (W1 = '.') OR (W1 = '{'))
          THEN
            BEGIN
              IF State <> 'E'
              THEN
                WRITELN;
              WRITE('END')
            END;
          IF ((W7 = ' ') OR (W7 = ';') OR (W7 = '}')) AND (W6 = 'W') AND (W5 = 'R') AND (W4 = 'I') AND (W3 = 'T') AND (W2 = 'E') AND ((W1 = ' ') OR (W1 = '(') OR (W1 = '{') OR (W1 = ';'))
          THEN
            WRITE('  WRITE');
          IF ((W6 = ' ') OR (W6 = ';') OR (W6 = '}')) AND (W5 = 'R') AND (W4 = 'E') AND (W3 = 'A') AND (W2 = 'D') AND ((W1 = ' ') OR (W1 = '(') OR (W1 = '{') OR (W1 = ';'))
          THEN
            WRITE('  READ');
          IF ((W9 = ' ') OR (W9 = ';') OR (W9 = '}')) AND (W8 = 'W') AND (W7 = 'R') AND (W6 = 'I') AND (W5 = 'T') AND (W4 = 'E') AND (W3 = 'L') AND (W2 = 'N') AND ((W1 = ' ') OR (W1 = '(') OR (W1 = '{') OR (W1 = ';'))
          THEN
            WRITE('  WRITELN');
          IF ((W8 = ' ') OR (W8 = ';') OR (W9 = '}')) AND (W7 = 'R') AND (W6 = 'E') AND (W5 = 'A') AND (W4 = 'D') AND (W3 = 'L') AND (W2 = 'N') AND ((W1 = ' ') OR (W1 = '(') OR (W1 = '{') OR (W1 = ';'))
          THEN
            WRITE('  READLN');
          IF W1 = '.'
          THEN
            WRITE('.');
          IF W1 = ';'
          THEN
            BEGIN
              IF State = 'K'
              THEN
                BEGIN
                  WRITELN;
                  WRITE('  ')
                END;
              State := ';';
              WRITE(';');
            END;
          IF W1 = '('
          THEN
            BEGIN
              State := '(';
              WRITE(W1)
            END;
          IF W1 = '{'
          THEN
            BEGIN
              IF (State = 'N')
              THEN
                BEGIN
                  State := '{';
                  WRITE(' ')
                END
              ELSE
                IF State = 'K'
                THEN  
                  BEGIN
                    State := ']';
                    WRITE(' ')
                  END
                ELSE
                  IF State = 'E'
                  THEN
                    WRITE('  ')
                  ELSE
                    State := '}';
              WRITE(W1)
            END;
        END
      ELSE
        BEGIN
          IF State = ''''
          THEN
            BEGIN
              WRITE(W1);
              IF W1 = ''''
              THEN
                BEGIN
                  W1 := ' ';
                  State := '('
                END;
            END;
          IF (State = ';') AND (W1 <> ' ')
          THEN
            BEGIN
              IF (W1 <> ';')
              THEN
                BEGIN
                  WRITELN;
                  State := 'E'
                END
              ELSE
                WRITE(W1)
            END;
          IF (State = '{') OR (State = '[') OR (State = '|') OR (State = '}') OR (State = ']')
          THEN
            BEGIN
              IF ((State <> '[')) OR (W1 <> '}')
              THEN
                WRITE(W1);
              IF W1 = '}'
              THEN
                IF (State = '{')
                THEN
                  State := 'N'
                ELSE
                  IF (State = '|')
                  THEN
                    State := ';'
                  ELSE
                    IF (State = '}')
                    THEN
                      State := 'C'
                    ELSE
                      IF (State = ']')
                      THEN
                        State := 'K'
                      ELSE
                        State := '('
            END;
          IF (State = '(') OR (State = ',')
          THEN
            IF (W1 <> ' ')
            THEN
              BEGIN
                IF (W1 = '{')
                THEN
                  BEGIN
                    IF (State <> ',')
                    THEN
                      WRITE(' ');
                    State := '['
                  END;

                IF (W1 = '''')
                THEN
                  State := '''';
                WRITE(W1);
                IF (W1 = ')')
                THEN
                  State := 'N';
                IF (W1 = ',')
                THEN
                  BEGIN
                    State := ',';
                    WRITE(' ')
                  END
              END;
        END
    END;
  WRITELN
END.
