import 'package:arga_azka_fe/application/app/constants/custom_color.dart';
import 'package:arga_azka_fe/application/helpers/rupiah_formatter.dart';
import 'package:arga_azka_fe/application/models/invoice.dart';
import 'package:arga_azka_fe/ui/views/invoice/invoice_viewmodel.dart';
import 'package:arga_azka_fe/ui/views/invoice/widget/custom_search.dart';
import 'package:flutter/material.dart';
import 'package:stacked_hooks/stacked_hooks.dart';

import '../../../../size_config.dart';
import '../../../../utils/constants.dart';
import 'detail_invoice.dart';

class InvoiceForm extends HookViewModelWidget<InvoiceViewModel> {
  const InvoiceForm({super.key});

  @override
  Widget buildViewModelWidget(
      BuildContext context, InvoiceViewModel viewModel) {
    return SafeArea(
      child: Container(
        color: Colors.grey[300],
        width: double.infinity,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenHeight(22)),
          child: viewModel.isShowDetails
              ? Column(
                  children: [
                    Expanded(child: DetailInvoice()),
                  ],
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.all(16),
                      margin: const EdgeInsets.only(top: 20),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(14)),
                      ),
                      child: CustomSearchBar(
                        hintText: 'Masukan Nomor Invoice',
                        onSubmitted: (val) {
                          viewModel.getListInvoices(val);
                        },
                        controller: viewModel.searchInvoiceController,
                      ),
                    ),
                    Expanded(
                      child: viewModel.listInvoices.isEmpty
                          ? Container(
                              padding: const EdgeInsets.all(20),
                              margin:
                                  const EdgeInsets.only(top: 20, bottom: 100),
                              decoration: const BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(14)),
                              ),
                              child: Center(
                                child: Text(
                                  'Tidak ada invoice',
                                  style: mTitleStyle20,
                                ),
                              ),
                            )
                          : ListView(
                              children: [
                                _buildListInvoice(viewModel),
                              ],
                            ),
                    ),
                  ],
                ),
        ),
      ),
    );
  }

  Widget _buildListInvoice(InvoiceViewModel viewModel) {
    return Container(
      margin: const EdgeInsets.only(bottom: 200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: List.generate(
          viewModel.listInvoices.length,
          (index) =>
              _buildItemInvoice(viewModel, viewModel.listInvoices[index]),
        ),
      ),
    );
  }

  Widget _buildItemInvoice(InvoiceViewModel viewModel, Invoice data) {
    return InkWell(
      onTap: () => viewModel.onTapDetails(data.id ?? ''),
      child: Container(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data.customerName ?? '',
                        style: mTitle2.copyWith(fontSize: 16),
                      ),
                      Text(
                        rupiah(
                          data.totalPrice ?? '0',
                        ),
                        style: mItemInvoice.copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          if ((data.status ?? '').toLowerCase() == 'lunas')
                            const Icon(
                              Icons.check_outlined,
                              color: CustomColor.green,
                              size: 16,
                            )
                          else
                            const Icon(
                              Icons.info,
                              color: CustomColor.orange,
                              size: 16,
                            ),
                          const SizedBox(
                            width: 4,
                          ),
                          Text(
                            data.status ?? '',
                            style: mItemInvoice.copyWith(
                              fontSize: 16,
                              color:
                                  (data.status ?? '').toLowerCase() == 'lunas'
                                      ? CustomColor.green
                                      : CustomColor.orange,
                            ),
                          ),
                        ],
                      ),
                      Text(
                        data.date ?? '',
                        style: mItemInvoice.copyWith(fontSize: 16),
                      ),
                      Text(
                        'No. ${data.id ?? ''}',
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
      ),
    );
  }
}
