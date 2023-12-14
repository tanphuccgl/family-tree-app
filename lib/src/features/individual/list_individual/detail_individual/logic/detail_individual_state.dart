// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'detail_individual_bloc.dart';

class DetailIndividualState extends Equatable {
  final String name;
  final String nameId;
  final bool isNameIdExist;
  final bool isEdit;

  DetailIndividualState({
    this.name = "",
    this.nameId = "",
    this.isNameIdExist = false,
    this.isEdit = false,
  });

  @override
  List<Object?> get props => [
        name,
        nameId,
        isNameIdExist,
        isEdit,
      ];

  DetailIndividualState copyWith({
    String? name,
    String? nameId,
    bool? isNameIdExist,
    bool? isEdit,
  }) {
    return DetailIndividualState(
      name: name ?? this.name,
      nameId: nameId ?? this.nameId,
      isNameIdExist: isNameIdExist ?? this.isNameIdExist,
      isEdit: isEdit ?? this.isEdit,
    );
  }
}
