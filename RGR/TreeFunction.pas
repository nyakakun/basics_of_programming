UNIT TreeFunction;

INTERFACE

  USES
    WordFunction;

  TYPE
    Tree = ^TreeUnit;
    TreeUnit = RECORD
                CountingWord: WordFixedLength;
                Count: INTEGER;
                Left: Tree;
                Right: Tree;
              END;

  PROCEDURE PrintTree(VAR OutputFile: TEXT; VAR Root: Tree);
  PROCEDURE AddTree(VAR Root: Tree; CurrentWord: WordFixedLength);
  PROCEDURE DestroyTree(VAR Root: Tree);

IMPLEMENTATION

  FUNCTION NewTreeUnit(CurrentWord: WordFixedLength): Tree;
  BEGIN
    NEW(NewTreeUnit);
    NewTreeUnit^.CountingWord := CurrentWord;
    NewTreeUnit^.Count := 1;
    NewTreeUnit^.Left := NIL;
    NewTreeUnit^.Right := NIL;
  END;

  PROCEDURE AddTree(VAR Root: Tree; CurrentWord: WordFixedLength);
  BEGIN
    IF Root = NIL
    THEN
      Root := NewTreeUnit(CurrentWord)
    ELSE
      IF Root^.CountingWord = CurrentWord
      THEN
        Root^.Count := Root^.Count + 1
      ELSE
        IF CurrentWord > Root^.CountingWord
        THEN
          AddTree(Root^.Right, CurrentWord)
        ELSE
          AddTree(Root^.Left, CurrentWord);
  END;
  
  PROCEDURE PrintTree(VAR OutputFile: TEXT; VAR Root: Tree);
  BEGIN
    IF Root <> NIL
    THEN
      BEGIN
        PrintTree(OutputFile, Root^.Left);
        WRITELN(Root^.CountingWord, ' ', Root^.Count);
        PrintTree(OutputFile, Root^.Right)
      END
  END;

  PROCEDURE DestroyTree(VAR Root: Tree);
  BEGIN
    IF Root <> NIL
    THEN
      BEGIN
        DestroyTree(Root^.Left);
        DestroyTree(Root^.Right);
        DISPOSE(Root)
      END
  END;

BEGIN

END.