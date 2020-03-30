PROGRAM SortMonth(INPUT, OUTPUT);
USES DateIO;
VAR
  FirstMonth, SecondMonth: Month;
BEGIN
  ReadMonth(INPUT, FirstMonth);
  ReadMonth(INPUT, SecondMonth);
  IF (FirstMonth <> NoMonth) AND (SecondMonth <> NoMonth)
  THEN
    IF FirstMonth = SecondMonth
    THEN
      BEGIN
        WRITE('Оба месяца ');
        WriteMonth(OUTPUT, FirstMonth);
      END
    ELSE
      BEGIN
        IF FirstMonth < SecondMonth
        THEN
          WriteMonth(OUTPUT, FirstMonth)
        ELSE
          BEGIN
            WriteMonth(OUTPUT, SecondMonth);
            SecondMonth := FirstMonth;
          END;
        WRITE(' предшествует ');
        WriteMonth(OUTPUT, SecondMonth)
      END
  ELSE
    WRITE('Входные данные записаны неверно');
  WRITELN;
END.