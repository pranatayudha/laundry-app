import 'package:arga_azka_fe/application/models/report.dart';
import 'package:arga_azka_fe/infrastructure/apis/report_api.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';

import '../../../application/app/app.locator.dart';

class ReportPendapatanViewModel extends BaseViewModel {
  final _reportAPI = locator<ReportAPI>();

  FocusNode focusNode = FocusNode();
  var formatter = NumberFormat("#,###", "id_ID");

  bool isLoadingReport = false;
  String? selectedDate;
  String? selectedBranch;
  ReportModel? reportModel;

  List<String> branchs = [
    'Kali Anyar',
    'Sawah Besar',
    'Jembatan Besi',
    'All',
  ];

  void getBranchValue(String value) async {
    if (value.isNotEmpty) {
      selectedBranch = value.trim();
      notifyListeners();
      await getReport();
    }
  }

  Future getReport() async {
    isLoadingReport = true;
    final response = await runBusyFuture(
      _reportAPI.getReport(selectedDate, (selectedBranch ?? '').toLowerCase()),
    );

    response.fold(
      (l) => isLoadingReport = false,
      (r) {
        reportModel = r;
        isLoadingReport = false;
        notifyListeners();
      },
    );
  }

  Future selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      // Refer step 1
      firstDate: DateTime(1900),
      lastDate: DateTime.now().add(const Duration(days: 1000)),
      builder: (context, child) {
        return Theme(
          data: ThemeData.light(),
          child: child!,
        );
      },
    );
    if (picked != null) {
      selectedDate = DateFormat('yyyy-MM-dd').format(picked);
    }
    notifyListeners();
  }
}
