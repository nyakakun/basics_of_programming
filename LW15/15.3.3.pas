PROGRAM TestRemove(INPUT, OUTPUT);
  {Читает строку из входа ,пропускает ее через RemoveExtraBlanks}
USES Queue;
VAR
  Ch: CHAR;

PROCEDURE RemoveExtraBlanks;
{Удаляет лишниe пробелы между словами на одной строке}
VAR
  Ch, Blank, LineEnd: CHAR;
BEGIN {RemoveExtraBlanks}
  Blank := ' ';
  LineEnd := '$';
  AddQueue(LineEnd); {помечаем конец текста в очереди}
  HeadQueue(Ch);
  {удаляем пробелы}
  WHILE Ch <> LineEnd
  DO
    BEGIN
      {читаем слово}
      WHILE (Ch <> Blank) AND (Ch <> LineEnd)
      DO
        BEGIN
          AddQueue(Ch);
          DelQueue;
          HeadQueue(Ch)
        END;
        
      {удаляем пробелы}
      WHILE Ch = Blank
      DO
        BEGIN
          DelQueue;
          HeadQueue(Ch)
        END;
        
      {Вставляем пробел между словами}
      IF Ch <> LineEnd
      THEN
        AddQueue(Blank)
    END;
  DelQueue {удаяем LineEnd из очереди}
END; {RemoveExtraBlanks}

BEGIN {TestRemove}
  ClearQueue;
  WRITE('Вход: ');
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      WRITE(Ch);
      AddQueue(Ch);
    END;
  WRITELN;
  RemoveExtraBlanks;
  WRITE('Выход: ');
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
