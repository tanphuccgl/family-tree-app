// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;

import '../features/area/wrapper_area_page.dart' as _i6;
import '../features/copulate/pages/wrapper_copulate_page.dart' as _i5;
import '../features/dashboard/pages/dashboard_page.dart' as _i2;
import '../features/dashboard/router/dashboard_wrapper_router.dart' as _i1;
import '../features/family_tree/pages/family_tree_page.dart' as _i3;
import '../features/individual/list_individual/wrapper_individual_page.dart'
    as _i4;
import '../features/origin/wrapper_origin_page.dart' as _i7;

class XRouter extends _i8.RootStackRouter {
  XRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    DashboardWrapperRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.DashboardWrapperPage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.DashboardPage(),
      );
    },
    TreeViewPageView.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.TreeViewPage(),
      );
    },
    WrapperIndividualPageView.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.WrapperIndividualPage(),
      );
    },
    WrapperCopulatePageView.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.WrapperCopulatePage(),
      );
    },
    WrapperAreaPageView.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.WrapperAreaPage(),
      );
    },
    WrapperOriginPageView.name: (routeData) {
      return _i8.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.WrapperOriginPage(),
      );
    },
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/dashboard',
          fullMatch: true,
        ),
        _i8.RouteConfig(
          DashboardWrapperRoute.name,
          path: '/dashboard',
          children: [
            _i8.RouteConfig(
              DashboardRoute.name,
              path: '',
              parent: DashboardWrapperRoute.name,
              children: [
                _i8.RouteConfig(
                  '#redirect',
                  path: '',
                  parent: DashboardRoute.name,
                  redirectTo: 'individual',
                  fullMatch: true,
                ),
                _i8.RouteConfig(
                  TreeViewPageView.name,
                  path: 'tree',
                  parent: DashboardRoute.name,
                ),
                _i8.RouteConfig(
                  WrapperIndividualPageView.name,
                  path: 'individual',
                  parent: DashboardRoute.name,
                ),
                _i8.RouteConfig(
                  WrapperCopulatePageView.name,
                  path: 'copulate',
                  parent: DashboardRoute.name,
                ),
                _i8.RouteConfig(
                  WrapperAreaPageView.name,
                  path: 'area',
                  parent: DashboardRoute.name,
                ),
                _i8.RouteConfig(
                  WrapperOriginPageView.name,
                  path: 'origin',
                  parent: DashboardRoute.name,
                ),
                _i8.RouteConfig(
                  '*#redirect',
                  path: '*',
                  parent: DashboardRoute.name,
                  redirectTo: '',
                  fullMatch: true,
                ),
              ],
            ),
            _i8.RouteConfig(
              '*#redirect',
              path: '*',
              parent: DashboardWrapperRoute.name,
              redirectTo: '',
              fullMatch: true,
            ),
          ],
        ),
        _i8.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.DashboardWrapperPage]
class DashboardWrapperRoute extends _i8.PageRouteInfo<void> {
  const DashboardWrapperRoute({List<_i8.PageRouteInfo>? children})
      : super(
          DashboardWrapperRoute.name,
          path: '/dashboard',
          initialChildren: children,
        );

  static const String name = 'DashboardWrapperRoute';
}

/// generated route for
/// [_i2.DashboardPage]
class DashboardRoute extends _i8.PageRouteInfo<void> {
  const DashboardRoute({List<_i8.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          path: '',
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i3.TreeViewPage]
class TreeViewPageView extends _i8.PageRouteInfo<void> {
  const TreeViewPageView()
      : super(
          TreeViewPageView.name,
          path: 'tree',
        );

  static const String name = 'TreeViewPageView';
}

/// generated route for
/// [_i4.WrapperIndividualPage]
class WrapperIndividualPageView extends _i8.PageRouteInfo<void> {
  const WrapperIndividualPageView()
      : super(
          WrapperIndividualPageView.name,
          path: 'individual',
        );

  static const String name = 'WrapperIndividualPageView';
}

/// generated route for
/// [_i5.WrapperCopulatePage]
class WrapperCopulatePageView extends _i8.PageRouteInfo<void> {
  const WrapperCopulatePageView()
      : super(
          WrapperCopulatePageView.name,
          path: 'copulate',
        );

  static const String name = 'WrapperCopulatePageView';
}

/// generated route for
/// [_i6.WrapperAreaPage]
class WrapperAreaPageView extends _i8.PageRouteInfo<void> {
  const WrapperAreaPageView()
      : super(
          WrapperAreaPageView.name,
          path: 'area',
        );

  static const String name = 'WrapperAreaPageView';
}

/// generated route for
/// [_i7.WrapperOriginPage]
class WrapperOriginPageView extends _i8.PageRouteInfo<void> {
  const WrapperOriginPageView()
      : super(
          WrapperOriginPageView.name,
          path: 'origin',
        );

  static const String name = 'WrapperOriginPageView';
}
