// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedRouterGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:arga_azka_fe/ui/views/kasir/kasir_view.dart' as _i3;
import 'package:arga_azka_fe/ui/views/login/login_view.dart' as _i2;
import 'package:arga_azka_fe/ui/views/main/main_view.dart' as _i4;
import 'package:flutter/material.dart' as _i5;
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart' as _i1;
import 'package:stacked_services/stacked_services.dart' as _i6;

class Routes {
  static const loginView = '/';

  static const kasirView = '/kasir-view';

  static const mainView = '/main-view';

  static const all = <String>{
    loginView,
    kasirView,
    mainView,
  };
}

class StackedRouter extends _i1.RouterBase {
  final _routes = <_i1.RouteDef>[
    _i1.RouteDef(
      Routes.loginView,
      page: _i2.LoginView,
    ),
    _i1.RouteDef(
      Routes.kasirView,
      page: _i3.KasirView,
    ),
    _i1.RouteDef(
      Routes.mainView,
      page: _i4.MainView,
    ),
  ];

  final _pagesMap = <Type, _i1.StackedRouteFactory>{
    _i2.LoginView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i2.LoginView(),
        settings: data,
      );
    },
    _i3.KasirView: (data) {
      return MaterialPageRoute<dynamic>(
        builder: (context) => const _i3.KasirView(),
        settings: data,
      );
    },
    _i4.MainView: (data) {
      final args = data.getArgs<MainViewArguments>(
        orElse: () => const MainViewArguments(),
      );
      return MaterialPageRoute<dynamic>(
        builder: (context) => _i4.MainView(
            key: args.key,
            index: args.index,
            prakarsaTabsIndex: args.prakarsaTabsIndex),
        settings: data,
      );
    },
  };

  @override
  List<_i1.RouteDef> get routes => _routes;
  @override
  Map<Type, _i1.StackedRouteFactory> get pagesMap => _pagesMap;
}

class MainViewArguments {
  const MainViewArguments({
    this.key,
    this.index = 0,
    this.prakarsaTabsIndex = 0,
  });

  final _i5.Key? key;

  final int? index;

  final int? prakarsaTabsIndex;
}

extension NavigatorStateExtension on _i6.NavigationService {
  Future<dynamic> navigateToLoginView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.loginView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToKasirView([
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  ]) async {
    return navigateTo<dynamic>(Routes.kasirView,
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }

  Future<dynamic> navigateToMainView({
    _i5.Key? key,
    int? index = 0,
    int? prakarsaTabsIndex = 0,
    int? routerId,
    bool preventDuplicates = true,
    Map<String, String>? parameters,
    Widget Function(BuildContext, Animation<double>, Animation<double>, Widget)?
        transition,
  }) async {
    return navigateTo<dynamic>(Routes.mainView,
        arguments: MainViewArguments(
            key: key, index: index, prakarsaTabsIndex: prakarsaTabsIndex),
        id: routerId,
        preventDuplicates: preventDuplicates,
        parameters: parameters,
        transition: transition);
  }
}
