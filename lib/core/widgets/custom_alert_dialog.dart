import 'package:flutter/material.dart';
import 'package:food_delivery/core/model/alert_dialog_model.dart';
import 'package:food_delivery/core/utils/styles.dart';

import 'alert_dialog_buttons.dart';
import 'alert_dialog_title.dart';

class CustomAlertDialog extends StatelessWidget {
  const CustomAlertDialog({super.key, required this.alertDialogModel});
  final AlertDialogModel alertDialogModel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      titlePadding: EdgeInsets.only(top: 16, right: 12, left: 24),
      title: AlertDialogTitle(title: alertDialogModel.title),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(alertDialogModel.content ?? "Do you want to log out?",
              style: Styles.medium12.copyWith(color: Color(0xff878787))),
          const SizedBox(height: 24),
          AlertDialogButtons(
              buttonName: alertDialogModel.buttonName ?? "Log Out",
              onTap: alertDialogModel.onTap),
        ],
      ),
    );
  }
}
