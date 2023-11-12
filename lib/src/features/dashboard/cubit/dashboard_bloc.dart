import 'package:equatable/equatable.dart';
import 'package:familytree/src/features/create_cathe/pages/create_cathe_page.dart';
import 'package:familytree/src/features/family_tree/pages/family_tree_page.dart';
import 'package:familytree/src/features/list_cathe/pages/list_cathe_page.dart';
import 'package:familytree/widgets/dialogs/toast_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Cubit<DashboardState> {
  DashboardBloc() : super(const DashboardState()) {
    init();
  }

  late final PageController pageController;

  void init() {
    pageController = PageController(initialPage: state.currentIndex);
  }

  void changePage(int index) {
    emit(state.copyWith(currentIndex: index));

    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  Future<void> close() {
    pageController.dispose();
    XToast.hideLoading();
    return super.close();
  }
}