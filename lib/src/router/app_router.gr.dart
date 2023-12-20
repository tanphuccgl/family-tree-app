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
import 'package:auto_route/auto_route.dart' as _i12;
import 'package:flutter/cupertino.dart' as _i14;
import 'package:flutter/material.dart' as _i13;

import '../features/area/wrapper_area_page.dart' as _i6;
import '../features/copulate/pages/wrapper_copulate_page.dart' as _i5;
import '../features/dashboard/pages/dashboard_page.dart' as _i2;
import '../features/dashboard/router/dashboard_wrapper_router.dart' as _i1;
import '../features/family_tree/pages/family_tree_page.dart' as _i3;
import '../features/individual/list_individual/create_individual/pages/create_individual_page.dart'
    as _i10;
import '../features/individual/list_individual/detail_individual/pages/detail_individual_page.dart'
    as _i11;
import '../features/individual/list_individual/list_individual/pages/list_individual_page.dart'
    as _i9;
import '../features/individual/list_individual/individual_page.dart'
    as _i8;
import '../features/individual/router/individual_wrapper_router.dart' as _i4;
import '../features/origin/wrapper_origin_page.dart' as _i7;

class XRouter extends _i12.RootStackRouter {
  XRouter([_i13.GlobalKey<_i13.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i12.PageFactory> pagesMap = {
    DashboardWrapperRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.DashboardWrapperPage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.DashboardPage(),
      );
    },
    TreeViewPageView.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.TreeViewPage(),
      );
    },
    IndividualWrapperRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.IndividualWrapperPage(),
      );
    },
    WrapperCopulatePageView.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.WrapperCopulatePage(),
      );
    },
    WrapperAreaPageView.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.WrapperAreaPage(),
      );
    },
    WrapperOriginPageView.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.WrapperOriginPage(),
      );
    },
    IndividualRoute.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.IndividualPage(),
      );
    },
    ListIndividualTab.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.ListIndividualPage(),
      );
    },
    CreateIndividualTab.name: (routeData) {
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.CreateIndividualPage(),
      );
    },
    DetailIndividualTab.name: (routeData) {
      final args = routeData.argsAs<DetailIndividualTabArgs>();
      return _i12.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i11.DetailIndividualPage(
          key: args.key,
          individualId: args.individualId,
        ),
      );
    },
  };

  @override
  List<_i12.RouteConfig> get routes => [
        _i12.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/dashboard',
          fullMatch: true,
        ),
        _i12.RouteConfig(
          DashboardWrapperRoute.name,
          path: '/dashboard',
          children: [
            _i12.RouteConfig(
              DashboardRoute.name,
              path: '',
              parent: DashboardWrapperRoute.name,
              children: [
                _i12.RouteConfig(
                  '#redirect',
                  path: '',
                  parent: DashboardRoute.name,
                  redirectTo: 'individual',
                  fullMatch: true,
                ),
                _i12.RouteConfig(
                  TreeViewPageView.name,
                  path: 'tree',
                  parent: DashboardRoute.name,
                ),
                _i12.RouteConfig(
                  IndividualWrapperRoute.name,
                  path: 'individual',
                  parent: DashboardRoute.name,
                  children: [
                    _i12.RouteConfig(
                      IndividualRoute.name,
                      path: '',
                      parent: IndividualWrapperRoute.name,
                      children: [
                        _i12.RouteConfig(
                          '#redirect',
                          path: '',
                          parent: IndividualRoute.name,
                          redirectTo: 'list',
                          fullMatch: true,
                        ),
                        _i12.RouteConfig(
                          ListIndividualTab.name,
                          path: 'list',
                          parent: IndividualRoute.name,
                        ),
                        _i12.RouteConfig(
                          CreateIndividualTab.name,
                          path: 'create',
                          parent: IndividualRoute.name,
                        ),
                        _i12.RouteConfig(
                          DetailIndividualTab.name,
                          path: 'info',
                          parent: IndividualRoute.name,
                        ),
                        _i12.RouteConfig(
                          '*#redirect',
                          path: '*',
                          parent: IndividualRoute.name,
                          redirectTo: '',
                          fullMatch: true,
                        ),
                      ],
                    ),
                    _i12.RouteConfig(
                      '*#redirect',
                      path: '*',
                      parent: IndividualWrapperRoute.name,
                      redirectTo: '',
                      fullMatch: true,
                    ),
                  ],
                ),
                _i12.RouteConfig(
                  WrapperCopulatePageView.name,
                  path: 'copulate',
                  parent: DashboardRoute.name,
                ),
                _i12.RouteConfig(
                  WrapperAreaPageView.name,
                  path: 'area',
                  parent: DashboardRoute.name,
                ),
                _i12.RouteConfig(
                  WrapperOriginPageView.name,
                  path: 'origin',
                  parent: DashboardRoute.name,
                ),
                _i12.RouteConfig(
                  '*#redirect',
                  path: '*',
                  parent: DashboardRoute.name,
                  redirectTo: '',
                  fullMatch: true,
                ),
              ],
            ),
            _i12.RouteConfig(
              '*#redirect',
              path: '*',
              parent: DashboardWrapperRoute.name,
              redirectTo: '',
              fullMatch: true,
            ),
          ],
        ),
        _i12.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.DashboardWrapperPage]
class DashboardWrapperRoute extends _i12.PageRouteInfo<void> {
  const DashboardWrapperRoute({List<_i12.PageRouteInfo>? children})
      : super(
          DashboardWrapperRoute.name,
          path: '/dashboard',
          initialChildren: children,
        );

  static const String name = 'DashboardWrapperRoute';
}

/// generated route for
/// [_i2.DashboardPage]
class DashboardRoute extends _i12.PageRouteInfo<void> {
  const DashboardRoute({List<_i12.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          path: '',
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i3.TreeViewPage]
class TreeViewPageView extends _i12.PageRouteInfo<void> {
  const TreeViewPageView()
      : super(
          TreeViewPageView.name,
          path: 'tree',
        );

  static const String name = 'TreeViewPageView';
}

/// generated route for
/// [_i4.IndividualWrapperPage]
class IndividualWrapperRoute extends _i12.PageRouteInfo<void> {
  const IndividualWrapperRoute({List<_i12.PageRouteInfo>? children})
      : super(
          IndividualWrapperRoute.name,
          path: 'individual',
          initialChildren: children,
        );

  static const String name = 'IndividualWrapperRoute';
}

/// generated route for
/// [_i5.WrapperCopulatePage]
class WrapperCopulatePageView extends _i12.PageRouteInfo<void> {
  const WrapperCopulatePageView()
      : super(
          WrapperCopulatePageView.name,
          path: 'copulate',
        );

  static const String name = 'WrapperCopulatePageView';
}

/// generated route for
/// [_i6.WrapperAreaPage]
class WrapperAreaPageView extends _i12.PageRouteInfo<void> {
  const WrapperAreaPageView()
      : super(
          WrapperAreaPageView.name,
          path: 'area',
        );

  static const String name = 'WrapperAreaPageView';
}

/// generated route for
/// [_i7.WrapperOriginPage]
class WrapperOriginPageView extends _i12.PageRouteInfo<void> {
  const WrapperOriginPageView()
      : super(
          WrapperOriginPageView.name,
          path: 'origin',
        );

  static const String name = 'WrapperOriginPageView';
}

/// generated route for
/// [_i8.IndividualPage]
class IndividualRoute extends _i12.PageRouteInfo<void> {
  const IndividualRoute({List<_i12.PageRouteInfo>? children})
      : super(
          IndividualRoute.name,
          path: '',
          initialChildren: children,
        );

  static const String name = 'IndividualRoute';
}

/// generated route for
/// [_i9.ListIndividualPage]
class ListIndividualTab extends _i12.PageRouteInfo<void> {
  const ListIndividualTab()
      : super(
          ListIndividualTab.name,
          path: 'list',
        );

  static const String name = 'ListIndividualTab';
}

/// generated route for
/// [_i10.CreateIndividualPage]
class CreateIndividualTab extends _i12.PageRouteInfo<void> {
  const CreateIndividualTab()
      : super(
          CreateIndividualTab.name,
          path: 'create',
        );

  static const String name = 'CreateIndividualTab';
}

/// generated route for
/// [_i11.DetailIndividualPage]
class DetailIndividualTab extends _i12.PageRouteInfo<DetailIndividualTabArgs> {
  DetailIndividualTab({
    _i14.Key? key,
    required String individualId,
  }) : super(
          DetailIndividualTab.name,
          path: 'info',
          args: DetailIndividualTabArgs(
            key: key,
            individualId: individualId,
          ),
        );

  static const String name = 'DetailIndividualTab';
}

class DetailIndividualTabArgs {
  const DetailIndividualTabArgs({
    this.key,
    required this.individualId,
  });

  final _i14.Key? key;

  final String individualId;

  @override
  String toString() {
    return 'DetailIndividualTabArgs{key: $key, individualId: $individualId}';
  }
}
