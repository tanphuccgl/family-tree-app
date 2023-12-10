// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'origin_bloc.dart';

class OriginState extends Equatable {
  final List<OriginModel> list;

  OriginState({
    this.list = const [],
  });

  @override
  List<Object?> get props => [list];

  OriginState copyWith({
    List<OriginModel>? list,
  }) {
    return OriginState(
      list: list ?? this.list,
    );
  }
}
