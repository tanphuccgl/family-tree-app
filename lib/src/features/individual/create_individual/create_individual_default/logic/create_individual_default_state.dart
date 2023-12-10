// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'create_individual_default_bloc.dart';

class CreateIndividualDefaultState extends Equatable {
  final AreaModel? area;
  final ProductTypeEnum? type;
  final String name;
  final String familyCode;
  final bool isMale;
  final bool isFamilyCodeExist;

  final OriginModel? origin;
  final List<OriginModel> listOriginSuggest;
  final List<ProductModel> listFatherSuggest;
  final ProductModel? fatherSelected;
  final List<ProductModel> listMotherSuggest;
  final ProductModel? motherSelected;

  const CreateIndividualDefaultState({
    this.area,
    this.name = "",
    this.familyCode = "",
    this.isMale = true,
    this.isFamilyCodeExist = false,
    this.type,
    this.origin,
    this.listOriginSuggest = const [],
    this.listFatherSuggest = const [],
    this.fatherSelected,
    this.listMotherSuggest = const [],
    this.motherSelected,
  });

  factory CreateIndividualDefaultState.ds() => CreateIndividualDefaultState();

  @override
  List<Object?> get props => [
        area,
        name,
        familyCode,
        isMale,
        isFamilyCodeExist,
        type,
        origin,
        listFatherSuggest,
        fatherSelected,
        listMotherSuggest,
        motherSelected,
        origin,
        listOriginSuggest,
      ];

  CreateIndividualDefaultState copyWith({
    AreaModel? area,
    String? name,
    bool? isMale,
    bool? isFamilyCodeExist,
    String? familyCode,
    ProductTypeEnum? type,
    OriginModel? origin,
    List<OriginModel>? listOriginSuggest,
    List<ProductModel>? listFatherSuggest,
    ProductModel? fatherSelected,
    List<ProductModel>? listMotherSuggest,
    ProductModel? motherSelected,
  }) {
    return CreateIndividualDefaultState(
      area: area ?? this.area,
      name: name ?? this.name,
      familyCode: familyCode ?? this.familyCode,
      isMale: isMale ?? this.isMale,
      isFamilyCodeExist: isFamilyCodeExist ?? this.isFamilyCodeExist,
      type: type ?? this.type,
      listFatherSuggest: listFatherSuggest ?? this.listFatherSuggest,
      fatherSelected: fatherSelected ?? this.fatherSelected,
      listMotherSuggest: listMotherSuggest ?? this.listMotherSuggest,
      motherSelected: motherSelected ?? this.motherSelected,
      origin: origin ?? this.origin,
      listOriginSuggest: listOriginSuggest ?? this.listOriginSuggest,
    );
  }
}
