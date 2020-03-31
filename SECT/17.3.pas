PROGRAM Stat(INPUT, OUTPUT);
USES
  Number;
VAR
  N1, N2, Min, Max, Sum, Q, Average, FractPart: INTEGER;
BEGIN  
  Sum := 0;
  Q := 0;
  N1 := -2;
  N2 := -2;
  WHILE (NOT EOLN) AND (N1 <> -1) AND (N2 <> -1)
  DO
    BEGIN
      ReadNumber(INPUT, N1);
      Q := Q + 1;
      Sum := Sum + N1;
      IF NOT EOLN       
      THEN
        BEGIN
          ReadNumber(INPUT, N2);
          Q := Q + 1;
          IF N1 <= N2
          THEN
            N1 := Min
          ELSE
            N1 := Max;
          Sum := Sum + N2;
        END;
    END;
  WRITELN(N1);  
  Average := Sum DIV Q;
  FractPart := (Sum MOD Q)*100;
  WRITELN('Min is ', Min);
  WRITELN('Max is ', Max);
  WRITELN('Average is ', Average, '.', FractPart);
END.       
              
