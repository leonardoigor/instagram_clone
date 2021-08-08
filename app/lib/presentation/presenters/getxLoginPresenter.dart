import 'package:app/domain/entities/userData.dart';
import 'package:app/ui/pages/pages.dart';
import 'package:get/state_manager.dart';

class GetxLoginPresenter extends LoginPresenter {
  final _isLoading = Rx<bool>();
  final _user = Rx<UserDataEntity>();

  @override
  Future<void> auth() {
    throw UnimplementedError();
  }

  @override
  Stream<bool> get isLoading => _isLoading.stream;

  @override
  Future<void> login() {
    throw UnimplementedError();
  }

  @override
  Stream<UserDataEntity> get user => _user.stream;
}
