// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'app_widget.dart';

main(List<String> args) {
  runApp(AppWidget(
    ));
}




/* Aula 5 - Estrutura child/Class 

Todo o App é criado através de Widgets
O conjunto completo é um Widget gigante que contem varios Widgets
pequenos dentro dele

Cada classe contem varios child, e dentro de cada child contém um
parâmetro específico que irá executar uma tarefa
Exemplo: 

 Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      home: Container(    
        child: Center(    //Widget que centraliza os Widgets que estão dentro dele
          child: Text('Teste'),   //Widget que contém um Texto
        ),
      ),
    );
  }

*/

/* Aula 6 - Stateless Widget

É um widget imutável, que mantém o mesmo estado estaticamente
**OBS: ELE PODE SER MUDADO APENAS DENTRO DO >>WIDGET PAI<<**
Dentro do Widget pai ele pode mudar os parâmetros do Stateless afim
de alterar uma informação.

class AppWidget extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Container(    
        child: Center(    //Widget que centraliza os Widgets que estão dentro dele
          child: Text(    //Widget que contém um Texto
            'Teste',
            textDirection: TextDirection.ltr,
            style: TextStyle(
              color: Colors.white,
              fontSize: 35.0
            ),
          ),
        ),
    );
  }
} 

Também podemos alterar a informação dentro do proprio Stateless com o
parâmetro: final, ficando assim:

class AppWidget extends StatelessWidget{

final String title;       //criando parâmetro final
const AppWidget({super.key, required this.title});


  @override
  Widget build(BuildContext context) {
    return Container(    
        child: Center(    //Widget que centraliza os Widgets que estão dentro dele
          child: Text(    //Widget que contém um Texto
            title,        //Dentro da class main é necessário informar o valor dessa variavel
            textDirection: TextDirection.ltr,
            style: TextStyle(
              color: Colors.white,
              fontSize: 35.0
            ),
          ),
        ),
    );
  }
} 

*/

/* Aula 7 - MaterialApp

MaterialApp - Muito utilizado dentre os primeiros Widgets
Facilita muito a aplicação e criação de novos parâmetros e Widgets

 @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      home: Container(
        child: Center(
          child: Text('Teste'),
        ),
      ),
    );
  }
*/

/* Aula 8 - Statefull Widget

A classe principal que herdará o StatefulWidget precisa receber o parâmetro
de outra classe que definirá o state para ela.
Então toda e qualquer alteração que houver na class Stateful virá da 
"class state".

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() {
  return HomePageState();
  } 
}


class HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text('Testeee'),
      ),
    );
  }
}

Após isso é necessário apenas importar para dentro do Widget que quiser.
Ex:

@override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.red),
      home: HomePage(),
    );
  }


O Objetivo de usar o Stateful é a possibilidade de alterar parâmetros
enquanto o App está sendo executado por possuir o state "desacoplado".
Exemplo na prática:

 @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: GestureDetector(
          child: Text('Contador: $counter'),
          onTap: (){
            setState(() {
              counter++;
            });
          },
        ),
      ),
    );
  }

A cada vez que a palavra Contador é clicada, é incrementado um valor ao
counter, devido ao setState.
OnTap: Recebe o estado quando é clicado.
SetState: Define o estado em tempo real.
*/

/* Aula 9 - Boas Práticas e organização


Criar um .dart para cada Widget
Dentro da main apenas importar as libs

*/

/* Aula 10 - Scaffold

  É como se fosse a cara do APP
  Ele tem diversos itens que podem ser importados que facilitam a criação
  do app, customizando da maneira que se quer
  MUITO FÁCIL DE USAR
  OBS: Pode ser utilizado o ' Material ' tbm, porém o Scaffold é mais facil
  a utilização (pelo menos eu acho até aqui)

  class HomePage extends StatefulWidget{
  
  @override
  State<HomePage> createState() {
    return HomePageState();
  }


  class HomePageState extends State<HomePage>{
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomePage', style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.red,
      ),
      
        body: Center(
          child: GestureDetector(
            child: 
              Text('Contador: $counter', 
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 30.0,
                ),
              ),
          ),
        ),

      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
                  counter++;
              });
        },
      splashColor: Colors.red[600],
      backgroundColor: Colors.red[300],
        child: Icon(Icons.add, color: Colors.white,),
      ),
    );
  }

}

*/

/* Aula 11 - Single render e Multi render

Quando colocamos child dentro de child, utilizamos apenas 1 render
Render seria basicamente a renderização do seu Widget
Se colocar instruções parecidas, child dentro de child, só vai pegar a
informação do ultimo child.
Ex:

body: Container(
        width: 200,
        height: 200,
        color: Colors.black,
        child: Container(
          width: 100,
          height: 100,
          color: Colors.green
        ),
      ),

      Basicamente, ele pegará o tamanho final (200x200) e a cor final (green)

      Para que ele renderize separadamente, renderizando cada filho de forma
      separada, um **SINGLE RENDER**, devemos utilizar Widgets específicos
      que utilizam estrutura SingleRender, como: "Align, Center, etc..."
      Pode ver todos os SingleChildRenderObjectWidget class através do link:
      https://api.flutter.dev/flutter/widgets/SingleChildRenderObjectWidget-class.html

      Ou seja, para que funcione da maneira que deveria, é necessário apenas
      colocar um Center antes do Container.
      Exemplo:

      body: Container(
        width: 200,
        height: 200,
        color: Colors.black,
        child: Center (
          child: Container(
            width: 100,
            height: 100,
            color: Colors.green
          ),
        ),      
      ),

*/

/* Aula 12 - Gerenciar outros Estados (States)

Quando instanciamos uma class em outras classes, é criado uma instancia
para cada uma das importações, ou seja será criado mais de um estado
Para que isso não ocorra é necessário criamos um " static " dentro da classe
que deve ter apenas uma única instancia

Ex: Class AppController extends ChangeNotifier{
  static AppController nomequequiserdar = AppController();
}

Aí pra que isso funcione é só importar o AppController.nomequequiserdar;
nas classes que deseja utilizar.
*/

/* Aula 13 - Componentização de Widgets

Basicamente é vc pegar uma parte do código que você deseja
usar recursivamente e importar ele dentro de uma class separada,
sendo assim, poderá usá-lo em outras partes do código apenas 
instanciando a classe desejada.


appBar: AppBar(
        backgroundColor: Colors.red,
        actions: [
          CustomSwitch()  ← ← ←
        ],
        title: Text(
          'HomePage', 
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),

          ↓↓↓
class CustomSwitch extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Switch(
      value: AppController.instance.isDarkTheme, 
      onChanged: (value){
        AppController.instance.changeTheme();
      },
    );
  }
}
 */

/* Aula 14 - Columns

children = conjunto de child (no português é o plural de filhos)


*/