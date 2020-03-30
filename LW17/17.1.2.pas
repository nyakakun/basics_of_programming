PROGRAM SumDigit(INPUT, OUTPUT);
VAR
	Digit, DigitSum: INTEGER;

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

BEGIN
	DigitSum := 0;
	Digit := -2;
	WHILE (Digit <> -1) AND (NOT EOLN)
	DO
		BEGIN
			ReadDigit(INPUT, Digit);
			IF Digit <> -1
			THEN
				DigitSum := DigitSum + Digit;
		END;
	WRITELN(DigitSum);
END.