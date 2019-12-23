
import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;
import 'package:formulariobloc/src/models/producto_model.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime_type/mime_type.dart';

class ProductosProvider {

  final String _url = 'https://flutter-app-4755f.firebaseio.com';


  Future<bool> crearProducto(ProductoModel producto)async{

    final url = '$_url/productos.json';

   final resp = await http.post(url,body: productoModelToJson(producto) );

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;

  }

    Future<bool> editarProducto(ProductoModel producto)async{

    final url = '$_url/productos/${producto.id}.json';

   final resp = await http.put(url,body: productoModelToJson(producto) );

    final decodedData = json.decode(resp.body);

    print(decodedData);

    return true;

  }

  Future<List<ProductoModel>> cargarProductos()async{

    final url = 'https://flutter-app-4755f.firebaseio.com/productos.json';

    final resp = await http.get(url);

    final Map<String,dynamic> decodedData = json.decode(resp.body);
    final List<ProductoModel>productos = new List();

    if (decodedData == null) return [];

    decodedData.forEach((id,prod){

      final prodTemp =  ProductoModel.fromJson(prod);
      prodTemp.id     = id;

      productos.add(prodTemp);

    });

    return productos;

  }
  Future<int> borrarProducto (String id )async{

    final url   = '$_url/productos/$id.json';
    final resp  = await http.delete(url);

    print(json.decode(resp.body));

  }


  Future<String> subirImagen(File imagen)async{

    final url = Uri.parse('');
    final mineType = mime(imagen.path).split('/');

    final imagenUploadRquest = http.MultipartRequest(
      'POST',
      url
    );
    final file = await http.MultipartFile.fromPath('file', imagen.path,contentType: MediaType(mineType[0],mineType[1]));

    imagenUploadRquest.files.add(file);
    final streamResponse = await imagenUploadRquest.send();
    final resp = await http.Response.fromStream(streamResponse);

    if (resp.statusCode != 200 && resp.statusCode !=201) {
      print('Algo salio mal');
      print(resp.body);
      return null;
    } 
    final respData = json.decode(resp.body);
    return respData;
  }
}