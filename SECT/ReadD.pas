UNIT ReadD;
INTERFACE
PROCEDURE ReadDigit(VAR Temp: TEXT; VAR D: INTEGER);

IMPLEMENTATION
PROCEDURE ReadDigit(VAR Temp: TEXT; VAR D: INTEGER);
VAR
  Ch: CHAR;
BEGIN {ReadDigit}
  D := -1;
  IF NOT EOLN(Temp)
  THEN
    BEGIN
      READ(Temp, Ch);
      IF Ch = '0' THEN D := 0 ELSE
      IF Ch = '1' THEN D := 1 ELSE
      IF Ch = '2' THEN D := 2 ELSE
      IF Ch = '3' THEN D := 3 ELSE
      IF Ch = '4' THEN D := 4 ELSE
      IF Ch = '5' THEN D := 5 ELSE
      IF Ch = '6' THEN D := 6 ELSE
      IF Ch = '7' THEN D := 7 ELSE
      IF Ch = '8' THEN D := 8 ELSE
      IF Ch = '9' THEN D := 9
    END
END; {ReadDigit}

BEGIN
END.
