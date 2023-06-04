import 'package:arga_azka_fe/application/models/invoice.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../application/app/app.locator.dart';
// import '../../../application/services/local_db_service.dart';
import '../../../application/enums/dialog_type.dart';
import '../../../application/helpers/rupiah_formatter.dart';
import '../../../infrastructure/apis/invoice_api.dart';

class InvoiceViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _invoiceAPI = locator<InvoiceAPI>();
  // final _localDBService = locator<LocalDBService>();

  // final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  bool isShowDetails = false;
  bool isLoadingDetailInvoice = true;
  bool scsMsg = false;
  List<Invoice> listInvoices = [];
  InvoiceModel? detailInvoice;
  TextEditingController? searchInvoiceController;

  String? paidoff;
  TextEditingController? paidOfResult = TextEditingController();

  void initialize() async {
    await getListInvoices('');
  }

  void searchInvoiceById() {
    getListInvoices(searchInvoiceController?.text ?? '');
  }

  void onBackDetails() {
    getListInvoices('');
    paidOfResult?.clear();
    isShowDetails = !isShowDetails;
    notifyListeners();
  }

  void onTapDetails(String id) {
    getDetailsInvoices(id);
    isShowDetails = !isShowDetails;
    notifyListeners();
  }

  void paidOfFormatter(String value) {
    if (value.isNotEmpty) {
      paidoff = value.replaceAll(RegExp('[^0-9]'), '').trim();
      paidOfResult?.text = rupiah(paidoff);
      notifyListeners();
    }
  }

  Future getListInvoices(String id) async {
    final response = await runBusyFuture(
      _invoiceAPI.getListInvoice(id),
    );

    response.fold(
      (l) => null,
      (r) {
        listInvoices = r;
        notifyListeners();
      },
    );
  }

  Future getDetailsInvoices(String id) async {
    final response = await runBusyFuture(
      _invoiceAPI.getDetailInvoice(id),
    );

    response.fold(
      (l) => isLoadingDetailInvoice = false,
      (r) {
        detailInvoice = r;
        isLoadingDetailInvoice = false;
        notifyListeners();
      },
    );
  }

  Future updateInvoices(String id) async {
    final response = await runBusyFuture(
      _invoiceAPI.updateInvoice(id, paidoff ?? ''),
    );

    response.fold(
      (l) {
        isLoadingDetailInvoice = false;
        _showErrorDialog(l);
      },
      (r) {
        detailInvoice = r;
        isLoadingDetailInvoice = false;
        _showSuccessDialog();
        notifyListeners();
      },
    );
  }

  Future _showErrorDialog(String errorMessage) async {
    await _dialogService.showCustomDialog(
      variant: DialogType.error,
      title: 'Error Validation',
      description: errorMessage,
      mainButtonTitle: 'Silakan Perbaiki',
    );
  }

  Future _showSuccessDialog() async {
    await _dialogService.showCustomDialog(
      variant: DialogType.success,
      description: "Update Invoice Success",
      mainButtonTitle: 'Ok',
    );
    return true;
  }

  // String getReturnPaid(String price, String paid) {
  //   int tempPrice = int.parse(price);
  //   int tempPaid = int.parse(paid);
  // }
}
