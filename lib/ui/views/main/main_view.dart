import 'package:arga_azka_fe/ui/views/kasir/kasir_view.dart';
import 'package:arga_azka_fe/ui/views/logout/logout_view.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import '../../../application/app/constants/custom_color.dart';
import '../../../application/app/constants/icon_constants.dart';
import '../invoice/invoice_view.dart';
import '../report_pendapatan/report_pendapatan_view.dart';
import 'main_viewmodel.dart';
import 'widgets/floating_navigation_item.dart';

class MainView extends ViewModelBuilderWidget<MainViewModel> {
  final int? index;
  final int? prakarsaTabsIndex;

  const MainView({
    Key? key,
    this.index = 0,
    this.prakarsaTabsIndex = 0,
  }) : super(key: key);

  @override
  MainViewModel viewModelBuilder(BuildContext context) =>
      MainViewModel(index: index ?? 0, prakarsaTabsIndex: prakarsaTabsIndex);

  @override
  void onViewModelReady(MainViewModel viewModel) => viewModel.init();

  @override
  Widget builder(
    BuildContext context,
    MainViewModel viewModel,
    Widget? child,
  ) {
    final floatingNavigation = _floatingNavigation(viewModel, context);

    return WillPopScope(
      onWillPop: () async => viewModel.logout(),
      child: GestureDetector(
        onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
        child: Scaffold(
          // resizeToAvoidBottomInset: false,
          body: Stack(
            children: [
              PageView(
                // allowImplicitScrolling: false,
                controller: viewModel.homeController,
                onPageChanged: (i) => viewModel.onPageChanged(i),
                children: [
                  const KasirView(),
                  const InvoiceView(),
                  if ((viewModel.role ?? '').toLowerCase().contains('owner'))
                    const ReportPengeluaranView(),
                  const LogoutView(),
                ],
              ),
              floatingNavigation,
            ],
          ),
        ),
      ),
    );
  }

  Positioned _floatingNavigation(
    MainViewModel vm,
    BuildContext context,
  ) {
    return Positioned(
      left: 16.w,
      right: 16.w,
      bottom: 16.h,
      height: 88.h,
      child: SafeArea(
        child: Container(
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
            color: CustomColor.secondaryBlue,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              FloatingNavigationItem(
                isSelected: vm.currentIndex == 0,
                iconPath: vm.currentIndex == 0
                    ? IconConstants.navBeranda
                    : IconConstants.navBerandaOutlined,
                label: 'Kasir',
                onTap: () => vm.setIndex(0),
              ),
              FloatingNavigationItem(
                isSelected: vm.currentIndex == 1,
                iconPath: vm.currentIndex == 1
                    ? IconConstants.navPipeline
                    : IconConstants.navPipelineOutlined,
                label: 'Invoice',
                onTap: () {
                  vm.index = 0;
                  vm.setIndex(1);
                },
              ),
              if ((vm.role ?? '').toLowerCase().contains('owner'))
                FloatingNavigationItem(
                  isSelected: vm.currentIndex == 2,
                  iconPath: vm.currentIndex == 2
                      ? IconConstants.navPrakarsa
                      : IconConstants.navPrakarsaOutlined,
                  label: 'Report',
                  onTap: () {
                    vm.index = 0;
                    vm.setIndex(2);
                  },
                ),
              FloatingNavigationItem(
                isSelected: vm.currentIndex == 3,
                iconPath: vm.currentIndex == 3
                    ? IconConstants.navAkun
                    : IconConstants.navAkunOutlined,
                label: 'Logout',
                onTap: () => vm.setIndex(3),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
