// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'create_area_bloc.dart';

class CreateAreaState extends Equatable {
  final String name;
  final String nameId;
  final bool isNameIdExist;

  CreateAreaState({
    this.name = "",
    this.nameId = "",
    this.isNameIdExist = false,
  });

  @override
  List<Object?> get props => [
        name,
        nameId,
        isNameIdExist,
      ];

  CreateAreaState copyWith({
    String? name,
    String? nameId,
    bool? isNameIdExist,
  }) {
    return CreateAreaState(
      name: name ?? this.name,
      nameId: nameId ?? this.nameId,
      isNameIdExist: isNameIdExist ?? this.isNameIdExist,
    );
  }
}
