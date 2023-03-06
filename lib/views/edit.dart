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
          title: const Text('Editar'),
        ),
        body: SingleChildScrollView(
          child: Padding(
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
                  controller: descripcionController,
                  decoration: const InputDecoration(
                    hintText: 'Descripcion del producto',
                  ),
                ),
                TextField(
                  controller: priceController,
                  decoration: const InputDecoration(
                    hintText: 'Precio del producto',
                  ),
                ),
                TextField(
                  controller: priceLowController,
                  decoration: const InputDecoration(
                    hintText: 'precio de descuento del producto',
                  ),
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
                    child: const Text('Actualizar'))
              ],
            ),
          ),
        ));
  }
}
