UNIT Queue;

INTERFACE

  PROCEDURE ClearQueue;
  PROCEDURE AddQueue(VAR Element: CHAR);
  PROCEDURE DelQueue;
  PROCEDURE HeadQueue(VAR Element: CHAR);
  PROCEDURE WriteQueue;

IMPLEMENTATION

  VAR
    QueueFile: TEXT;

  PROCEDURE CopyOpen(VAR F1, F2 :TEXT);
  {копириует строку из F1 в F2 без RESET или REWRITE;
    таким образом F1 должен быть готов для чтения,а F2 для записи,
    но прошлые строки у этих файлов могут быть не пусты }
  VAR
    Ch: CHAR;
  BEGIN {CopyOpen}
    WHILE NOT EOLN(F1)
    DO
      BEGIN
        READ(F1, Ch);
        WRITE(F2, Ch)
      END
  END; {CopyOpen}

  PROCEDURE ClearQueue;
  {QueueFile := <,/,R>}
  BEGIN {EmptyQueueFile}
    REWRITE(QueueFile);
    WRITELN(QueueFile);
    RESET(QueueFile)
  END; {EmptyQueueFile}

  PROCEDURE AddQueue(VAR Element: CHAR);
  {QueueFile = &lt;,x/,R&gt;,где x строка И Element = a --&gt; QueueFile = &lt;,xa/,R&gt; }
  VAR
    Temp: TEXT;
  BEGIN {AddQueueFile}
    REWRITE(Temp);
    CopyOpen(QueueFile, Temp);
    WRITELN(Temp, Element);
    RESET(Temp);
    REWRITE(QueueFile);
    CopyOpen(Temp, QueueFile);
    WRITELN(QueueFile);
    RESET(QueueFile)
  END; {AddQueueFile}

  PROCEDURE DelQueue;
    {(QueueFile = <,/,R> -->)|
    (QueueFile = <,ax/,R>,где a символ и x строка  -->
      QueueFile:= <,x/,R> }
  VAR
    Ch: CHAR;
    Temp: TEXT;
  BEGIN {DelQueue}
    {удаляем первый элемент из QueueFile};
    READ(QueueFile, Ch);
    IF NOT EOF (QueueFile)
    THEN {не пустой}
      BEGIN
        REWRITE(Temp);
        CopyOpen(QueueFile, Temp);
        WRITELN(Temp);
        {копируем Temp в QueueFile}
        RESET(Temp);
        REWRITE(QueueFile);
        CopyOpen(Temp, QueueFile);
        WRITELN(QueueFile);
      END;
    RESET(QueueFile)
  END; {DelQueue}

  PROCEDURE HeadQueue(VAR Element: CHAR);
    {(QueueFile = <,/,R> --> Element := '#')|
    (QueueFile = <,ax/,R>,где a символ и x строка  -->
      Element:= 'a' }
  BEGIN  {HeadQueue}
    IF NOT EOLN(QueueFile)
    THEN
      READ(QueueFile, Element)
    ELSE
      Element := '#';
    RESET(QueueFile)
  END; {HeadQueue}

  PROCEDURE WriteQueue;
    { (QueueFile = <,x/,R> и OUTPUT =<y,,W>,где y и x строка  -->
      OUTPUT := <y&x/,,W> }
  BEGIN {WriteQueue}
    CopyOpen(QueueFile, OUTPUT);
    WRITELN(OUTPUT);
    RESET(QueueFile)
  END; {WriteQueue}

BEGIN

END. 
