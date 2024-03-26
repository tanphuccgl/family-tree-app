import 'package:auto_route/auto_route.dart';
import 'package:familytree/src/features/dashboard/router/dashboard_router.dart';
import 'package:familytree/src/features/individual/create_individual/pages/create_individual_page.dart';
import 'package:familytree/src/features/individual/detail_individual/pages/detail_individual_page.dart';

import 'package:familytree/src/features/individual/individual_page.dart';
import 'package:familytree/src/features/individual/list_individual/pages/list_individual_page.dart';
import 'package:familytree/src/features/individual/router/individual_wrapper_router.dart';

class IndividualTabView {
  static const String list = 'list';
  static const String create = 'create';
  static const String info = 'info/:individualId';
}

class IndividualCoordinator {
  static const autoRoute = AutoRoute(
    path: DashboardPageView.individual,
    name: "IndividualWrapperRoute",
    page: IndividualWrapperPage,
    //todo
    initial: false,
    children: [
      AutoRoute(
          name: "IndividualRoute",
          page: IndividualPage,
          initial: true,
          children: [
            AutoRoute(
              name: "ListIndividualTab",
              path: IndividualTabView.list,
              page: ListIndividualPage,
              initial: true,
            ),
            AutoRoute(
              name: "CreateIndividualTab",
              path: IndividualTabView.create,
              page: CreateIndividualPage,
            ),
            RedirectRoute(path: '*', redirectTo: ''),
          ]),
      AutoRoute(
        name: "DetailIndividualRoute",
        path: IndividualTabView.info,
        page: DetailIndividualPage,
      ),
      RedirectRoute(path: '*', redirectTo: ''),
    ],
  );
}
