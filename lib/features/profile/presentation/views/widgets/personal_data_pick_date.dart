import 'package:flutter/material.dart';
import 'package:food_delivery/core/utils/colors.dart';

Future<DateTime?> personalDataPickDate(BuildContext context,
    {DateTime? initialDate}) {
  return showDatePicker(
      context: context,
      initialDate: initialDate ?? DateTime(2000),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
      initialEntryMode: DatePickerEntryMode.inputOnly,
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
              primaryColor: AppColors.primaryColor,
              colorScheme: ColorScheme.light(
                  primary: AppColors.primaryColor,
                  onPrimary: Colors.white,
                  onSurface: Colors.black),
              dialogBackgroundColor: Colors.white),
          child: child!,
        );
      });
}
