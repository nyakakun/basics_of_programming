PROGRAM TestRemove(INPUT,OUTPUT);
  {������ ������ �� ����� ,���������� �� ����� RemoveExtraBlanks}
USES Queue;
VAR
  Ch: CHAR;
//PROCEDURE RemoveExtraBlanks;
  {������� �����e ������� ����� ������� �� ����� ������}

BEGIN {TestRemove}
  EmptyQ;
  WRITE('����: ');
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      WRITE(Ch);
      AddQ(Ch);
    END;
  WRITELN;
  //RemoveExtraBlanks;
  WRITE('�����: ');
  HeadQ(Ch);
  WHILE Ch <> '#'
  DO
    BEGIN
      WRITE(Ch);
      DelQ;
      HeadQ(Ch)
    END;
  WRITELN
END. {TestRemove}
