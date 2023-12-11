// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'origin_bloc.dart';

class OriginState extends Equatable {
  final List<OriginModel> list;
  final List<String> listOriginSelected;

  OriginState({
    this.list = const [],
    this.listOriginSelected = const [],
  });

  @override
  List<Object?> get props => [
        list,
        listOriginSelected,
      ];

  OriginState copyWith({
    List<OriginModel>? list,
    List<String>? listOriginSelected,
  }) {
    return OriginState(
      list: list ?? this.list,
      listOriginSelected: listOriginSelected ?? this.listOriginSelected,
    );
  }
}
