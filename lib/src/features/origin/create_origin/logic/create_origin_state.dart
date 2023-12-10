// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'create_origin_bloc.dart';

class CreateOriginState extends Equatable {
  final String name;
  final String nameId;
  final bool isNameIdExist;

  CreateOriginState({
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

  CreateOriginState copyWith({
    String? name,
    String? nameId,
    bool? isNameIdExist,
  }) {
    return CreateOriginState(
      name: name ?? this.name,
      nameId: nameId ?? this.nameId,
      isNameIdExist: isNameIdExist ?? this.isNameIdExist,
    );
  }
}
