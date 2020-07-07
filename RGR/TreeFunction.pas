UNIT TreeFunction;

INTERFACE

  USES
    WordFunction;

  TYPE
    Tree = ^TreeUnit;
    TreeUnit = RECORD
                CountingWord: WordFixedLength;
                Count: INTEGER;
                ShorterWord: Tree;
                BiggerWord: Tree;
              END;

  PROCEDURE PrintTree(VAR OutputFile: TEXT; VAR Root: Tree);
  PROCEDURE AddTree(VAR Root: Tree; CurrentWord: WordFixedLength);

IMPLEMENTATION

  FUNCTION NewTreeUnit(CurrentWord: WordFixedLength): Tree;
  BEGIN
    NEW(NewTreeUnit);
    NewTreeUnit^.CountingWord := CurrentWord;
    NewTreeUnit^.Count := 1;
    NewTreeUnit^.ShorterWord := NIL;
    NewTreeUnit^.BiggerWord := NIL;
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
          AddTree(Root^.BiggerWord, CurrentWord)
        ELSE
          AddTree(Root^.ShorterWord, CurrentWord);
  END;
  
  PROCEDURE PrintTree(VAR OutputFile: TEXT; VAR Root: Tree);
  BEGIN
    IF Root <> NIL
    THEN
      BEGIN
        PrintTree(OutputFile, Root^.ShorterWord);
        WRITELN(Root^.CountingWord, ' ', Root^.Count);
        PrintTree(OutputFile, Root^.BiggerWord)
      END
  END;
{
  PROCEDURE DestroyTree(VAR Root: Tree);
  BEGIN
    IF Root <> NIL
    THEN
      BEGIN
        DestroyTree(Root^.ShorterWord);
        DestroyTree(Root^.BiggerWord);
        DISPOSE(Root)
      END
  END;
}
BEGIN

END.