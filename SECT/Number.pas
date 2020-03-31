UNIT Number;
INTERFACE
USES
  Digit;
PROCEDURE ReadNumber(VAR F: TEXT; VAR N: INTEGER);
IMPLEMENTATION
  PROCEDURE ReadNumber(VAR F: TEXT; VAR N: INTEGER);
  VAR
    D, MAXINT: INTEGER;
  BEGIN
    N := 0;
    ReadDigit(F, D);
    WHILE (D <> -1) AND (N <> -1)
    DO
      BEGIN   
        IF (MAXINT DIV 10 > N) OR (((MAXINT DIV 10) = N) AND ((MAXINT MOD 10) > D))
        THEN
          BEGIN
            N := N*10 + D;
            ReadDigit(F, D)
          END  
        ELSE
          N := -1 
      END;    
  END;
BEGIN
END.  
