import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:malika_shop/data/models/category/category_item.dart';
import 'package:malika_shop/utils/my_utils.dart';

class CategoryViewModel {
  final FirebaseFirestore _fireStore;

  CategoryViewModel({required FirebaseFirestore fireStore})
      : _fireStore = fireStore;

  Future<void> addCategory({
    required BuildContext context,
    required CategoryItem categoryItem,
  }) async {
    try {
      await _fireStore
          .collection("categories")
          .doc()
          .set(categoryItem.toJson());
    } on FirebaseException catch (e) {
      MyUtils.showSnackBar(context, e.message);
    }
  }

  Future<void> updateCategory(
      {required BuildContext context,
      required CategoryItem categoryItem,
      required String docId}) async {
    try {
      await _fireStore
          .collection("categories")
          .doc(docId)
          .update(categoryItem.toJson());
    } on FirebaseException catch (e) {
      MyUtils.showSnackBar(context, e.message);
    }
  }

  Future<void> deleteCategory({
    required BuildContext context,
    required String docId,
  }) async {
    try {
      await _fireStore.collection("categories").doc(docId).delete();
    } on FirebaseException catch (e) {
      MyUtils.showSnackBar(context, e.message);
    }
  }

  Stream<List<CategoryItem>> getCategories() =>
      _fireStore.collection('categories').snapshots().map(
            (snapshot) => snapshot.docs
                .map((doc) => CategoryItem.fromJson(doc.data()))
                .toList(),
          );

  Stream<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getCategoriesForAdmin() =>
          _fireStore.collection('categories').snapshots().map(
                (snapshot) => snapshot.docs,
              );
}
