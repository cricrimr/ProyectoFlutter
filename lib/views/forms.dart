import 'dart:io';

import 'package:flutter/material.dart';
import 'package:proyectop_flutter/services/seleccionarImagen.dart';
import 'package:flutter/services.dart';

import '../desing/drawer.dart';
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
  TextEditingController PriceController = TextEditingController(text: "");
  TextEditingController lowController =
      TextEditingController(text: ""); //en el controller se gurda la indo
  TextEditingController contidadStock =
      TextEditingController(text: ""); //en el controller se gurda la indo
  TextEditingController descripcion =
      TextEditingController(text: ""); //en el controller se gurda la indo
  TextEditingController categoryController = TextEditingController();
  String dropdownValue = 'Envio nacional'; // Valor por defecto en el dropdown
  String dropdownValuePrecio = 'Envio gratis';
  String dropdownValueDia = 'Lunes';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF016BC1),
          title: const Text('Agregar producto'),
        ),
        drawer: const drawerPlantilla(),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Form(
                child: Column(
                  children: [
                    Text(
                      'Nombre del producto',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        hintText: 'Nombre del producto',
                      ),
                      validator: (value) {
                        if (nameController.text.isEmpty) {
                          return 'Este campo no puede estar vacío';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Descripcion del producto',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      controller: descripcion,
                      decoration: const InputDecoration(
                        hintText: 'Descripcion',
                      ),
                      validator: (value) {
                        if (descripcion.text.isEmpty) {
                          return 'Este campo no puede estar vacío';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Precio del producto',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      controller: PriceController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: const InputDecoration(
                        hintText: 'Precio del producto',
                      ),
                      validator: (value) {
                        if (PriceController.text.isEmpty) {
                          return 'Este campo no puede estar vacío';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Precio del descuento',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      controller: lowController,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: const InputDecoration(
                        hintText: 'Precio del descuento',
                      ),
                      validator: (value) {
                        if (lowController.text.isEmpty) {
                          return 'Este campo no puede estar vacío';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'cantidad de stock producto',
                      style: TextStyle(
                          fontSize: 16.0, fontWeight: FontWeight.bold),
                    ),
                    TextFormField(
                      controller: contidadStock,
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly,
                      ],
                      decoration: const InputDecoration(
                        hintText: 'Cantidad Stock',
                      ),
                      validator: (value) {
                        if (contidadStock.text.isEmpty) {
                          return 'Este campo no puede estar vacío';
                        }
                        return null;
                      },
                    ),
                    // DropdownButton
                    const SizedBox(
                      height: 20,
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
                    const SizedBox(
                      height: 20,
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

                    // DropdownButton
                    const SizedBox(
                      height: 20,
                    ),
                    imagen_to_upload != null
                        ? Image.file(imagen_to_upload!)
                        : Container(
                            margin: const EdgeInsets.all(10),
                            height: 100,
                            width: double.infinity,
                            color: Colors.grey[200],
                          ),
                    ElevatedButton(
                      onPressed: () async {
                        final imagen = await getImagen();
                        setState(() {
                          imagen_to_upload = File(imagen!.path);
                        });
                      },
                      child: const Text('Seleccionar imagen'),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Color(0xFF016BC1)),
                      ),
                    ),
                    Container(
                      child: ElevatedButton(
                        onPressed: () async {
                          if (imagen_to_upload == null) {
                            return;
                          }
                          if (nameController == null) {
                            return;
                          }
                          if (descripcion == null) {
                            return;
                          }
                          if (PriceController == null) {
                            return;
                          }
                          final uploaded = await subirImagen(imagen_to_upload!);

                          final imageUrl = await subirImagen(imagen_to_upload!); 

                          await addProducts(
                                  nameController.text,
                                  descripcion.text,
                                  imageUrl,
                                  PriceController.text,
                                  lowController.text,
                                  dropdownValue,
                                  dropdownValuePrecio,
                                  dropdownValueDia,
                                  contidadStock.text)
                              .then((_) => {
                                    Navigator.pop(context),
                                  });
                        },
                        child: const Text('Guardar'),
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Color(0xFF016BC1)),
                        ),
                      ),
                    ),
                  ],
                ),
              )),
        ));
  }
}
