import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import '../services/firebase_services.dart';

class Forms extends StatefulWidget {
  const Forms({super.key});

  @override
  State<Forms> createState() => _formsState();
}

class _formsState extends State<Forms> {
  final _nameController = TextEditingController();
  File? _image;

  Future<void> _pickImage() async {
    final pickedImage =
        await ImagePicker().getImage(source: ImageSource.gallery);
    if (pickedImage != null) {
      setState(() {
        _image = File(pickedImage.path);
      });
    }
  }

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
                controller: _nameController,
                decoration: const InputDecoration(
                  hintText: 'Nombre del producto',
                ),
              ),
              ElevatedButton(
                  onPressed: _pickImage,
                  child: const Text('Seleccionar imagen')),
              if (_image != null)
                Image.file(_image!), // Muestra la imagen seleccionada
              ElevatedButton(
                  onPressed: () async {
                    await addProducts(_nameController.text, _image)
                        .then((_) => {
                              Navigator.pop(context),
                            });
                  },
                  child: const Text('Guardar'))
            ],
          ),
        ));
  }
}
