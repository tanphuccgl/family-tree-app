import 'package:auto_route/auto_route.dart';
import 'package:familytree/src/features/area/wrapper_area_page.dart';
import 'package:familytree/src/features/copulate/pages/wrapper_copulate_page.dart';
import 'package:familytree/src/features/dashboard/pages/dashboard_page.dart';
import 'package:familytree/src/features/dashboard/router/dashboard_wrapper_router.dart';
import 'package:familytree/src/features/family_tree/pages/family_tree_page.dart';
import 'package:familytree/src/features/individual/list_individual/wrapper_individual_page.dart';
import 'package:familytree/src/features/origin/wrapper_origin_page.dart';
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
            AutoRoute(
              name: "WrapperIndividualPageView",
              path: DashboardPageView.individual,
              page: WrapperIndividualPage,
              initial: true,
            ),
            AutoRoute(
              name: "WrapperCopulatePageView",
              path: DashboardPageView.copulate,
              page: WrapperCopulatePage,
            ),
            AutoRoute(
              name: "WrapperAreaPageView",
              path: DashboardPageView.area,
              page: WrapperAreaPage,
            ),
            AutoRoute(
              name: "WrapperOriginPageView",
              path: DashboardPageView.origin,
              page: WrapperOriginPage,
            ),
            RedirectRoute(path: '*', redirectTo: ''),
          ]),
      RedirectRoute(path: '*', redirectTo: ''),
    ],
  );
}
