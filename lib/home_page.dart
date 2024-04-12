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
      
        body: Center(
          child: CustomSwitch(),
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