import 'package:bot_toast/bot_toast.dart';
import 'package:familytree/src/router/app_router.dart';
import 'package:familytree/src/router/coordinator.dart';
import 'package:familytree/src/router/route_observer.dart';
import 'package:familytree/src/router/router_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();

    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp(
          navigatorKey: XCoordinator.navigatorKey,
          initialRoute: XRouterName.dashboard,
          onGenerateRoute: XAppRoute.onGenerateRoute,
          navigatorObservers: [XRouteObserver()],
          builder: (context, child) {
            child = botToastBuilder(context, child);

            return child;
          },
          themeMode: ThemeMode.light,
          debugShowCheckedModeBanner: false,
        );
      },
      rebuildFactor: (old, data) => RebuildFactors.all(old, data),
      designSize: const Size(360, 844),
      useInheritedMediaQuery: true,
    );
  }
}
