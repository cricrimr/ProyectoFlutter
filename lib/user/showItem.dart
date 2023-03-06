import 'package:flutter/material.dart';
import 'package:proyectop_flutter/desing/appBar.dart';
import '../services/firebase_services.dart';

class itemGen extends StatefulWidget {
  const itemGen({super.key});

  @override
  State<itemGen> createState() => _EditState();
}

class _EditState extends State<itemGen> {
  TextEditingController nameController = TextEditingController(text: "");
  TextEditingController descripcionController = TextEditingController(text: "");
  TextEditingController imageUrlController = TextEditingController(text: "");
  TextEditingController priceController = TextEditingController(text: "");
  TextEditingController priceLowController = TextEditingController(text: "");
  TextEditingController entregaController = TextEditingController(text: "");
  TextEditingController tEntregaController = TextEditingController(text: "");
  TextEditingController eDiaController = TextEditingController(text: "");
  TextEditingController cantidadController = TextEditingController(text: "");

  @override
  Widget build(BuildContext context) {
    final Map argumentos = ModalRoute.of(context)!.settings.arguments as Map;
    nameController.text = argumentos['name'];
    descripcionController.text = argumentos['descripcion'];
    priceController.text = argumentos['price'];
    imageUrlController.text = argumentos['imageUrl'];
    priceLowController.text = argumentos['priceLow'];
    entregaController.text = argumentos['entrega'];
    tEntregaController.text = argumentos['tEntrega'];
    cantidadController.text = argumentos['cantidad'];
    eDiaController.text = argumentos['edia'];
    int priceLow = int.parse(priceLowController.text);
    int price = int.parse(priceController.text);

    double discountPercent = ((price - priceLow) / price) * 100;

// Redondea el porcentaje a dos decimales
    discountPercent = double.parse(discountPercent.toStringAsFixed(2));

    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF016BC1),
        title: Text('Comprar ${nameController.text}'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.all(1.0),
                child: Text(
                  descripcionController.text,
                  style: const TextStyle(fontSize: 17),
                ),
              ),
              Container(
                height: 200,
                width: double.infinity,
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 5,
                      offset: const Offset(0, 3),
                    ),
                  ],
                  image: DecorationImage(
                    image: NetworkImage(imageUrlController.text),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Text(
              //   nameController.text,
              //   style: const TextStyle(fontSize: 20),
              // ),
              // const SizedBox(height: 10),
              // Text(
              //   descripcionController.text,
              //   style: const TextStyle(fontSize: 16),
              // ),
              const SizedBox(height: 20),
              Text(
                '\$${priceController.text}',
                style: const TextStyle(
                  fontSize: 18,
                  decoration: TextDecoration
                      .lineThrough, // Agrega una línea a través del texto
                  decorationColor: Colors.black, // Color de la línea
                  decorationThickness: 2, // Gro
                ),
              ),
              const SizedBox(height: 20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\$ ${priceLowController.text}',
                    style: const TextStyle(
                        fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 5),
                  Text(
                    '%${discountPercent}',
                    style: const TextStyle(fontSize: 16, height: 0),
                  ),
                ],
              ),

              const SizedBox(height: 20),
              Text(
                'Cantidad disponible: ${cantidadController.text}',
                style: const TextStyle(fontSize: 16),
              ),

              const SizedBox(height: 20),
              Text(
                'Entrega: ${entregaController.text} ${tEntregaController.text}',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 20),
              Text(
                'Día estimado de entrega: ${eDiaController.text}',
                style: const TextStyle(fontSize: 16),
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
      ),
    );
  }
}
