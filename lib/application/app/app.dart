import 'package:arga_azka_fe/infrastructure/apis/kasir_api.dart';
import 'package:arga_azka_fe/infrastructure/apis/report_api.dart';
import 'package:arga_azka_fe/ui/views/main/main_view.dart';
import 'package:dio/dio.dart';
import 'package:places_service/places_service.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import '../../infrastructure/apis/invoice_api.dart';
import '../../infrastructure/apis/user_api.dart';
import '../../ui/views/kasir/kasir_view.dart';
import '../../ui/views/login/login_view.dart';
import '../services/connectivity_service.dart';
import '../services/dio_service.dart';
import '../services/local_db_service.dart';
import '../services/media_service.dart';
import '../services/url_launcher_service.dart';

@StackedApp(
  routes: [
    MaterialRoute(page: LoginView, initial: true),
    MaterialRoute(page: KasirView),
    MaterialRoute(page: MainView),
  ],
  dependencies: [
    LazySingleton(classType: NavigationService),
    LazySingleton(classType: DialogService),
    LazySingleton(classType: BottomSheetService),
    LazySingleton(classType: PlacesService),
    LazySingleton(classType: MediaService),
    LazySingleton(classType: URLLauncherService),
    LazySingleton(classType: ConnectivityService),
    Singleton(classType: LocalDBService),
    Singleton(
      classType: DioService,
      resolveUsing: DioService.getInstance,
      asType: Dio,
    ),
    LazySingleton(classType: UserAPI),
    LazySingleton(classType: KasirAPI),
    LazySingleton(classType: InvoiceAPI),
    LazySingleton(classType: ReportAPI),
  ],
)
class AppSetup {
  /** Serves no purpose besides having an annotation attached to it **/
}
