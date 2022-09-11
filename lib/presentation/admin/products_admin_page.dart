import 'package:flutter/material.dart';

class ProductsAdminPage extends StatefulWidget {
  const ProductsAdminPage({Key? key}) : super(key: key);

  @override
  State<ProductsAdminPage> createState() => _ProductsAdminPageState();
}

class _ProductsAdminPageState extends State<ProductsAdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Products"),),
    );
  }
}
