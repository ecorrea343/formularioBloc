

import 'dart:async';

class LoginBloc{
  // es par aque varias instacias puedan estar escuchando estos cambios.
  final _emailController     = StreamController<String>.broadcast();
  final _passwordController  = StreamController<String>.broadcast();

  //Insertar Valores al String
  Function (String) get changeEmail     => _emailController.sink.add;
  Function (String) get changePassword  => _passwordController.sink.add;

  //Recuparar los datos del String
  Stream<String> get emailStream => _emailController.stream;
  Stream<String> get passStream  => _passwordController.stream;

  dispose(){
    _emailController?.close();
    _passwordController?.close();
  }
}