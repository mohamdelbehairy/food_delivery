import 'package:flutter/material.dart';

import '../utils/styles.dart';

AppBar customAppBar({String? title, Widget? leading, Color? backgroundColor}) {
  return AppBar(
    centerTitle: true,
    scrolledUnderElevation: 0.0,
    backgroundColor: backgroundColor ?? Colors.white,
    leading: leading,
    title: Text(title ?? "Profile Settings", style: Styles.semiBold16),
  );
}
