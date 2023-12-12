// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_list_area_bloc.dart';

class GetListAreaState extends Equatable {
  final List<AreaModel> list;

  final bool enableSortWithName;
  final bool enableSortWithNameId;

  GetListAreaState({
    this.list = const [],
    this.enableSortWithName = false,
    this.enableSortWithNameId = false,
  });

  @override
  List<Object?> get props => [
        list,
        enableSortWithName,
        enableSortWithNameId,
      ];

  GetListAreaState copyWith({
    List<AreaModel>? list,
    bool? enableSortWithName,
    bool? enableSortWithNameId,
  }) {
    return GetListAreaState(
      list: list ?? this.list,
      enableSortWithName: enableSortWithName ?? this.enableSortWithName,
      enableSortWithNameId: enableSortWithNameId ?? this.enableSortWithNameId,
    );
  }
}
