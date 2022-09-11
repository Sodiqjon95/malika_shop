import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:malika_shop/data/models/cateogory/category_item.dart';
import 'package:malika_shop/utils/constants.dart';
import 'package:malika_shop/view_models/category_view_model.dart';
import 'package:provider/provider.dart';

class CategoriesPage extends StatefulWidget {
  const CategoriesPage({Key? key}) : super(key: key);

  @override
  State<CategoriesPage> createState() => _CategoriesPageState();
}

class _CategoriesPageState extends State<CategoriesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Categories Page"),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, profilePage);
            },
            icon: const Icon(
              Icons.person,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: StreamBuilder<List<CategoryItem>>(
        stream: getCategories(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            final categories = snapshot.data!;
            return ListView(
              children: categories
                  .map(
                    (category) => ListTile(
                      title: Text(category.categoryName),
                    ),
                  )
                  .toList(),
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }

  Stream<List<CategoryItem>> getCategories() =>
      FirebaseFirestore.instance.collection('categories').snapshots().map(
            (snapshot) => snapshot.docs
                .map((doc) => CategoryItem.fromJson(doc.data()))
                .toList(),
          );
}
