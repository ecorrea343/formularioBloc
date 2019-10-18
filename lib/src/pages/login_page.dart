
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        children: <Widget>[
          _crearFondo(context),

        ],
      ),
      
    );
  }
 Widget _crearFondo (BuildContext context){

    final size        = MediaQuery.of(context).size;
    final fondoMorado =
    Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
           colors: <Color>[
             Color.fromRGBO(63, 63, 156, 1.0),
             Color.fromRGBO(90, 70, 178, 1.0)
           ]
        )
      ),
    );

    final circulo = Container(
      width: 100.0,
      height: 100.0,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100.0),
        color: Color.fromRGBO(255, 255, 255, 0.05),
        
      ),
    );

    return Stack(
      children: <Widget>[
        fondoMorado,
        Positioned(top: 90.0,left: 20.0,child:circulo ,),
        Positioned(top: -50.0,right: 10.0,child:circulo ,),
        Positioned(top: -20.0,left: 10.0,child:circulo ,),
        Positioned(top: 200.0,right: 90.0,child:circulo ,),
        
        Container(
          padding: EdgeInsets.only(top: 80.0),
          child: Column(
            children: <Widget>[
              Icon(Icons.person_pin_circle,size:100.0,color: Colors.white,),
              SizedBox(height:10.0,width: double.infinity,),
              Text('usuario Espol',style: TextStyle(color: Colors.white,fontSize: 25.0),)
            ],
          ),
        )
      ],

    );

 }

}