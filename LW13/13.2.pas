PROGRAM CompareTwoWord(INPUT, OUTPUT);
VAR
  ResultCompare: CHAR;
  F1, F2: TEXT;

PROCEDURE Read2WordTo2File(VAR Source, Receiver1Word, Receiver2Word: TEXT);
{ опируем из первой строки INPUT 2 слова отделЄнных пробелом}
{≈сли перва€ строка INPUT пуста, то на выходе будет 2 пустых файла}
VAR
  Ch: CHAR;
BEGIN
  IF NOT EOLN(Source)
  THEN
    READ(Source, Ch);
  WHILE (CH <> ' ') AND (NOT EOLN(Source))
  DO
    BEGIN
      WRITE(Receiver1Word, Ch);
      READ(Source, Ch)
    END;
  WHILE (NOT EOLN(Source))
  DO
    BEGIN
      READ(Source, Ch);
      WRITE(Receiver2Word, Ch)
    END;
END;

PROCEDURE Lexico(VAR F1, F2: TEXT; VAR Result: CHAR);
{Result 0, 1, 2 если лексикографический пор€док F1 =, <, > чем F2       
соответственно. ‘актические параметры, соответствующие F1 и F2,
должны быть различными}
VAR
  Ch1, Ch2: CHAR;
BEGIN {Lexico}
  RESET(F1);
  RESET(F2);
  Result := '0';
  WHILE (NOT EOLN(F1) AND NOT EOLN(F2)) AND (Result = '0')
  DO
    BEGIN
      READ(F1, Ch1);
      READ(F2, Ch2);
      IF (Ch1 < Ch2)
      THEN {Ch1 < Ch2 или F1 короче F2}
        Result := '1'
      ELSE
        IF (Ch1 > Ch2)
        THEN {Ch1 > Ch2 или F2 короче F1}
          Result := '2'
    END; {WHILE}
  IF Result = '0'
  THEN
    IF (EOLN(F1)) AND (NOT EOLN(F2))
    THEN
      Result := '1'
    ELSE
      IF (EOLN(F2)) AND (NOT EOLN(F1))
      THEN
        Result := '2'
END; {Lexico}

BEGIN
  REWRITE(F1);
  REWRITE(F2);
  Read2WordTo2File(INPUT, F1, F2);
  RESET(F1);
  RESET(F2);
  Lexico(F1, F2, ResultCompare);
  WRITELN(ResultCompare)
END.
