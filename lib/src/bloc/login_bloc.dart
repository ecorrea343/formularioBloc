import 'dart:async';

import 'package:formulariobloc/src/bloc/validator.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators{
  // es para que varias instacias puedan estar escuchando estos cambios.
  // El problema  que como vamos a usar rxDart los streams no son compatibles y vamos a ocupar Behaviors
  // final _emailController     = StreamController<String>.broadcast();
  // final _passwordController  = StreamController<String>.broadcast();

  final _emailController     = BehaviorSubject<String>();//Estos ya vienen con Broadcast por defecto .
  final _passwordController  = BehaviorSubject<String>();//Estos ya vienen con Broadcast por defecto .

  //Insertar Valores al String
  Function (String) get changeEmail     => _emailController.sink.add;
  Function (String) get changePassword  => _passwordController.sink.add;

  //Recuparar los datos del String
  Stream<String> get emailStream => _emailController.stream.transform(validarEmail);//.transform(validarCampoVaciosE);
  Stream<String> get passStream  => _passwordController.stream.transform( validarPass );//.transform(validarCampoVaciosP);
  
  //
  Stream<bool>   get formValidStream => Observable.combineLatest2(emailStream, passStream, (e,p) => true );
  
  //Obtener el ultimo valor ingresa a los Strings
  String get email    => _emailController.value;
  String get password =>_passwordController.value;
  
  
  
  
  dispose(){
    _emailController?.close();
    _passwordController?.close();
  }
}