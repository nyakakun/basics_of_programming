PROGRAM SarahRevere(INPUT, OUTPUT);
{����� ᮮ�饭�� � ⮬ ��� ���� ��⠭��,
� ����ᨬ��� �� ⮣�, ���� �� �室� ����砥���
'land', 'air' ��� 'sea'.}
VAR
  W1, W2, W3, W4, Looking: CHAR;
BEGIN {SarahRevere}
  {���樠������ W1,W2,W3,W4,Looking}
  W1 := ' ';
  W2 := ' ';
  W3 := ' ';
  W4 := ' ';
  Looking := 'Y';
  WHILE Looking = 'Y'
  DO
    BEGIN
      { ������� ����, �஢����� ����� ������}
      W1 := W2;
      W2 := W3;
      W3 := W4;
      READ(W4);
      IF W4 = '#'
      THEN {����� ������}
        Looking := 'N';
      { �஢�ઠ ���� ��� 'land'}
      IF W1 = 'l'
      THEN
        IF W2 = 'a'
        THEN
          IF W3 = 'n'
          THEN
            IF W4 = 'd'
            THEN {'land' �������}
              Looking := 'L';
      { �஢�ઠ ���� ��� 'sea'}
      IF W2 = 's'
      THEN
        IF W3 = 'e'
        THEN
          IF W4 = 'a'
          THEN {'sea' �������}
            Looking := 'S'
      { �஢�ઠ ���� ��� 'air'}
      IF W2 = 'a'
      THEN
        IF W3 = 'i'
        THEN
          IF W4 = 'r'
          THEN {'air' �������}
            Looking := 'A'
    END;
  {ᮧ���� ᮮ�饭�� Sarah}
  WRITELN('Looking is ', Looking)
END. {Sarah revere}