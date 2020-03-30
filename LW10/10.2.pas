PROGRAM Format(INPUT, OUTPUT);
VAR
  C1, C2, C3, C4, C5, C6, C7, Flag, FlagStat: CHAR;
BEGIN
  C1 := ' ';
  C2 := ' ';
  C3 := ' ';
  C4 := ' ';
  C5 := ' ';
  C6 := ' ';
  C7 := ' ';
  Flag := 'O';
  FlagStat := ' ';
  WHILE NOT EOLN
  DO
    BEGIN
      C1 := C2;
      C2 := C3;
      C3 := C4;
      C4 := C5;
      C5 := C6;
      C6 := C7;
      READ(C7);
      IF Flag = 'O'
      THEN
        BEGIN
          IF (C3 = 'B') AND (C4 = 'E') AND (C5 = 'G') AND (C6 = 'I') AND (C7 = 'N')
          THEN
            BEGIN
              WRITELN('BEGIN');
              FlagStat := 'N'
            END;  
          IF (C5 = 'E') AND (C6 = 'N') AND (C7 = 'D')
          THEN
            Flag := 'E';
          IF (C1 = 'W') AND (C2 = 'R') AND (C3 = 'I') AND (C4 = 'T') AND (C5 = 'E') AND (C6 = 'L') AND (C7 = 'N')
          THEN
            BEGIN
              WRITE('  WRITELN');
              FlagStat := 'Y'
            END;  
          IF (C2 = 'W') AND (C3 = 'R') AND (C4 = 'I') AND (C5 = 'T') AND (C6 = 'E') AND (C7 <> 'L')
          THEN
            BEGIN
              WRITE('  WRITE');
              FlagStat := 'Y'
            END;  
          IF (C2 = 'R') AND (C4 = 'E') AND (C5 = 'A') AND (C6 = 'D') AND (C7 <> 'L')
          THEN
            BEGIN
              WRITE('  READ');
              FlagStat := 'Y'
            END;  
          IF (C2 = 'R') AND (C3 = 'E') AND (C4 = 'A') AND (C5 = 'D') AND (C6 = 'L') AND (C7 = 'N')
          THEN
            BEGIN
              WRITE('  READLN');
              FlagStat := 'Y'
            END;  
          IF (C7 = '(')
          THEN
            Flag := '(';
          IF (C7 = ';')
          THEN
            BEGIN
              Flag := ';';
              FlagStat := 'N'
            END;
        END;      
      IF Flag = '('
      THEN
        BEGIN
          IF (C7 <> ' ') AND (C7 <> ',')
          THEN
            WRITE(C7);              
          IF C7 = ','
          THEN 
            WRITE(', ');
          IF C7 = ')'
          THEN
            Flag := 'O'                    
        END;
      IF Flag = ';'
      THEN  
        IF C7 = ';'
        THEN
          BEGIN
            WRITE(C7);
            Flag := ';'
          END
        ELSE
          IF (C7 <> ' ') AND (Flag = ';')
          THEN
            BEGIN
              WRITELN;
              Flag := 'O'
            END;
      IF Flag = 'E'
      THEN
        BEGIN
          IF FlagStat = 'Y'
          THEN
            BEGIN
              WRITELN;
              WRITELN('END.');
              Flag := 'O'
            END;
          IF FlagStat = 'N'
          THEN
            BEGIN
              WRITELN('END.');
              Flag := 'O'
            END
        END          
    END  
END.
