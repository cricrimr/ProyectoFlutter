import 'dart:io';

import 'package:flutter/material.dart';
import 'package:proyectop_flutter/services/seleccionarImagen.dart';

import '../services/firebase_services.dart';
import '../services/seleccionarImagen.dart'; // importar la función subirImagen

class Forms extends StatefulWidget {
  const Forms({super.key});

  @override
  State<Forms> createState() => _formsState();
}

class _formsState extends State<Forms> {
  File? imagen_to_upload;
  String? imageUrl;
  TextEditingController nameController =
      TextEditingController(text: ""); //en el controller se gurda la indo
  TextEditingController PriceController =
      TextEditingController(text: ""); //en el controller se gurda la indo

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
              TextField(
                controller: PriceController,
                decoration: const InputDecoration(
                  hintText: 'Precio del producto',
                ),
              ),
              imagen_to_upload != null
                  ? Image.file(imagen_to_upload!)
                  : Container(
                      margin: EdgeInsets.all(10),
                      height: 200,
                      width: double.infinity,
                      color: Colors.red,
                    ),
              ElevatedButton(
                  onPressed: () async {
                    final imagen = await getImagen();
                    setState(() {
                      imagen_to_upload = File(imagen!.path);
                    });
                  },
                  child: const Text('Seleccionar imagen')),
              Container(
                child: ElevatedButton(
                    onPressed: () async {
                      if (imagen_to_upload == null) {
                        return;
                      }
                      final uploaded = await subirImagen(imagen_to_upload!);

                      final imageUrl = await subirImagen(imagen_to_upload!);

                      await addProducts(nameController.text, imageUrl,PriceController.text)
                          .then((_) => {
                                Navigator.pop(context),
                              });
                    },
                    child: const Text('Guardar')),
              ),
            ],
          ),
        ));
  }
}
