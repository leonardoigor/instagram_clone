import 'dart:ffi';

import 'package:app/domain/entities/userData.dart';
import 'package:app/ui/pages/pages.dart';
import 'package:get/state_manager.dart';

class GetxLoginPresenter extends LoginPresenter {
  final _isLoading = Rx<bool>();
  final _isAuthentic = Rx<bool>();
  final _user = Rx<UserDataEntity>(new UserDataEntity());

  @override
  Future<void> auth() async {
    this._isAuthentic.value = true;
  }

  @override
  Stream<bool> get isLoading => _isLoading.stream;

  @override
  Future<void> login() async {
    await this.auth();
    if (this._isAuthentic.value) {
      this._isLoading.value = true;
      await Future.delayed(Duration(seconds: 2));
      this._isLoading.value = false;
    } else {
      this._isLoading.value = false;
      NullThrownError();
    }
  }

  @override
  Stream<bool> get isAuthentic => _isAuthentic.stream;

  @override
  Stream<UserDataEntity> get user => _user.stream;

  @override
  void onEmailText(String email) {
    UserDataEntity userData = new UserDataEntity();
    userData.userdata = email;
    userData.passworddata = this._user.value.passworddata;
    this._user.value = userData;
  }

  @override
  void onPassText(String pass) {
    UserDataEntity userData = new UserDataEntity();
    userData.userdata = this._user.value.userdata;
    userData.passworddata = pass;
    this._user.value = userData;
  }
}
