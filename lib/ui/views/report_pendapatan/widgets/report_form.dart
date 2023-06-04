import 'package:arga_azka_fe/application/models/report.dart';
import 'package:arga_azka_fe/ui/views/report_pendapatan/report_pendapatan_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../application/app/constants/custom_color.dart';
import '../../../../application/helpers/rupiah_formatter.dart';
import '../../../../size_config.dart';
import '../../../../utils/constants.dart';
import '../../../shared/my_sparator.dart';
import '../../kasir/widget/custom_input_title.dart';

class ReportForm extends HookViewModelWidget<ReportPendapatanViewModel> {
  const ReportForm({super.key});

  @override
  Widget buildViewModelWidget(
      BuildContext context, ReportPendapatanViewModel viewModel) {
    return SafeArea(
      child: Container(
        color: Colors.grey[300],
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenHeight(22)),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildHeader(),
                _buildItem2(viewModel, context),
                _buildItem3(viewModel),
                _buildItemPendapatan(
                    'Estimasi Pendapatan Total',
                    viewModel.reportModel?.data?.estimasiPendapatanTotal ?? '0',
                    true,
                    true),
                _buildItemPendapatan(
                    'Pendapatan Lunas',
                    viewModel.reportModel?.data?.pendapatanLunas ?? '0',
                    true,
                    false),
                _buildItemPendapatan(
                    'Pendapatan Belum Lunas',
                    viewModel.reportModel?.data?.pendapatanBelumLunas ?? '0',
                    false,
                    true),
                _buildListNoInvoice(viewModel.reportModel),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(14)),
      ),
      child: Center(
        child: Text(
          'Report Pendapatan',
          style: mTitleBlue20,
        ),
      ),
    );
  }

  Widget _buildItem2(
      ReportPendapatanViewModel viewModel, BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.only(top: 20),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(14)),
        ),
        child: Row(
          children: [
            Expanded(
              child: _buildDate(viewModel, context),
            ),
            Expanded(
              child: _buildCabang(viewModel, context),
            ),
          ],
        ));
  }

  Widget _buildItem3(ReportPendapatanViewModel viewModel) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(14)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            viewModel.selectedDate != null
                ? DateFormat('d MMMM yyyy', 'id_ID').format(
                    (DateTime.parse('${viewModel.selectedDate}')),
                  )
                : '-',
            style: mTitleBlue20,
          ),
          Text(
            viewModel.selectedBranch ?? '',
            style: mTitleBlue20,
          ),
        ],
      ),
    );
  }

  Widget _buildDate(ReportPendapatanViewModel viewModel, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: CustomInputTitle(
        title: 'Tanggal',
        isMandatory: true,
        inputWidget: InputDecorator(
          decoration: InputDecoration(
            labelStyle: TextStyle(
                color: viewModel.focusNode.hasFocus
                    ? mSubtitleColor
                    : kPrimaryColor),
            floatingLabelBehavior: FloatingLabelBehavior.always,
          ),
          child: InkWell(
            onTap: () => viewModel.selectDate(context),
            child: DropdownButtonHideUnderline(
              child: DropdownButton(
                isExpanded: true,
                style: mTitleStyle,
                hint: Text(viewModel.selectedDate == null
                    ? 'Pilih Tanggal'
                    : viewModel.selectedDate ?? ''),
                isDense: true,
                items: List.generate(
                  (0),
                  (index) => const DropdownMenuItem(
                    value: '',
                    child: Text(
                      '',
                    ),
                  ),
                ),
                menuMaxHeight: MediaQuery.of(context).size.height / 3,
                onTap: () => viewModel.selectDate(context),
                onChanged: (val) {},
                value: viewModel.selectedDate,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildCabang(
      ReportPendapatanViewModel viewModel, BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 10),
      child: CustomInputTitle(
        title: 'Cabang',
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
              hint: const Text('Pilih Cabang'),
              isDense: true,
              items: List.generate(
                (viewModel.branchs.length),
                (index) => DropdownMenuItem(
                  value: viewModel.branchs[index],
                  child: Text(
                    viewModel.branchs[index],
                  ),
                ),
              ),
              menuMaxHeight: MediaQuery.of(context).size.height / 3,
              onChanged: (val) => viewModel.getBranchValue(val as String),
              value: viewModel.selectedBranch,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItemPendapatan(
    String title,
    String value,
    bool isPaidOff,
    bool isNotPaidOff,
  ) {
    return Container(
      padding: const EdgeInsets.fromLTRB(16, 16, 10, 16),
      margin: const EdgeInsets.only(top: 10),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(14)),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: mTitle2.copyWith(fontSize: 16),
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        if (isPaidOff)
                          Row(
                            children: [
                              const Icon(
                                Icons.check_outlined,
                                color: CustomColor.green,
                                size: 16,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                'Lunas',
                                style: mItemInvoice.copyWith(
                                  fontSize: 16,
                                  color: CustomColor.green,
                                ),
                              ),
                            ],
                          ),
                        const SizedBox(
                          width: 10,
                        ),
                        if (isNotPaidOff)
                          Row(
                            children: [
                              const Icon(
                                Icons.info,
                                color: CustomColor.orange,
                                size: 16,
                              ),
                              const SizedBox(
                                width: 4,
                              ),
                              Text(
                                'Belum Lunas',
                                style: mItemInvoice.copyWith(
                                  fontSize: 16,
                                  color: CustomColor.orange,
                                ),
                              ),
                            ],
                          )
                      ],
                    ),
                    Text(
                      rupiah(value),
                      style: mItemInvoice.copyWith(fontSize: 16),
                    ),
                  ],
                )
              ],
            ),
          ),
          const Icon(Icons.chevron_right, size: 28),
        ],
      ),
    );
  }

  Widget _buildListNoInvoice(ReportModel? reportModel) {
    return Container(
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(top: 20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(14)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'List Invoice Belum Lunas',
            style: mTitle2.copyWith(fontSize: 16),
          ),
          const SizedBox(
            height: 14,
          ),
          const MySeparator(),
          const SizedBox(
            height: 14,
          ),
          Wrap(
            children: List.generate(
                reportModel?.data?.listPending?.length ?? 0,
                (index) => Padding(
                      padding: const EdgeInsets.all(4),
                      child: Text(
                        reportModel?.data?.listPending?[index] ?? '-',
                        style: mTitle2.copyWith(
                            fontWeight: FontWeight.normal, fontSize: 20),
                      ),
                    )),
          )
        ],
      ),
    );
  }
}
