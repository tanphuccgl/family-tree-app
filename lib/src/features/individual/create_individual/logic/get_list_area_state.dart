// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'get_list_area_bloc.dart';

class GetListAreaState extends Equatable {
  final List<AreaModel> list;
  final AreaModel? selectedArea;

  final bool enableSortWithName;
  final bool enableSortWithNameId;

  GetListAreaState({
    this.list = const [],
    this.enableSortWithName = false,
    this.enableSortWithNameId = false,
    this.selectedArea,
  });

  @override
  List<Object?> get props => [
        list,
        enableSortWithName,
        enableSortWithNameId,
        selectedArea,
      ];

  GetListAreaState copyWith({
    List<AreaModel>? list,
    bool? enableSortWithName,
    bool? enableSortWithNameId,
    AreaModel? selectedArea,
  }) {
    return GetListAreaState(
      list: list ?? this.list,
      enableSortWithName: enableSortWithName ?? this.enableSortWithName,
      enableSortWithNameId: enableSortWithNameId ?? this.enableSortWithNameId,
      selectedArea: selectedArea ?? this.selectedArea,
    );
  }

  GetListAreaState clearCurrentArea() {
    return GetListAreaState(
      list: this.list,
      enableSortWithName: this.enableSortWithName,
      enableSortWithNameId: this.enableSortWithNameId,
      selectedArea: null,
    );
  }
}
