import 'dart:js_util';

import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:proyectop_flutter/services/firebase_services.dart';
import 'package:proyectop_flutter/views/edit.dart';
import 'package:proyectop_flutter/views/forms.dart';
import 'package:proyectop_flutter/views/home.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Productos',
      routes: {
        '/': (context) => const Home(),
        '/add': (context) => const Forms(),
        '/edit': (context) => const edit(),
      },
    );
  }
}
