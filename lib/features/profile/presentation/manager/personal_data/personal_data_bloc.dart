import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/model/text_field_model.dart';
import '../../../data/repo/profile_repo.dart';
import '../../views/widgets/gender_bottom_sheet.dart';
import '../../views/widgets/personal_data_pick_date.dart';

part 'personal_data_event.dart';
part 'personal_data_state.dart';

class PersonalDataBloc extends Bloc<PersonalDataEvent, PersonalDataState> {
  final ProfileRepo _profileRepo;

  PersonalDataBloc(this._profileRepo) : super(PersonalDataInitial()) {
    on<PersonalDataEvent>((event, emit) async {
      if (event is PickImageEvent) {
        image = await _profileRepo.pickImage();
        emit(PickImageSuccess());
      }
      if (event is SavePersonalDataEvent) {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
        }
      }
    });
  }

  File? image;
  String? dateOfBirth;

  final TextEditingController _fullNameController = TextEditingController();
  final TextEditingController _dateOfBirthController = TextEditingController();
  final TextEditingController _genderController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  List<TextFieldModel> textFieldList(BuildContext context) {
    return [
      TextFieldModel(
        header: "Full Name",
        hintText: "Full Name",
        controller: _fullNameController,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "This field is required";
          }
          return null;
        },
      ),
      TextFieldModel(
          header: "Date of birth",
          hintText: "DD/MM/YYYY",
          readOnly: true,
          controller: _dateOfBirthController,
          suffixIcon: GestureDetector(
            onTap: () async {
              final date = await personalDataPickDate(context);
              if (date == null) return;
              dateOfBirth =
                  "${date.day.toString().padLeft(2, "0")}/${date.month.toString().padLeft(2, "0")}/${date.year}";
              _dateOfBirthController.text = dateOfBirth ?? "";
            },
            child: Icon(Icons.calendar_month_outlined,
                size: 20, color: const Color(0xff101010)),
          )),
      TextFieldModel(
        header: "Gender",
        hintText: "Male",
        readOnly: true,
        controller: _genderController,
        suffixIcon: GestureDetector(
          onTap: () => showModalBottomSheet(
              context: context,
              backgroundColor: Colors.white,
              builder: (context) => GenderBottomSheet()),
          child: Transform.rotate(
            angle: -90 * 3.14 / 180,
            child: Icon(Icons.arrow_back_ios_new_outlined,
                size: 16, color: const Color(0xff101010)),
          ),
        ),
      ),
      TextFieldModel(
          header: "Phone",
          hintText: "+1 (123) 456-7890",
          controller: _phoneController),
      TextFieldModel(
          header: "Email",
          readOnly: true,
          controller: _emailController,
          hintText: "example@gmail.com"),
    ];
  }

  @override
  Future<void> close() {
    _fullNameController.dispose();
    _dateOfBirthController.dispose();
    _genderController.dispose();
    _phoneController.dispose();
    _emailController.dispose();

    return super.close();
  }
}
