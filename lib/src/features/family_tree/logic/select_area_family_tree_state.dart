// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'select_area_family_tree_bloc.dart';

class SelectAreaFamilyTreeState extends Equatable {
  final List<AreaModel> list;
  final AreaModel? selectedArea;

  final bool enableSortWithName;
  final bool enableSortWithNameId;

  SelectAreaFamilyTreeState({
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

  SelectAreaFamilyTreeState copyWith({
    List<AreaModel>? list,
    bool? enableSortWithName,
    bool? enableSortWithNameId,
    AreaModel? selectedArea,
  }) {
    return SelectAreaFamilyTreeState(
      list: list ?? this.list,
      enableSortWithName: enableSortWithName ?? this.enableSortWithName,
      enableSortWithNameId: enableSortWithNameId ?? this.enableSortWithNameId,
      selectedArea: selectedArea ?? this.selectedArea,
    );
  }

  SelectAreaFamilyTreeState clearCurrentArea() {
    return SelectAreaFamilyTreeState(
      list: this.list,
      enableSortWithName: this.enableSortWithName,
      enableSortWithNameId: this.enableSortWithNameId,
      selectedArea: null,
    );
  }
}
