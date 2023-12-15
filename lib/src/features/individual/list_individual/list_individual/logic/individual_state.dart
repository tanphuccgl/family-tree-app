// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'individual_bloc.dart';

class IndividualState extends Equatable {
  final List<IndividualModel> list;
  final List<String> listIndividualSelected;

  final bool enableSortWithName;
  final bool enableSortWithNameId;

  final String detailIndividualSelectedId;

  IndividualState({
    this.list = const [],
    this.listIndividualSelected = const [],
    this.enableSortWithName = false,
    this.enableSortWithNameId = false,
    this.detailIndividualSelectedId = "",
  });

  @override
  List<Object?> get props => [
        list,
        listIndividualSelected,
        enableSortWithName,
        enableSortWithNameId,
        detailIndividualSelectedId,
      ];

  IndividualState copyWith({
    List<IndividualModel>? list,
    List<String>? listIndividualSelected,
    bool? enableSortWithName,
    bool? enableSortWithNameId,
    String? detailIndividualSelectedId,
  }) {
    return IndividualState(
      list: list ?? this.list,
      listIndividualSelected:
          listIndividualSelected ?? this.listIndividualSelected,
      enableSortWithName: enableSortWithName ?? this.enableSortWithName,
      enableSortWithNameId: enableSortWithNameId ?? this.enableSortWithNameId,
      detailIndividualSelectedId:
          detailIndividualSelectedId ?? this.detailIndividualSelectedId,
    );
  }
}
