import 'package:arga_azka_fe/ui/views/invoice/invoice_viewmodel.dart';
import 'package:arga_azka_fe/ui/views/invoice/widget/invoice_form.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../size_config.dart';

class InvoiceView extends ViewModelBuilderWidget<InvoiceViewModel> {
  const InvoiceView({super.key});

  @override
  InvoiceViewModel viewModelBuilder(BuildContext context) => InvoiceViewModel();

  @override
  void onViewModelReady(InvoiceViewModel viewModel) => viewModel.initialize();

  @override
  Widget builder(
    BuildContext context,
    InvoiceViewModel viewModel,
    Widget? child,
  ) {
    SizeConfig().init(context);
    return const InvoiceForm();
  }
}
