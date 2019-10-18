import 'package:flutter/material.dart';
import 'package:formulariobloc/src/bloc/provider.dart';

import 'package:formulariobloc/src/pages/home_page.dart';
import 'package:formulariobloc/src/pages/login_page.dart';
 
void main() {
  
  runApp(MyApp());
  
  }
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    return Provider(
    
      child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Formulario',
            initialRoute: 'login',
            routes: {
              'login' : (BuildContext context) => LoginPage(),
              'home'  : (BuildContext context) => HomePage(),
        }
      )
    );  
  }
}