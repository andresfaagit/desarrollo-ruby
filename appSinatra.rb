# app.rb
require 'sinatra'

get "/" do
  <<-HTML
  <script type="text/javascript">

      var textToPrint = "Cantidad de palabras mágicas: ";

      function replace_Points(textRec){
        //remueve los puntos y comas de la frase
        textRec = textRec.split('.').join('');
        textRec = textRec.split(',').join('');
        return textRec;
      }

      function get_Array_Of_Words(textRec){
        //Retorna un array de palabras
        stringArray = textRec.split(" ");
        return stringArray;
      }

      function array_to_set(arrayRec){
        //Elimina las palabras repetidas, dejando solo una de ellas
        arraySet = Array.from(new Set(arrayRec));
        return arraySet;
      }

      function check_word_palindrom(stringRec){
        //Retorna true o false dependiendo si la palabra racibida es palíndromo o no
        stringRec = stringRec.toLowerCase();
        for( let i=0; i<stringRec.length; i+=1){
            if( stringRec[i] !== stringRec[stringRec.length -1 -i] ){
              return false;
            }
        }
        return true;
      }

      function number_of_hits(arrayRec){
        //Retorna la cantidad de palabras palíndromo dentro de la frase
        var count = 0;
        arraySet = array_to_set(arrayRec);
        for (let i=0; i<arraySet.length; i+=1){
          if( check_word_palindrom(arraySet[i])){
            count = count +1;
          } 
        }
        return count;
      }

      function check_phrase_palindrom(stringRec){
        //Retorna true o false dependiendo si la frase recibida es palíndromo o no
        stringClean = replace_Points(stringRec);
        arrayOfWords = get_Array_Of_Words(stringClean);
        palindrom_hits = number_of_hits(arrayOfWords);
        return palindrom_hits;
      }

      function callAjax() {
        //Informa la cantidad de palabras palíndromo que hay en la frase
        //Ejemplo1 -> check_phrase_palindrom("osiiso. osiis.o e,pe qu"); -> 2
        //Ejemplo2 -> check_phrase_palindrom("ana nacio en neuquen, nosotros somos turistas en neuquen"); -> 3  
        //Ejemplo3 -> check_phrase_palindrom("la documentacion estaba incompleta, somos conscientes de ello"); -> 1

        inputField = document.getElementById("inputform").value;
        result = check_phrase_palindrom(inputField);
        alert(textToPrint + result);
      }      
    </script>

    <h1>Complete los datos</h1>
    <form id="simpleForm">
        Texto: <input type="text" size="60" name="inputform" id="inputform">
        <input type="submit" value="Verificar" onclick="callAjax()">
    </form>
  HTML
end