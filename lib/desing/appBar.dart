import 'package:flutter/material.dart';

class MyAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);

  @override
  State<MyAppBar> createState() => _MyAppBarState();
}

class _MyAppBarState extends State<MyAppBar> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Color(0xFF016BC1),
      title: Text('Bienvenido'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.expand_more),
          onPressed: () {
            // Acción al presionar el botón de buscar
          },
        ),
        IconButton(
          icon: Icon(Icons.expand_less),
          onPressed: () {
            // Acción al presionar el botón de buscar
          },
        ),
      ],
    );
  }
}
