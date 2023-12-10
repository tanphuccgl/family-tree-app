// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'create_individual_f0_female_bloc.dart';

class CreateIndividualF0FemaleState extends Equatable {
  final AreaModel? area;
  final String name;
  final String familyCode;
  final String origin;
  final bool isFamilyCodeExist;

  const CreateIndividualF0FemaleState({
    this.area,
    this.name = "",
    this.familyCode = "",
    this.origin = "",
    this.isFamilyCodeExist = false,
  });

  factory CreateIndividualF0FemaleState.ds() => CreateIndividualF0FemaleState();

  @override
  List<Object?> get props => [
        area,
        name,
        familyCode,
        origin,
        isFamilyCodeExist,
      ];

  CreateIndividualF0FemaleState copyWith({
    AreaModel? area,
    String? name,
    String? familyCode,
    String? origin,
    bool? isFamilyCodeExist,
  }) {
    return CreateIndividualF0FemaleState(
      area: area ?? this.area,
      name: name ?? this.name,
      familyCode: familyCode ?? this.familyCode,
      origin: origin ?? this.origin,
      isFamilyCodeExist: isFamilyCodeExist ?? this.isFamilyCodeExist,
    );
  }
}
