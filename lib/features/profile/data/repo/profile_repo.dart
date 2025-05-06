import 'dart:io';

abstract class ProfileRepo {
  Future<File?> pickImage();
}
