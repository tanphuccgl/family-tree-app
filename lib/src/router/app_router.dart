import 'package:auto_route/auto_route.dart';
import 'package:familytree/src/features/dashboard/pages/dashboard_page.dart';
import 'package:familytree/src/router/router_name.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      path: XRoutes.dashboard,
      name: "DashBoardRoute",
      page: DashboardPage,
      initial: true,
    ),

    // redirect all other paths
    RedirectRoute(path: '*', redirectTo: ''),
  ],
)
class $XRouter {}
