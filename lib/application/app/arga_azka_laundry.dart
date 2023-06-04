import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:stacked_services/stacked_services.dart';

import '../enums/connectivity_status.dart';
import '../services/connectivity_service.dart';
import 'app.router.dart';
import 'constants/custom_color.dart';
import 'theme/palette.dart';

class ArgaAzkaLaundry extends StatelessWidget {
  const ArgaAzkaLaundry({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      builder: (context, child) => StreamProvider<ConnectivityStatus>(
        initialData: ConnectivityStatus.cellular,
        create: (context) =>
            ConnectivityService().connectionStatusController.stream,
        child: MaterialApp(
          title: 'Arga Azka Laundry',
          theme: ThemeData(
            primarySwatch: Palette.primaryBlue,
            primaryColor: CustomColor.primaryColor,
            visualDensity: VisualDensity.adaptivePlatformDensity,
            fontFamily: 'Nunito',
          ),
          debugShowCheckedModeBanner: false,
          navigatorKey: StackedService.navigatorKey,
          onGenerateRoute: StackedRouter().onGenerateRoute,
          navigatorObservers: [
            StackedService.routeObserver,
          ],
        ),
      ),
    );
  }
}
