PROGRAM BubbleSort(INPUT, OUTPUT); { Сортируем первую строку INPUT в OUTPUT }
VAR
  Sorted, Ch, Ch1, Ch2: CHAR;
  F1, F2: TEXT;

PROCEDURE CopyFile(VAR F1, F2: TEXT); {Копируем первую строку из F1, в F2}
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
  { Копируем INPUT в F1 }
  REWRITE(F1);
  CopyFile(INPUT, F1);
  Sorted := 'N';
  WHILE Sorted = 'N'
  DO
    BEGIN
      Sorted := 'Y';
      { Копируем F1 в F2,проверяя отсортированность  и переставляя первые соседние символы по порядку}
      RESET(F1);
      REWRITE(F2);
      IF NOT EOLN(F1)
      THEN
        BEGIN
          READ(F1, Ch1);
          WHILE NOT EOLN(F1)
          DO { По крайней мере два символа остается для Ch1,Ch2 }
            BEGIN
              READ(F1, Ch2);
              { Выводим   min(Ch1,Ch2) в  F2, записывая
               отсортированные символы } 
              WRITE(F2, Ch2)        
            END;
          WRITELN(F2, Ch1); { Выводим последний символ в F2 }
        END;
      { Копируем F2 в F1 }
      RESET(F2);
      REWRITE(F1);
      CopyFile(F2, F1);
    END;
  { Копируем F1 в OUTPUT }
  RESET(F1);
  CopyFile(F1, OUTPUT);
END.{ BubbleSort }
