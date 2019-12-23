import 'dart:io';

import 'package:flutter/material.dart';
import 'package:formulariobloc/src/models/producto_model.dart';
import 'package:formulariobloc/src/providers/productos_providers.dart';
import 'package:formulariobloc/src/utils/utils.dart' as utils;
import 'package:image_picker/image_picker.dart';

class ProductoPage extends StatefulWidget {

  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final formKey           = GlobalKey<FormState>();
  final scaffoldKey       = GlobalKey<ScaffoldState>();
  final productosProvider = new ProductosProvider();

  ProductoModel producto  = new ProductoModel();

  bool _guardando = false;
  File foto;

  @override
  Widget build(BuildContext context) {

    final ProductoModel prodArg = ModalRoute.of(context).settings.arguments;
    if (prodArg != null) { producto = prodArg; }

    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        title: Text('PRODUCTO'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.photo_size_select_actual),
            onPressed:_procesarImagen(ImageSource.gallery),
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed:_procesarImagen(ImageSource.camera),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              children: <Widget>[
                _mostrarFoto(),
                _crearNombre(),
                _crearPrecio(),
                _crearDisponible(),
                _crearBoton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _crearNombre(){

    return TextFormField(
      initialValue: producto.titulo,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Producto'
      ),
      onSaved: (value)=> producto.titulo = value,
      validator: (value){
        if (value.length < 3) {
          return 'Ingrese el nombre del producto';          
        }else{
          return null;
        }
      },
    );
  }

   Widget _crearPrecio(){
    
    return TextFormField(
      initialValue: producto.valor.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Precio'
      ),
      onSaved: (value)=> producto.valor = int.parse(value),
      validator: (value){
        if (utils.isNumeric(value)) {

           return null; 
    
      }else{
      
        return 'Solo numeros';      
      
      }
     },
    );
   }

   Widget _crearBoton(){  

     return RaisedButton.icon(

       icon: Icon(Icons.save),
       label: Text('Guardar'),
       shape: RoundedRectangleBorder(
         borderRadius: BorderRadius.circular(20.0)
       ),
       color: Colors.deepPurple,
       textColor: Colors.white,
       onPressed: (_guardando)? null :_submit,
     );
   }

   Widget _crearDisponible(){

     return SwitchListTile(
       value: producto.disponible,
       title: Text('Disponible'),
       onChanged: (value)=>setState((){
         producto.disponible = value;
       }),
     );
   }

   void _submit(){

    if (!formKey.currentState.validate()) return;

      formKey.currentState.save();
     setState(() {  _guardando = true;});

      if( producto.id == null )
      {  productosProvider.crearProducto(producto); }
    else{  productosProvider.editarProducto(producto);}

       // setState(() {  _guardando = false;});
        mostrarSnackBar('Registro Guardado');
        Navigator.pop(context);
    // Aca estamos diciendo si esta todo ok .
    // if (formKey.currentState.validate()) {
      
    // } 
   }

  void mostrarSnackBar(String mensaje){

     final snackbar = SnackBar(
       content      : Text(mensaje),
       duration     : Duration(milliseconds: 1500),
     );
     scaffoldKey.currentState.showSnackBar(snackbar);
  }

  Widget _mostrarFoto(){

    if (producto.fotoUrl != null) {
      //tengo que hacer esto
      return Container();
    }else{

      return Image(
        image: AssetImage(foto?.path ?? 'assets/no-image.png'),
        height: 300.0,
        fit: BoxFit.cover,
      );
    }
  }

  _procesarImagen(ImageSource tipo)async{

    foto = await ImagePicker.pickImage(
      source: tipo
    );

    if (foto!= null) {
      //liempieza
    } 
    setState(() {});
  }
}