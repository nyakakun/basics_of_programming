PROGRAM SumDigit(INPUT, OUTPUT);

VAR
	Number: INTEGER;

PROCEDURE ReadDigit(VAR Source: TEXT; VAR Digit: INTEGER);
VAR
	Ch: CHAR;
BEGIN
	Digit := -1;
	READ(Source, Ch);
	IF Ch = '0' THEN Digit := 0 ELSE
	IF Ch = '1' THEN Digit := 1 ELSE
	IF Ch = '2' THEN Digit := 2 ELSE
	IF Ch = '3' THEN Digit := 3 ELSE
	IF Ch = '4' THEN Digit := 4 ELSE
	IF Ch = '5' THEN Digit := 5 ELSE
	IF Ch = '6' THEN Digit := 6 ELSE
	IF Ch = '7' THEN Digit := 7 ELSE
	IF Ch = '8' THEN Digit := 8 ELSE
	IF Ch = '9' THEN Digit := 9
END;

PROCEDURE ReadNumber(VAR Source: TEXT; VAR Number: INTEGER);
VAR
	Digit: INTEGER;
BEGIN
	Number := -2;
	Digit := -2;
	WHILE (NOT EOLN(Source)) AND (Digit <> -1) AND (Number <> -1)
	DO
		BEGIN
			ReadDigit(Source, Digit);
			IF Digit <> -1
			THEN
				BEGIN
					IF Number = -2
					THEN
						Number := 0;
					IF ((MAXINT DIV 10) > Number) OR (((MAXINT MOD 10) = Digit) AND ((MAXINT DIV 10) >= Number))
					THEN
						Number := Number * 10 + Digit
					ELSE
						Number := -1
				END
			ELSE
				IF Number = -2
				THEN
					Digit := -2
		END
END;

BEGIN
	ReadNumber(INPUT, Number);
	WRITELN(OUTPUT, Number);
END.