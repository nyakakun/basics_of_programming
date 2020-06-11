PROGRAM GraphicPrinting2(INPUT, OUTPUT);
TYPE
  POSIT = SET OF 1..500;
VAR
  Ch: CHAR;
  Number: INTEGER;
  Pos: POSIT;
  
PROCEDURE ReadGraphicPrinting(VAR Letter: CHAR; VAR TotalPosition: POSIT; VAR N: INTEGER);
VAR
  Positions: POSIT;
  Index: INTEGER; 
  
BEGIN
  READ(Letter);
  Positions := [];
  CASE Letter OF
    'A', 'a': Positions := [3, 52, 54, 101, 105, 151, 152, 153, 154, 155, 201, 205];
    'B', 'b': Positions := [1, 2, 3, 4, 51, 54, 101, 102, 103, 104, 105, 151, 155, 201, 202, 203, 204, 205];
    'C', 'c': Positions := [1, 2, 3, 4, 5, 51,  55, 101, 151, 155, 201, 202, 203, 204, 205];
    'D', 'd': Positions := [1, 2, 3, 51, 54, 101, 105, 151, 155, 201, 202, 203, 204, 205];
    'E', 'e': Positions := [1, 2, 3, 4, 5, 51, 101, 102, 103, 151, 201, 202, 203, 204, 205];
    'F', 'f': Positions := [1, 2, 3, 4, 5, 51, 101, 151, 152, 153, 201];
    'G', 'g': Positions := [2, 3, 4, 51, 101, 103, 104, 105, 151, 155, 201, 202, 203, 204, 205];
    'H', 'h': Positions := [1, 5, 51,  55, 101, 105, 151, 152, 153, 154, 155, 201, 205];
    'I', 'i': Positions := [2, 3, 4, 53, 103, 153, 202, 203, 204];
    'J', 'j': Positions := [2, 3, 4, 54, 104, 151, 154, 202, 203];
    'K', 'k': Positions := [1, 5, 51, 54, 101, 102, 103, 151, 154, 201, 205];
    'L', 'l': Positions := [1, 51, 101, 151, 155, 201, 202, 203, 204, 205];
    'M', 'm': Positions := [1, 2, 4, 5, 51, 53, 55, 101, 105, 151, 155, 201, 205];
    'N', 'n': Positions := [1, 2, 5, 51, 53, 55, 101, 104, 105, 151, 202, 201, 205];
    'O', 'o': Positions := [2, 3, 4, 51, 54, 101, 105, 151, 155, 202, 203, 204, 205];
    'P', 'p': Positions := [1, 2, 3, 4, 51, 55, 101, 105, 151, 152, 153, 154, 155, 201];
    'Q', 'q': Positions := [2, 3, 4, 51, 55, 101, 103, 105, 151, 154, 155, 202, 203, 204, 205];
    'R', 'r': Positions := [1, 2, 3, 4, 51, 55, 101, 102, 103, 104, 105, 151, 154, 201, 205];
    'S', 's': Positions := [3, 4, 5, 52, 103, 154, 201, 202, 203];
    'T', 't': Positions := [1, 2, 3, 4, 5, 51, 53,  55, 103, 153, 203];
    'U', 'u': Positions := [1, 5, 51, 55, 101, 105, 151, 155, 202, 203, 204];
    'V', 'v': Positions := [1, 5, 51, 55, 101, 105, 152, 154, 203];
    'W', 'w': Positions := [1, 5, 51, 55, 101, 105, 151, 153, 155, 202, 204];
    'X', 'x': Positions := [2, 4, 53, 102, 104, 151, 155, 201, 205];
    'Y', 'y': Positions := [1, 5, 51, 55, 102, 104, 153, 203];
    'Z', 'z': Positions := [2, 3, 4, 5, 54, 103, 152, 202, 203, 204, 205]
  END;

  IF (Positions <> []) AND (N <> 1)
  THEN
    FOR Index := 1 TO 205
    DO
      IF Index IN Positions
      THEN
        Positions := Positions - [Index] + [Index + 25 * (N - 1)];

    
  TotalPosition := TotalPosition + Positions;

END;

PROCEDURE WriteGraphicPrinting(VAR TotalPos: POSIT);
VAR
  Index: INTEGER;
BEGIN
  IF TotalPos <> []
  THEN
    BEGIN
      FOR Index := 1 TO 500
      DO
        BEGIN
          IF Index IN TotalPos
          THEN
            WRITE('@')
          ELSE
            WRITE(' ');
          IF Index MOD 50 = 0
          THEN
            WRITELN
        END        
    END
  ELSE
    WRITELN
END;

BEGIN

  Pos := [];
  Number := 1;
  WHILE NOT EOLN
  DO
    BEGIN
      ReadGraphicPrinting(Ch, Pos, Number);
      IF Number <  10
      THEN
        Number := Number + 1
      ELSE
        BEGIN
          Number := 1;
          WriteGraphicPrinting(Pos);
          Pos := []
        END
    END;
  WriteGraphicPrinting(Pos)
END.

