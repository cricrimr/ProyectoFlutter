import 'package:flutter/material.dart';

import '../services/firebase_services.dart';

class Forms extends StatefulWidget {
  const Forms({super.key});

  @override
  State<Forms> createState() => _formsState();
}

class _formsState extends State<Forms> {
  TextEditingController nameController =TextEditingController(text: ""); //en el controller se gurda la indo
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Formulario'),
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
                    await addProducts(nameController.text).then((_) => {
                          Navigator.pop(context),
                        });
                  },
                  child: const Text('Guardar'))
            ],
          ),
        ));
  }
}
