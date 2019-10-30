import 'package:flutter/material.dart';
import 'package:formulariobloc/src/models/producto_model.dart';
import 'package:formulariobloc/src/providers/productos_providers.dart';
import 'package:formulariobloc/src/utils/utils.dart' as utils;

class ProductoPage extends StatefulWidget {

  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final productosProvider = new ProductosProvider();

  ProductoModel producto = new ProductoModel();

  bool _guardando = false;

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
            onPressed: (){},
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: (){},
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

        setState(() {  _guardando = false;});
        mostrarSnackBar('Registro Guardado');

    // Aca estamos diciendo si esta todo ok .
    // if (formKey.currentState.validate()) {
      
    // } 

   }
   void mostrarSnackBar(String mensaje){
     final snackbar = SnackBar(
       content: Text(mensaje),
       duration: Duration(milliseconds: 1500),
     );
     scaffoldKey.currentState.showSnackBar(snackbar);
   }
}