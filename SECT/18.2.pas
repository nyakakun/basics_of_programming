PROGRAM AverageScore(INPUT, OUTPUT);
CONST
  NumberOfScores = 4;
  ClassSize = 4;
TYPE
  Score = 0 .. 100;
VAR
  WhichScore: 1 .. NumberOfScores;
  Student: 1 .. ClassSize;
  NextScore: Score;
  Ave, TotalScore, ClassTotal: INTEGER;
  Ch: CHAR;
  Surename: TEXT;
BEGIN {AverageScore}
  ClassTotal := 0;
  WRITELN('Student averages:');
  Student := 1;
  WHILE (Student <= ClassSize) AND (NOT EOLN(INPUT))
  DO 
    BEGIN
      TotalScore := 0;
      WhichScore := 1;
      REWRITE(Surename);
      READ(INPUT, Ch);
      IF((Ch <> ' ') AND (Ch >= 'A') AND (Ch <= 'z'))
      THEN
        WHILE ((Ch <> ' ') AND (Ch >= 'A') AND (Ch <= 'z') )
        DO
          BEGIN
            WRITE(Surename, Ch);
            READ(INPUT, Ch)
          END;
      WHILE (WhichScore <= NumberOfScores)
      DO
        BEGIN
          READ(INPUT, NextScore);
          TotalScore := TotalScore + NextScore;
          WhichScore := WhichScore + 1
        END;
      READLN(INPUT);
      TotalScore := TotalScore * 10;
      Ave := TotalScore DIV NumberOfScores;
      RESET(Surename);
      WHILE (NOT EOLN(Surename))
      DO
        BEGIN
          READ(Surename, Ch);
          WRITE(OUTPUT, Ch)
        END;
      WRITE('-');
      IF (Ave MOD 10 >= 5)
      THEN
        WRITE(Ave DIV 10 + 1)
      ELSE
        WRITE(Ave DIV 10);
      ClassTotal := ClassTotal + TotalScore;
      Student := Student + 1;
      WRITELN
    END;
  WRITELN;
  WRITELN ('Class average:');
  ClassTotal := ClassTotal DIV (ClassSize * NumberOfScores);
  WRITELN(ClassTotal DIV 10, '.', ClassTotal MOD 10:1)
END.  {AverageScore}
