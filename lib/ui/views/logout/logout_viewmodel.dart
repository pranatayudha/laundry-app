import 'package:arga_azka_fe/application/models/user.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../application/app/app.locator.dart';
import '../../../application/app/app.router.dart';
import '../../../application/enums/dialog_type.dart';
import '../../../application/services/local_db_service.dart';

class LogoutViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _localDBService = locator<LocalDBService>();
  final _navigationService = locator<NavigationService>();

  User? user;

  void initialise() => user = _localDBService.getUser();

  Future logout() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Konfirmasi',
      description: 'Apakah Anda yakin ingin keluar dari aplikasi ini?',
      mainButtonTitle: 'LOG OUT',
    );

    if (response!.confirmed) {
      _localDBService.removeToken();
      _localDBService.removeUser();
      _navigationService.clearStackAndShow(Routes.loginView);
    }
  }
}
