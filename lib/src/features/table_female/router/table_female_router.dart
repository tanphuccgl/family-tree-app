import 'package:auto_route/auto_route.dart';
import 'package:familytree/src/features/dashboard/router/dashboard_router.dart';

import 'package:familytree/src/features/table_female/female_individuals/pages/female_individuals_page.dart';
import 'package:familytree/src/features/table_female/router/table_female_wrapper_router.dart';

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
          children: [
            RedirectRoute(path: '*', redirectTo: ''),
          ]),
      RedirectRoute(path: '*', redirectTo: ''),
    ],
  );
}
