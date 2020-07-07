UNIT WordFunction;

INTERFACE
  TYPE
    WordFixedLength = STRING[20];

  PROCEDURE ReadWord(VAR InputFile: TEXT; VAR OutWord: STRING);
  PROCEDURE ToLowerCase(VAR Ch: CHAR);

IMPLEMENTATION

  PROCEDURE ToLowerCase(VAR Ch: CHAR);
  BEGIN
    IF ('A' <= Ch) AND (Ch <= 'Z')
    THEN
      Ch := CHR(ORD(Ch) + (ORD('à') - ORD('À')));
    IF ('À' <= Ch) AND (Ch <= 'ß')
    THEN
      Ch := CHR(ORD(Ch) + (ORD('a') - ORD('A')));
    IF (Ch = '¨') OR (Ch = '¸')
    THEN
      Ch := 'å';
  END;

  PROCEDURE ReadWord(VAR InputFile: TEXT; VAR OutWord: STRING);
  VAR
    Ch: CHAR;
    Flag: CHAR;
  BEGIN
    Flag := 'B';
    OutWord := '';
    WHILE Flag <> 'E'
    DO
      BEGIN
        IF NOT (EOLN(InputFile) OR EOF(InputFile))
        THEN 
          READ(InputFile, Ch)
        ELSE
          BEGIN
            Flag := 'E';
            BREAK
          END;
        ToLowerCase(Ch);
        IF Ch in ['à'..'ÿ', '¸', 'a'..'z']
        THEN
          BEGIN
            OutWord := OutWord + Ch;
            Flag := 'W'
          END
        ELSE
          IF Flag = 'W'
          THEN
            Flag := 'E'
      END
  END;

BEGIN

END.