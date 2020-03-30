PROGRAM SarahRevere(INPUT, OUTPUT);
{Печать сообщения о том как идут британцы,
в зависимости от того, первым во входе встречается
'land', 'air' или 'sea'.}
VAR
  W1, W2, W3, W4: CHAR; 
  Looking, Land, Sea: BOOLEAN; 
BEGIN {SarahRevere}
  {инициализация W1,W2,W3,W4,Looking}
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
      { Двигать окно, проверять конец данных}
      W1 := W2;
      W2 := W3;
      W3 := W4;
      READ(W4);
      Looking := (W4 <> '#');
      { Проверка окна для 'land'}
      Land := (W1 = 'l') AND (W2 = 'a') AND (W3 = 'n') AND (W4 = 'd');
      { Проверка окна для 'sea'}
      Sea := (W2 = 's') AND (W3 = 'e') AND (W4 = 'a');
    END;
  {создать сообщение Sarah}
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