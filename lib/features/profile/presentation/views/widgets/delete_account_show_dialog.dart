import 'package:flutter/material.dart';
import 'package:food_delivery/core/model/alert_dialog_model.dart';
import 'package:food_delivery/core/utils/navigation.dart';
import 'package:food_delivery/core/widgets/custom_alert_dialog.dart';

import '../../../../delete_account/presentation/views/delete_account_view.dart';

class DeleteAccountShowDialog extends StatelessWidget {
  const DeleteAccountShowDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomAlertDialog(
        alertDialogModel: AlertDialogModel(
      buttonName: "Delete",
      title: "Delete Account",
      content: "Do you want to delete your account?",
      onTap: () => Navigation.push(context, const DeleteAccountView()),
    ));
  }
}
