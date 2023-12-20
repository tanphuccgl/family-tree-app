// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'create_individual_f0_root_bloc.dart';

class CreateIndividualF0RootState extends Equatable {
  final AreaModel? area;
  final OriginModel? origin;
  final List<OriginModel> listOriginSuggest;

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

  const CreateIndividualF0RootState({
    this.area,
    this.name = "",
    this.familyCode = "",
    this.origin,
    this.listOriginSuggest = const [],
    this.listFieldInfo = const [],
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
  });

  factory CreateIndividualF0RootState.ds() => CreateIndividualF0RootState();

  @override
  List<Object?> get props {
    return [
      area,
      origin,
      listOriginSuggest,
      name,
      listFieldInfo,
      familyCode,
      video,
      age,
      color,
      date,
      food,
      price,
      review,
      style,
      weight,
      image,
    ];
  }

  CreateIndividualF0RootState copyWith({
    AreaModel? area,
    OriginModel? origin,
    List<OriginModel>? listOriginSuggest,
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
    return CreateIndividualF0RootState(
      area: area ?? this.area,
      origin: origin ?? this.origin,
      listOriginSuggest: listOriginSuggest ?? this.listOriginSuggest,
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
