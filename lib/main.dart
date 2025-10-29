import 'package:flutter/material.dart';
import 'package:storekeeper/screens/addproduct.dart';
import 'package:storekeeper/screens/nextscreen.dart';
import 'package:storekeeper/screens/productscreen.dart';
import 'package:storekeeper/screens/splashscreen.dart';

void main() {
  runApp(const StorekeeperApp());
}

class StorekeeperApp extends StatelessWidget {
  const StorekeeperApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      initialRoute: '/',
      routes: {
        '/': (context) => const SplashScreen(),
        '/next': (context) => const NextScreen(),
        '/product': (context) => const ProductScreen(),
        '/add': (context) => const AddProduct(),
      },
    );
  }
}
