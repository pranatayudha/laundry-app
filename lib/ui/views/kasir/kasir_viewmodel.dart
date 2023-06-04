import 'dart:async';

import 'package:arga_azka_fe/application/models/invoice.dart';
import 'package:arga_azka_fe/application/models/packages.dart';
import 'package:arga_azka_fe/application/models/price.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../../application/app/app.locator.dart';
import '../../../application/enums/dialog_type.dart';
import '../../../application/models/user.dart';
import '../../../application/services/local_db_service.dart';
import '../../../infrastructure/apis/kasir_api.dart';
import 'package:intl/date_symbol_data_local.dart';

class KasirViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _kasirAPI = locator<KasirAPI>();
  final _localDBService = locator<LocalDBService>();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  AutovalidateMode _autoValidateMode = AutovalidateMode.onUserInteraction;

  ScrollController? scrollController;

  String? customer;
  String? phone;
  String? paidtype;
  String? packagename;
  String? weight;
  String? price;
  String? totalprice;
  String? paidof;
  bool? remember = false;
  FocusNode focusNode = FocusNode();
  List<Data>? packagesList;
  Price? priceList;
  Invoice? invoice;
  User? user;

  TextEditingController? customerResult = TextEditingController();
  TextEditingController? phoneResult = TextEditingController();
  TextEditingController? weightResult = TextEditingController();
  TextEditingController? priceResult = TextEditingController();
  TextEditingController? totalPriceResult = TextEditingController();
  TextEditingController? paidOfResult = TextEditingController();

  GlobalKey<FormState> get formKey => _formKey;

  GlobalKey<FormState> get paidKey => _formKey;

  AutovalidateMode get autoValidateMode => _autoValidateMode;

  var formatter = NumberFormat("#,###", "id_ID");

  void customerName(String value) {
    customer = value.trim();
    customerResult?.text = value;
    notifyListeners();
  }

  void phoneNumber(String value) {
    phone = value.trim();
    phoneResult?.text = value;
    notifyListeners();
  }

  void paidType(String value) {
    paidtype = value.trim();
    notifyListeners();
  }

  void packageName(String value) async {
    if (value.isNotEmpty) {
      packagename = value.trim();
      notifyListeners();
      await _generatePrice();
    }
  }

  void priceValue(String value) {
    price = value.trim();
    notifyListeners();
  }

  void totalPrice(String value) {
    totalprice = value.trim();
    notifyListeners();
  }

  void paidOf(String value) {
    paidof = value.replaceAll(RegExp('[^0-9]'), '').trim();
    notifyListeners();
  }

  void paidOfFormatter(String value) {
    if (value.isNotEmpty) {
      paidof = value.replaceAll(RegExp('[^0-9]'), '').trim();
      paidOfResult?.text = rupiah(paidof);
      notifyListeners();
    }
  }

  void initialize() async {
    initializeDateFormatting('id_ID', null);
    user = _localDBService.getUser();
    await _getPackages();
  }

  void validateInputs() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      createInvoice();
      _autoValidateMode = AutovalidateMode.disabled;
    } else {
      _autoValidateMode = AutovalidateMode.onUserInteraction;
      notifyListeners();
    }
  }

  Future<Map<String, dynamic>> _generateInvoiceMap() async {
    String tempPhoneNum = '+62${(phoneResult?.text ?? '').substring(1)}';
    paidOfFormatter(paidOfResult?.text ?? '');
    return {
      'customer_name': customerResult?.text ?? '',
      'phone_number': tempPhoneNum,
      'package_name': packagename ?? '',
      'weight': weightResult?.text ?? '',
      'price': price ?? '',
      'total_price': totalprice ?? '',
      'paid_off': paidof ?? '0',
    };
  }

  bool scsMsg = false;
  Future createInvoice() async {
    final createInvoiceMap = await _generateInvoiceMap();
    final response = await runBusyFuture(
      _kasirAPI.createInvoice(
        payload: createInvoiceMap,
      ),
    );

    response.fold(
      (errorMessage) {
        if (errorMessage.contains('62')) {
          errorMessage = 'Format No. Handphone tidak sesuai. ex: 081231234512';
        }
        _showErrorDialog(errorMessage);
        FocusManager.instance.primaryFocus?.unfocus();
      },
      (res) async {
        invoice = res.data;
        scsMsg = await _showSuccessDialog();
        if (scsMsg) {
          _clearForm();
          FocusManager.instance.primaryFocus?.unfocus();
        }
        notifyListeners();
      },
    );
  }

  Future _getPackages() async {
    final response = await runBusyFuture(
      _kasirAPI.getPackages(),
    );

    response.fold(
      (errorMessage) {},
      (res) {
        packagesList = res.data;
        notifyListeners();
      },
    );
  }

  Future _generatePrice() async {
    if (packagename != null && weightResult?.text != null) {
      final data = {
        "package_name": packagename,
        "weight": double.parse(weightResult?.text ?? '0'),
      };
      final response = await runBusyFuture(
        _kasirAPI.generatePrice(payload: data),
      );

      response.fold(
        (errorMessage) {},
        (res) {
          priceList = res.data;
          priceResult?.text = rupiah(priceList?.price ?? '');
          totalPriceResult?.text = rupiah(priceList?.totalPrice ?? '');
          priceValue(priceList?.price ?? '');
          totalPrice(priceList?.totalPrice ?? '');
          notifyListeners();
        },
      );
    }
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
      description: "Create Invoice Success",
      mainButtonTitle: 'Ok',
    );
    return true;
  }

  String rupiah(value, {String separator = '.', String trailing = ""}) {
    return 'Rp. ${formatter.format(double.parse(value.toString()))}';
  }

  void _clearForm() async {
    customerResult?.clear();
    phoneResult?.clear();
    weightResult?.clear();
    priceResult?.clear();
    totalPriceResult?.clear();
    paidOfResult?.clear();
    packagename = null;
    paidtype = null;
    packagesList?.clear();
    initialize();
    notifyListeners();
  }
}
