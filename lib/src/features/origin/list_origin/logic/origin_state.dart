// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'origin_bloc.dart';

class OriginState extends Equatable {
  final List<OriginModel> list;
  final List<String> listOriginSelected;

  final bool enableSortWithName;
  final bool enableSortWithNameId;

  OriginState({
    this.list = const [],
    this.listOriginSelected = const [],
    this.enableSortWithName = false,
    this.enableSortWithNameId = false,
  });

  @override
  List<Object?> get props => [
        list,
        listOriginSelected,
        enableSortWithName,
        enableSortWithNameId,
      ];

  OriginState copyWith({
    List<OriginModel>? list,
    List<String>? listOriginSelected,
    bool? enableSortWithName,
    bool? enableSortWithNameId,
  }) {
    return OriginState(
      list: list ?? this.list,
      listOriginSelected: listOriginSelected ?? this.listOriginSelected,
      enableSortWithName: enableSortWithName ?? this.enableSortWithName,
      enableSortWithNameId: enableSortWithNameId ?? this.enableSortWithNameId,
    );
  }
}
