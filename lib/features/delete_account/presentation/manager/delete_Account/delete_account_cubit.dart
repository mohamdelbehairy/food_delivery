import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/repo/delete_account_repo.dart';

part 'delete_account_state.dart';

class DeleteAccountCubit extends Cubit<DeleteAccountState> {
  DeleteAccountCubit(this._deleteAccountRepo) : super(DeleteAccountInitial());

  final DeleteAccountRepo _deleteAccountRepo;

  bool isLoading = false;
  Future<void> deleteAccount() async {
    isLoading = true;
    emit(DeleteAccountLoading());
    await _deleteAccountRepo.deleteAccount().then((value) {
      isLoading = false;
      emit(DeleteAccountSuccess());
    }).catchError((error) {
      log("error from delete account $error");
      isLoading = false;
      emit(DeleteAccountFailure(errorMessage: error.toString()));
    });
  }
}
