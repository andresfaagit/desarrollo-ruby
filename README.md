# desarrollo-aperez
El archivo appSinatra.rb se compone de una llamada AJAX y código Js, introduciendo
dentro del campo "texto" en / la frase a testear.

1) Pruebas solicitadas:
  a) la documentacion estaba incompleta, somos conscientes de ello
    - Cantidad de palabras mágicas (palíndromo): 1
      . "somos"
  b) ana nacio en neuquen, nosotros somos turistas en neuquen
    - Cantidad de palabras mágicas (palíndromo): 3
      . "ana"
      . "neuquen"
      . "somos"

2) Aclaraciones extra:
  a) remueve puntos y comas ingresadas por error entre palabras
  b) el enunciado contabilizaba 2 palabras al caso de prueba 1-b. y deberían ser 3.
  c) Se eliminan las ocurrencias: Si en la frase aparece por ejemplo 2 veces neuquen, 
     se contabiliza como 1 (funciona como un set).
