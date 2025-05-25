import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/model/button_model.dart';
import 'package:food_delivery/core/utils/constants.dart';
import 'package:food_delivery/core/utils/navigation.dart';
import 'package:food_delivery/core/utils/styles.dart';
import 'package:intl/intl.dart';

import '../../../../../core/model/text_field_model.dart';
import '../../../../../core/utils/colors.dart';
import '../../../../../core/utils/services/firebase_firestore_service.dart';
import '../../../../../core/utils/services/firebase_storage_service.dart';
import '../../../../../core/utils/services/image_picker_service.dart';
import '../../../../home/presentation/manager/home/home_bloc.dart';
import '../../../data/model/user_data_model.dart';
import '../../views/widgets/gender_bottom_sheet.dart';
import '../../views/widgets/personal_data_pick_date.dart';

part 'personal_data_event.dart';
part 'personal_data_state.dart';

class PersonalDataBloc extends Bloc<PersonalDataEvent, PersonalDataState> {
  final FirebaseFirestoreService _firebaseFirestoreService;
  final FirebaseStorageService _firebaseStorageService;
  final ImagePickerService _imagePickerService;

  PersonalDataBloc(this._firebaseFirestoreService, this._firebaseStorageService,
      this._imagePickerService)
      : super(PersonalDataInitial()) {
    on<PersonalDataEvent>((event, emit) async {
      if (event is PickImageEvent) {
        image = await _imagePickerService.pickImage();
        emit(PickImageSuccess());
      }
      if (event is UpdatePersonalDataEvent) {
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

            if (isNameChanged ||
                isDateChanged ||
                isGenderChanged ||
                isImageChanged) {
              String? imageUrl;
              if (isImageChanged) {
                imageUrl = await _firebaseStorageService.uploadImage(image!);
              }

              final userData = _userDataModel!.copyWith(
                  imageFile: image?.path,
                  userImage: imageUrl,
                  userName: _fullNameController!.text.trim(),
                  gender: _genderController!.text.trim(),
                  dateOfBirth: _dateOfBirthController!.text.trim());
              await _firebaseFirestoreService.updateData(
                  collectionName: Constants.userCollection,
                  docID: userData.userID,
                  data: userData.toJson());

              emit(UpdateUserDataSuccess());
            }
          }
        }
      }

      if (event is CancleChangesEvent) {
        final isFullNameChanged = _fullNameController!.text.isNotEmpty &&
            _userDataModel?.userName != _fullNameController!.text.trim();
        final isDateChanged = _dateOfBirthController!.text.isNotEmpty &&
            _userDataModel?.dateOfBirth != _dateOfBirthController!.text.trim();
        final isGenderChanged = _genderController!.text.isNotEmpty &&
            _userDataModel?.gender != _genderController!.text.trim();

        final isImageChanged = image != null;

        if (isFullNameChanged ||
            isDateChanged ||
            isGenderChanged ||
            isImageChanged) {
          if (isFullNameChanged || isDateChanged || isGenderChanged) {
            _fullNameController!.text = _userDataModel!.userName;
            _dateOfBirthController!.text = _userDataModel!.dateOfBirth!;
            _genderController!.text = _userDataModel!.gender!;
          }
          if (isImageChanged) {
            image = null;
          }
          emit(CancleChanges());
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
        hintText: "Type something longer here...",
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

  List<ButtonModel> buttonList() {
    return [
      ButtonModel(
          buttonName: "Update Changes",
          backgroundColor: AppColors.primaryColor,
          isLoading: isLoading,
          onTap: () => add(UpdatePersonalDataEvent())),
      ButtonModel(
          buttonName: "Cancel Changes",
          backgroundColor: Colors.white,
          borderColor: AppColors.primaryColor,
          style: Styles.semiBold14.copyWith(color: const Color(0xff101010)),
          onTap: () => add(CancleChangesEvent())),
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
