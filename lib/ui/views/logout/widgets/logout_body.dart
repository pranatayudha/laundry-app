import 'package:arga_azka_fe/ui/views/logout/logout_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../application/app/constants/custom_color.dart';
import '../../../../size_config.dart';
import '../../../../utils/constants.dart';

class LogoutBody extends HookViewModelWidget<LogoutViewModel> {
  const LogoutBody({super.key});

  @override
  Widget buildViewModelWidget(BuildContext context, LogoutViewModel viewModel) {
    return Container(
      padding: const EdgeInsets.all(20),
      margin: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(14)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          SimpleShadow(
            opacity: 0,
            child: Image.asset(
              'assets/images/arga_azka.png',
              height: 200,
              width: 200,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            viewModel.user?.name ?? '-',
            style: mTitleBlue20.copyWith(fontSize: 25),
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            viewModel.user?.role ?? '-',
            style: mTitleStyle20,
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () => viewModel.logout(),
            child: Container(
              width: getProportionateScreenWidth(200),
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(top: 20, bottom: 10, left: 10),
              decoration: BoxDecoration(
                color: CustomColor.primaryRed,
                borderRadius: const BorderRadius.all(Radius.circular(8)),
                border: Border.all(color: CustomColor.primaryRed),
              ),
              child: Center(
                child: Text(
                  'Logout',
                  style: mTitle.copyWith(fontSize: 16),
                ),
              ),
            ),
          ),
          SizedBox(
            height: getProportionateScreenHeight(30),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }
}
