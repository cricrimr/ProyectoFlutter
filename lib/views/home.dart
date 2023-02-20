import 'package:flutter/material.dart';

import '../services/firebase_services.dart';

class Home extends StatefulWidget {
  const Home({
    Key? key,
  }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
      ),
      body: FutureBuilder(
        future: getPeople(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Card(
              child: GridView.count(
                crossAxisCount: 2,
                children: List.generate(
                  snapshot.data!.length,
                  (index) {
                    return Dismissible(
                      onDismissed: (direction) async {
                        await deleteProducts(snapshot.data![index]['id']);
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
                        color: Colors.red,
                        child: Icon(Icons.delete),
                      ),
                      direction: DismissDirection.endToStart,
                      key: Key(snapshot.data![index]['id']),
                      child: ListTile(
                        leading:
                            Image.network(snapshot.data![index]['imageUrl']),
                        title: Text(snapshot.data![index]['name']),
                        onTap: (() async {
                          await Navigator.pushNamed(context, "/edit",
                              arguments: {
                                'name': snapshot.data![index]['name'],
                                'id': snapshot.data![index]['id']
                              });
                          setState(() {});
                        }),
                      ),
                    );
                  },
                ),
              ),
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
          await Navigator.pushNamed(context, '/add');
          setState(() {});
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
