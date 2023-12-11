import 'package:equatable/equatable.dart';
import 'package:familytree/src/features/dashboard/widgets/drawer/item_drawer_enum.dart';
import 'package:familytree/widgets/dialogs/toast_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Cubit<DashboardState> {
  final BuildContext context;
  DashboardBloc(this.context) : super(const DashboardState()) {
    init();
  }
  final GlobalKey<ScaffoldState> scaffoldKeyDrawer = GlobalKey<ScaffoldState>();
  late final PageController pageController;

  void init() {
    pageController = PageController(initialPage: state.currentIndex);
  }

  void changePage(int index) {
    emit(state.copyWith(currentIndex: index));

    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
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
    pageController.dispose();
    XToast.hideLoading();
    return super.close();
  }
}
