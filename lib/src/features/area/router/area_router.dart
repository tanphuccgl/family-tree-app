import 'package:auto_route/auto_route.dart';
import 'package:familytree/src/features/area/area_page.dart';
import 'package:familytree/src/features/area/create_area/pages/create_origin_page.dart';
import 'package:familytree/src/features/area/detail_area/pages/detail_area_page.dart';
import 'package:familytree/src/features/area/list_area/pages/list_area_page.dart';
import 'package:familytree/src/features/area/router/area_wrapper_router.dart';
import 'package:familytree/src/features/dashboard/router/dashboard_router.dart';

class AreaTabView {
  static const String list = 'list';
  static const String create = 'create';
  static const String info = 'info/:areaId';
}

class AreaCoordinator {
  static const autoRoute = AutoRoute(
    path: DashboardPageView.area,
    name: "AreaWrapperRoute",
    page: AreaWrapperPage,
    children: [
      AutoRoute(
        name: "AreaRoute",
        page: AreaPage,
        initial: true,
        children: [
          AutoRoute(
            name: "ListAreaTab",
            path: AreaTabView.list,
            page: ListAreaPage,
            initial: true,
          ),
          AutoRoute(
            name: "CreateAreaTab",
            path: AreaTabView.create,
            page: CreateAreaPage,
          ),
          RedirectRoute(path: '*', redirectTo: ''),
        ],
      ),
      AutoRoute(
        name: "DetailAreaRoute",
        path: AreaTabView.info,
        page: DetailAreaPage,
      ),
      RedirectRoute(path: '*', redirectTo: ''),
    ],
  );
}
