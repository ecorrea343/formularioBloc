import 'package:flutter/material.dart';
import 'package:formulariobloc/src/bloc/provider.dart';

import 'package:formulariobloc/src/pages/home_page.dart';
import 'package:formulariobloc/src/pages/login_page.dart';
import 'package:formulariobloc/src/pages/producto_page.dart';
 
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
            initialRoute: 'producto',
            routes: {
              'login'     : (BuildContext context) => LoginPage(),
              'home'      : (BuildContext context) => HomePage(),
              'producto'  : (BuildContext context) => ProductoPage(),
            },
        theme: ThemeData(
          primaryColor: Colors.purpleAccent,
        ),
      )
    );  
  }
}