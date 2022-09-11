import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:malika_shop/presentation/widgets/my_custom_button.dart';
import 'package:malika_shop/utils/constants.dart';
import 'package:malika_shop/utils/my_utils.dart';

class AdminPage extends StatefulWidget {
  const AdminPage({Key? key}) : super(key: key);

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black54,
      appBar: AppBar(
        title: const Text("Admin Panel"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          MyCustomButton(
            onTap: () => Navigator.pushNamed(context, adminCategories),
            text: "Categories",
          ),
          const SizedBox(height: 30),
          MyCustomButton(
            onTap: () => Navigator.pushNamed(context, adminProducts),
            text: "Products",
          ),
          const SizedBox(height: 30),
          MyCustomButton(
            onTap: () => Navigator.pushNamed(context, adminOrders),
            text: "Users Orders",
          ),
        ],
      ),
    );
  }

  Future<void> addCategory1() async {
    try {
      CollectionReference categories =
          FirebaseFirestore.instance.collection('categories');
      await categories.doc("my_doc_id").set({
        "first_name": "Abdulloh",
        "last_name": "Falonchi",
      });
    } on FirebaseException catch (e) {
      MyUtils.showSnackBar(context, e.message);
    }
  }


  Future<void> addCategory2() async {
    try {
      CollectionReference categories =
          FirebaseFirestore.instance.collection('categories');
      await categories.add({
        "first_name": "Abdulloh",
        "last_name": "Falonchi",
      });
    } on FirebaseException catch (e) {
      MyUtils.showSnackBar(context, e.message);
    }
  }
}
