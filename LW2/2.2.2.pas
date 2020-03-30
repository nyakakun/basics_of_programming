PROGRAM What(INPUT, OUTPUT);
VAR
  Ch: CHAR;
BEGIN
  READ(Ch);
  WRITELN('Ваш символ: ', Ch);
  WRITE('Является ли он числом? ');
  IF '0' <= Ch
  THEN
    IF Ch <= '9'
    THEN
      WRITELN('RHZ')
END.
