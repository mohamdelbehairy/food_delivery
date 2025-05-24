import 'dart:io';

import 'package:image_picker/image_picker.dart';

import 'profile_repo.dart';

class ProfileRepoImpl extends ProfileRepo {
  @override
  Future<File?> pickImage() async {
    File? image;
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage != null) {
      image = File(returnImage.path);
    }
    return image;
  }

  // @override
  // Future<String> storgeImage(File imageFile) async {
  //   final imageName = DateTime.now().millisecondsSinceEpoch.toString();
  //   final reference =
  //       FirebaseStorage.instance.ref().child("userImage/$imageName");
  //   await reference.putFile(imageFile);
  //   return await reference.getDownloadURL();
  // }
}
