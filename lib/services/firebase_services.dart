import 'package:cloud_firestore/cloud_firestore.dart';

FirebaseFirestore db =
    FirebaseFirestore.instance; //se crea instacia de las base de datis

// un future es algo que va venri en un futuro es como las promesas en js
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
      "name": data['name'],
      "id": documento.id,
    };
    people.add(producto);
  });
  return people; // y se retonar las personas
}

// lo de mayor y menos esl oque regresa la funcion
Future<void> addProducts(String name) async {
  await db.collection("articulos").add({"name": name});
}

// actualizar
Future<void> editProducts(String id, String nuevoNombre) async {
  await db.collection("articulos").doc(id).set({"name": nuevoNombre});
}

// eliminar
Future<void> deleteProducts(String id) async {
  await db.collection("articulos").doc(id).delete();
}
