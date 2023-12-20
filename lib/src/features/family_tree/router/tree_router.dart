import 'package:auto_route/auto_route.dart';
import 'package:familytree/src/features/dashboard/router/dashboard_router.dart';
import 'package:familytree/src/features/family_tree/pages/family_tree_page.dart';
import 'package:familytree/src/features/family_tree/router/tree_wrapper_router.dart';
import 'package:familytree/src/features/individual/detail_individual/pages/detail_individual_page.dart';

class TreeName {
  static const String list = 'list';
  static const String create = 'create';
  static const String info = 'info/:individualId';
}

class TreeCoordinator {
  static const autoRoute = AutoRoute(
    path: DashboardPageView.tree,
    name: "TreeWrapperRoute",
    page: TreeWrapperPage,
    children: [
      AutoRoute(
        name: "TreeViewRoute",
        page: TreeViewPage,
        initial: true,
      ),
      AutoRoute(
        name: "DetailIndividualRoute",
        path: TreeName.info,
        page: DetailIndividualPage,
      ),
      RedirectRoute(path: '*', redirectTo: ''),
    ],
  );
}
