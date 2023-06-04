import 'package:flutter/cupertino.dart';
import 'package:flutter/scheduler.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../application/app/app.locator.dart';
import '../../../application/enums/dialog_type.dart';
import '../../../application/services/local_db_service.dart';

class MainViewModel extends IndexTrackingViewModel {
  int index;
  final int? prakarsaTabsIndex;

  final _localDBService = locator<LocalDBService>();
  final _dialogService = locator<DialogService>();

  final PageController homeController = PageController();

  MainViewModel({this.index = 0, this.prakarsaTabsIndex});

  String? role;

  void init() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
      homeController.jumpToPage(index);
      super.setIndex(index);
      role = _localDBService.getUser()?.role ?? '';
    });
  }

  @override
  void dispose() {
    homeController.dispose();
    super.dispose();
  }

  @override
  void setIndex(int value) {
    homeController.animateToPage(
      value,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastOutSlowIn,
    );
  }

  void onPageChanged(int value) {
    super.setIndex(value);
  }

  Future<bool> logout() async {
    final response = await _dialogService.showCustomDialog(
      variant: DialogType.base,
      title: 'Konfirmasi',
      description: 'Apakah Anda yakin ingin keluar dari aplikasi ini?',
      mainButtonTitle: 'LOG OUT',
    );

    if (response!.confirmed) {
      _localDBService.removeToken();
      _localDBService.removeUser();
      // _navigationService.clearStackAndShow(Routes.loginView);
      return true;
    }
    return false;
  }
}
