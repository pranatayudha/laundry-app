import 'dart:async';

import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../application/app/app.locator.dart';
import '../../../application/app/app.router.dart';
import '../../../application/enums/dialog_type.dart';
import '../../../application/services/local_db_service.dart';
import '../../../infrastructure/apis/user_api.dart';

class LoginViewModel extends BaseViewModel {
  final _localDBService = locator<LocalDBService>();
  final _dialogService = locator<DialogService>();
  final _navigationService = locator<NavigationService>();
  final _userAPI = locator<UserAPI>();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.disabled;

  late String? username;
  late String? password;
  bool _isObscured = true;
  bool? remember = false;
  FocusNode focusNode = FocusNode();

  GlobalKey<FormState> get formKey => _formKey;

  AutovalidateMode get autoValidateMode => _autoValidateMode;

  bool get isObscured => _isObscured;

  void saveUsername(String value) => username = value.trim();

  void savePassword(String value) => password = value.trim();

  void initialize() => {
        _localDBService.removeToken(),
        _localDBService.removeUser(),
      };

  void toggleShowPassword() {
    _isObscured = !_isObscured;
    notifyListeners();
  }

  void validateInputs() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      _login();
    } else {
      _autoValidateMode = AutovalidateMode.always;
      notifyListeners();
    }
  }

  Future<Map<String, dynamic>> _generateLoginMap() async {
    return {
      'name': username,
      'password': password,
    };
  }

  Future _login() async {
    final loginMap = await _generateLoginMap();
    final response = await runBusyFuture(
      _userAPI.login(
        payload: loginMap,
      ),
    );

    response.fold(
      (errorMessage) {
        _localDBService.removeToken();
        _showLoginErrorDialog(errorMessage);
      },
      (user) async {
        final scsMsg = await _showLoginSuccessDialog();
        if (scsMsg) {
          _navigationService.replaceWith(Routes.mainView);
        }
      },
    );
  }

  Future _showLoginErrorDialog(String errorMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Login Gagal',
      description: "Usename/Password Salah",
      mainButtonTitle: 'Coba Lagi',
    );
  }

  Future _showLoginSuccessDialog() async {
    await _dialogService.showCustomDialog(
      variant: DialogType.success,
      description: "Login Berhasil",
      mainButtonTitle: 'Ok',
    );
    return true;
  }
}
