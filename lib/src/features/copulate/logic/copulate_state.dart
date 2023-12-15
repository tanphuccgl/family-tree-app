// ignore_for_file: public_member_api_docs, sort_constructors_first
part of "copulate_bloc.dart";

class CopulateState extends Equatable {
  final AreaModel? currnentArea;

  final GenerationEnum type;
  final List<IndividualModel> listIndividualCurrent;

  final IndividualModel? maleSelected;
  final IndividualModel? femaleSelected;

  List<IndividualModel> get listMaleIndividual => listIndividualCurrent
      .where((e) => e.isMale == true && e.origin != null)
      .toList();

  List<IndividualModel> get listFemaleIndividual => listIndividualCurrent
      .where((e) =>
          e.isMale == false && e.listCopulateId.isEmpty && e.origin != null)
      .toList();

  CopulateState({
    this.type = GenerationEnum.f0,
    this.listIndividualCurrent = const [],
    this.maleSelected,
    this.femaleSelected,
    this.currnentArea,
  });
  @override
  List<Object?> get props => [
        type,
        listIndividualCurrent,
        maleSelected,
        femaleSelected,
        currnentArea,
      ];

  CopulateState copyWith({
    GenerationEnum? type,
    List<IndividualModel>? listIndividualCurrent,
    IndividualModel? maleSelected,
    IndividualModel? femaleSelected,
    AreaModel? currnentArea,
  }) {
    return CopulateState(
      type: type ?? this.type,
      listIndividualCurrent:
          listIndividualCurrent ?? this.listIndividualCurrent,
      maleSelected: maleSelected ?? this.maleSelected,
      femaleSelected: femaleSelected ?? this.femaleSelected,
      currnentArea: currnentArea ?? this.currnentArea,
    );
  }

  CopulateState clearSelectIndividual() {
    return CopulateState(
      type: this.type,
      listIndividualCurrent: this.listIndividualCurrent,
      currnentArea: this.currnentArea,
      maleSelected: null,
      femaleSelected: null,
    );
  }

  CopulateState clearSelectMaleIndividual() {
    return CopulateState(
      type: this.type,
      currnentArea: this.currnentArea,
      listIndividualCurrent: this.listIndividualCurrent,
      maleSelected: null,
      femaleSelected: this.femaleSelected,
    );
  }

  CopulateState clearSelectFemaleIndividual() {
    return CopulateState(
      type: this.type,
      currnentArea: this.currnentArea,
      listIndividualCurrent: this.listIndividualCurrent,
      maleSelected: this.maleSelected,
      femaleSelected: null,
    );
  }

  CopulateState clearAreaCurrent() {
    return CopulateState(
      type: this.type,
      currnentArea: null,
      listIndividualCurrent: this.listIndividualCurrent,
      maleSelected: this.maleSelected,
      femaleSelected: this.femaleSelected,
    );
  }

  CopulateState refreshData() {
    return CopulateState(
      currnentArea: this.currnentArea,
    );
  }
}
