import 'package:auto_route/auto_route.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:familytree/src/router/app_router.gr.dart';
import 'package:familytree/src/router/route_observer.dart';
import 'package:familytree/src/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:responsive_framework/responsive_framework.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final botToastBuilder = BotToastInit();
    final appRouter = GetIt.I<XRouter>();

    return ScreenUtilInit(
      builder: (context, child) {
        return MaterialApp.router(
          routeInformationParser:
              appRouter.defaultRouteParser(includePrefixMatches: true),
          routerDelegate: AutoRouterDelegate(
            appRouter,
            navigatorObservers: () => [XRouteObserver()],
          ),
          builder: (context, child) {
            child = botToastBuilder(context, child);
            child = ResponsiveBreakpoints.builder(
              child: child,
              breakpoints: [
                const Breakpoint(start: 0, end: 450, name: MOBILE),
                const Breakpoint(start: 451, end: 800, name: TABLET),
                const Breakpoint(start: 801, end: 1920, name: DESKTOP),
                const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
              ],
            );
            return child;
          },
          theme: ThemeData(
              canvasColor: XColors.primary2,
              unselectedWidgetColor: XColors.primary5,
              checkboxTheme: CheckboxThemeData(
                checkColor: MaterialStateProperty.all(XColors.primary6),
                fillColor: MaterialStateProperty.all(XColors.primary7),
              )),
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
