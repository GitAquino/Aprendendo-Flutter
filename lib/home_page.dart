// ignore_for_file: prefer_const_constructors, sort_child_properties_last


import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'app_controller.dart';

class HomePage extends StatefulWidget{
  
  @override
  State<HomePage> createState() {
    return HomePageState();
  }
}

class HomePageState extends State<HomePage>{
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        actions: [
          CustomSwitch()
        ],
        title: Text(
          'HomePage', 
          style: TextStyle(
            color: Colors.white
          ),
        ),
      ),
      
      body: Container(
        width: double.infinity, 
        height: double.infinity, 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
        //  crossAxisAlignment: CrossAxisAlignment.center, // Altera o Widget pra determinada posição (Inicio da tela, Final da tela, centro da tela, etc...)
          children: [
            Text('Contador: $counter'),
            Container(height: 10,), //Adicionando um espaço entre os Widgets
            CustomSwitch(),
            Container(height: 50,), //Adicionando um espaço entre os Widgets
            Row( //Adicionando um Widget de LINHA
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, //Adicionando um espaço entre os itens
              crossAxisAlignment: CrossAxisAlignment.center, //Centralizando os itens no meio da tela
              children: [
                Container( //Criando um novo quadrado
                  width: 25,
                  height: 25,
                  color: Colors.black,
                ),
                Container( //Criando um novo quadrado
                  width: 25,
                  height: 25,
                  color: Colors.black,
                ),
                Container( //Criando um novo quadrado
                  width: 25,
                  height: 25,
                  color: Colors.black,
                )
              ],
            ),
          ],
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