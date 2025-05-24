import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService {
  final FirebaseStorage _firebaseStorage;

  FirebaseStorageService(this._firebaseStorage);

  Future<String> uploadImage(File imageFile) async {
    final imageName = DateTime.now().millisecondsSinceEpoch.toString();
    final reference = _firebaseStorage.ref().child("userImage/$imageName");
    await reference.putFile(imageFile);
    return await reference.getDownloadURL();
  }
}
