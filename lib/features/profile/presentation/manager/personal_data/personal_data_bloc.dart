import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/model/text_field_model.dart';

import '../../../data/repo/profile_repo.dart';
import '../../views/widgets/gender_bottom_sheet.dart';

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
    });
  }

  File? image;
  List<TextFieldModel> textFieldList(BuildContext context) {
    return [
      TextFieldModel(header: "Full Name", hintText: "Full Name"),
      TextFieldModel(header: "Date of birth", hintText: "DD/MM/YYYY"),
      TextFieldModel(
        header: "Gender",
        hintText: "Male",
        readOnly: true,
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
      TextFieldModel(header: "Phone", hintText: "+1 (123) 456-7890"),
      TextFieldModel(header: "Email", hintText: "example@gmail.com"),
    ];
  }
}
