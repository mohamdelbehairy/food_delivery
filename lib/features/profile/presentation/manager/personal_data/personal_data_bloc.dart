import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/utils/navigation.dart';
import 'package:intl/intl.dart';

import '../../../../../core/model/text_field_model.dart';
import '../../../../home/presentation/manager/home/home_bloc.dart';
import '../../../../user_data/data/model/user_data_model.dart';
import '../../../../user_data/data/repo/user_data_repo.dart';
import '../../../data/repo/profile_repo.dart';
import '../../views/widgets/gender_bottom_sheet.dart';
import '../../views/widgets/personal_data_pick_date.dart';

part 'personal_data_event.dart';
part 'personal_data_state.dart';

class PersonalDataBloc extends Bloc<PersonalDataEvent, PersonalDataState> {
  final ProfileRepo _profileRepo;
  final UserDataRepo _dataRepo;

  PersonalDataBloc(this._profileRepo, this._dataRepo)
      : super(PersonalDataInitial()) {
    on<PersonalDataEvent>((event, emit) async {
      if (event is PickImageEvent) {
        image = await _profileRepo.pickImage();
        emit(PickImageSuccess());
      }
      if (event is SavePersonalDataEvent) {
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();

          final isNameChanged = _fullNameController!.text.isNotEmpty &&
              _userDataModel?.userName != _fullNameController!.text.trim();

          final isDateChanged = _dateOfBirthController!.text.isNotEmpty &&
              _userDataModel?.dateOfBirth !=
                  _dateOfBirthController!.text.trim();

          final isGenderChanged = _genderController!.text.isNotEmpty &&
              _userDataModel?.gender != _genderController!.text.trim();

          bool isImageChanged = false;
          if (image != null && _userDataModel?.imageFile != null) {
            final newImageLength = await File(image!.path).length();
            final oldImageLength =
                await File(_userDataModel!.imageFile!).length();
            isImageChanged = newImageLength != oldImageLength;
          } else {
            isImageChanged = image != null;
          }

          if (isNameChanged ||
              isDateChanged ||
              isGenderChanged ||
              isImageChanged) {
            isLoading = true;
            emit(PersonalDataLoading());

            if (isNameChanged || isDateChanged || isGenderChanged) {
              final userDataModel = _userDataModel!.copyWith(
                userName: _fullNameController!.text.trim(),
                gender: _genderController!.text.trim(),
                dateOfBirth: _dateOfBirthController!.text.trim(),
              );
              await _dataRepo.updateUserData(userDataModel);
            }

            if (isImageChanged) {
              final imageUrl = await _profileRepo.storgeImage(image!);
              final userDataModel = _userDataModel!.copyWith(
                  imageFile: image?.path,
                  userImage: imageUrl,
                  userName: _fullNameController!.text.trim(),
                  gender: _genderController!.text.trim(),
                  dateOfBirth: _dateOfBirthController!.text.trim());
              await _dataRepo.updateUserData(userDataModel);
            }

            emit(UpdateUserDataSuccess());
          }
        }
      }
    });
  }

  File? image;
  String? _dateOfBirth, gender;
  UserDataModel? _userDataModel;
  bool isLoading = false;

  TextEditingController? _fullNameController;
  TextEditingController? _dateOfBirthController;
  TextEditingController? _genderController;
  TextEditingController? _phoneController;
  TextEditingController? _emailController;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  void initTextField(BuildContext context, UserDataModel userDataModel) {
    _userDataModel = userDataModel;
    _fullNameController = TextEditingController(text: userDataModel.userName);
    _dateOfBirthController =
        TextEditingController(text: userDataModel.dateOfBirth);
    _genderController = TextEditingController(text: userDataModel.gender);
    _phoneController = TextEditingController(text: null);
    _emailController = TextEditingController(text: userDataModel.userEmail);
  }

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
              final date = await personalDataPickDate(context,
                  initialDate: _userDataModel?.dateOfBirth == null ||
                          _userDataModel!.dateOfBirth!.isEmpty
                      ? null
                      : DateFormat("dd/MM/yyyy")
                          .parseStrict("${_userDataModel?.dateOfBirth}"));
              if (date == null) return;
              _dateOfBirth =
                  "${date.day.toString().padLeft(2, "0")}/${date.month.toString().padLeft(2, "0")}/${date.year}";
              _dateOfBirthController!.text = _dateOfBirth ?? "";
            },
            child: Icon(Icons.calendar_month_outlined,
                size: 20, color: const Color(0xff101010)),
          )),
      TextFieldModel(
        header: "Gender",
        hintText: "Gender",
        readOnly: true,
        controller: _genderController,
        suffixIcon: GestureDetector(
          onTap: () async {
            final result = await showModalBottomSheet(
                context: context,
                backgroundColor: Colors.white,
                builder: (context) => GenderBottomSheet(
                      onTap: () {
                        int index = context.read<HomeBloc>().genderCurrentIndex;
                        if (index == -1) return;
                        gender = index == 0 ? "Male" : "Female";
                        _genderController!.text = gender ?? "";
                        Navigation.pop(context);
                      },
                    ));
            if (result == null) {
              // ignore: use_build_context_synchronously
              context.read<HomeBloc>().genderCurrentIndex = -1;
            }
          },
          child: Transform.rotate(
            angle: -90 * 3.14 / 180,
            child: Icon(Icons.arrow_back_ios_new_outlined,
                size: 16, color: const Color(0xff101010)),
          ),
        ),
      ),
      TextFieldModel(
          header: "Phone",
          readOnly: true,
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
    _fullNameController?.dispose();
    _dateOfBirthController?.dispose();
    _genderController?.dispose();
    _phoneController?.dispose();
    _emailController?.dispose();

    return super.close();
  }
}
