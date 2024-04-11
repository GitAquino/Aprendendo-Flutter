// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppController extends ChangeNotifier{

// ChangeNotifier é como se fosse um setState pra parte de codigo,
//não para parte de tela!

static AppController instance = AppController();

bool isDarkTheme = false;

  changeTheme(){
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }


}