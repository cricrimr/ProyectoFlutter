import 'package:flutter/material.dart';

import '../services/firebase_services.dart';

class edit extends StatefulWidget {
  const edit({super.key});

  @override
  State<edit> createState() => _editState();
}

class _editState extends State<edit> {
  TextEditingController nameController =
      TextEditingController(text: ""); //en el controller se gurda la indo
  @override
  Widget build(BuildContext context) {
    //aqui se traen las variables
    final Map argumentos = ModalRoute.of(context)!.settings.arguments as Map;
    // nameController.text = argumentos['name'];
    nameController.text = argumentos['name'];

    return Scaffold(
        appBar: AppBar(
          title: const Text('Editar'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  hintText: 'Nombre del producto',
                ),
              ),
              ElevatedButton(
                  onPressed: () async {
                    await editProducts(argumentos['id'], nameController.text)
                        .then((_) {
                      Navigator.pop(context);
                    });
                  },
                  child: const Text('Actualizar'))
            ],
          ),
        ));
  }
}
