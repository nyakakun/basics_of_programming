PROGRAM MergeSort(INPUT, OUTPUT);
VAR
  F1, F2, F3: TEXT;

{�������� ������ ������ �� Source, � Receiver}
PROCEDURE CopyFile(VAR Source, Receiver: TEXT); 
VAR
  Ch: CHAR;
BEGIN { CopyFile }
  RESET(Source);
  REWRITE(Receiver);
  WHILE NOT EOLN(Source)
  DO
    BEGIN
      READ(Source, Ch);
      WRITE(Receiver, Ch)
    END;
  WRITELN(Receiver)
END; { CopyFile }

{PROCEDURE Split(VAR F1, F2, F3: TEXT) ��������� F1 �� F2 � F3}
PROCEDURE Split(VAR F1, F2, F3: TEXT);
{��������� F1 �� F2, F3}
VAR
  Ch, Switch: CHAR;
BEGIN {Split}
  RESET(F1);
  REWRITE(F2);
  REWRITE(F3);
  {���������� F1 ����������� � F2 � F3}
  Switch := '2';
  WHILE NOT (EOLN(F1))
  DO
    BEGIN
      READ(F1, Ch);
      IF (Switch = '2')
      THEN
        BEGIN
          WRITE(F2, Ch);
          Switch := '3'
        END
      ELSE
        BEGIN
          WRITE(F3, Ch);
          Switch := '2'
        END
    END;
  WRITELN(F2);
  WRITELN(F3)
END; {Split}

BEGIN {MergeSort}
  CopyFile(INPUT, F1);
  Split(F1, F2, F3);
  CopyFile(F2, OUTPUT);
  CopyFile(F3, OUTPUT);
END. {MergeSort}
