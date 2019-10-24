import 'package:flutter/material.dart';
import 'package:formulariobloc/src/models/producto_model.dart';
import 'package:formulariobloc/src/utils/utils.dart' as utils;

class ProductoPage extends StatefulWidget {

  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {
  final formKey = GlobalKey<FormState>();

  ProductoModel producto = new ProductoModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
       onPressed: _submit,
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
      print('Todo ok');
      print(producto.titulo);
      print(producto.disponible);
      print(producto.valor);

    // Aca estamos diciendo si esta todo ok .
    // if (formKey.currentState.validate()) {
      
    // } 

   }
}