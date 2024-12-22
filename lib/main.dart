import 'package:flutter/material.dart';
import 'package:nova_flow_flutter/screens/home_screen.dart';
import 'package:nova_flow_flutter/screens/product/product_detail.dart';
import 'package:nova_flow_flutter/screens/product/product_screen.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (BuildContext context) => HomeScreen(),
        '/product': (BuildContext context) => ProductScreen(),
        '/product_detail': (BuildContext context) => ProductDetail(),
      },
    ),
  );
}
