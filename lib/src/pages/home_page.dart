import 'package:flutter/material.dart';
//import 'package:formulariobloc/src/bloc/provider.dart';
import 'package:formulariobloc/src/models/producto_model.dart';
import 'package:formulariobloc/src/providers/productos_providers.dart';


class HomePage extends StatelessWidget {

  final productosProvider = new ProductosProvider();
  @override
  Widget build(BuildContext context) {


    //final bloc = Provider.of(context);
    

    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido'),
      ),
      body:_crearListado(),
      floatingActionButton: _crearBoton(context),    
    );
  }
  _crearBoton(BuildContext context){
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.deepPurple,
      onPressed: ()=>Navigator.pushNamed(context, 'producto'),
    );
  }

  Widget _crearListado(){

    return FutureBuilder(
      future: productosProvider.cargarProductos(),
      builder: (BuildContext context, AsyncSnapshot<List<ProductoModel>> snapshot) { 
        if (snapshot.hasData) {

          final productos = snapshot.data;

          return ListView.builder(

            itemCount: snapshot.data.length ,
            itemBuilder: (context,i) => _crearItem(context,productos[i]),
          );
        } else {
          return Center(child: CircularProgressIndicator(),);
        }
      },
    );
  }
  Widget _crearItem(BuildContext context,ProductoModel producto){

    return Dismissible(
      key: UniqueKey(),
      background: Container(
        color: Colors.green,
      ),
      onDismissed: (direccion){
        //Todo: Borrar Item de Producto.
        productosProvider.borrarProducto(producto.id);
      },
          child: ListTile(
        title: Text(' ${producto.titulo} - ${ producto.valor } '),
        subtitle: Text(producto.id),
        onTap: () => Navigator.pushNamed(context, 'producto', arguments: producto ),
      ),
    );
  }
}