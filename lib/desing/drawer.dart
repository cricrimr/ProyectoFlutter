import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:proyectop_flutter/services/firebase_services.dart';

import '../services/cerrarSesion.dart';

class drawerPlantilla extends StatelessWidget {
  const drawerPlantilla({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Image.asset(
              'assets/imagenPubli.webp',
              height: 24,
              color: Colors.white,
            ),
          ),
          ListTile(
            title: Text('Ver Compras'),
            onTap: () {
              Navigator.pushNamed(context, '/reporte');
            },
          ),
          ListTile(
            title: Text('Opción 2'),
            onTap: () {
              // Acción a realizar cuando se seleccione esta opción
            },
          ),
          ListTile(
            title: Text('Cerrar Sesion'),
            leading: IconButton(
              onPressed: () {
                logout(context);
              },
              icon: Icon(Icons.logout),
            ),
          )
        ],
      ),
    );
  }
}
