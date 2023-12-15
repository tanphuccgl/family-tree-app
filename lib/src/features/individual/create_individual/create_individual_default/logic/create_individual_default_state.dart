// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'create_individual_default_bloc.dart';

class CreateIndividualDefaultState extends Equatable {
  final AreaModel? area;
  final ProductTypeEnum? type;
  final OriginModel? origin;

  final List<OriginModel> listOriginSuggest;
  final List<IndividualModel> listFatherSuggest;
  final IndividualModel? fatherSelected;
  final List<IndividualModel> listMotherSuggest;
  final IndividualModel? motherSelected;

  final String name;
  final String familyCode;
  final bool isMale;
  final bool isFamilyCodeExist;
  final String age;
  final String color;
  final String date;
  final String food;
  final String price;
  final String review;
  final String style;
  final String weight;

  final String image;
  final String video;

  final List<InfoMoreModel> listFieldInfo;

  const CreateIndividualDefaultState({
    this.area,
    this.type,
    this.origin,
    this.listOriginSuggest = const [],
    this.listFatherSuggest = const [],
    this.fatherSelected,
    this.listMotherSuggest = const [],
    this.motherSelected,
    this.name = "",
    this.familyCode = "",
    this.isMale = true,
    this.isFamilyCodeExist = false,
    this.age = "",
    this.color = "",
    this.date = "",
    this.food = "",
    this.price = "",
    this.review = "",
    this.style = "",
    this.weight = "",
    this.image = "",
    this.video = "",
    this.listFieldInfo = const [],
  });

  factory CreateIndividualDefaultState.ds() => CreateIndividualDefaultState();

  @override
  List<Object?> get props {
    return [
      area,
      type,
      origin,
      listOriginSuggest,
      listFatherSuggest,
      fatherSelected,
      listMotherSuggest,
      motherSelected,
      name,
      familyCode,
      isMale,
      isFamilyCodeExist,
      age,
      color,
      date,
      food,
      price,
      review,
      style,
      weight,
      image,
      video,
      listFieldInfo,
    ];
  }

  CreateIndividualDefaultState copyWith({
    AreaModel? area,
    ProductTypeEnum? type,
    OriginModel? origin,
    List<OriginModel>? listOriginSuggest,
    List<IndividualModel>? listFatherSuggest,
    IndividualModel? fatherSelected,
    List<IndividualModel>? listMotherSuggest,
    IndividualModel? motherSelected,
    String? name,
    String? familyCode,
    bool? isMale,
    bool? isFamilyCodeExist,
    String? age,
    String? color,
    String? date,
    String? food,
    String? price,
    String? review,
    String? style,
    String? weight,
    String? image,
    String? video,
    List<InfoMoreModel>? listFieldInfo,
  }) {
    return CreateIndividualDefaultState(
      area: area ?? this.area,
      type: type ?? this.type,
      origin: origin ?? this.origin,
      listOriginSuggest: listOriginSuggest ?? this.listOriginSuggest,
      listFatherSuggest: listFatherSuggest ?? this.listFatherSuggest,
      fatherSelected: fatherSelected ?? this.fatherSelected,
      listMotherSuggest: listMotherSuggest ?? this.listMotherSuggest,
      motherSelected: motherSelected ?? this.motherSelected,
      name: name ?? this.name,
      familyCode: familyCode ?? this.familyCode,
      isMale: isMale ?? this.isMale,
      isFamilyCodeExist: isFamilyCodeExist ?? this.isFamilyCodeExist,
      age: age ?? this.age,
      color: color ?? this.color,
      date: date ?? this.date,
      food: food ?? this.food,
      price: price ?? this.price,
      review: review ?? this.review,
      style: style ?? this.style,
      weight: weight ?? this.weight,
      image: image ?? this.image,
      video: video ?? this.video,
      listFieldInfo: listFieldInfo ?? this.listFieldInfo,
    );
  }
}
