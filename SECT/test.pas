PROGRAM GetSratistic(INPUT, OUTPUT);
USES
  workWithWord, workWithTree;
VAR
  Root: Tree;
  Wrdd: STRING;
  Stat: BOOLEAN;
  INTF: TEXT;
  
BEGIN{TEST}
  ASSIGN(INTF, 'input.txt');
  RESET(INTF);
  WHILE NOT EOF(INTF)
  DO
    BEGIN
      WHILE NOT EOLN(INTF)
      DO
        BEGIN
          GetWord(INTF, Wrdd, Stat);
            IF Stat
            THEN
              Insert(Root, Wrdd)
        END;
      READLN(INTF)
  END;
  PrintTree(OUTPUT, Root);
  DelTree(Root);
END. {TEST} 
