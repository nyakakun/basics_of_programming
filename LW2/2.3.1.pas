PROGRAM Less(INPUT, OUTPUT);
VAR
  Ch: CHAR;
BEGIN
  READ(Ch);
  WRITE('��ப� ������ �� ����� ��� �஡���� �� ��ࢮ�� ᨬ���� #: ');
  WHILE Ch <> '#'
  DO
    BEGIN
      IF Ch <> ' '
      THEN
        WRITE(Ch);
      READ(Ch)
    END;
  WRITELN
END.
