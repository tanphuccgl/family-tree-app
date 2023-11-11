import 'package:familytree/src/features/common/pages/not_found_page.dart';
import 'package:familytree/src/features/dashboard/pages/dashboard_page.dart';
import 'package:familytree/src/router/router_name.dart';
import 'package:flutter/material.dart';

class XAppRoute {
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case XRouterName.dashboard:
        return MaterialPageRoute(builder: (_) => const DashboardPage());

      default:
        return MaterialPageRoute(
          builder: (_) => const NotFoundPage(),
        );
    }
  }
}
