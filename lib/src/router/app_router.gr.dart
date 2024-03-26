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
import 'package:auto_route/auto_route.dart' as _i23;
import 'package:flutter/cupertino.dart' as _i25;
import 'package:flutter/material.dart' as _i24;

import '../features/area/area_page.dart' as _i14;
import '../features/area/create_area/pages/create_origin_page.dart' as _i17;
import '../features/area/detail_area/pages/detail_area_page.dart' as _i15;
import '../features/area/list_area/pages/list_area_page.dart' as _i16;
import '../features/area/router/area_wrapper_router.dart' as _i6;
import '../features/copulate/pages/wrapper_copulate_page.dart' as _i5;
import '../features/dashboard/pages/dashboard_page.dart' as _i2;
import '../features/dashboard/router/dashboard_wrapper_router.dart' as _i1;
import '../features/family_tree/pages/family_tree_page.dart' as _i9;
import '../features/family_tree/router/tree_wrapper_router.dart' as _i3;
import '../features/individual/create_individual/pages/create_individual_page.dart'
    as _i13;
import '../features/individual/detail_individual/pages/detail_individual_page.dart'
    as _i10;
import '../features/individual/individual_page.dart' as _i11;
import '../features/individual/list_individual/pages/list_individual_page.dart'
    as _i12;
import '../features/individual/router/individual_wrapper_router.dart' as _i4;
import '../features/origin/create_origin/pages/create_origin_page.dart' as _i21;
import '../features/origin/detail_origin/pages/detail_origin_page.dart' as _i19;
import '../features/origin/list_origin/pages/list_origin_page.dart' as _i20;
import '../features/origin/origin_page.dart' as _i18;
import '../features/origin/router/origin_wrapper_router.dart' as _i7;
import '../features/table_female/female_individuals/pages/female_individuals_page.dart'
    as _i22;
import '../features/table_female/router/table_female_wrapper_router.dart'
    as _i8;

class XRouter extends _i23.RootStackRouter {
  XRouter([_i24.GlobalKey<_i24.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i23.PageFactory> pagesMap = {
    DashboardWrapperRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.DashboardWrapperPage(),
      );
    },
    DashboardRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.DashboardPage(),
      );
    },
    TreeWrapperRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.TreeWrapperPage(),
      );
    },
    IndividualWrapperRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i4.IndividualWrapperPage(),
      );
    },
    WrapperCopulatePageView.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i5.WrapperCopulatePage(),
      );
    },
    AreaWrapperRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i6.AreaWrapperPage(),
      );
    },
    OriginWrapperRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i7.OriginWrapperPage(),
      );
    },
    TableFemaleWrapperRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i8.TableFemaleWrapperPage(),
      );
    },
    TreeViewRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i9.TreeViewPage(),
      );
    },
    DetailIndividualRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<DetailIndividualRouteArgs>(
          orElse: () => DetailIndividualRouteArgs(
              individualId: pathParams.getString('individualId')));
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i10.DetailIndividualPage(
          key: args.key,
          individualId: args.individualId,
        ),
      );
    },
    IndividualRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i11.IndividualPage(),
      );
    },
    ListIndividualTab.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i12.ListIndividualPage(),
      );
    },
    CreateIndividualTab.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i13.CreateIndividualPage(),
      );
    },
    AreaRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i14.AreaPage(),
      );
    },
    DetailAreaRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<DetailAreaRouteArgs>(
          orElse: () =>
              DetailAreaRouteArgs(areaId: pathParams.getString('areaId')));
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i15.DetailAreaPage(
          key: args.key,
          areaId: args.areaId,
        ),
      );
    },
    ListAreaTab.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i16.ListAreaPage(),
      );
    },
    CreateAreaTab.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i17.CreateAreaPage(),
      );
    },
    OriginRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i18.OriginPage(),
      );
    },
    DetailOriginRoute.name: (routeData) {
      final pathParams = routeData.inheritedPathParams;
      final args = routeData.argsAs<DetailOriginRouteArgs>(
          orElse: () => DetailOriginRouteArgs(
              originId: pathParams.getString('originId')));
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: _i19.DetailOriginPage(
          key: args.key,
          originId: args.originId,
        ),
      );
    },
    ListOriginTab.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i20.ListOriginPage(),
      );
    },
    CreateOriginTab.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i21.CreateOriginPage(),
      );
    },
    FemaleIndividualsRoute.name: (routeData) {
      return _i23.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i22.FemaleIndividualsPage(),
      );
    },
  };

  @override
  List<_i23.RouteConfig> get routes => [
        _i23.RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/dashboard',
          fullMatch: true,
        ),
        _i23.RouteConfig(
          DashboardWrapperRoute.name,
          path: '/dashboard',
          children: [
            _i23.RouteConfig(
              DashboardRoute.name,
              path: '',
              parent: DashboardWrapperRoute.name,
              children: [
                _i23.RouteConfig(
                  '#redirect',
                  path: '',
                  parent: DashboardRoute.name,
                  redirectTo: 'table-female',
                  fullMatch: true,
                ),
                _i23.RouteConfig(
                  TreeWrapperRoute.name,
                  path: 'tree',
                  parent: DashboardRoute.name,
                  children: [
                    _i23.RouteConfig(
                      TreeViewRoute.name,
                      path: '',
                      parent: TreeWrapperRoute.name,
                    ),
                    _i23.RouteConfig(
                      DetailIndividualRoute.name,
                      path: 'info/:individualId',
                      parent: TreeWrapperRoute.name,
                    ),
                    _i23.RouteConfig(
                      '*#redirect',
                      path: '*',
                      parent: TreeWrapperRoute.name,
                      redirectTo: '',
                      fullMatch: true,
                    ),
                  ],
                ),
                _i23.RouteConfig(
                  IndividualWrapperRoute.name,
                  path: 'individual',
                  parent: DashboardRoute.name,
                  children: [
                    _i23.RouteConfig(
                      IndividualRoute.name,
                      path: '',
                      parent: IndividualWrapperRoute.name,
                      children: [
                        _i23.RouteConfig(
                          '#redirect',
                          path: '',
                          parent: IndividualRoute.name,
                          redirectTo: 'list',
                          fullMatch: true,
                        ),
                        _i23.RouteConfig(
                          ListIndividualTab.name,
                          path: 'list',
                          parent: IndividualRoute.name,
                        ),
                        _i23.RouteConfig(
                          CreateIndividualTab.name,
                          path: 'create',
                          parent: IndividualRoute.name,
                        ),
                        _i23.RouteConfig(
                          '*#redirect',
                          path: '*',
                          parent: IndividualRoute.name,
                          redirectTo: '',
                          fullMatch: true,
                        ),
                      ],
                    ),
                    _i23.RouteConfig(
                      DetailIndividualRoute.name,
                      path: 'info/:individualId',
                      parent: IndividualWrapperRoute.name,
                    ),
                    _i23.RouteConfig(
                      '*#redirect',
                      path: '*',
                      parent: IndividualWrapperRoute.name,
                      redirectTo: '',
                      fullMatch: true,
                    ),
                  ],
                ),
                _i23.RouteConfig(
                  WrapperCopulatePageView.name,
                  path: 'copulate',
                  parent: DashboardRoute.name,
                ),
                _i23.RouteConfig(
                  AreaWrapperRoute.name,
                  path: 'area',
                  parent: DashboardRoute.name,
                  children: [
                    _i23.RouteConfig(
                      AreaRoute.name,
                      path: '',
                      parent: AreaWrapperRoute.name,
                      children: [
                        _i23.RouteConfig(
                          '#redirect',
                          path: '',
                          parent: AreaRoute.name,
                          redirectTo: 'list',
                          fullMatch: true,
                        ),
                        _i23.RouteConfig(
                          ListAreaTab.name,
                          path: 'list',
                          parent: AreaRoute.name,
                        ),
                        _i23.RouteConfig(
                          CreateAreaTab.name,
                          path: 'create',
                          parent: AreaRoute.name,
                        ),
                        _i23.RouteConfig(
                          '*#redirect',
                          path: '*',
                          parent: AreaRoute.name,
                          redirectTo: '',
                          fullMatch: true,
                        ),
                      ],
                    ),
                    _i23.RouteConfig(
                      DetailAreaRoute.name,
                      path: 'info/:areaId',
                      parent: AreaWrapperRoute.name,
                    ),
                    _i23.RouteConfig(
                      '*#redirect',
                      path: '*',
                      parent: AreaWrapperRoute.name,
                      redirectTo: '',
                      fullMatch: true,
                    ),
                  ],
                ),
                _i23.RouteConfig(
                  OriginWrapperRoute.name,
                  path: 'origin',
                  parent: DashboardRoute.name,
                  children: [
                    _i23.RouteConfig(
                      OriginRoute.name,
                      path: '',
                      parent: OriginWrapperRoute.name,
                      children: [
                        _i23.RouteConfig(
                          '#redirect',
                          path: '',
                          parent: OriginRoute.name,
                          redirectTo: 'list',
                          fullMatch: true,
                        ),
                        _i23.RouteConfig(
                          ListOriginTab.name,
                          path: 'list',
                          parent: OriginRoute.name,
                        ),
                        _i23.RouteConfig(
                          CreateOriginTab.name,
                          path: 'create',
                          parent: OriginRoute.name,
                        ),
                        _i23.RouteConfig(
                          '*#redirect',
                          path: '*',
                          parent: OriginRoute.name,
                          redirectTo: '',
                          fullMatch: true,
                        ),
                      ],
                    ),
                    _i23.RouteConfig(
                      DetailOriginRoute.name,
                      path: 'info/:originId',
                      parent: OriginWrapperRoute.name,
                    ),
                    _i23.RouteConfig(
                      '*#redirect',
                      path: '*',
                      parent: OriginWrapperRoute.name,
                      redirectTo: '',
                      fullMatch: true,
                    ),
                  ],
                ),
                _i23.RouteConfig(
                  TableFemaleWrapperRoute.name,
                  path: 'table-female',
                  parent: DashboardRoute.name,
                  children: [
                    _i23.RouteConfig(
                      FemaleIndividualsRoute.name,
                      path: '',
                      parent: TableFemaleWrapperRoute.name,
                      children: [
                        _i23.RouteConfig(
                          '*#redirect',
                          path: '*',
                          parent: FemaleIndividualsRoute.name,
                          redirectTo: '',
                          fullMatch: true,
                        )
                      ],
                    ),
                    _i23.RouteConfig(
                      '*#redirect',
                      path: '*',
                      parent: TableFemaleWrapperRoute.name,
                      redirectTo: '',
                      fullMatch: true,
                    ),
                  ],
                ),
                _i23.RouteConfig(
                  '*#redirect',
                  path: '*',
                  parent: DashboardRoute.name,
                  redirectTo: '',
                  fullMatch: true,
                ),
              ],
            ),
            _i23.RouteConfig(
              '*#redirect',
              path: '*',
              parent: DashboardWrapperRoute.name,
              redirectTo: '',
              fullMatch: true,
            ),
          ],
        ),
        _i23.RouteConfig(
          '*#redirect',
          path: '*',
          redirectTo: '',
          fullMatch: true,
        ),
      ];
}

/// generated route for
/// [_i1.DashboardWrapperPage]
class DashboardWrapperRoute extends _i23.PageRouteInfo<void> {
  const DashboardWrapperRoute({List<_i23.PageRouteInfo>? children})
      : super(
          DashboardWrapperRoute.name,
          path: '/dashboard',
          initialChildren: children,
        );

  static const String name = 'DashboardWrapperRoute';
}

/// generated route for
/// [_i2.DashboardPage]
class DashboardRoute extends _i23.PageRouteInfo<void> {
  const DashboardRoute({List<_i23.PageRouteInfo>? children})
      : super(
          DashboardRoute.name,
          path: '',
          initialChildren: children,
        );

  static const String name = 'DashboardRoute';
}

/// generated route for
/// [_i3.TreeWrapperPage]
class TreeWrapperRoute extends _i23.PageRouteInfo<void> {
  const TreeWrapperRoute({List<_i23.PageRouteInfo>? children})
      : super(
          TreeWrapperRoute.name,
          path: 'tree',
          initialChildren: children,
        );

  static const String name = 'TreeWrapperRoute';
}

/// generated route for
/// [_i4.IndividualWrapperPage]
class IndividualWrapperRoute extends _i23.PageRouteInfo<void> {
  const IndividualWrapperRoute({List<_i23.PageRouteInfo>? children})
      : super(
          IndividualWrapperRoute.name,
          path: 'individual',
          initialChildren: children,
        );

  static const String name = 'IndividualWrapperRoute';
}

/// generated route for
/// [_i5.WrapperCopulatePage]
class WrapperCopulatePageView extends _i23.PageRouteInfo<void> {
  const WrapperCopulatePageView()
      : super(
          WrapperCopulatePageView.name,
          path: 'copulate',
        );

  static const String name = 'WrapperCopulatePageView';
}

/// generated route for
/// [_i6.AreaWrapperPage]
class AreaWrapperRoute extends _i23.PageRouteInfo<void> {
  const AreaWrapperRoute({List<_i23.PageRouteInfo>? children})
      : super(
          AreaWrapperRoute.name,
          path: 'area',
          initialChildren: children,
        );

  static const String name = 'AreaWrapperRoute';
}

/// generated route for
/// [_i7.OriginWrapperPage]
class OriginWrapperRoute extends _i23.PageRouteInfo<void> {
  const OriginWrapperRoute({List<_i23.PageRouteInfo>? children})
      : super(
          OriginWrapperRoute.name,
          path: 'origin',
          initialChildren: children,
        );

  static const String name = 'OriginWrapperRoute';
}

/// generated route for
/// [_i8.TableFemaleWrapperPage]
class TableFemaleWrapperRoute extends _i23.PageRouteInfo<void> {
  const TableFemaleWrapperRoute({List<_i23.PageRouteInfo>? children})
      : super(
          TableFemaleWrapperRoute.name,
          path: 'table-female',
          initialChildren: children,
        );

  static const String name = 'TableFemaleWrapperRoute';
}

/// generated route for
/// [_i9.TreeViewPage]
class TreeViewRoute extends _i23.PageRouteInfo<void> {
  const TreeViewRoute()
      : super(
          TreeViewRoute.name,
          path: '',
        );

  static const String name = 'TreeViewRoute';
}

/// generated route for
/// [_i10.DetailIndividualPage]
class DetailIndividualRoute
    extends _i23.PageRouteInfo<DetailIndividualRouteArgs> {
  DetailIndividualRoute({
    _i25.Key? key,
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

  final _i25.Key? key;

  final String individualId;

  @override
  String toString() {
    return 'DetailIndividualRouteArgs{key: $key, individualId: $individualId}';
  }
}

/// generated route for
/// [_i11.IndividualPage]
class IndividualRoute extends _i23.PageRouteInfo<void> {
  const IndividualRoute({List<_i23.PageRouteInfo>? children})
      : super(
          IndividualRoute.name,
          path: '',
          initialChildren: children,
        );

  static const String name = 'IndividualRoute';
}

/// generated route for
/// [_i12.ListIndividualPage]
class ListIndividualTab extends _i23.PageRouteInfo<void> {
  const ListIndividualTab()
      : super(
          ListIndividualTab.name,
          path: 'list',
        );

  static const String name = 'ListIndividualTab';
}

/// generated route for
/// [_i13.CreateIndividualPage]
class CreateIndividualTab extends _i23.PageRouteInfo<void> {
  const CreateIndividualTab()
      : super(
          CreateIndividualTab.name,
          path: 'create',
        );

  static const String name = 'CreateIndividualTab';
}

/// generated route for
/// [_i14.AreaPage]
class AreaRoute extends _i23.PageRouteInfo<void> {
  const AreaRoute({List<_i23.PageRouteInfo>? children})
      : super(
          AreaRoute.name,
          path: '',
          initialChildren: children,
        );

  static const String name = 'AreaRoute';
}

/// generated route for
/// [_i15.DetailAreaPage]
class DetailAreaRoute extends _i23.PageRouteInfo<DetailAreaRouteArgs> {
  DetailAreaRoute({
    _i25.Key? key,
    required String areaId,
  }) : super(
          DetailAreaRoute.name,
          path: 'info/:areaId',
          args: DetailAreaRouteArgs(
            key: key,
            areaId: areaId,
          ),
          rawPathParams: {'areaId': areaId},
        );

  static const String name = 'DetailAreaRoute';
}

class DetailAreaRouteArgs {
  const DetailAreaRouteArgs({
    this.key,
    required this.areaId,
  });

  final _i25.Key? key;

  final String areaId;

  @override
  String toString() {
    return 'DetailAreaRouteArgs{key: $key, areaId: $areaId}';
  }
}

/// generated route for
/// [_i16.ListAreaPage]
class ListAreaTab extends _i23.PageRouteInfo<void> {
  const ListAreaTab()
      : super(
          ListAreaTab.name,
          path: 'list',
        );

  static const String name = 'ListAreaTab';
}

/// generated route for
/// [_i17.CreateAreaPage]
class CreateAreaTab extends _i23.PageRouteInfo<void> {
  const CreateAreaTab()
      : super(
          CreateAreaTab.name,
          path: 'create',
        );

  static const String name = 'CreateAreaTab';
}

/// generated route for
/// [_i18.OriginPage]
class OriginRoute extends _i23.PageRouteInfo<void> {
  const OriginRoute({List<_i23.PageRouteInfo>? children})
      : super(
          OriginRoute.name,
          path: '',
          initialChildren: children,
        );

  static const String name = 'OriginRoute';
}

/// generated route for
/// [_i19.DetailOriginPage]
class DetailOriginRoute extends _i23.PageRouteInfo<DetailOriginRouteArgs> {
  DetailOriginRoute({
    _i25.Key? key,
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

  final _i25.Key? key;

  final String originId;

  @override
  String toString() {
    return 'DetailOriginRouteArgs{key: $key, originId: $originId}';
  }
}

/// generated route for
/// [_i20.ListOriginPage]
class ListOriginTab extends _i23.PageRouteInfo<void> {
  const ListOriginTab()
      : super(
          ListOriginTab.name,
          path: 'list',
        );

  static const String name = 'ListOriginTab';
}

/// generated route for
/// [_i21.CreateOriginPage]
class CreateOriginTab extends _i23.PageRouteInfo<void> {
  const CreateOriginTab()
      : super(
          CreateOriginTab.name,
          path: 'create',
        );

  static const String name = 'CreateOriginTab';
}

/// generated route for
/// [_i22.FemaleIndividualsPage]
class FemaleIndividualsRoute extends _i23.PageRouteInfo<void> {
  const FemaleIndividualsRoute({List<_i23.PageRouteInfo>? children})
      : super(
          FemaleIndividualsRoute.name,
          path: '',
          initialChildren: children,
        );

  static const String name = 'FemaleIndividualsRoute';
}
