PROGRAM Prime(INPUT, OUTPUT);
CONST
  Max = 11;
  Min = 2;
VAR
  I, D: INTEGER;
  IsPrime: BOOLEAN;
  Sieve: SET  OF 0..Max;
BEGIN {Prime}
  Sieve := [Min .. Max];
  I := Min;
  WHILE (I <= Max)
  DO
    BEGIN
      D := I;
      WRITELN('Min - ', I);
      IF (D IN Sieve)
      THEN
        BEGIN
          WRITE('Deleted - ');
          WHILE (D <= Max)
          DO
            BEGIN
              Sieve := Sieve - [D];
              WRITE(D, ' ');
              D := D + I
            END;
          I := I + 1;
          WRITELN
        END;    
    END;
  WRITELN       
END. {Prime}  
  
