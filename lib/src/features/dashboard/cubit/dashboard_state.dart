// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  final int currentIndex;
  final bool isExpandedDrawer;

  List<Widget> get pages => ItemDrawerEnum.values.map((e) => e.pages).toList();

  const DashboardState({
    this.currentIndex = 1,
    this.isExpandedDrawer = true,
  });

  @override
  List<Object?> get props => [
        currentIndex,
        isExpandedDrawer,
      ];

  DashboardState copyWith({
    int? currentIndex,
    bool? isExpandedDrawer,
  }) {
    return DashboardState(
      currentIndex: currentIndex ?? this.currentIndex,
      isExpandedDrawer: isExpandedDrawer ?? this.isExpandedDrawer,
    );
  }
}
