PROGRAM TestRemove(INPUT, OUTPUT);
  {������ ������ �� ����� ,���������� �� ����� RemoveExtraBlanks}
USES Queue;
VAR
  Ch: CHAR;

PROCEDURE RemoveExtraBlanks;
{������� �����e ������� ����� ������� �� ����� ������}
VAR
  Ch, Blank, LineEnd: CHAR;
BEGIN {RemoveExtraBlanks}
  Blank := ' ';
  LineEnd := '$';
  AddQueue(LineEnd); {�������� ����� ������ � �������}
  HeadQueue(Ch);
  {������� �������}
  WHILE Ch <> LineEnd
  DO
    BEGIN
      {������ �����}
      WHILE (Ch <> Blank) AND (Ch <> LineEnd)
      DO
        BEGIN
          AddQueue(Ch);
          DelQueue;
          HeadQueue(Ch)
        END;
        
      {������� �������}
      WHILE Ch = Blank
      DO
        BEGIN
          DelQueue;
          HeadQueue(Ch)
        END;
        
      {��������� ������ ����� �������}
      IF Ch <> LineEnd
      THEN
        AddQueue(Blank)
    END;
  DelQueue {������ LineEnd �� �������}
END; {RemoveExtraBlanks}

BEGIN {TestRemove}
  ClearQueue;
  WRITE('����: ');
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      WRITE(Ch);
      AddQueue(Ch);
    END;
  WRITELN;
  RemoveExtraBlanks;
  WRITE('�����: ');
  HeadQueue(Ch);
  WHILE Ch <> '#'
  DO
    BEGIN
      WRITE(Ch);
      DelQueue;
      HeadQueue(Ch)
    END;
  WRITELN
END. {TestRemove}
