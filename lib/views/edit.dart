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
  TextEditingController descripcionController =
      TextEditingController(text: ""); //en el controller se gurda la indo
  TextEditingController imageUrlController =
      TextEditingController(text: ""); //en el controller se gurda la indo
  TextEditingController priceController =
      TextEditingController(text: ""); //en el controller se gurda la indo
  TextEditingController priceLowController =
      TextEditingController(text: ""); //en el controller se gurda la indo
  TextEditingController cantidadController =
      TextEditingController(text: ""); //en el controller se gurda la indo

  @override
  Widget build(BuildContext context) {
    //aqui se traen las variables
    final Map argumentos = ModalRoute.of(context)!.settings.arguments as Map;
    // nameController.text = argumentos['name'];
    nameController.text = argumentos['name'];
    descripcionController.text = argumentos['descripcion'];
    imageUrlController.text = argumentos['imageUrl'];
    priceController.text = argumentos['price'];
    priceLowController.text = argumentos['priceLow'];
    cantidadController.text = argumentos['cantidad'];
    String dropdownValue = 'Envio nacional'; // Valor por defecto en el dropdown
    String dropdownValuePrecio = 'Envio gratis';
    String dropdownValueDia = 'Lunes';
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF016BC1),
          title: const Text('Editar'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Text(
                  'Nombre del producto',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(
                    hintText: 'Nombre del producto',
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Descripcion del producto',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                TextField(
                  maxLines: 3,
                  controller: descripcionController,
                  decoration: const InputDecoration(
                    hintText: 'Descripcion del producto',
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Precio del producto',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: priceController,
                  decoration: const InputDecoration(
                    hintText: 'Precio del producto',
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'precio de descuento del producto',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: priceLowController,
                  decoration: const InputDecoration(
                    hintText: 'precio de descuento del producto',
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'cantidad de stock producto',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
                TextField(
                  controller: cantidadController,
                  decoration: const InputDecoration(
                    hintText: 'cantidad de stock producto',
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Tipo de envio',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 45),
                    Container(
                      constraints: const BoxConstraints(
                        maxWidth: 1000,
                      ),
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xFF016BC1),
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: DropdownButton<String>(
                          value: dropdownValue,
                          underline: null,
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValue = newValue!;
                            });
                          },
                          items: <String>[
                            'Envio nacional',
                            'Envio internacional',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Costo de envio',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 60),
                    Container(
                      constraints: const BoxConstraints(
                        maxWidth: 1000,
                      ),
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xFF016BC1),
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: DropdownButton<String>(
                          value: dropdownValuePrecio,
                          underline: null,
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValuePrecio = newValue!;
                            });
                          },
                          items: <String>[
                            'Envio gratis',
                            'Envio con costo',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Fecha estimada de entrega',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(width: 16),
                    Container(
                      constraints: const BoxConstraints(
                        maxWidth: 1000,
                      ),
                      child: DecoratedBox(
                        decoration: const BoxDecoration(
                          border: Border(
                            bottom: BorderSide(
                              color: Color(0xFF016BC1),
                              width: 1.0,
                            ),
                          ),
                        ),
                        child: DropdownButton<String>(
                          value: dropdownValueDia,
                          underline: null,
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownValueDia = newValue!;
                            });
                          },
                          items: <String>[
                            'Lunes',
                            'Martes',
                            'Miercoles',
                            'Jueves',
                            'Viernes',
                            'Sabado',
                            'Domingo',
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                  onPressed: () async {
                    await editProducts(
                            argumentos['id'],
                            nameController.text,
                            descripcionController.text,
                            imageUrlController.text,
                            priceController.text,
                            priceLowController.text,
                            dropdownValue,
                            dropdownValuePrecio,
                            dropdownValueDia,
                            cantidadController.text)
                        .then((_) {
                      Navigator.pop(context);
                    });
                  },
                  child: const Text('Actualizar'),
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Color(0xFF016BC1)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
