PROGRAM CountReverse(INPUT, OUTPUT);
USES Count3;
VAR
  Ch1, Ch2, Ch3: CHAR;
BEGIN
  WRITE('����: ');
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
      IF (Ch1 < Ch2) AND (Ch3 < Ch2)
      THEN
        Bump;
      IF (Ch1 > Ch2) AND (Ch3 > Ch2)
      THEN
        Bump;
    END;
  Value(Ch3, Ch2, Ch1);
  WRITELN('���������� ��������: ', Ch3, Ch2, Ch1)
END.
