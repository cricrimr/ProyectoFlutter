import 'package:flutter/material.dart';

import '../services/firebase_services.dart';

class itemGen extends StatefulWidget {
  const itemGen({super.key});

  @override
  State<itemGen> createState() => _editState();
}

class _editState extends State<itemGen> {
  TextEditingController nameController =
      TextEditingController(text: ""); //en el controller se guarda la indo
  TextEditingController priceController =
      TextEditingController(text: ""); //en el controller se guarda la indo
  TextEditingController imageUrlController =
      TextEditingController(text: ""); //en el controller se guarda la indo

  @override
  Widget build(BuildContext context) {
    //aqui se traen las variables
    final Map argumentos = ModalRoute.of(context)!.settings.arguments as Map;
    nameController.text = argumentos['name'];
    priceController.text = argumentos['price'];
    imageUrlController.text = argumentos['imageUrl'];

    return Scaffold(
      appBar: AppBar(
        title: Text('Comprar ${nameController.text}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrlController.text),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              nameController.text,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              "Camisa nueva",
              // argumentos['description'],
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            Text(
              '\$${priceController.text}',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                // Aquí iría el código para realizar la compra del producto
              },
              child: const Text('Comprar'),
            ),
          ],
        ),
      ),
    );
  }
}
