import 'package:auto_route/auto_route.dart';
import 'package:equatable/equatable.dart';

import 'package:familytree/widgets/dialogs/toast_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Cubit<DashboardState> {
  final BuildContext context;
  final TabsRouter tabsRouter;
  DashboardBloc(this.context, this.tabsRouter) : super(const DashboardState()) {
    init();
  }
  final GlobalKey<ScaffoldState> scaffoldKeyDrawer = GlobalKey<ScaffoldState>();

  void init() {}

  void changePage(int index) {
    tabsRouter.setActiveIndex(index);
  }

  void onDrawerButton() {
    emit(state.copyWith(isExpandedDrawer: !state.isExpandedDrawer));
  }

  void openDrawer() {
    scaffoldKeyDrawer.currentState?.openDrawer();
  }

  void closeDrawer() {
    Navigator.of(context).pop();
  }

  @override
  Future<void> close() {
    XToast.hideLoading();
    return super.close();
  }
}
