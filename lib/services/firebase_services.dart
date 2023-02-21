import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final FirebaseStorage storage = FirebaseStorage.instance;

FirebaseFirestore db =
    FirebaseFirestore.instance; //se crea instacia de las base de datis

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
      "name": data['name'],
      "price": data['price'],
      "id": documento.id,
    };
    people.add(producto);
  });
  return people; // y se retonar las personas
}

// lo de mayor y menos esl oque regresa la funcion
Future<void> addProducts(String name, String imageUrl, String price) async {
  await db
      .collection("articulos")
      .add({"name": name, "imageUrl": imageUrl, "price": price});
}

// actualizar
Future<void> editProducts(String id, String nuevoNombre) async {
  await db.collection("articulos").doc(id).set({"name": nuevoNombre});
}

// eliminar
Future<void> deleteProducts(String id) async {
  await db.collection("articulos").doc(id).delete();
}
