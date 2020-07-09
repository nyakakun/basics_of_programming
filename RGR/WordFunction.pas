UNIT WordFunction;

INTERFACE
  TYPE
    StringFixLen = STRING[20];

  PROCEDURE ReadWord(VAR InFile: TEXT; VAR OutWord: STRING);
  PROCEDURE ToLowerCase(VAR Ch: CHAR);
  PROCEDURE RegisterChange(VAR Ch: CHAR);

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

  PROCEDURE ReadWord(VAR InFile: TEXT; VAR OutWord: STRING);
  VAR
    Ch: CHAR;
    FlagSearchWord: CHAR;
  BEGIN
    FlagSearchWord := 'B';
    OutWord := '';
    WHILE FlagSearchWord <> 'E'
    DO
      BEGIN
        IF NOT (EOLN(InFile) OR EOF(InFile))
        THEN 
          READ(InFile, Ch)
        ELSE
          BEGIN
            FlagSearchWord := 'E';
            BREAK
          END;
        ToLowerCase(Ch);
        IF Ch in ['�'..'�', '�', 'a'..'z']
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

  PROCEDURE RegisterChange(VAR Ch: CHAR);
  BEGIN {RegisterChange}
    IF (Ch IN ['�' .. '�'])
    THEN
      CASE Ch OF
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�';
        '�': Ch := '�'
      END;
    IF ((Ch = '�') OR (Ch = '�'))
    THEN
      Ch := '�';  
    IF (Ch IN ['A' .. 'Z'])
    THEN
      CASE Ch OF
        'A': Ch := 'a';
        'B': Ch := 'b';
        'C': Ch := 'c';
        'D': Ch := 'd';
        'E': Ch := 'e';
        'F': Ch := 'f';
        'G': Ch := 'g';
        'H': Ch := 'h';
        'I': Ch := 'i';
        'J': Ch := 'j';
        'K': Ch := 'k';
        'L': Ch := 'l';
        'M': Ch := 'm';
        'N': Ch := 'n';
        'O': Ch := 'o';
        'P': Ch := 'p';
        'Q': Ch := 'q';
        'R': Ch := 'r';
        'S': Ch := 's';
        'T': Ch := 't';
        'U': Ch := 'u';
        'V': Ch := 'v';
        'W': Ch := 'w';
        'X': Ch := 'x';
        'Y': Ch := 'y';
        'Z': Ch := 'z'
      END
END;  {RegisterChange}

BEGIN

END.