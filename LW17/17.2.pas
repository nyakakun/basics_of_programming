PROGRAM SumDigit(INPUT, OUTPUT);
VAR
	Number: INTEGER;

PROCEDURE ReadDigit(VAR F: TEXT; VAR D: INTEGER);
VAR
	Ch: CHAR;
BEGIN
	D := -1;
	READ(F, Ch);
	IF Ch = '0' THEN D := 0 ELSE
	IF Ch = '1' THEN D := 1 ELSE
	IF Ch = '2' THEN D := 2 ELSE
	IF Ch = '3' THEN D := 3 ELSE
	IF Ch = '4' THEN D := 4 ELSE
	IF Ch = '5' THEN D := 5 ELSE
	IF Ch = '6' THEN D := 6 ELSE
	IF Ch = '7' THEN D := 7 ELSE
	IF Ch = '8' THEN D := 8 ELSE
	IF Ch = '9' THEN D := 9
END;

PROCEDURE ReadNumber(VAR F: TEXT; VAR N: INTEGER);
VAR
	Digit, OwerflowNumber: INTEGER;
BEGIN
	N := 0;
	Digit := -2;
	WHILE (NOT EOLN(F)) AND (Digit <> -1) AND (N <> -1)
	DO
		BEGIN
			ReadDigit(F, Digit);
			IF Digit <> -1
			THEN
				BEGIN
					IF ((MAXINT DIV 10) >= N) AND (((MAXINT MOD 10) >= Digit) OR ((MAXINT DIV 10) > N))
					THEN
						N := N * 10 + Digit
					ELSE
						N := -1
				END
		END
END;

BEGIN
	ReadNumber(INPUT, Number);
	WRITELN(OUTPUT, Number);
END.