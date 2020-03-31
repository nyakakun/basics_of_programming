UNIT Digit;
INTERFACE
  PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);
IMPLEMENTATION
  PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);
  {��������� ������� ������ �� �����, ���� �� - �����, ���������� ��� 
   ���������� � �������� ���� INTEGER. ���� ��������� ������ �� �����
   ���������� -1}
  VAR    
    Ch: CHAR;
    TempFile: TEXT;
  BEGIN
    D := -1;
    REWRITE(TempFile);
    IF NOT EOLN(F)
    THEN
      BEGIN
        READ(F, Ch);
        IF (Ch >= '0') OR (Ch <= '9') 
        THEN
          BEGIN
            WRITELN(TempFile, Ch);
            RESET(TempFile);
            READ(TempFile, D);
          END 
      END;
  END;  
BEGIN
END.          
