import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseFirestoreService {
  final FirebaseFirestore _firebaseFirestore;

  FirebaseFirestoreService(this._firebaseFirestore);

  Future<void> addData(
      {required String collectionName,
      required String docID,
      required Map<String, dynamic> data}) async {
    await _firebaseFirestore.collection(collectionName).doc(docID).set(data);
  }

  void getData(
      {required String collectionName,
      required Function(QuerySnapshot<Map<String, dynamic>>)? onData}) {
    _firebaseFirestore.collection(collectionName).snapshots().listen(onData);
  }

  Future<bool> isDataExist(
      {required String collectionName, required String docID}) async {
    final doc = await FirebaseFirestore.instance
        .collection(collectionName)
        .doc(docID)
        .get();
    return doc.exists;
  }

  Future<void> updateData(
      {required String collectionName,
      required String docID,
      required Map<String, dynamic> data}) async {
    await FirebaseFirestore.instance
        .collection(collectionName)
        .doc(docID)
        .update(data);
  }
}
