import 'package:arga_azka_fe/ui/views/logout/logout_viewmodel.dart';
import 'package:arga_azka_fe/ui/views/logout/widgets/logout_body.dart';
import 'package:arga_azka_fe/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../size_config.dart';

class LogoutView extends ViewModelBuilderWidget<LogoutViewModel> {
  const LogoutView({super.key});

  @override
  LogoutViewModel viewModelBuilder(BuildContext context) => LogoutViewModel();

  @override
  void onViewModelReady(LogoutViewModel viewModel) => viewModel.initialise();

  @override
  Widget builder(
    BuildContext context,
    LogoutViewModel viewModel,
    Widget? child,
  ) {
    SizeConfig().init(context);
    return SafeArea(
      child: Container(
        color: Colors.grey[300],
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenHeight(22)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              _buildHeaderAkun(),
              const LogoutBody(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeaderAkun() {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(14)),
      ),
      child: Center(
        child: Text(
          'Akun Info',
          style: mTitleBlue20,
        ),
      ),
    );
  }
}
