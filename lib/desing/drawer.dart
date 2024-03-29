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
              color: Color(0xFF016BC1),
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
            title: Text('Inicio'),
            onTap: () {
              Navigator.pushNamed(context, '/items');
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
