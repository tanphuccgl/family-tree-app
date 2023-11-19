// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "area_bloc.dart";

class AreaState extends Equatable {
  final List<AreaModel> list;

  AreaState({
    this.list = const [],
  });

  @override
  List<Object?> get props => [list];

  AreaState copyWith({
    List<AreaModel>? list,
  }) {
    return AreaState(
      list: list ?? this.list,
    );
  }
}
