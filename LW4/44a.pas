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
      WRITE(W1, W2, W3, W4);
      { �஢�ઠ ���� ��� 'land'}
      { �஢�ઠ ���� ��� 'sea'}
      { �஢�ઠ ���� ��� 'air'}
    END;
  {ᮧ���� ᮮ�饭�� Sarah}
END. {Sarah revere}