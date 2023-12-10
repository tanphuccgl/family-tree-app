// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'detail_origin_bloc.dart';

class DetailOriginState extends Equatable {
  final String name;
  final String nameId;
  final bool isNameIdExist;
  final bool isEdit;

  DetailOriginState({
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

  DetailOriginState copyWith({
    String? name,
    String? nameId,
    bool? isNameIdExist,
    bool? isEdit,
  }) {
    return DetailOriginState(
      name: name ?? this.name,
      nameId: nameId ?? this.nameId,
      isNameIdExist: isNameIdExist ?? this.isNameIdExist,
      isEdit: isEdit ?? this.isEdit,
    );
  }
}
