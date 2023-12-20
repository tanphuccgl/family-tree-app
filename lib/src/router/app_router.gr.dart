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
import 'package:auto_route/auto_route.dart' as _i16;
import 'package:flutter/cupertino.dart' as _i18;
import 'package:flutter/material.dart' as _i17;

import '../features/area/wrapper_area_page.dart' as _i6;
import '../features/copulate/pages/wrapper_copulate_page.dart' as _i5;
import '../features/dashboard/pages/dashboard_page.dart' as _i2;
import '../features/dashboard/router/dashboard_wrapper_router.dart' as _i1;
import '../features/family_tree/pages/family_tree_page.dart' as _i3;
import '../features/individual/create_individual/pages/create_individual_page.dart'
    as _i11;
import '../features/individual/detail_individual/pages/detail_individual_page.dart'
    as _i9;
import '../features/individual/individual_page.dart' as _i8;
import '../features/individual/list_individual/pages/list_individual_page.dart'
    as _i10;
import '../features/individual/router/individual_wrapper_router.dart' as _i4;
import '../features/origin/create_origin/pages/create_origin_page.dart' as _i15;
import '../features/origin/detail_origin/pages/detail_origin_page.dart' as _i13;
import '../features/origin/list_origin/pages/list_origin_page.dart' as _i14;
import '../features/origin/origin_page.dart' as _i12;
import '../features/origin/router/origin_wrapper_router.dart' as _i7;

class XRouter extends _i16.RootStackRouter {
  XRouter([_i17.GlobalKey<_i17.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i16.PageFactory> pagesMap = {
    DashboardWrapperRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.DashboardWrapperPage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.DashboardPage(),
      );
    },
    TreeViewPageView.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.TreeViewPage(),
      );
    },
    IndividualWrapperRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.IndividualWrapperPage(),
      );
    },
    WrapperCopulatePageView.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.WrapperCopulatePage(),
      );
    },
    WrapperAreaPageView.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.WrapperAreaPage(),
      );
    },
    OriginWrapperRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.OriginWrapperPage(),
      );
    },
    IndividualRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.IndividualPage(),
      );
    },
    DetailIndividualRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<DetailIndividualRouteArgs>(
          orElse: () => DetailIndividualRouteArgs(
              individualId: pathParams.getString('individualId')));
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i9.DetailIndividualPage(
          key: args.key,
          individualId: args.individualId,
        ),
      );
    },
    ListIndividualTab.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i10.ListIndividualPage(),
      );
    },
    CreateIndividualTab.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.CreateIndividualPage(),
      );
    },
    OriginRoute.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.OriginPage(),
      );
    },
    DetailOriginRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<DetailOriginRouteArgs>(
          orElse: () => DetailOriginRouteArgs(
              originId: pathParams.getString('originId')));
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i13.DetailOriginPage(
          key: args.key,
          originId: args.originId,
        ),
      );
    },
    ListOriginTab.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.ListOriginPage(),
      );
    },
    CreateOriginTab.name: (routeData) {
      return _i16.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i15.CreateOriginPage(),
      );
    },
  };

  @override
  List<_i16.RouteConfig> get routes => [
        _i16.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/dashboard',
          fullMatch: true,
        ),
        _i16.RouteConfig(
          DashboardWrapperRoute.name,
          path: '/dashboard',
          children: [
            _i16.RouteConfig(
              DashboardRoute.name,
              path: '',
              parent: DashboardWrapperRoute.name,
              children: [
                _i16.RouteConfig(
                  '#redirect',
                  path: '',
                  parent: DashboardRoute.name,
                  redirectTo: 'individual',
                  fullMatch: true,
                ),
                _i16.RouteConfig(
                  TreeViewPageView.name,
                  path: 'tree',
                  parent: DashboardRoute.name,
                ),
                _i16.RouteConfig(
                  IndividualWrapperRoute.name,
                  path: 'individual',
                  parent: DashboardRoute.name,
                  children: [
                    _i16.RouteConfig(
                      IndividualRoute.name,
                      path: '',
                      parent: IndividualWrapperRoute.name,
                      children: [
                        _i16.RouteConfig(
                          '#redirect',
                          path: '',
                          parent: IndividualRoute.name,
                          redirectTo: 'list',
                          fullMatch: true,
                        ),
                        _i16.RouteConfig(
                          ListIndividualTab.name,
                          path: 'list',
                          parent: IndividualRoute.name,
                        ),
                        _i16.RouteConfig(
                          CreateIndividualTab.name,
                          path: 'create',
                          parent: IndividualRoute.name,
                        ),
                        _i16.RouteConfig(
                          '*#redirect',
                          path: '*',
                          parent: IndividualRoute.name,
                          redirectTo: '',
                          fullMatch: true,
                        ),
                      ],
                    ),
                    _i16.RouteConfig(
                      DetailIndividualRoute.name,
                      path: 'info/:individualId',
                      parent: IndividualWrapperRoute.name,
                    ),
                    _i16.RouteConfig(
                      '*#redirect',
                      path: '*',
                      parent: IndividualWrapperRoute.name,
                      redirectTo: '',
                      fullMatch: true,
                    ),
                  ],
                ),
                _i16.RouteConfig(
                  WrapperCopulatePageView.name,
                  path: 'copulate',
                  parent: DashboardRoute.name,
                ),
                _i16.RouteConfig(
                  WrapperAreaPageView.name,
                  path: 'area',
                  parent: DashboardRoute.name,
                ),
                _i16.RouteConfig(
                  OriginWrapperRoute.name,
                  path: 'origin',
                  parent: DashboardRoute.name,
                  children: [
                    _i16.RouteConfig(
                      OriginRoute.name,
                      path: '',
                      parent: OriginWrapperRoute.name,
                      children: [
                        _i16.RouteConfig(
                          '#redirect',
                          path: '',
                          parent: OriginRoute.name,
                          redirectTo: 'list',
                          fullMatch: true,
                        ),
                        _i16.RouteConfig(
                          ListOriginTab.name,
                          path: 'list',
                          parent: OriginRoute.name,
                        ),
                        _i16.RouteConfig(
                          CreateOriginTab.name,
                          path: 'create',
                          parent: OriginRoute.name,
                        ),
                        _i16.RouteConfig(
                          '*#redirect',
                          path: '*',
                          parent: OriginRoute.name,
                          redirectTo: '',
                          fullMatch: true,
                        ),
                      ],
                    ),
                    _i16.RouteConfig(
                      DetailOriginRoute.name,
                      path: 'info/:originId',
                      parent: OriginWrapperRoute.name,
                    ),
                    _i16.RouteConfig(
                      '*#redirect',
                      path: '*',
                      parent: OriginWrapperRoute.name,
                      redirectTo: '',
                      fullMatch: true,
                    ),
                  ],
                ),
                _i16.RouteConfig(
                  '*#redirect',
                  path: '*',
                  parent: DashboardRoute.name,
                  redirectTo: '',
                  fullMatch: true,
                ),
              ],
            ),
            _i16.RouteConfig(
              '*#redirect',
              path: '*',
              parent: DashboardWrapperRoute.name,
              redirectTo: '',
              fullMatch: true,
            ),
          ],
        ),
        _i16.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.DashboardWrapperPage]
class DashboardWrapperRoute extends _i16.PageRouteInfo<void> {
  const DashboardWrapperRoute({List<_i16.PageRouteInfo>? children})
      : super(
          DashboardWrapperRoute.name,
          path: '/dashboard',
          initialChildren: children,
        );

  static const String name = 'DashboardWrapperRoute';
}

/// generated route for
/// [_i2.DashboardPage]
class DashboardRoute extends _i16.PageRouteInfo<void> {
  const DashboardRoute({List<_i16.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          path: '',
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i3.TreeViewPage]
class TreeViewPageView extends _i16.PageRouteInfo<void> {
  const TreeViewPageView()
      : super(
          TreeViewPageView.name,
          path: 'tree',
        );

  static const String name = 'TreeViewPageView';
}

/// generated route for
/// [_i4.IndividualWrapperPage]
class IndividualWrapperRoute extends _i16.PageRouteInfo<void> {
  const IndividualWrapperRoute({List<_i16.PageRouteInfo>? children})
      : super(
          IndividualWrapperRoute.name,
          path: 'individual',
          initialChildren: children,
        );

  static const String name = 'IndividualWrapperRoute';
}

/// generated route for
/// [_i5.WrapperCopulatePage]
class WrapperCopulatePageView extends _i16.PageRouteInfo<void> {
  const WrapperCopulatePageView()
      : super(
          WrapperCopulatePageView.name,
          path: 'copulate',
        );

  static const String name = 'WrapperCopulatePageView';
}

/// generated route for
/// [_i6.WrapperAreaPage]
class WrapperAreaPageView extends _i16.PageRouteInfo<void> {
  const WrapperAreaPageView()
      : super(
          WrapperAreaPageView.name,
          path: 'area',
        );

  static const String name = 'WrapperAreaPageView';
}

/// generated route for
/// [_i7.OriginWrapperPage]
class OriginWrapperRoute extends _i16.PageRouteInfo<void> {
  const OriginWrapperRoute({List<_i16.PageRouteInfo>? children})
      : super(
          OriginWrapperRoute.name,
          path: 'origin',
          initialChildren: children,
        );

  static const String name = 'OriginWrapperRoute';
}

/// generated route for
/// [_i8.IndividualPage]
class IndividualRoute extends _i16.PageRouteInfo<void> {
  const IndividualRoute({List<_i16.PageRouteInfo>? children})
      : super(
          IndividualRoute.name,
          path: '',
          initialChildren: children,
        );

  static const String name = 'IndividualRoute';
}

/// generated route for
/// [_i9.DetailIndividualPage]
class DetailIndividualRoute
    extends _i16.PageRouteInfo<DetailIndividualRouteArgs> {
  DetailIndividualRoute({
    _i18.Key? key,
    required String individualId,
  }) : super(
          DetailIndividualRoute.name,
          path: 'info/:individualId',
          args: DetailIndividualRouteArgs(
            key: key,
            individualId: individualId,
          ),
          rawPathParams: {'individualId': individualId},
        );

  static const String name = 'DetailIndividualRoute';
}

class DetailIndividualRouteArgs {
  const DetailIndividualRouteArgs({
    this.key,
    required this.individualId,
  });

  final _i18.Key? key;

  final String individualId;

  @override
  String toString() {
    return 'DetailIndividualRouteArgs{key: $key, individualId: $individualId}';
  }
}

/// generated route for
/// [_i10.ListIndividualPage]
class ListIndividualTab extends _i16.PageRouteInfo<void> {
  const ListIndividualTab()
      : super(
          ListIndividualTab.name,
          path: 'list',
        );

  static const String name = 'ListIndividualTab';
}

/// generated route for
/// [_i11.CreateIndividualPage]
class CreateIndividualTab extends _i16.PageRouteInfo<void> {
  const CreateIndividualTab()
      : super(
          CreateIndividualTab.name,
          path: 'create',
        );

  static const String name = 'CreateIndividualTab';
}

/// generated route for
/// [_i12.OriginPage]
class OriginRoute extends _i16.PageRouteInfo<void> {
  const OriginRoute({List<_i16.PageRouteInfo>? children})
      : super(
          OriginRoute.name,
          path: '',
          initialChildren: children,
        );

  static const String name = 'OriginRoute';
}

/// generated route for
/// [_i13.DetailOriginPage]
class DetailOriginRoute extends _i16.PageRouteInfo<DetailOriginRouteArgs> {
  DetailOriginRoute({
    _i18.Key? key,
    required String originId,
  }) : super(
          DetailOriginRoute.name,
          path: 'info/:originId',
          args: DetailOriginRouteArgs(
            key: key,
            originId: originId,
          ),
          rawPathParams: {'originId': originId},
        );

  static const String name = 'DetailOriginRoute';
}

class DetailOriginRouteArgs {
  const DetailOriginRouteArgs({
    this.key,
    required this.originId,
  });

  final _i18.Key? key;

  final String originId;

  @override
  String toString() {
    return 'DetailOriginRouteArgs{key: $key, originId: $originId}';
  }
}

/// generated route for
/// [_i14.ListOriginPage]
class ListOriginTab extends _i16.PageRouteInfo<void> {
  const ListOriginTab()
      : super(
          ListOriginTab.name,
          path: 'list',
        );

  static const String name = 'ListOriginTab';
}

/// generated route for
/// [_i15.CreateOriginPage]
class CreateOriginTab extends _i16.PageRouteInfo<void> {
  const CreateOriginTab()
      : super(
          CreateOriginTab.name,
          path: 'create',
        );

  static const String name = 'CreateOriginTab';
}
