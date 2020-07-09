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
      Ch := CHR(ORD(Ch) + (ORD('‡') - ORD('¿')));
    IF ('¿' <= Ch) AND (Ch <= 'ﬂ')
    THEN
      Ch := CHR(ORD(Ch) + (ORD('a') - ORD('A')));
    IF (Ch = '®') OR (Ch = '∏')
    THEN
      Ch := 'Â';
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
        IF Ch in ['‡'..'ˇ', '∏', 'a'..'z']
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
    IF (Ch IN ['Ä' .. 'ü'])
    THEN
      CASE Ch OF
        'Ä': Ch := '†';
        'Å': Ch := '°';
        'Ç': Ch := '¢';
        'É': Ch := '£';
        'Ñ': Ch := '§';
        'Ö': Ch := '•';
        'Ü': Ch := '¶';
        'á': Ch := 'ß';
        'à': Ch := '®';
        'â': Ch := '©';
        'ä': Ch := '™';
        'ã': Ch := '´';
        'å': Ch := '¨';
        'ç': Ch := '≠';
        'é': Ch := 'Æ';
        'è': Ch := 'Ø';
        'ê': Ch := '‡';
        'ë': Ch := '·';
        'í': Ch := '‚';
        'ì': Ch := '„';
        'î': Ch := '‰';
        'ï': Ch := 'Â';
        'ñ': Ch := 'Ê';
        'ó': Ch := 'Á';
        'ò': Ch := 'Ë';
        'ô': Ch := 'È';
        'ö': Ch := 'Í';
        'õ': Ch := 'Î';
        'ú': Ch := 'Ï';
        'ù': Ch := 'Ì';
        'û': Ch := 'Ó';
        'ü': Ch := 'Ô'
      END;
    IF ((Ch = '') OR (Ch = 'Ò'))
    THEN
      Ch := '•';  
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