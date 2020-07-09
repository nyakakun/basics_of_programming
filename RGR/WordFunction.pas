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
      Ch := CHR(ORD(Ch) + (ORD('�') - ORD('�')));
    IF ('�' <= Ch) AND (Ch <= '�')
    THEN
      Ch := CHR(ORD(Ch) + (ORD('a') - ORD('A')));
    IF (Ch = '�') OR (Ch = '�')
    THEN
      Ch := '�';
  END;

  PROCEDURE ReadWord(VAR InputFile: TEXT; VAR OutWord: STRING);
  VAR
    Ch: CHAR;
    FlagSearchWord: CHAR;
  BEGIN
    FlagSearchWord := 'B';
    OutWord := '';
    WHILE FlagSearchWord <> 'E'
    DO
      BEGIN
        IF NOT (EOLN(InputFile) OR EOF(InputFile))
        THEN 
          READ(InputFile, Ch)
        ELSE
          BEGIN
            FlagSearchWord := 'E';
            BREAK
          END;
        ToLowerCase(Ch);
        IF Ch in ['�'..'�', 'a'..'z']
        THEN
          BEGIN
            OutWord := OutWord + Ch;
            FlagSearchWord := 'W'
          END
        ELSE
          IF FlagSearchWord = 'W'
          THEN
            FlagSearchWord := 'E'
      END
  END;

BEGIN

END.