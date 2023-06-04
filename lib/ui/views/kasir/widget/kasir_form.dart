import 'package:arga_azka_fe/application/helpers/input_validators.dart';
import 'package:arga_azka_fe/ui/views/kasir/widget/custom_input_title.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import '../../../../size_config.dart';
import '../../../../utils/constants.dart';
import 'package:arga_azka_fe/ui/views/kasir/kasir_viewmodel.dart';
import 'package:stacked_hooks/stacked_hooks.dart';
import '../../../shared/default_button_custom_color.dart';

class KasirForm extends HookViewModelWidget<KasirViewModel> {
  const KasirForm({Key? key}) : super(key: key);

  @override
  Widget buildViewModelWidget(
    BuildContext context,
    KasirViewModel viewModel,
  ) {
    final ScrollController scrollController = ScrollController();

    return SafeArea(
      child: Container(
        color: Colors.grey[300],
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenHeight(22)),
          child: Column(
            children: [
              Expanded(
                child: ListView(
                  controller: scrollController,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeader(viewModel),
                    Container(
                      padding: const EdgeInsets.all(16),
                      margin: EdgeInsets.only(
                        top: 20,
                        bottom: 100.h,
                      ),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                      ),
                      child: Form(
                        key: viewModel.formKey,
                        autovalidateMode: viewModel.autoValidateMode,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            buildNamaPelanggan(viewModel),
                            SizedBox(
                              height: getProportionateScreenHeight(14),
                            ),
                            buildPhone(viewModel),
                            SizedBox(
                              height: getProportionateScreenHeight(14),
                            ),
                            buildWeight(viewModel),
                            SizedBox(
                              height: getProportionateScreenHeight(14),
                            ),
                            buildPackage(viewModel, context),
                            SizedBox(
                              height: getProportionateScreenHeight(14),
                            ),
                            Row(
                              children: [
                                Expanded(child: buildPrice(viewModel)),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(child: buildTotalPrice(viewModel)),
                                const SizedBox(
                                  width: 1,
                                ),
                              ],
                            ),
                            // buildTotalPrice(),
                            SizedBox(
                              height: getProportionateScreenHeight(14),
                            ),
                            buildPaidOff(viewModel, scrollController),
                            SizedBox(
                              height: getProportionateScreenHeight(30),
                            ),
                            DefaultButtonCustomeColor(
                              color: Colors.white,
                              text: 'Simpan',
                              press: () => viewModel.createInvoice(),
                            ),
                            const SizedBox(
                              height: 25,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildNamaPelanggan(KasirViewModel viewModel) {
    return CustomInputTitle(
      title: 'Nama Pelanggan',
      isMandatory: true,
      inputWidget: TextFormField(
        controller: viewModel.customerResult,
        keyboardType: TextInputType.text,
        style: mTitleStyle,
        validator: (value) =>
            InputValidators.validateName(value, fieldType: 'Nama Pelanggan'),
        decoration: InputDecoration(
          hintText: 'Masukan Pelanggan',
          labelStyle: TextStyle(
              color: viewModel.focusNode.hasFocus
                  ? mSubtitleColor
                  : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        onSaved: (val) => viewModel.customerName(val!),
      ),
    );
  }

  Widget buildPhone(KasirViewModel viewModel) {
    return CustomInputTitle(
      title: 'No. Handphone',
      isMandatory: true,
      inputWidget: TextFormField(
        controller: viewModel.phoneResult,
        keyboardType: TextInputType.number,
        style: mTitleStyle,
        maxLength: 13,
        validator: (value) => InputValidators.validateMobileNumber(value),
        decoration: InputDecoration(
          hintText: 'Masukan No. Handphone',
          labelStyle: TextStyle(
              color: viewModel.focusNode.hasFocus
                  ? mSubtitleColor
                  : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
          counterText: '',
        ),
        onSaved: (val) => viewModel.phoneNumber(val!),
      ),
    );
  }

  Widget buildPackage(KasirViewModel viewModel, BuildContext context) {
    return CustomInputTitle(
      title: 'Paket Cuci',
      isMandatory: true,
      inputWidget: InputDecorator(
        decoration: InputDecoration(
          labelStyle: TextStyle(
              color: viewModel.focusNode.hasFocus
                  ? mSubtitleColor
                  : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        child: DropdownButtonHideUnderline(
          child: DropdownButton(
            isExpanded: true,
            style: mTitleStyle,
            hint: const Text('Pilih Paket Cuci'),
            isDense: true,
            items: List.generate(
              (viewModel.packagesList?.length ?? 0),
              (index) => DropdownMenuItem(
                value: viewModel.packagesList?[index].packageName,
                child: Text(
                  '${viewModel.packagesList?[index].desc} - ${viewModel.packagesList?[index].price?.replaceAll('.00', '')}',
                ),
              ),
            ),
            menuMaxHeight: MediaQuery.of(context).size.height / 3,
            onChanged: (val) => {viewModel.packageName(val as String)},
            value: viewModel.packagename,
          ),
        ),
      ),
    );
  }

  Widget buildWeight(KasirViewModel viewModel) {
    return CustomInputTitle(
      title: 'Berat',
      isMandatory: true,
      inputWidget: TextFormField(
        controller: viewModel.weightResult,
        keyboardType: TextInputType.number,
        style: mTitleStyle,
        decoration: InputDecoration(
          hintText: 'Masukan Total Berat',
          labelStyle: TextStyle(
              color: viewModel.focusNode.hasFocus
                  ? mSubtitleColor
                  : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        onChanged: (value) =>
            viewModel.packageName(viewModel.packagename ?? ''),
      ),
    );
  }

  Widget buildPrice(KasirViewModel viewModel) {
    return CustomInputTitle(
      title: 'Harga',
      isMandatory: true,
      inputWidget: TextFormField(
        controller: viewModel.priceResult,
        style: mTitleStyle,
        enabled: false,
        decoration: InputDecoration(
          hintText: '0',
          labelStyle: TextStyle(
              color: viewModel.focusNode.hasFocus
                  ? mSubtitleColor
                  : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        onSaved: (val) => viewModel.priceValue(val!),
      ),
    );
  }

  Widget buildTotalPrice(KasirViewModel viewModel) {
    return CustomInputTitle(
      title: 'Total Harga',
      isMandatory: true,
      inputWidget: TextFormField(
        controller: viewModel.totalPriceResult,
        style: mTitleStyle,
        enabled: false,
        decoration: InputDecoration(
          hintText: '0',
          labelStyle: TextStyle(
              color: viewModel.focusNode.hasFocus
                  ? mSubtitleColor
                  : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        onSaved: (val) => viewModel.totalPrice(val!),
      ),
    );
  }

  Widget buildPaidOff(
    KasirViewModel viewModel,
    ScrollController scrollController,
  ) {
    return CustomInputTitle(
      title: 'Pembayaran',
      inputWidget: TextFormField(
        controller: viewModel.paidOfResult,
        keyboardType: TextInputType.number,
        style: mTitleStyle,
        enabled: true,
        scrollPadding: const EdgeInsets.all(30),
        decoration: InputDecoration(
          hintText: 'Masukan Pembayaran',
          labelStyle: TextStyle(
              color: viewModel.focusNode.hasFocus
                  ? mSubtitleColor
                  : kPrimaryColor),
          floatingLabelBehavior: FloatingLabelBehavior.always,
        ),
        onSaved: (val) => viewModel.paidOf(val!),
        onEditingComplete: () {
          viewModel.paidof = '0';
          viewModel.paidOfFormatter(viewModel.paidOfResult?.text ?? '');
        },
        onTap: () {
          viewModel.paidof = '0';
          viewModel.paidOfResult?.clear();
          Future.delayed(const Duration(seconds: 1)).then(
            (_) => scrollController.animateTo(
              scrollController.position.maxScrollExtent,
              curve: Curves.slowMiddle,
              duration: const Duration(milliseconds: 50),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(KasirViewModel viewModel) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(14)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          RichText(
            text: TextSpan(
              text: 'Selamat Datang, ',
              style: mTitleStyle20,
              children: [
                TextSpan(
                  text: viewModel.user?.name?.split(' - ')[0] ?? '',
                  style: mTitleBlue20,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat('EEEE, d MMMM yyyy', 'id_ID').format(
                  (DateTime.now()),
                ),
                style: mTitle2,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
