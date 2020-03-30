Program Count3Test(INPUT,OUTPUT);
USES Count3;
VAR
  Ch1, Ch2, Ch3, V100, V10, V1: TEXT;
BEGIN
  Start;
  IF NOT EOLN
  THEN
    READ(Ch2);
  IF NOT EOLN
  THEN
    READ(Ch3);
  WHILE NOT EOLN
  DO
    BEGIN
      Ch1 := Ch2;
      Ch2 := Ch3;
      READ(Ch3);
      IF ((Ch1 < Ch2) AND (Ch2 > Ch3)) OR ((Ch1 > Ch2) AND (Ch2 < Ch3))
      THEN
        BEGIN
          Bump;
          Value(V100, V10, V1)
        END
    END;
  WRITE(V100, V10, V1)
END.
