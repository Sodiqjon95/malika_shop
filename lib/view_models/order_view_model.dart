import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:malika_shop/data/models/card/order_item.dart';
import 'package:malika_shop/utils/my_utils.dart';

class OrderViewModel {
  final FirebaseFirestore _fireStore;

  OrderViewModel({required FirebaseFirestore fireStore})
      : _fireStore = fireStore;

  Future<void> addOrder({
    required BuildContext context,
    required OrderItem orderItem,
  }) async {
    try {
      await _fireStore.collection("orders").doc().set(orderItem.toJson());
      MyUtils.showSnackBar(context, "Muvaffaqiyatli qo'shildi");
    } on FirebaseException catch (e) {
      MyUtils.showSnackBar(context, e.message);
    }
  }

  Future<void> updateOrder(
      {required BuildContext context,
      required OrderItem orderItem,
      required String docId}) async {
    try {
      await _fireStore
          .collection("orders")
          .doc(docId)
          .update(orderItem.toJson());
      MyUtils.showSnackBar(context, "Muvaffaqiyatli update bo'ldi");
    } on FirebaseException catch (e) {
      MyUtils.showSnackBar(context, e.message);
    }
  }

  Future<void> deleteOrder({
    required BuildContext context,
    required String docId,
  }) async {
    try {
      await _fireStore.collection("orders").doc(docId).delete();
      MyUtils.showSnackBar(context, "Muvaffaqiyatli o'chirildi");
    } on FirebaseException catch (e) {
      MyUtils.showSnackBar(context, e.message);
    }
  }

  Stream<List<OrderItem>> getAllOrders() =>
      _fireStore.collection('orders').snapshots().map(
            (snapshot) => snapshot.docs
                .map((doc) => OrderItem.fromJson(doc.data()))
                .toList(),
          );

  Stream<List<QueryDocumentSnapshot<Map<String, dynamic>>>>
      getOrdersForAdmin() => _fireStore.collection('orders').snapshots().map(
            (snapshot) => snapshot.docs,
          );
}
