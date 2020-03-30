PROGRAM CopyFirstLine(INPUT, OUTPUT);
PROCEDURE RCopy(VAR Sourse, Receiver: TEXT);
VAR
  Ch: CHAR;
BEGIN
  IF NOT EOLN(Sourse)
  THEN
    BEGIN
      READ(Sourse, Ch);   
      WRITE(Receiver, Ch);
      RCopy(Sourse, Receiver)
    END
END;
BEGIN
  RCopy(INPUT, OUTPUT);
  WRITELN(OUTPUT)
END.
