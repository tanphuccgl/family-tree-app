// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'create_individual_f0_female_bloc.dart';

class CreateIndividualF0FemaleState extends Equatable {
  final AreaModel? area;
  final String name;
  final String familyCode;
  final bool isFamilyCodeExist;
  final OriginModel? origin;
  final List<OriginModel> listOriginSuggest;

  const CreateIndividualF0FemaleState({
    this.area,
    this.name = "",
    this.familyCode = "",
    this.origin,
    this.listOriginSuggest = const [],
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
        listOriginSuggest,
      ];

  CreateIndividualF0FemaleState copyWith({
    AreaModel? area,
    String? name,
    String? familyCode,
    bool? isFamilyCodeExist,
    OriginModel? origin,
    List<OriginModel>? listOriginSuggest,
  }) {
    return CreateIndividualF0FemaleState(
      area: area ?? this.area,
      name: name ?? this.name,
      familyCode: familyCode ?? this.familyCode,
      isFamilyCodeExist: isFamilyCodeExist ?? this.isFamilyCodeExist,
      origin: origin ?? this.origin,
      listOriginSuggest: listOriginSuggest ?? this.listOriginSuggest,
    );
  }
}
