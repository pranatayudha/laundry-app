import 'package:flutter/material.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:stacked/stacked.dart';

import '../../../size_config.dart';
import '../../../utils/constants.dart';
import 'login_viewmodel.dart';
import 'widgets/sign_form.dart';

class LoginView extends ViewModelBuilderWidget<LoginViewModel> {
  const LoginView({Key? key}) : super(key: key);

  @override
  LoginViewModel viewModelBuilder(BuildContext context) => LoginViewModel();

  @override
  void onViewModelReady(LoginViewModel viewModel) => viewModel.initialize();

  @override
  Widget builder(
    BuildContext context,
    LoginViewModel viewModel,
    Widget? child,
  ) {
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        // menghilangkan button back di atas
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: getProportionateScreenHeight(20)),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  // handle size kalau hpnya kekecilan
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.01,
                  ),
                  SizedBox(
                    height: SizeConfig.screenHeight * 0.01,
                  ),
                  SimpleShadow(
                    opacity: 0,
                    child: Image.asset(
                      'assets/images/arga_azka.png',
                      height: 200,
                      width: 200,
                    ),
                    // color: kSecondaryColor,
                    // offset: Offset(5, 5),
                    // sigma: 0,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 1),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Login !", style: mTitleStyle),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  const SigninForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
