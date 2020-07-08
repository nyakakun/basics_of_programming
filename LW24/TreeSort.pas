PROGRAM TreeSort(INPUT, OUTPUT);
TYPE 
  Tree = ^NodeType;
  NodeType = RECORD
               Ch: CHAR;
               LLink, RLink: Tree
             END;
VAR
  Root: Tree;
  Ch: CHAR;
  Iteration: INTEGER;

PROCEDURE Insert(VAR Ptr: Tree; Data: CHAR; VAR Iteration: INTEGER);
BEGIN {Insert}
  IF Ptr = NIL
  THEN
    BEGIN {������� ���� �� ��������� Data}
      NEW(Ptr);
      Ptr^.LLink := NIL;
      Ptr^.RLink := NIL;
      Ptr^.Ch := Data
    END
  ELSE
    BEGIN
      Iteration := Iteration + 1;
      IF Ptr^.Ch > Data
      THEN
        Insert(Ptr^.LLink, Data, Iteration)
      ELSE
        Insert(Ptr^.RLink, Data, Iteration)
    END
END;  {Insert}

PROCEDURE PrintTree(Ptr: Tree);
BEGIN {PrintTree}
  IF Ptr <> NIL
  THEN  {�������� ��������� �����, �������, ��������� ������}
    BEGIN
      PrintTree(Ptr^.LLink);
      WRITE(Ch);
      PrintTree(Ptr^.RLink)
    END;
  WRITELN
END;  {PrintTree}

BEGIN {TreeSort}
  Root := NIL;
  WHILE NOT EOLN
  DO
    BEGIN
      READ(Ch);
      Insert(Root, Ch, Iteration)
    END;
  PrintTree(Root);
  WRITELN;
  WRITELN('�����: ', Iteration);
END.  {TreeSort}