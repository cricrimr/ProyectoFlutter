import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage storage = FirebaseStorage.instance;
final FirebaseAuth _auth = FirebaseAuth.instance;

FirebaseFirestore db = FirebaseFirestore.instance;

// un future es algo que va venri en un futuro es como las promesas en js
Future<String> subirImagen(File image) async {
  final String namefile = image.path.split("/").last;
  Reference ref = storage.ref().child('productos').child(namefile);
  final UploadTask uploadTask = ref.putFile(image);
  final TaskSnapshot snapshot = await uploadTask.whenComplete(() => true);
  final String url = await snapshot.ref.getDownloadURL();
  if (snapshot.state == TaskState.success) {
    return url; // Devolvemos la URL obtenida
  } else {
    throw Exception('Error al subir imagen'); // Manejamos el error
  }
}

Future<List> getPeople() async {
  // funcion asincrona
  List people = []; // se inicializa vacia
  // se habla a la bd osea se hace una refencia para poder traer la coleccion
  CollectionReference collectionReferenceProducts = db.collection('articulos');
  //query
  //cuiando se usa el get que sean procos registros
  QuerySnapshot queryProduts = await collectionReferenceProducts
      .get(); //esto nos va trer todos los datos que existan en la coleccion
  queryProduts.docs.forEach((documento) {
    //aqui agregamos la data de la db en la lista people
    final Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
    final producto = {
      "imageUrl": data['imageUrl'],
      "descripcion": data['descripcion'],
      "name": data['name'],
      "price": data['price'],
      "priceLow": data['priceLow'],
      "entrega": data['entrega'],
      "tEntrega": data['tEntrega'],
      "cantidad": data['cantidad'],
      "edia": data['edia'],
      "id": documento.id,
    };
    people.add(producto);
  });
  return people; // y se retonar las personas
}

Future<List> getItemsShoppingCar() async {
  // funcion asincrona
  List people = []; // se inicializa vacia
  // se habla a la bd osea se hace una refencia para poder traer la coleccion
  CollectionReference collectionReferenceProducts = db.collection('carrito');
  //query
  //cuiando se usa el get que sean procos registros
  QuerySnapshot queryProduts = await collectionReferenceProducts
      .get(); //esto nos va trer todos los datos que existan en la coleccion
  queryProduts.docs.forEach((documento) {
    //aqui agregamos la data de la db en la lista people
    final Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
    final producto = {
      "imageUrl": data['imageUrl'],
      "descripcion": data['descripcion'],
      "name": data['name'],
      "price": data['price'],
      "priceLow": data['priceLow'],
      "entrega": data['entrega'],
      "tEntrega": data['tEntrega'],
      "cantidad": data['cantidad'],
      "edia": data['edia'],
      "id": documento.id,
    };
    people.add(producto);
  });
  return people; // y se retonar las personas
}

Future<List> getProductsByPriceLow() async {
  List products = [];
  CollectionReference collectionReferenceProducts = db.collection('articulos');
  QuerySnapshot queryProducts = await collectionReferenceProducts
      .orderBy('priceLow', descending: false)
      .get();
  queryProducts.docs.forEach((documento) {
    final Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
    final producto = {
      "imageUrl": data['imageUrl'],
      "descripcion": data['descripcion'],
      "name": data['name'],
      "price": data['price'],
      "priceLow": data['priceLow'],
      "entrega": data['entrega'],
      "tEntrega": data['tEntrega'],
      "cantidad": data['cantidad'],
      "edia": data['edia'],
      "id": documento.id,
    };
    products.add(producto);
  });
  return products;
}

Future<List> getProductsByPriceHigh() async {
  List products = [];
  CollectionReference collectionReferenceProducts = db.collection('articulos');
  QuerySnapshot queryProducts = await collectionReferenceProducts
      .orderBy('priceLow', descending: true)
      .get();
  queryProducts.docs.forEach((documento) {
    final Map<String, dynamic> data = documento.data() as Map<String, dynamic>;
    final producto = {
      "imageUrl": data['imageUrl'],
      "descripcion": data['descripcion'],
      "name": data['name'],
      "price": data['price'],
      "priceLow": data['priceLow'],
      "entrega": data['entrega'],
      "tEntrega": data['tEntrega'],
      "cantidad": data['cantidad'],
      "edia": data['edia'],
      "id": documento.id,
    };
    products.add(producto);
  });
  return products;
}

// lo de mayor y menos esl oque regresa la funcion
Future<void> addProducts(
    String name,
    String descripcion,
    String imageUrl,
    String price,
    String priceLow,
    String entrega,
    String tEntrega,
    String eDia,
    String cantidad) async {
  await db.collection("articulos").add({
    "name": name,
    "imageUrl": imageUrl,
    "price": price,
    "descripcion": descripcion,
    "priceLow": priceLow,
    "entrega": entrega,
    "tEntrega": tEntrega,
    "edia": eDia,
    "cantidad": cantidad,
  });
}

Future<void> addReport(
  String name,
  String descripcion,
  String imageUrl,
  String priceLow,
  String entrega,
  String tEntrega,
  String eDia,
) async {
  await db.collection("report").add({
    "name": name,
    "imageUrl": imageUrl,
    "descripcion": descripcion,
    "priceLow": priceLow,
    "entrega": entrega,
    "tEntrega": tEntrega,
    "edia": eDia,
  });
}

Future<void> addShoppincard(
  String name,
  String descripcion,
  String imageUrl,
  String price,
  String priceLow,
  String entrega,
  String tEntrega,
  String eDia,
  String cantidad,
) async {
  await db.collection("carrito").add({
    "name": name,
    "descripcion": descripcion,
    "imageUrl": imageUrl,
    "price": price,
    "priceLow": priceLow,
    "entrega": entrega,
    "tEntrega": tEntrega,
    "edia": eDia,
    "cantidad": cantidad,
  });
}

// actualizar
Future<void> editProducts(
    String id,
    String nuevoNombre,
    String nuevadescripcion,
    String nuevaimageUrl,
    String nuevoprice,
    String nuevopriceLow,
    String nuevoentrega,
    String nuevatEntrega,
    String nuevaeDia,
    String nuevacantidad) async {
  await db.collection("articulos").doc(id).set({
    "name": nuevoNombre,
    "descripcion": nuevadescripcion,
    "imageUrl": nuevaimageUrl,
    "price": nuevoprice,
    "priceLow": nuevopriceLow,
    "entrega": nuevatEntrega,
    "tEntrega": nuevatEntrega,
    "edia": nuevaeDia,
    "cantidad": nuevacantidad
  });
}

// eliminar
Future<void> deleteProducts(String id) async {
  await db.collection("articulos").doc(id).delete();
}

// eliminar car
Future<void> deleteProductsShoppingcar(String id) async {
  await db.collection("carrito").doc(id).delete();
}