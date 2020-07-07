UNIT Statistic;

INTERFACE

  USES
    TreeFunction, WordFunction;

  PROCEDURE FillTreeWord(VAR InputFile, OutputFile: TEXT);

IMPLEMENTATION

  PROCEDURE FillTreeWord(VAR InputFile, OutputFile: TEXT);
  VAR
    TempWord: WordFixedLength;
    RootTree: Tree;
  BEGIN
    RootTree := NIL;
    WHILE NOT EOF(InputFile)
    DO
      BEGIN
        WHILE NOT EOLN(InputFile)
        DO
          BEGIN
            ReadWord(InputFile, TempWord);
            IF TempWord <> ''
            THEN
              AddTree(RootTree, TempWord);
          END;
        READLN(InputFile);
      END;
    PrintTree(OutputFile, RootTree);
  END;
BEGIN

END.