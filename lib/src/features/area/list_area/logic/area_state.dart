// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'area_bloc.dart';

class AreaState extends Equatable {
  final List<AreaModel> list;
  final List<String> listAreaSelected;

  final bool enableSortWithName;
  final bool enableSortWithNameId;

  final String detailAreaSelectedId;

  AreaState({
    this.list = const [],
    this.listAreaSelected = const [],
    this.enableSortWithName = false,
    this.enableSortWithNameId = false,
    this.detailAreaSelectedId = "",
  });

  @override
  List<Object?> get props => [
        list,
        listAreaSelected,
        enableSortWithName,
        enableSortWithNameId,
        detailAreaSelectedId,
      ];

  AreaState copyWith({
    List<AreaModel>? list,
    List<String>? listAreaSelected,
    bool? enableSortWithName,
    bool? enableSortWithNameId,
    String? detailAreaSelectedId,
  }) {
    return AreaState(
      list: list ?? this.list,
      listAreaSelected: listAreaSelected ?? this.listAreaSelected,
      enableSortWithName: enableSortWithName ?? this.enableSortWithName,
      enableSortWithNameId: enableSortWithNameId ?? this.enableSortWithNameId,
      detailAreaSelectedId: detailAreaSelectedId ?? this.detailAreaSelectedId,
    );
  }
}
