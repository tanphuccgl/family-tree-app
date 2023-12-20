// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'create_individual_f0_female_bloc.dart';

class CreateIndividualF0FemaleState extends Equatable {
  final AreaModel? area;
  final OriginModel? origin;
  final List<OriginModel> listOriginSuggest;

  final bool isFamilyCodeExist;
  final String name;
  final String familyCode;
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

  const CreateIndividualF0FemaleState({
    this.area,
    this.origin,
    this.listOriginSuggest = const [],
    this.isFamilyCodeExist = false,
    this.name = "",
    this.familyCode = "",
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

  factory CreateIndividualF0FemaleState.ds() => CreateIndividualF0FemaleState();

  @override
  List<Object?> get props {
    return [
      area,
      origin,
      listOriginSuggest,
      isFamilyCodeExist,
      name,
      familyCode,
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

  CreateIndividualF0FemaleState copyWith({
    AreaModel? area,
    OriginModel? origin,
    List<OriginModel>? listOriginSuggest,
    bool? isFamilyCodeExist,
    String? name,
    String? familyCode,
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
    return CreateIndividualF0FemaleState(
      area: area ?? this.area,
      origin: origin ?? this.origin,
      listOriginSuggest: listOriginSuggest ?? this.listOriginSuggest,
      isFamilyCodeExist: isFamilyCodeExist ?? this.isFamilyCodeExist,
      name: name ?? this.name,
      familyCode: familyCode ?? this.familyCode,
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
