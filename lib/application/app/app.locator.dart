// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedLocatorGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, implementation_imports, depend_on_referenced_packages

import 'package:dio/src/dio.dart';
import 'package:places_service/src/places_service.dart';
import 'package:stacked_core/stacked_core.dart';
import 'package:stacked_services/src/bottom_sheet/bottom_sheet_service.dart';
import 'package:stacked_services/src/dialog/dialog_service.dart';
import 'package:stacked_services/src/navigation/navigation_service.dart';

import '../../infrastructure/apis/invoice_api.dart';
import '../../infrastructure/apis/kasir_api.dart';
import '../../infrastructure/apis/report_api.dart';
import '../../infrastructure/apis/user_api.dart';
import '../services/connectivity_service.dart';
import '../services/dio_service.dart';
import '../services/local_db_service.dart';
import '../services/media_service.dart';
import '../services/url_launcher_service.dart';

final locator = StackedLocator.instance;

Future<void> setupLocator(
    {String? environment, EnvironmentFilter? environmentFilter}) async {
// Register environments
  locator.registerEnvironment(
      environment: environment, environmentFilter: environmentFilter);

// Register dependencies
  locator.registerLazySingleton(() => NavigationService());
  locator.registerLazySingleton(() => DialogService());
  locator.registerLazySingleton(() => BottomSheetService());
  locator.registerLazySingleton(() => PlacesService());
  locator.registerLazySingleton(() => MediaService());
  locator.registerLazySingleton(() => URLLauncherService());
  locator.registerLazySingleton(() => ConnectivityService());
  locator.registerSingleton(LocalDBService());
  locator.registerSingleton<Dio>(DioService.getInstance());
  locator.registerLazySingleton(() => UserAPI());
  locator.registerLazySingleton(() => KasirAPI());
  locator.registerLazySingleton(() => InvoiceAPI());
  locator.registerLazySingleton(() => ReportAPI());
}
