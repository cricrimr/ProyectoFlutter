import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyectop_flutter/desing/appBar.dart';
import 'package:proyectop_flutter/desing/drawer.dart';
import 'package:proyectop_flutter/login/login.dart';

import '../services/firebase_services.dart';

class HomeUserPriceLow extends StatefulWidget {
  const HomeUserPriceLow({
    Key? key,
  }) : super(key: key);

  @override
  State<HomeUserPriceLow> createState() => _HomeUserState();
}

class _HomeUserState extends State<HomeUserPriceLow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xFFF5F5F5),
      child: Scaffold(
        appBar: MyAppBar(),
        drawer: drawerPlantilla(),
        body: FutureBuilder(
          future: getProductsByPriceLow(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 0.75,
                ),
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    child: Card(
                      elevation: 3,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Container(
                            height: 100.0,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10.0),
                                topRight: Radius.circular(10.0),
                              ),
                              image: DecorationImage(
                                image: NetworkImage(
                                    snapshot.data![index]['imageUrl']),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 8.0),
                                Text(
                                  snapshot.data![index]['name'],
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                RichText(
                                  text: TextSpan(
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: snapshot.data![index]['priceLow'],
                                        style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 15.0,
                                        ),
                                      ),
                                      TextSpan(
                                        text: ' MXN',
                                        style: TextStyle(
                                          fontSize: 12.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                Container(
                                  height:
                                      20.0, // Ajustar aquí la altura del contenedor
                                  child: ElevatedButton(
                                    onPressed: () async {
                                      await Navigator.pushNamed(
                                          context, "/item",
                                          arguments: {
                                            'name': snapshot.data![index]
                                                ['name'],
                                            'descripcion': snapshot.data![index]
                                                ['descripcion'],
                                            'imageUrl': snapshot.data![index]
                                                ['imageUrl'],
                                            'price': snapshot.data![index]
                                                ['price'],
                                            'priceLow': snapshot.data![index]
                                                ['priceLow'],
                                            'entrega': snapshot.data![index]
                                                ['entrega'],
                                            'tEntrega': snapshot.data![index]
                                                ['tEntrega'],
                                            'cantidad': snapshot.data![index]
                                                ['cantidad'],
                                            'edia': snapshot.data![index]
                                                ['edia'],
                                            'id': snapshot.data![index]['id']
                                          });
                                      setState(() {});
                                    },
                                    child: Text('Ver'),
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all<Color>(
                                              Color(0xFF016BC1)),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Error al cargar los productos'),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async {
            await Navigator.pushNamed(context, "/carrito");
            setState(() {});
          },
          child: const Icon(Icons.shopping_cart),
          backgroundColor: Color(0xFF016BC1),
        ),
      ),
    );
  }
}
