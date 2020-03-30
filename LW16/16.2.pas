PROGRAM SarahRevere(INPUT, OUTPUT);
{����� ᮮ�饭�� � ⮬ ��� ���� ��⠭��,
� ����ᨬ��� �� ⮣�, ���� �� �室� ����砥���
'land', 'air' ��� 'sea'.}
VAR
  W1, W2, W3, W4: CHAR; 
  Looking, Land, Sea: BOOLEAN; 
BEGIN {SarahRevere}
  {���樠������ W1,W2,W3,W4,Looking}
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ';
  Looking := TRUE;
  Land := FALSE;
  Sea := FALSE;
  WHILE Looking AND NOT (Land OR Sea)
  DO
    BEGIN
      { ������� ����, �஢����� ����� ������}
      W1 := W2;
      W2 := W3;
      W3 := W4;
      READ(W4);
      Looking := (W4 <> '#');
      { �஢�ઠ ���� ��� 'land'}
      Land := (W1 = 'l') AND (W2 = 'a') AND (W3 = 'n') AND (W4 = 'd');
      { �஢�ઠ ���� ��� 'sea'}
      Sea := (W2 = 's') AND (W3 = 'e') AND (W4 = 'a');
    END;
  {ᮧ���� ᮮ�饭�� Sarah}
  IF Sea
  THEN
    WRITELN('The British coming by sea.')
  ELSE
    IF Land
    THEN
      WRITELN('The British are coming by land.')
    ELSE
      IF Looking
      THEN
        WRITELN('Sarah didn''t say')
END. {Sarah revere}