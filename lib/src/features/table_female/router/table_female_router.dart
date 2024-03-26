import 'package:auto_route/auto_route.dart';
import 'package:familytree/src/features/dashboard/router/dashboard_router.dart';

import 'package:familytree/src/features/table_female/female_individuals/pages/female_individuals_page.dart';
import 'package:familytree/src/features/table_female/router/table_female_wrapper_router.dart';
import 'package:familytree/src/features/table_female/table_female/page/table_female_page.dart';

class TableFemaleRouteName {
  static const String table = 'table/:individualId';
}

class TableFemaleCoordinator {
  static const autoRoute = AutoRoute(
    path: DashboardPageView.tableFemale,
    name: "TableFemaleWrapperRoute",
    page: TableFemaleWrapperPage,
    initial: true,
    children: [
      AutoRoute(
        name: "FemaleIndividualsRoute",
        page: FemaleIndividualsPage,
        initial: true,
      ),
      AutoRoute(
        path: TableFemaleRouteName.table,
        name: "TableFemaleRoute",
        page: TableFemalePage,
      ),
      RedirectRoute(path: '*', redirectTo: ''),
    ],
  );
}
