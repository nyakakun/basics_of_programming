PROGRAM BubbleSort(INPUT, OUTPUT); { ��������� ������ ������ INPUT � OUTPUT }
VAR
  Sorted, Ch, Ch1, Ch2: CHAR;
  F1, F2: TEXT;

PROCEDURE CopyFile(VAR F1, F2: TEXT); {�������� ������ ������ �� F1, � F2}
VAR
  Ch: CHAR;
BEGIN { CopyFile }
  WHILE NOT EOLN(F1)
  DO
    BEGIN
      READ(F1, Ch);
      WRITE(F2, Ch)
    END;
  WRITELN(F2)
END; { CopyFile }

BEGIN { BubbleSort }
  { �������� INPUT � F1 }
  REWRITE(F1);
  CopyFile(INPUT, F1);
  Sorted := 'N';
  WHILE Sorted = 'N'
  DO
    BEGIN
      Sorted := 'Y';
      { �������� F1 � F2,�������� �����������������  � ����������� ������ �������� ������� �� �������}
      RESET(F1);
      REWRITE(F2);
      IF NOT EOLN(F1)
      THEN
        BEGIN
          READ(F1, Ch1);
          WHILE NOT EOLN(F1)
          DO { �� ������� ���� ��� ������� �������� ��� Ch1,Ch2 }
            BEGIN
              READ(F1, Ch2);
              { �������   min(Ch1,Ch2) �  F2, ���������
               ��������������� ������� } 
              WRITE(F2, Ch2)        
            END;
          WRITELN(F2, Ch1); { ������� ��������� ������ � F2 }
        END;
      { �������� F2 � F1 }
      RESET(F2);
      REWRITE(F1);
      CopyFile(F2, F1);
    END;
  { �������� F1 � OUTPUT }
  RESET(F1);
  CopyFile(F1, OUTPUT);
END.{ BubbleSort }
