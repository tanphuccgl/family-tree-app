import 'package:equatable/equatable.dart';
import 'package:familytree/src/features/create_cathe/pages/create_cathe_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_state.dart';

class DashboardBloc extends Cubit<DashboardState> {
  DashboardBloc() : super(const DashboardState());

  final PageController pageController = PageController(initialPage: 0);

  void changePage(int index) {
    emit(state.copyWith(currentIndex: index));

    pageController.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
