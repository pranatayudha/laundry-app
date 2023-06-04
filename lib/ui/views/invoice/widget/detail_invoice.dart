import 'package:arga_azka_fe/application/helpers/rupiah_formatter.dart';
import 'package:arga_azka_fe/ui/views/invoice/invoice_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:simple_shadow/simple_shadow.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../application/app/constants/custom_color.dart';
import '../../../../print.dart';
import '../../../../utils/constants.dart';
import '../../../shared/my_sparator.dart';
import 'row_info.dart';

class DetailInvoice extends HookViewModelWidget<InvoiceViewModel> {
  final _globalKey = GlobalKey();

  DetailInvoice({super.key});

  @override
  Widget buildViewModelWidget(
      BuildContext context, InvoiceViewModel viewModel) {
    final ScrollController scrollController = ScrollController();

    var data = viewModel.detailInvoice?.data;
    return ListView(
      controller: scrollController,
      children: [
        if (viewModel.isLoadingDetailInvoice)
          Container(
            height: 300,
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(top: 20),
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(14)),
            ),
            child: const Center(child: CircularProgressIndicator()),
          )
        else
          Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(
                  top: 20,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                        onTap: viewModel.onBackDetails,
                        child: const Icon(Icons.arrow_back_ios_new)),
                    const SizedBox(
                      width: 12,
                    ),
                    Expanded(
                      child: Center(
                        child: Text(
                          'Detail Invoice',
                          style: mTitleBlue20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              RepaintBoundary(
                key: _globalKey,
                child: Container(
                  padding: const EdgeInsets.all(16),
                  margin: const EdgeInsets.only(top: 10),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(14)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Center(
                        child: SimpleShadow(
                          opacity: 0,
                          child: Image.asset(
                            'assets/images/arga_azka.png',
                            height: 100,
                            width: 100,
                          ),
                        ),
                      ),
                      RowInfo(
                        title: 'Cabang',
                        value: data?.branchKasir ?? '',
                        textAlign: TextAlign.left,
                      ),
                      RowInfo(
                        title: 'Kasir',
                        value: data?.kasir ?? '',
                        textAlign: TextAlign.left,
                      ),
                      const MySeparator(),
                      Container(
                        margin: const EdgeInsets.only(bottom: 5, top: 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                data?.customerName ?? '',
                                style: mTitleStyle16,
                                maxLines: 2,
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  if (data?.createdAt != null)
                                    Text(
                                      DateFormat(
                                              'dd/MM/yyyy - HH:MM:ss', 'id_ID')
                                          .format(
                                        (DateTime.parse('${data?.createdAt}')),
                                      ),
                                      style: mTitleStyle16,
                                    ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Text(
                                    'No. ${data?.id}',
                                    style: mTitleStyle16,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const MySeparator(),
                      Container(
                        margin: const EdgeInsets.only(bottom: 5, top: 5),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              data?.packageName ?? '',
                              style: mTitleStyle16,
                            ),
                            const SizedBox(
                              height: 4,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  '${data?.weight ?? 0} Kg x ${rupiah(data?.price ?? 0)}',
                                  style: mTitleStyle16,
                                ),
                                Text(
                                  rupiah(data?.totalPrice ?? 0),
                                  style: mTitleStyle16,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const MySeparator(),
                      const SizedBox(
                        height: 5,
                      ),
                      RowInfo(
                        title: 'Total',
                        value: rupiah(data?.totalPrice ?? 0),
                        textAlign: TextAlign.right,
                      ),
                      RowInfo(
                        title: 'Kurang Bayar',
                        value: rupiah(data?.pendingPaid ?? 0),
                        textAlign: TextAlign.right,
                      ),
                      RowInfo(
                        title: 'Bayar',
                        value: rupiah(data?.paidOff ?? 0),
                        textAlign: TextAlign.right,
                      ),
                      RowInfo(
                        title: 'Kembali',
                        value: rupiah((data?.returnPaid ?? 0)),
                        textAlign: TextAlign.right,
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Center(
                        child: Text(
                          (data?.status ?? '').toUpperCase(),
                          style: mTitleStyle20.copyWith(
                            fontSize: 28,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(16),
                margin: EdgeInsets.only(top: 10, bottom: 100.h),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(14)),
                ),
                child: Column(
                  children: [
                    if ((data?.status ?? '').toLowerCase().contains('belum'))
                      TextField(
                        controller: viewModel.paidOfResult,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(4.r),
                            borderSide:
                                const BorderSide(color: Color(0xff99A0AF)),
                          ),
                          hintStyle:
                              const TextStyle(color: CustomColor.darkGrey),
                          hintText: 'Masukan Nominal Pelunasan',
                          contentPadding: EdgeInsets.symmetric(
                            horizontal: 16.w,
                            vertical: 12.h,
                          ),
                        ),
                        onChanged: (val) {},
                        onSubmitted: (val) => viewModel.paidOfFormatter(val),
                        onTap: () {
                          viewModel.paidoff = '0';
                          viewModel.paidOfResult?.clear();
                          Future.delayed(const Duration(seconds: 1)).then(
                            (_) => scrollController.animateTo(
                              scrollController.position.maxScrollExtent,
                              curve: Curves.slowMiddle,
                              duration: const Duration(milliseconds: 50),
                            ),
                          );
                        },
                        textInputAction: TextInputAction.done,
                        keyboardType: TextInputType.number,
                      ),
                    Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          Print(data: data!)));
                            },
                            child: Container(
                              padding: const EdgeInsets.all(16),
                              margin: const EdgeInsets.only(
                                  top: 20, bottom: 10, right: 10),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(8)),
                                border: Border.all(
                                    color: CustomColor.secondaryBlue),
                              ),
                              child: Center(
                                child: Text(
                                  'Cetak',
                                  style: mTitle.copyWith(
                                    fontSize: 16,
                                    color: CustomColor.secondaryBlue,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        if ((data?.status ?? '')
                            .toLowerCase()
                            .contains('belum'))
                          Expanded(
                            child: InkWell(
                              onTap: () =>
                                  viewModel.updateInvoices(data?.id ?? ''),
                              child: Container(
                                padding: const EdgeInsets.all(16),
                                margin: const EdgeInsets.only(
                                    top: 20, bottom: 10, left: 10),
                                decoration: BoxDecoration(
                                  color: CustomColor.secondaryBlue,
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(8)),
                                  border: Border.all(
                                      color: CustomColor.secondaryBlue),
                                ),
                                child: Center(
                                  child: Text(
                                    'Bayar',
                                    style: mTitle.copyWith(fontSize: 16),
                                  ),
                                ),
                              ),
                            ),
                          ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
      ],
    );
  }
}
