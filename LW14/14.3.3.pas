PROGRAM MergeSort(INPUT, OUTPUT);
VAR
  F1, F2, F3: TEXT;

{Копируем первую строку из Source, в Receiver}
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

PROCEDURE RecursiveSort(VAR F1: TEXT);
VAR
  F2, F3: TEXT;
  Ch: CHAR;

{PROCEDURE Merge(VAR F1, F2, F3: TEXT) Сливает F2 и F3 в F1}
PROCEDURE Merge(VAR F1, F2, F3: TEXT);
{Сливает F2, F3 в F1 в сортированном порядке}
VAR
  Ch2, Ch3, Flag: CHAR;
BEGIN {Merge}
  RESET(F2);
  RESET(F3);
  REWRITE(F1);
  Flag := 'B';
  WHILE (Flag <> '2') AND (Flag <> '3') AND (Flag <> 'E')
  DO
    BEGIN
      IF NOT EOLN(F2)
      THEN
        BEGIN
          IF (Flag = '<') OR (Flag = 'B')
          THEN
            READ(F2, Ch2);
          IF Flag = 'B'
          THEN
            Flag := '>'
        END
      ELSE
        IF Flag = '<'
        THEN
          BEGIN
            Flag := '2';
            WRITE(F1, Ch3)
          END;

      IF NOT EOLN(F3)
      THEN
        BEGIN
          IF (Flag = '>') OR (Flag = 'B')
          THEN
            READ(F3, Ch3);
        END
      ELSE
        IF Flag = '>'
        THEN
          BEGIN
            Flag := '3';
            WRITE(F1, Ch2)
          END;

      IF (Flag <> '2') AND (Flag <> '3') AND (Flag <> 'B')
      THEN
        IF Ch2 < Ch3
        THEN
          BEGIN
            WRITE(F1, Ch2);
            Flag := '<'
          END
        ELSE
          BEGIN
            WRITE(F1, Ch3);
            Flag := '>'
          END;

      IF Flag = 'B'
      THEN
        Flag := 'E';
    END;
  WHILE NOT EOLN(F2)
  DO
    BEGIN
      READ(F2, Ch2);
      WRITE(F1, Ch2)
    END;
  WHILE NOT EOLN(F3)
  DO
    BEGIN
      READ(F3, Ch3);
      WRITE(F1, Ch3)
    END;
  WRITELN(F1);
END; {Merge}

{PROCEDURE Split(VAR F1, F2, F3: TEXT) Разбивает F1 на F2 и F3}
PROCEDURE Split(VAR F1, F2, F3: TEXT);
{Разбивает F1 на F2, F3}
VAR
  Ch, Switch: CHAR;
BEGIN {Split}
  RESET(F1);
  REWRITE(F2);
  REWRITE(F3);
  {Копировать F1 попеременно в F2 и F3}
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

BEGIN {RecursiveSort}
  RESET(F1);
  IF NOT(EOLN(F1))
  THEN {Файл имеет как минимум 2 символа}
    BEGIN
      READ(F1, Ch);
      IF NOT(EOLN(F1))
      THEN {Файл имеет как минимум 2 символа}
        BEGIN
          Split(F1, F2, F3);
          RecursiveSort(F2);
          RecursiveSort(F3);
          Merge(F1, F2, F3)
        END
    END
END; {RecursiveSort}

BEGIN {MergeSort}
  CopyFile(INPUT, F1);
  RecursiveSort(F1);
  CopyFile(F1, OUTPUT);
END. {MergeSort}
