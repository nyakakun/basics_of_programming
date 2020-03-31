UNIT ReadN;
INTERFACE
USES
  ReadD;
PROCEDURE ReadNumber(VAR Temp: TEXT; VAR N: INTEGER);

IMPLEMENTATION
PROCEDURE ReadNumber(VAR Temp: TEXT; VAR N: INTEGER);
VAR
  D: INTEGER;

BEGIN {ReadNumber}
  N := 0;
  ReadDigit(Temp, D);
  WHILE (D <> -1) AND (D < MAXINT - N * 10)
  DO
    BEGIN
      N := N *10 + D;
      ReadDigit(Temp, D)
    END;
  IF (D >= MAXINT - N * 10)
  THEN
    N := -1
END; {ReadNumber}

BEGIN
END.
