import 'package:auto_route/auto_route.dart';
import 'package:familytree/src/features/area/router/area_router.dart';
import 'package:familytree/src/features/copulate/pages/wrapper_copulate_page.dart';
import 'package:familytree/src/features/dashboard/pages/dashboard_page.dart';
import 'package:familytree/src/features/dashboard/router/dashboard_wrapper_router.dart';
import 'package:familytree/src/features/family_tree/pages/family_tree_page.dart';
import 'package:familytree/src/features/individual/router/individual_router.dart';

import 'package:familytree/src/features/origin/router/origin_router.dart';
import 'package:familytree/src/router/router_name.dart';

class DashboardPageView {
  static const String tree = 'tree';
  static const String individual = 'individual';
  static const String copulate = 'copulate';
  static const String area = 'area';
  static const String origin = 'origin';
}

class DashboardCoordinator {
  static const autoRoute = AutoRoute(
    path: XRoutes.dashboard,
    name: "DashboardWrapperRoute",
    page: DashboardWrapperPage,
    initial: true,
    children: [
      AutoRoute(
          name: "DashboardRoute",
          page: DashboardPage,
          initial: true,
          children: [
            AutoRoute(
              name: "TreeViewPageView",
              path: DashboardPageView.tree,
              page: TreeViewPage,
            ),
            IndividualCoordinator.autoRoute,
            AutoRoute(
              name: "WrapperCopulatePageView",
              path: DashboardPageView.copulate,
              page: WrapperCopulatePage,
            ),
            AreaCoordinator.autoRoute,
            OriginCoordinator.autoRoute,
            RedirectRoute(path: '*', redirectTo: ''),
          ]),
      RedirectRoute(path: '*', redirectTo: ''),
    ],
  );
}
