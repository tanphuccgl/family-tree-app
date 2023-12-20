// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  final bool isExpandedDrawer;


  const DashboardState({
    this.isExpandedDrawer = true,

  });

  @override
  List<Object?> get props => [
        isExpandedDrawer,
      ];

  DashboardState copyWith({
    bool? isExpandedDrawer,
  }) {
    return DashboardState(
      isExpandedDrawer: isExpandedDrawer ?? this.isExpandedDrawer,
    );
  }
}
