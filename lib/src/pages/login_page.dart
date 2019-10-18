
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Stack(
        children: <Widget>[
          _crearFondo(context),
          _crearCaja(context),
          
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
              Icon(Icons.person_pin_circle,size:80.0,color: Colors.white,),
              SizedBox(height:10.0,width: double.infinity,),
              Text('usuario Espol',style: TextStyle(color: Colors.white,fontSize: 25.0),)
            ],
          ),
        )
      ],

    );

 }

 Widget _crearCaja(BuildContext context){

   final size = MediaQuery.of(context).size;

   return SingleChildScrollView(
     child: Column(
       children: <Widget>[

          SafeArea(
            child: Container(
              height: 180.0,
            ),
          ),

         Container(
           
           width: size.width * 0.85,
           margin: EdgeInsets.symmetric(vertical: 10.0),
           padding: EdgeInsets.symmetric(vertical: 70.0),
           decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            boxShadow: <BoxShadow>[
              BoxShadow(
                  color: Colors.black26,
                  blurRadius: 7.0,
                  offset: Offset(0.0,5.0),
                  spreadRadius: 3.0
                ),
              ]
            ),
           child:Column(

             children: <Widget>[
               Text('Ingreso',style: TextStyle(fontSize: 20.0),),
               SizedBox(height: 40.0,),
               _crearEmail(),
               SizedBox(height:10.0),
               _crearPass(),
               SizedBox(height:10.0),
               _crearBoton(),
               

             ],
           ) ,
         ),
         Text('Olvido su contraseña'),
         SizedBox(height: 100.0)
       ],
     ),
   );
 }
 Widget _crearEmail(){

   return Container(
     padding: EdgeInsets.symmetric(horizontal: 20.0),
     child: TextField(
       keyboardType: TextInputType.emailAddress,
       decoration: InputDecoration(
         icon: Icon(Icons.alternate_email, color:Colors.deepPurple),
         hintText: 'example@espol.cl',
         labelText: 'Correa Electronico'
       ),
     ),
   );

 }
 Widget _crearPass(){

   return Container(
     padding: EdgeInsets.symmetric(horizontal: 20.0),
     child: TextField(
       keyboardType: TextInputType.visiblePassword,
       obscureText: true,
       decoration: InputDecoration(
         icon: Icon(Icons.lock_outline, color:Colors.deepPurple),
         hintText: 'example@espol.cl',
         labelText: 'Contraseña'
       ),
     ),
   );

 }
 Widget _crearBoton(){

   return RaisedButton(
     child: Container(
       padding: EdgeInsets.symmetric(horizontal: 80.0,vertical: 15.0),
       child: 
         Text('Ingresar'),
     ),
     shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(5.0)
     ),
     elevation: 0.0,
     color: Colors.deepPurple,
     textColor: Colors.white,
     onPressed: (){},
   );

 }

}