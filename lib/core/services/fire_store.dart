import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:e_commerce_app/core/services/data_base_service.dart';

class FirestoreService extends DataBaseService {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
    String? dId,
  }) async {
    if (dId != null) {
      await firestore.collection(path).doc(dId).set(data);
    } else {
      await firestore.collection(path).add(data);
    }
  }


   @override
  Future<Map<String, dynamic>?> getData({
    required String path,
    required String dId,
  }) async {
    final doc = await firestore.collection(path).doc(dId).get();
    if (doc.exists) {
      return doc.data();
    } else {
      return null;
    }
  }
}


