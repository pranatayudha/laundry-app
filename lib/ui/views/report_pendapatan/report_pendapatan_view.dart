import 'package:arga_azka_fe/ui/views/report_pendapatan/report_pendapatan_viewmodel.dart';
import 'package:arga_azka_fe/ui/views/report_pendapatan/widgets/report_form.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import '../../../size_config.dart';

class ReportPengeluaranView
    extends ViewModelBuilderWidget<ReportPendapatanViewModel> {
  const ReportPengeluaranView({super.key});

  @override
  ReportPendapatanViewModel viewModelBuilder(BuildContext context) =>
      ReportPendapatanViewModel();

  @override
  Widget builder(
    BuildContext context,
    ReportPendapatanViewModel viewModel,
    Widget? child,
  ) {
    SizeConfig().init(context);
    return const ReportForm();
  }
}
