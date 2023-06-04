import 'package:arga_azka_fe/ui/views/kasir/widget/kasir_form.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../size_config.dart';
import 'kasir_viewmodel.dart';

class KasirView extends ViewModelBuilderWidget<KasirViewModel> {
  const KasirView({Key? key}) : super(key: key);

  @override
  KasirViewModel viewModelBuilder(BuildContext context) => KasirViewModel();

  @override
  void onViewModelReady(KasirViewModel viewModel) => viewModel.initialize();

  @override
  Widget builder(
    BuildContext context,
    KasirViewModel viewModel,
    Widget? child,
  ) {
    SizeConfig().init(context);
    return const KasirForm();
  }
}
