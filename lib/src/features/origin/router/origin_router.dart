import 'package:auto_route/auto_route.dart';
import 'package:familytree/src/features/dashboard/router/dashboard_router.dart';

import 'package:familytree/src/features/origin/create_origin/pages/create_origin_page.dart';
import 'package:familytree/src/features/origin/detail_origin/pages/detail_origin_page.dart';
import 'package:familytree/src/features/origin/list_origin/pages/list_origin_page.dart';
import 'package:familytree/src/features/origin/origin_page.dart';
import 'package:familytree/src/features/origin/router/origin_wrapper_router.dart';

class OriginTabView {
  static const String list = 'list';
  static const String create = 'create';
  static const String info = 'info/:originId';
}

class OriginCoordinator {
  static const autoRoute = AutoRoute(
    path: DashboardPageView.origin,
    name: "OriginWrapperRoute",
    page: OriginWrapperPage,
    children: [
      AutoRoute(
          name: "OriginRoute",
          page: OriginPage,
          initial: true,
          children: [
            AutoRoute(
              name: "ListOriginTab",
              path: OriginTabView.list,
              page: ListOriginPage,
              initial: true,
            ),
            AutoRoute(
              name: "CreateOriginTab",
              path: OriginTabView.create,
              page: CreateOriginPage,
            ),
            RedirectRoute(path: '*', redirectTo: ''),
          ]),
      AutoRoute(
        name: "DetailOriginRoute",
        path: OriginTabView.info,
        page: DetailOriginPage,
      ),
      RedirectRoute(path: '*', redirectTo: ''),
    ],
  );
}
