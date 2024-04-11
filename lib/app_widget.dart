import 'package:flutter/material.dart';

import 'home_page.dart';
import 'app_controller.dart';


class AppWidget extends StatelessWidget{
 @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: AppController.instance,
      builder: (context, child) { 
        return MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.deepOrange,
            brightness: AppController.instance.isDarkTheme 
              ? Brightness.light 
              : Brightness.dark,
            ),
      home: HomePage(),
    );
     },);
  }
}