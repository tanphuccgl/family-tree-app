// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'dashboard_bloc.dart';

class DashboardState extends Equatable {
  final int currentIndex;

  List<Widget> get pages => ItemDrawerEnum.values.map((e) => e.pages).toList();

  const DashboardState({
    this.currentIndex = 3,
  });

  @override
  List<Object?> get props => [
        currentIndex,
      ];

  DashboardState copyWith({
    int? currentIndex,
  }) {
    return DashboardState(
      currentIndex: currentIndex ?? this.currentIndex,
    );
  }
}
