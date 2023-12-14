// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'create_individual_bloc.dart';

class CreateIndividualState extends Equatable {
  final AreaModel? currnentArea;
  final ProductTypeEnum? type;
  final bool isShowSelectArea;
  final bool isShowSelectType;

  final String name;
  final String nameId;
  final bool isNameIdExist;

  CreateIndividualState({
    this.isShowSelectArea = true,
    this.type,
    this.isShowSelectType = false,
    this.name = "",
    this.nameId = "",
    this.isNameIdExist = false,
    this.currnentArea,
  });

  @override
  List<Object?> get props => [
        name,
        nameId,
        isNameIdExist,
        currnentArea,
        isShowSelectType,
        isShowSelectArea,
        type,
      ];

  CreateIndividualState copyWith({
    String? name,
    String? nameId,
    bool? isNameIdExist,
    AreaModel? currnentArea,
    bool? isShowSelectArea,
    bool? isShowSelectType,
    ProductTypeEnum? type,
  }) {
    return CreateIndividualState(
      name: name ?? this.name,
      nameId: nameId ?? this.nameId,
      isNameIdExist: isNameIdExist ?? this.isNameIdExist,
      currnentArea: currnentArea ?? this.currnentArea,
      isShowSelectType: isShowSelectType ?? this.isShowSelectType,
      isShowSelectArea: isShowSelectArea ?? this.isShowSelectArea,
      type: type ?? this.type,
    );
  }

  CreateIndividualState clearAreaCurrent() {
    return CreateIndividualState(
      name: this.name,
      nameId: this.nameId,
      isNameIdExist: this.isNameIdExist,
      currnentArea: null,
      isShowSelectArea: this.isShowSelectArea,
      isShowSelectType: this.isShowSelectType,
      type: null,
    );
  }

  CreateIndividualState refreshData() {
    return CreateIndividualState(
      currnentArea: this.currnentArea,
      type: this.type,
    );
  }
}
