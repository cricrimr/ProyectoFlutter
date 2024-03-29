import 'package:flutter/material.dart';

import '../desing/drawer.dart';
import '../services/firebase_services.dart';

class Carrito extends StatefulWidget {
  const Carrito({
    Key? key,
  }) : super(key: key);

  @override
  State<Carrito> createState() => _HomeUserState();
}

class _HomeUserState extends State<Carrito> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Carrito'),
      ),
      drawer: drawerPlantilla(),
      body: FutureBuilder(
        future: getItemsShoppingCar(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(snapshot.data![index]['id']),
                  onDismissed: (direction) async {
                    await deleteProductsShoppingcar(
                        snapshot.data![index]['id']);
                    snapshot.data?.removeAt(index);
                    setState(() {});
                  },
                  confirmDismiss: (direction) async {
                    bool resultado = false;
                    resultado = await showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: Text(
                            "Confirmar Eliminacion ${snapshot.data?[index]['name']}",
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                return Navigator.pop(context, false);
                              },
                              child: const Text(
                                "Cancelar",
                                style: TextStyle(color: Colors.red),
                              ),
                            ),
                            TextButton(
                              onPressed: () {
                                return Navigator.pop(context, true);
                              },
                              child: const Text("Si estoy seguro"),
                            ),
                          ],
                        );
                      },
                    );
                    return resultado;
                  },
                  background: Container(
                    color: Colors.red[600],
                    child: Icon(
                      Icons.delete,
                      color: Colors.white,
                    ),
                  ),
                  direction: DismissDirection.endToStart,
                  child: GestureDetector(
                    child: Card(
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 25.0),
                      child: Row(
                        children: <Widget>[
                          Container(
                            width: 100.0,
                            height: 100.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                bottomLeft: Radius.circular(10.0),
                              ),
                              image: DecorationImage(
                                image: NetworkImage(
                                    snapshot.data![index]['imageUrl']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 20.0),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 20.0),
                                Text(
                                  snapshot.data![index]['name'],
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                Text(
                                  snapshot.data![index]['price'],
                                  style: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.grey[600],
                                  ),
                                ),
                                SizedBox(height: 10.0),
                                ElevatedButton(
                                  onPressed: () async {
                                    await addReport(
                                            snapshot.data![index]['name'],
                                            snapshot.data![index]
                                                ['descripcion'],
                                            snapshot.data![index]['imageUrl'],
                                            snapshot.data![index]['priceLow'],
                                            snapshot.data![index]['entrega'],
                                            snapshot.data![index]['tEntrega'],
                                            snapshot.data![index]['edia'])
                                        .then((_) => {
                                              Navigator.pop(context),
                                            });
                                  },
                                  style: ElevatedButton.styleFrom(
                                      primary: Color(0xFF016BC1)),
                                  child: Text('Comprar'),
                                ),
                                SizedBox(height: 10.0),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text("Error al cargar los productos"),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
