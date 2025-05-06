import 'package:flutter/material.dart';

class CachedNetworkModel {
  final String imageUrl;
  final BoxFit? fit;
  final Widget Function(BuildContext, String)? placeholder;

  CachedNetworkModel({required this.imageUrl, this.fit, this.placeholder});
}
