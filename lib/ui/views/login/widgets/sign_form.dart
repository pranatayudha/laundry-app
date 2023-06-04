import 'package:arga_azka_fe/ui/views/login/login_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../size_config.dart';
import '../../../../utils/constants.dart';
import '../../../shared/custom_surfix_icon.dart';
import '../../../shared/default_button_custom_color.dart';

class SigninForm extends HookViewModelWidget<LoginViewModel> {
  const SigninForm({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    LoginViewModel viewModel,
  ) {
    return Form(
      key: viewModel.formKey,
      autovalidateMode: viewModel.autoValidateMode,
      child: Column(children: [
        buildUserName(viewModel),
        SizedBox(
          height: getProportionateScreenHeight(25),
        ),
        buildPasword(viewModel),
        SizedBox(
          height: getProportionateScreenHeight(25),
        ),
        DefaultButtonCustomeColor(
          color: kPrimaryColor,
          textColor: Colors.white,
          text: 'Masuk',
          press: viewModel.validateInputs,
        ),
        const SizedBox(
          height: 25,
        ),
        GestureDetector(
          onTap: () {},
          child: const Text(
            'Belum Punya Akun?',
            style: TextStyle(decoration: TextDecoration.underline),
          ),
        )
      ]),
    );
  }

  TextFormField buildUserName(LoginViewModel viewModel) {
    return TextFormField(
      keyboardType: TextInputType.text,
      style: mTitleStyle,
      decoration: InputDecoration(
        labelText: 'Username',
        hintText: 'Masukan Username Anda',
        labelStyle: TextStyle(
          color: viewModel.focusNode.hasFocus ? mSubtitleColor : kPrimaryColor,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const CustomSurffixIcon(svgIcon: 'assets/icons/User.svg'),
      ),
      onSaved: (username) => viewModel.saveUsername(username!),
    );
  }

  TextFormField buildPasword(LoginViewModel viewModel) {
    return TextFormField(
      obscureText: true,
      style: mTitleStyle,
      decoration: InputDecoration(
        labelText: 'Password',
        hintText: 'Masukan Password Anda',
        labelStyle: TextStyle(
          color: viewModel.focusNode.hasFocus ? mSubtitleColor : kPrimaryColor,
        ),
        floatingLabelBehavior: FloatingLabelBehavior.always,
        suffixIcon: const CustomSurffixIcon(svgIcon: 'assets/icons/Lock.svg'),
      ),
      onSaved: (password) => viewModel.savePassword(password!),
    );
  }
}
