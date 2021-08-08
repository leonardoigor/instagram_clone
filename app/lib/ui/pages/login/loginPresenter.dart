import 'package:app/domain/entities/entities.dart';

abstract class LoginPresenter {
  Stream<bool> get isLoading;

  Stream<UserDataEntity> get user;

  Future<void> login();
  Future<void> auth();
  void onEmailText(String email);
  void onPassText(String pass);
}
