import 'dart:io';

abstract class ProfileRepo {
  Future<File?> pickImage();
  Future<String> storgeImage(File imageFile);
}
